unit ZipFilesThread;

//
// Copyright 2002, Neal C. Stublen
// Commercial use requires permission.
//
// Contact: nstublen_public@yahoo.com
//

interface

uses
  Classes,
  MyThread,
  SyncObjs,
  Windows,
  Zip32;

type
  TOnZipComplete = procedure() of object;
  TOnZipDetails = procedure(Info: TStrings) of object;
  TOnZipInfo = procedure(Info: TStrings) of object;
  TOnZipProgress = procedure(ZipProgress: Integer) of object;

  TZipFilesThread = class(TMyThread)
  private
    FAborted: Boolean;
    FCompressionLevel: Integer;
    FFileList: TStringList;
    FFileListSection: TCriticalSection;
    FFilesTotal: Integer;
    FFilesZipped: Integer;
    FZipDetails: TStringList;
    FZipDetailsSection: TCriticalSection;
    FZipEvent: TEvent;
    FZipFileName: String;
    FZipInfo: TStringList;
    FZipInfoSection: TCriticalSection;
    FZipOptions: TZPOpt;
    FZipProgress: Integer;
    FOnZipComplete: TOnZipComplete;
    FOnZipDetails: TOnZipDetails;
    FOnZipInfo: TOnZipInfo;
    FOnZipProgress: TOnZipProgress;
  protected
    function CallbackPrint(Buffer: PChar; Size: ULONG): integer;
    function CallbackPassword(P: PChar; N: Integer; M, Name: PChar): integer;
    function CallbackComment(Buffer: PChar): PChar;
    function CallbackService(P: PChar; Size: ULONG): integer;
    procedure DoZipFiles();
    procedure Execute; override;
    procedure SetCompressionLevel(Value: Integer);
    procedure SyncOnZipComplete();
    procedure SyncOnZipDetails();
    procedure SyncOnZipInfo();
    procedure SyncOnZipProgress();
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy(); override;
    procedure AbortZip();
    procedure AddFile(FileName: String);
    procedure ClearFiles();
    procedure RemoveFile(FileName: String);
    procedure ZipFiles(FileName: String);
    property CompressionLevel: Integer read FCompressionLevel write SetCompressionLevel;
    property OnZipComplete: TOnZipComplete read FOnZipComplete write FOnZipComplete;
    property OnZipDetails: TOnZipDetails read FOnZipDetails write FOnZipDetails;
    property OnZipInfo: TOnZipInfo read FOnZipInfo write FOnZipInfo;
    property OnZipProgress: TOnZipProgress read FOnZipProgress write FOnZipProgress;
    property ZipFileName: String read FZipFileName write FZipFileName;
  end;

implementation

uses Contnrs,
     Math,
     SysUtils;

var
  _csThreadList: TCriticalSection;
  _lstThreads: TObjectList;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TZipFilesThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

/////////////////////////////////////////////////////////////////////////////
//
// ZIP helper functions
//
// Passing a list of files to the Info-Zip DLL takes a little bit of work.
// These functions are designed to make the process a little easier.
//

function CreateZipFileList(Files: TStrings): PCharArray;
var
  pchFileStart: PChar;
  pchList: PCharArray;
  intIndex: Integer;
  intSize: Integer;
  strFileName: String;
begin
  Result := nil;

  intSize := 0;
  for intIndex := 0 to Files.Count - 1 do
  begin
    Inc(intSize, SizeOf(PChar) + Length(Files[intIndex]) + SizeOf(Char));
  end;

  if intSize = 0 then
    exit;

  try
    GetMem(pchList, intSize);
    try
      pchFileStart := PChar(pchList) + SizeOf(PChar) * Files.Count;
      for intIndex := 0 to Files.Count - 1 do
      begin
        pchList[intIndex] := pchFileStart;
        strFileName := Files[intIndex];
        CopyMemory(pchFileStart, PChar(strFileName), Length(strFileName) + 1);
        pchFileStart := pchFileStart + Length(strFileName) + 1;
      end;
      Result := pchList;
    except
      FreeMem(pchList);
    end;
  except
  end;
end;

procedure FreeZipFileList(Files: PCharArray);
begin
  FreeMem(Files);
end;

/////////////////////////////////////////////////////////////////////////////
//
// Thread management functions
//
// Since the Info-Zip DLL requires callback functions, we will need to manage
// for multiple threads using the DLL simultaneously.  (Though it is unknown
// whether the DLL itself is thread-safe.
//

procedure _AddThread(Thread: TZipFilesThread);
begin
  _csThreadList.Enter();
  _lstThreads.Add(Thread);
  _csThreadList.Leave();
end;

function _GetCurrentThread(): TZipFilesThread;
var
  intIndex: Integer;
  tSearch: TZipFilesThread;
begin
  Result := nil;
  _csThreadList.Enter();
  for intIndex := 0 to _lstThreads.Count - 1 do
  begin
    Assert(_lstThreads[intIndex] is TZipFilesThread);
    tSearch := TZipFilesThread(_lstThreads[intIndex]);
    if tSearch.ThreadID = Windows.GetCurrentThreadId() then
    begin
      Result := tSearch;
      break;
    end;
  end;
  _csThreadList.Leave();
end;

procedure _RemoveThread(Thread: TZipFilesThread);
begin
  _csThreadList.Enter();
  _lstThreads.Remove(Thread);
  _csThreadList.Leave();
end;

/////////////////////////////////////////////////////////////////////////////
//
// Direct callback functions
//
// Since the Info-Zip DLL requires these callback functions we will need to
// map the individual callbacks to a current thread.
//

function _DummyPrint(Buffer: PChar; Size: ULONG): integer; stdcall;
var
  zft: TZipFilesThread;
begin
  zft := _GetCurrentThread();
  Result := zft.CallbackPrint(Buffer, Size);
end;

function _DummyPassword(P: PChar; N: Integer; M, Name: PChar): integer; stdcall;
var
  zft: TZipFilesThread;
begin
  zft := _GetCurrentThread();
  Result := zft.CallbackPassword(P, N, M, Name);
end;

function _DummyComment(Buffer: PChar): PChar; stdcall;
var
  zft: TZipFilesThread;
begin
  zft := _GetCurrentThread();
  Result := zft.CallbackComment(Buffer);
end;

function _DummyService(P: PChar; Size: ULONG): integer; stdcall;
var
  zft: TZipFilesThread;
begin
  zft := _GetCurrentThread();
  Result := zft.CallbackService(P, Size);
end;

{ TZipFilesThread }

procedure TZipFilesThread.AbortZip;
begin
  FAborted := True;
end;

procedure TZipFilesThread.AddFile(FileName: String);
begin
  FFileListSection.Enter();
  FFileList.Add(FileName);
  FFileListSection.Leave();
end;

function TZipFilesThread.CallbackComment(Buffer: PChar): PChar;
begin
  Result := '';
end;

function TZipFilesThread.CallbackPassword(P: PChar; N: Integer; M,
  Name: PChar): integer;
begin
  Result := 1;
end;

function TZipFilesThread.CallbackPrint(Buffer: PChar;
  Size: ULONG): integer;
begin
  // It is at least possible that the main thread will not process these
  // detail events as fast as the zip thread can generate them, so we will
  // need to use a string list instead of a simple string.  The string
  // supplied by Zip32.dll is trimmed since it has been seen to occassionally
  // return control characters in strings (which would probably be handled
  // correctly when printing in a console environment).
  FZipDetailsSection.Enter();
  FZipDetails.Add(Trim(Buffer));
  FZipDetailsSection.Leave();
  Synchronize(SyncOnZipDetails);
  Result := Size;
end;

function TZipFilesThread.CallbackService(P: PChar; Size: ULONG): integer;
begin
  // It is at least possible that the main thread will not process these
  // detail events as fast as the zip thread can generate them, so we will
  // need to use a string list instead of a simple string.  The string
  // supplied by Zip32.dll is trimmed since it has been seen to occassionally
  // return control characters in strings (which would probably be handled
  // correctly when printing in a console environment).
  FZipInfoSection.Enter();
  FZipInfo.Add(Trim(P));
  FZipInfoSection.Leave();
  Synchronize(SyncOnZipInfo);

  Inc(FFilesZipped);
  Synchronize(SyncOnZipProgress);

  // Return non-zero to abort the operation.
  if (FAborted) then
    Result := 1
  else
    Result := 0;
end;

procedure TZipFilesThread.ClearFiles;
begin
  FFileListSection.Enter();
  FFileList.Clear();
  FFileListSection.Leave();
end;

constructor TZipFilesThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);

  _AddThread(Self);

  FAborted := False;
  FCompressionLevel := 9;
  FFileList := TStringList.Create();
  FFileListSection := TCriticalSection.Create();
  FZipDetails := TStringList.Create();
  FZipDetailsSection := TCriticalSection.Create();
  FZipInfo := TStringList.Create();
  FZipInfoSection := TCriticalSection.Create();

  FZipEvent := TEvent.Create(nil, False, False, '');
end;

destructor TZipFilesThread.Destroy;
begin
  FFileList.Free();
  FFileListSection.Free();
  FZipDetails.Free();
  FZipDetailsSection.Free();
  FZipInfo.Free();
  FZipInfoSection.Free();

  FZipEvent.Free();

  _RemoveThread(Self);

  inherited;
end;

procedure TZipFilesThread.DoZipFiles;
var
  lstFiles: TStringList;
  zcl: TZCL;
  zuf: TZipUserFunctions;
begin
  lstFiles := TStringList.Create();

  FFileListSection.Enter();
  lstFiles.Assign(FFileList);
  FFileListSection.Leave();

  with zuf do
  begin
    zuf.Print := @_DummyPrint;
    zuf.Comment := @_DummyComment;
    zuf.Password := @_DummyPassword;
    zuf.Service := @_DummyService;
  end;
  ZpInit(zuf);

  with FZipOptions do
  begin
    Date             := nil;     { Date to include after (US format e.g. "12/31/98") }
    szRootDir        := nil;     { Directory to use as base for zipping }
    szTempDir        := nil;     { Temporary directory used during zipping }
    fTemp            := True;    { Use temporary directory '-b' during zipping }
    fSuffix          := False;   { Include suffixes (not implemented) }
    fEncrypt         := False;   { Encrypt files }
    fSystem          := True;    { Include system and hidden files }
    fVolume          := False;   { Include volume label }
    fExtra           := False;   { Exclude extra attributes }
    fNoDirEntries    := False;   { Do not add directory entries }
    fExcludeDate     := False;   { Exclude files earlier than specified date }
    fIncludeDate     := False;   { Include only files earlier than specified date }
    fVerbose         := True;    { Mention oddities in zip file structure }
    fQuiet           := False;   { Quiet operation }
    fCRLF_LF         := False;   { Translate CR/LF to LF }
    fLF_CRLF         := False;   { Translate LF to CR/LF }
    fJunkDir         := False;   { Junk directory names }
    fGrow            := False;   { Allow appending to a zip file }
    fForce           := False;   { Make entries using DOS names (k for Katz) }
    fMove            := False;   { Delete files added or updated in zip file }
    fDeleteEntries   := False;   { Delete files from zip file }
    fUpdate          := False;   { Update zip file--overwrite only if newer }
    fFreshen         := False;   { Freshen zip file--overwrite only }
    fJunkSFX         := False;   { Junk SFX prefix }
    fLatestTime      := True;    { Set zip file time to time of latest file in it }
    fComment         := False;   { Put comment in zip file }
    fOffsets         := False;   { Update archive offsets for SFX files }
    fPrivilege       := True;    { Use privileges (WIN32 only) }
    fEncryption      := False;   { TRUE if encryption supported, else FALSE. This is a read only flag }
    fRecurse         := 0;       { Recurse into subdirectories.  1 => -r, 2 => -R }
    fRepair          := 0;       { Repair archive. 1 => -F, 2 => -FF }
    fLevel           := Chr(48 + FCompressionLevel);     { Compression level (0-9) 6 = Default}
  end;
  ZpSetOptions(FZipOptions);

  zcl.argc := lstFiles.Count;
  zcl.FNV := CreateZipFileList(lstFiles);
  zcl.lpszZipFN := PChar(FZipFileName);

  FFilesZipped := 0;
  FFilesTotal := zcl.argc;
  Synchronize(SyncOnZipProgress);

  try
    ZpArchive(zcl);
  except
    on E: Exception do
    begin
    end;
  end;

  Synchronize(SyncOnZipComplete);

  FreeZipFileList(zcl.FNV);

  lstFiles.Free();
end;

procedure TZipFilesThread.Execute;
var
  dwResult: DWORD;
  hObjects: Array[1..2] of THandle;
begin
  while not Terminated do
  begin
    hObjects[1] := FZipEvent.Handle;
    hObjects[2] := FTerminateEvent.Handle;
    dwResult := WaitForMultipleObjects(2, @hObjects[1], False, INFINITE);
    case dwResult of
    WAIT_OBJECT_0:
      begin
        // Zip the files in the file list.
        DoZipFiles();
      end;
    WAIT_OBJECT_0 + 1:
      begin
        // The thread will now be terminated.
      end;
    end;
  end;
end;

procedure TZipFilesThread.RemoveFile(FileName: String);
var
  intIndex: Integer;
begin
  FFileListSection.Enter();
  intIndex := FFileList.IndexOf(FileName);
  if intIndex <> -1 then
    FFileList.Delete(intIndex);
  FFileListSection.Leave();
end;

procedure TZipFilesThread.SetCompressionLevel(Value: Integer);
begin
  FCompressionLevel := Max(0, Min(10, Value));
end;

procedure TZipFilesThread.SyncOnZipComplete;
begin
  if Assigned(FOnZipComplete) then
    FOnZipComplete();
end;

procedure TZipFilesThread.SyncOnZipDetails;
begin
  if Assigned(FOnZipDetails) then
  begin
    FZipDetailsSection.Enter();
    FOnZipDetails(FZipDetails);
    FZipDetailsSection.Leave();
  end;
end;

procedure TZipFilesThread.SyncOnZipInfo;
begin
  if Assigned(FOnZipInfo) then
  begin
    FZipInfoSection.Enter();
    FOnZipInfo(FZipInfo);
    FZipInfoSection.Leave();
  end;
end;

procedure TZipFilesThread.SyncOnZipProgress;
begin
  if FFilesTotal <> 0 then
    FZipProgress := (FFilesZipped * 100) div FFilesTotal
  else
    FZipProgress := 100;
  if Assigned(FOnZipProgress) then
    FOnZipProgress(FZipProgress);
end;

procedure TZipFilesThread.ZipFiles(FileName: String);
begin
  FAborted := False;
  FZipFileName := FileName;
  FZipEvent.SetEvent();
end;

initialization
  _csThreadList := TCriticalSection.Create();
  _lstThreads := TObjectList.Create();
  _lstThreads.OwnsObjects := False;

finalization
  _lstThreads.Free();
  _csThreadList.Free();

end.

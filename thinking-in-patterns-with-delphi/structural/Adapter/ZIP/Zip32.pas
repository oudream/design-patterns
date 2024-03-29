(*

-----------------------------------------------------------------------------------------
                                     STATE
-----------------------------------------------------------------------------------------
 THIS SOFTWARE IS FREEWARE AND IS PROVIDED AS IS AND COMES WITH NO WARRANTY OF ANY
 KIND, EITHER EXPRESSED OR IMPLIED. IN NO EVENT WILL THE AUTHOR(S) BE LIABLE FOR
 ANY DAMAGES RESULTING FROM THE USE OF THIS SOFTWARE.
-----------------------------------------------------------------------------------------
                                  INFORMATION
-----------------------------------------------------------------------------------------
 Description : Info-Zip's Api.h header file for its Zip32.dll ( version 2.3 ) translated to
               Pascal (Delphi)
 Tested      : Delphi 2, 3, 4, 5
 Author(s)   : Theo Bebekis <bebekis@otenet.gr>       -  original author
               Marcus Wirth <mwirth@generali-int.de>  -  changes for zip version 2.3
 More info   : For more information and information regarding Copyright and Distribution
               rights of the Info-Zip's work contact Info-Zip at
               http://www.cdrom.com/pub/infozip/
               InfoZip provides the Wiz.exe, a Windows application for zipping and
               unzipping files. You can find examples for the dll calls in the Wiz.exe
               sources (C language) which you can obtain from the above site.
 License     : Check Info-Zip's license in the accompanying license.htm
 Thanks to   : Davide Moretti
	       Marcel van Brakel
	       Rudy Velthuis
	       Danny Thorpe
               from the Delphi-JEDI@onelist.com mailing list who helped me with their
               advises to finish this translation.
 JEDI        : http://www.delphi-jedi.org/
-----------------------------------------------------------------------------------------
                                     HISTORY
-----------------------------------------------------------------------------------------
 Version   Date          Changes - Additions                             By
-----------------------------------------------------------------------------------------
 0.01      30.06.1999    Initial version for Zip32.dll ver. 2.2          Theo Bebekis
 0.02      25.01.2000    Changes for Zip32.dll ver. 2.3                  Marcus Wirth

-----------------------------------------------------------------------------------------
*)




unit Zip32;

interface

uses
  Windows;


const
  ZIP_DLL = 'ZIP32.DLL';

{ ZIPVER.H }
const
  ZIP_DLL_VERSION = '2.3';
  COMPANY_NAME = 'Info-ZIP';


 { api.h }
const
  PATH_MAX        = 256 ;  

type
{  intended to be a private struct  }
  _zip_ver = record
    Major      : UCHAR;   { e.g., integer 5 }
    Minor      : UCHAR;   { e.g., 2 }
    PatchLevel : UCHAR;   { e.g., 0 }
    Not_Used   : UCHAR;
  end;
  TZipVersionType = _zip_ver;

type
 PZpVer = ^TZpVer;
  _ZpVer = record
    StructLen     : ULONG;                    { length of the struct being passed }
    Flag          : ULONG;                    { 1: is_beta, ?: uses_zlib }
    BetaLevel     : array[0..10-1] of Char;   { e.g., "g BETA" or "" }
    Date          : array[0..20-1] of Char;   { e.g., "4 Sep 95" (beta) or "4 September 1995" }
    ZLib_Version  : array[0..10-1] of Char;   { e.g., "0.95" or NULL }
    Zip           : TZipVersionType;
    Os2Dll        : TZipVersionType;
    WinDll        : TZipVersionType;
  end;
  TZpVer = _ZpVer;

const
    ZPVER_LEN   = SizeOf(TZpVer);
  
type
  TDllPrnt = function(Buffer: PChar; Size: ULONG): integer; stdcall;
  TDllPassword = function(P: PChar; N: Integer; M, Name: PChar): integer; stdcall;
  TDllComment = function(Buffer: PChar): PChar; stdcall;
  TDllService = function(P: PChar; Size: ULONG): integer; stdcall;


  
type
  { zip options }
  PZPOpt = ^TZPOpt;
  ZPOPT = record
    Date             : PChar;   { Date to include after (US format e.g. "12/31/98") }
    szRootDir        : PChar;   { Directory to use as base for zipping }
    szTempDir        : PChar;   { Temporary directory used during zipping }
    fTemp            : Bool;    { Use temporary directory '-b' during zipping }
    fSuffix          : Bool;    { Include suffixes (not implemented) }
    fEncrypt         : Bool;    { Encrypt files }
    fSystem          : Bool;    { Include system and hidden files }
    fVolume          : Bool;    { Include volume label }
    fExtra           : Bool;    { Exclude extra attributes }
    fNoDirEntries    : Bool;    { Do not add directory entries }
    fExcludeDate     : Bool;    { Exclude files earlier than specified date }
    fIncludeDate     : Bool;    { Include only files earlier than specified date }
    fVerbose         : Bool;    { Mention oddities in zip file structure }
    fQuiet           : Bool;    { Quiet operation }
    fCRLF_LF         : Bool;    { Translate CR/LF to LF }
    fLF_CRLF         : Bool;    { Translate LF to CR/LF }
    fJunkDir         : Bool;    { Junk directory names }
    fGrow            : Bool;    { Allow appending to a zip file }
    fForce           : Bool;    { Make entries using DOS names (k for Katz) }
    fMove            : Bool;    { Delete files added or updated in zip file }
    fDeleteEntries   : Bool;    { Delete files from zip file }
    fUpdate          : Bool;    { Update zip file--overwrite only if newer }
    fFreshen         : Bool;    { Freshen zip file--overwrite only }
    fJunkSFX         : Bool;    { Junk SFX prefix }
    fLatestTime      : Bool;    { Set zip file time to time of latest file in it }
    fComment         : Bool;    { Put comment in zip file }
    fOffsets         : Bool;    { Update archive offsets for SFX files }
    fPrivilege       : Bool;    { Use privileges (WIN32 only) }
    fEncryption      : Bool;    { TRUE if encryption supported, else FALSE. This is a read only flag }
    fRecurse         : Integer; { Recurse into subdirectories.  1 => -r, 2 => -R }
    fRepair          : Integer; { Repair archive. 1 => -F, 2 => -FF }
    fLevel           : Char;    { Compression level (0-9) 6 = Default}
  end;
  TZPOpt = ZPOPT;


type
  { added for compatibility with older Delphi versions - Theo }
  TPCharArray = array [0..0] of PChar;
  PCharArray  = ^TPCharArray;

  PTZCL = ^TZCL;
  ZCL = record
    argc       : Integer;         { Count of files to zip }
    lpszZipFN  : PChar;           { name of archive to create/update }
    FNV        : PCharArray;      { array of file names to zip up }
  end;
  TZCL = ZCL;

type
  PZipUserFunctions = ^TZipUserFunctions;
  ZIPUSERFUNCTIONS = record
    Print     : TDllPrnt;
    Comment   : TDllComment;
    Password  : TDllPassword;
    Service   : TDllService;
  end;
  TZipUserFunctions = ZIPUSERFUNCTIONS;


  { dll prototypes }
procedure ZpVersion(var ZipVer: TZpVer); stdcall ;
function  ZpInit(var lpZipUserFunc: TZipUserFunctions): Integer; stdcall;
function  ZpSetOptions(var Opts: TZPOpt): Bool; stdcall;
function  ZpGetOptions: TZPOpt; stdcall;
function  ZpArchive(C: TZCL): Integer; stdcall;

  { helper }
function IsExpectedZipDllVersion: boolean;




implementation

uses
 SysUtils;


  { dll routines }
procedure ZpVersion; external ZIP_DLL name 'ZpVersion';
function  ZpInit; external ZIP_DLL name 'ZpInit';
function  ZpSetOptions; external ZIP_DLL name 'ZpSetOptions';
function  ZpGetOptions; external ZIP_DLL name 'ZpGetOptions';
function  ZpArchive; external ZIP_DLL name 'ZpArchive';



type
 TFVISubBlock = (sbCompanyName, sbFileDescription, sbFileVersion, sbInternalName, sbLegalCopyright,
   sbLegalTradeMarks, sbOriginalFilename, sbProductName, sbProductVersion, sbComments);


{----------------------------------------------------------------------------------
 Description    : retrieves selected version information from the specified
                  version-information resource. True on success
 Parameters     :
                  const FullPath : string;        the exe or dll full path
                  SubBlock       : TFVISubBlock;  the requested sub block information ie sbCompanyName
                  var sValue     : string         the returned string value
 Error checking : YES
 Notes          :
                  1. 32bit only ( It does not work with 16-bit Windows file images )
                  2. TFVISubBlock is declared as
                     TFVISubBlock = (sbCompanyName, sbFileDescription, sbFileVersion, sbInternalName,
                                     sbLegalCopyright, sbLegalTradeMarks, sbOriginalFilename,
                                     sbProductName, sbProductVersion, sbComments);
 Tested         : in Delphi 4 only
 Author         : Theo Bebekis <bebekis@otenet.gr>
-----------------------------------------------------------------------------------}
function Get_FileVersionInfo(const FullPath: string; SubBlock: TFVISubBlock; var sValue: string):boolean;
const
 arStringNames : array[sbCompanyName..sbComments] of string =
  ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright',
   'LegalTradeMarks', 'OriginalFilename', 'ProductName', 'ProductVersion', 'Comments');
var
  Dummy       : DWORD;
  iLen        : DWORD;
  pData       : PChar;
  pVersion    : Pointer;
  pdwLang     : PDWORD;
  sLangID     : string;
  sCharsetID  : string;
  pValue      : PChar;
begin

  Result := False;

  { get the size of the size in bytes of the file's version information}
  iLen := GetFileVersionInfoSize(PChar(FullPath), Dummy);
  if iLen = 0 then Exit;


  { get the information }
  pData := StrAlloc(iLen + 1);
  if not GetFileVersionInfo(PChar(FullPath),  { pointer to filename string }
                            0,                { ignored }
                            iLen,             { size of buffer }
                            pData)            { pointer to buffer to receive file-version info }
  then Exit;


  { get the national ID.
    retrieve a pointer to an array of language and
    character-set identifiers. Use these identifiers
    to create the name of a language-specific
    structure in the version-information resource}
  if not VerQueryValue(pData,                       { address of buffer for version resource (in)}
                       '\VarFileInfo\Translation',  { address of value to retrieve (in) }
                       pVersion,                    { address of buffer for version pointer (out)}
                       iLen )                       { address of version-value length buffer (out)}
  then Exit;

  { analyze it }
  pdwLang    := pVersion;
  sLangID    := IntToHex(pdwLang^, 8);
  sCharsetID := Copy(sLangID, 1, 4);
  sLangID    := Copy(sLangID, 5, 4);


  { get the info for the requested sub block }
  if not VerQueryValue(pData,
                       PChar('\StringFileInfo\' + sLangID + sCharsetID + '\' + arStringNames[SubBlock]),
                       pVersion,
                       iLen)
  then Exit;     

  { copy it to sValue }
  pValue := StrAlloc(iLen + 1);
  StrLCopy(pValue, pVersion, iLen);
  sValue := String(pValue);
  StrDispose(pValue);

  Result := True;
end;      
{----------------------------------------------------------------------------------
 NOTE : this function uses the SearchPath WinAPI call to locate the dll and
        then checks up for the version info using the above Get_FileVersionInfo
        to get both the version number and the company name.
        The dll's ZpVersion function does not check for the CompanyName.
        I recommend to call the IsExpectedZipDllVersion function as the very
        first step to ensure that is the right dll and not any other with a
        similar name etc.
        This function is more usefull when link the dll dynamically
----------------------------------------------------------------------------------}
function IsExpectedZipDllVersion: boolean;
const
 DLL_WARNING =          'Cannot find %s.'  + #10 +
                        'The Dll must be in the application directory, the path,' + #10 +
                        'the Windows directory or the Windows System directory.';
 DLL_VERSION_WARNING =  '%s has the wrong version number.' + #10 +
                        'Insure that you have the correct dll''s installed, and that ' + #10 +
                        'an older dll is not in your path or Windows System directory.';
var
 sCompany  : string;
 sVersion  : string;
 iRes      : DWORD;
 pBuffer   : array[0..MAX_PATH - 1] of Char;
 pFilePart : PChar;
begin

  Result := False;

  iRes := SearchPath(nil,         { address of search path }
                    PChar(ZIP_DLL), { address of filename }
                    '.dll',         { address of extension }
                    MAX_PATH - 1, { size, in characters, of buffer }
                    pBuffer,         { address of buffer for found filename }
                    pFilePart          { address of pointer to file component }
                    );

  if iRes = 0 then raise Exception.CreateFmt(DLL_WARNING, [ZIP_DLL]);


  if Get_FileVersionInfo(String(pBuffer), sbCompanyName, sCompany)
  and Get_FileVersionInfo(String(pBuffer), sbFileVersion, sVersion)
  then Result :=  (sCompany = COMPANY_NAME) and (sVersion = ZIP_DLL_VERSION) ;

  if not Result then raise Exception.CreateFmt(DLL_VERSION_WARNING, [ZIP_DLL]);

end;

end.


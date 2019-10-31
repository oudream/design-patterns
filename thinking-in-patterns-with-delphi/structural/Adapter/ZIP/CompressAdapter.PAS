{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：ZipFiles
    Ver：2.0

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit CompressAdapter;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,ZipFilesThread;

type

  
  TAbstractArchiver = class (TObject)
  public
    procedure add(SourceFileName: String;ArchiverFileName: String); virtual; 
            abstract;
  end;

  TRarAdapter = class (TAbstractArchiver)
  end;

  TArjAdapter = class (TAbstractArchiver)
  end;

  TZipAdapter = class (TAbstractArchiver)
  private
    FZipFilesThread: TZipFilesThread;
    procedure OnZipComplete;
  public
    constructor create;
    destructor Destroy; override;
    procedure Add(SourceFileName: String;ArchiverFileName: String); override;
  end;
  
implementation


{
********************************* TZipAdapter **********************************
}
constructor TZipAdapter.create;
begin
  FZipFilesThread:= TZipFilesThread.Create(False);
  FZipFilesThread.OnZipComplete:=OnZipComplete;
end;

destructor TZipAdapter.Destroy;
begin
  FZipFilesThread.TerminateWithEvent;
  FZipFilesThread.WaitFor;
  FZipFilesThread.Free;
end;

procedure TZipAdapter.Add(SourceFileName: String;ArchiverFileName: String);
begin
  DeleteFile(PChar(ArchiverFileName));
  FZipFilesThread.ClearFiles;
  FZipFilesThread.AddFile(SourceFileName);
  FZipFilesThread.Zipfiles(ArchiverFileName);
end;

procedure TZipAdapter.OnZipComplete;
begin
  Application.MessageBox('压缩完毕！', '操作提示',
            MB_ICONINFORMATION);
end;


end.

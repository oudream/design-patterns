{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�ZipFiles
    Ver��2.0

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
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
  Application.MessageBox('ѹ����ϣ�', '������ʾ',
            MB_ICONINFORMATION);
end;


end.
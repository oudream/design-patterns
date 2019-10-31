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
unit Form_ZipFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,Spin, ExtCtrls,
  CompressAdapter;

type
  TFormZipFiles = class(TForm)
    cmdZip: TButton;
    cmdAddFile: TButton;
    odSelectFile: TOpenDialog;
    Label4: TLabel;
    edtFilename2: TEdit;
    cmdAbort: TButton;
    Label2: TLabel;
    edtFilename1: TEdit;
    procedure cmdAddFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdZipClick(Sender: TObject);
    procedure cmdAbortClick(Sender: TObject);
  private
    FZipAdapter:TZipAdapter;
  public
    { Public declarations }
  end;

var
  FormZipFiles: TFormZipFiles;

implementation


{$R *.dfm}

procedure TFormZipFiles.cmdAddFileClick(Sender: TObject);
begin
  if  odSelectFile.Execute then
    edtFilename1.Text:=odSelectFile.FileName;
end;

procedure TFormZipFiles.FormCreate(Sender: TObject);
begin
  FZipAdapter:= TZipAdapter.Create;

end;

procedure TFormZipFiles.FormDestroy(Sender: TObject);
begin
  FZipAdapter.Free;
end;

procedure TFormZipFiles.cmdZipClick(Sender: TObject);
begin
  FZipAdapter.add(edtFilename1.Text,edtFilename2.Text);
end;

procedure TFormZipFiles.cmdAbortClick(Sender: TObject);
begin
  close;
end;

end.

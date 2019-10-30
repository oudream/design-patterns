{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,jpeg, StdCtrls, ComCtrls, ExtCtrls, ExtDlgs,
  PicIterator;

type
  TfrmClient = class (TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    Timer1: TTimer;
    Panel1: TPanel;
    lsbPic: TListBox;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    btnExit: TButton;
    btnView: TButton;
    btnAddDir: TButton;
    rgStep: TRadioGroup;
    Panel3: TPanel;
    rgTime: TRadioGroup;
    btnClear: TButton;
    procedure btnAddDirClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    FPicFiles:IFiles;
    FPicIterator:IIterator;
    FPic: TImage;
  end;

  
var
  frmClient: TfrmClient;

implementation


{$R *.dfm}



{
********************************** TfrmClient **********************************
}
procedure TfrmClient.btnAddDirClick(Sender: TObject);
var
  i:integer;
  tmpStrings:TStrings;
begin
  if OpenPictureDialog1.Execute then
  begin
    tmpStrings:=OpenPictureDialog1.Files;
    for i:=0 to tmpStrings.Count-1  do
    begin
      lsbPic.Items.Add(tmpStrings[i]);
      FPic:=TImage.Create(self);
      FPic.Picture.LoadFromFile(lsbPic.Items[lsbPic.Items.count-1]);
      FPicFiles[lsbPic.Items.count-1]:=FPic;
    end;
  end;
end;

procedure TfrmClient.btnViewClick(Sender: TObject);
var
  i:integer;
  temp:string;
  Obj:TObject;
begin
  if lsbPic.Count<1 then exit;
  i:=1;
  timer1.Interval:=1000+rgTime.ItemIndex*1000;
  FPicIterator:=FPicFiles.CreateIterator;
  FPicIterator.Step:=rgStep.ItemIndex;
  Obj:=FPicIterator.First;
  if  Obj<>nil then
  begin
    FPic:=TImage(Obj);
    image1.Picture:=FPic.Picture;
    Panel1.Visible:=false;
    image1.Visible:=True;
    timer1.Enabled:=True;
  end
  else
  begin
    timer1.Enabled:=False;
    image1.Visible:=False;
    Panel1.Visible:=True;
    FPicIterator:=nil;
  end;
end;

procedure TfrmClient.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmClient.FormCreate(Sender: TObject);
begin
  FPicFiles:=TPicFiles.Create;
  image1.Align:=alClient;
  Panel1.Align:=alClient;
end;

procedure TfrmClient.Timer1Timer(Sender: TObject);
var
  Obj:TObject;
begin
  Obj:=FPicIterator.Next;
  if  Obj<>nil then
  begin
    FPic:=TImage(Obj);
    image1.Picture:=FPic.Picture;
  end
  else
  begin
    timer1.Enabled:=False;
    image1.Visible:=False;
    Panel1.Visible:=True;
    FPicIterator:=nil;
  end;
end;

procedure TfrmClient.FormDestroy(Sender: TObject);
begin
  FPicFiles:=nil;
end;

procedure TfrmClient.btnClearClick(Sender: TObject);
begin
  FPicFiles.Clear;
  lsbPic.Clear;
end;

end.


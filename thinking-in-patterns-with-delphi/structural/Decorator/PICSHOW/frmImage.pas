{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�PicDeco
    Ver��2.0

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
_______________________________________________________
*******************************************************
}
unit frmImage;

interface

uses Windows, Classes, Graphics, Forms, Controls,
  FileCtrl, StdCtrls, ExtCtrls, Buttons, Spin, ComCtrls, Dialogs ,
  PicDecorator,Jpeg;

type
  TImageForm = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FileEdit: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    FileListBox1: TFileListBox;
    Bevel1: TBevel;
    FilterComboBox1: TFilterComboBox;
    btnWatch: TButton;
    btnExit: TButton;
    Label1:Tlabel;
    rgDecoType: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    procedure FileListBox1Click(Sender: TObject);
    procedure FileEditKeyPress(Sender: TObject; var Key: Char);
    procedure btnExitClick(Sender: TObject);
    procedure btnWatchClick(Sender: TObject);
  private
     ImgFileName:string;
  end;

var
  ImageForm:TImageForm;

implementation

uses  SysUtils,
  mmsystem;

{$R *.DFM}

procedure TImageForm.FileListBox1Click(Sender: TObject);
var
  FileExt: string[4];
begin
  FileExt := AnsiUpperCase(ExtractFileExt(FileListBox1.Filename));
  btnWatch.Enabled:=False;
  if (FileExt = '.BMP') or
     (FileExt = '.ICO') or
     (FileExt = '.WMF') or
     (FileExt = '.EMF') or
     (FileExt = '.JPG') or
     (FileExt = '.JPEG') then
  begin
    Image1.Picture.LoadFromFile(FileListBox1.Filename);
    if  (Image1.Picture.Width>800) or  (Image1.Picture.Height>600) then
      application.MessageBox('ͼƬ�ߴ糬��800*600��','������ʾ',MB_OK)
    else
    begin
      ImgFileName:=FileListBox1.Filename;
      btnWatch.Enabled:=True;
    end;
  end;
end;

procedure TImageForm.FileEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then 
  begin
    FileListBox1.ApplyFilePath(FileEdit.Text);
    Key := #0;
  end;
end;

procedure TImageForm.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TImageForm.btnWatchClick(Sender: TObject);
var
  DecoPic:TPicShow;
  CurForm:TForm;
begin
  CurForm:=TForm.Create(nil);
  case rgDecoType.ItemIndex of
    0:DecoPic:=TPicWithFrame.Creat(TPic.Create);//װ�ο�
    1:DecoPic:=TPicWithMusic.Creat(TPic.Create);//��������
    2:DecoPic:=TPicWithMusic.Creat(TPicWithFrame.Creat(TPic.Create));//���ֿ�
  end;
  try
    DecoPic.Display(CurForm,ImgFileName);
    CurForm.ShowModal;
  finally
     DecoPic.Free;
     CurForm.Free;
  end;
end;

end.

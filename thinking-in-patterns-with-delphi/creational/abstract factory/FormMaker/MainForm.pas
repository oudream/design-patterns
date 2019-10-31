unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, janTiledPanel, janRoundedButton, formmaker,
  Buttons;

type
  TfrmMain = class (TForm)
    btnArt: TjanRoundedButton;
    btnStandard: TButton;
    procedure btnStandardClick(Sender: TObject);
    procedure btnArtclick(Sender: TObject);
  private
    FFormMaker:TFormMaker;
    procedure CreateForm(Factory:TFormMaker;title:String);
  end;
  
var
  frmMain: TfrmMain;

implementation

{
*********************************** TfrmMain ***********************************
}

{$R *.dfm}

procedure TfrmMain.btnStandardClick(Sender: TObject);
var
  StandardFormMaker:TStandardFormMaker;
begin
  FFormMaker:=TStandardFormMaker.Create;
  try
    CreateForm(FFormMaker,'标准型对话框');
  finally
    FFormMaker.Free;
  end;
end;

procedure TfrmMain.btnArtclick(Sender: TObject);
begin
  FFormMaker:=TArtFormMaker.Create;
  try
    CreateForm(FFormMaker,'艺术型对话框');
  finally
    FFormMaker.Free;
  end;
end;

procedure TfrmMain.CreateForm(Factory:TFormMaker;title:String);
var
  TempPanel: TPanel;
  TempForm: TForm;
begin
  TempForm:=TForm.Create(nil);
  TempForm.Caption:=title;
  TempForm.Position:=poDesktopCenter;
  TempPanel:=TPanel(Factory.CreatePanel(TempForm));
  Factory.CreateButton( TempForm, 'OK', (TempForm.Height-110), (TempForm.Width-120) );
  Factory.CreateButton( TempForm, 'Cancel', (TempForm.Height-80),(TempForm.Width-120) );
  try
    TempForm.ShowModal;
  finally
    TempForm.Free;
  end;
end;

end.


unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    btnExit: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
     FLeft,FTop,FNum:integer;
  public
    { Public declarations }
  end;

{var
  frmMain: TfrmMain; }

implementation

uses ConnectorForm, Connector;

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
var
  curForm:Tform;
begin
  curForm:=TfrmConnector.Create(self);
  curForm.Left:=FLeft;
  curForm.Top:=FTop;
  curForm.Caption:=curForm.Caption+'µÄÑÝÊ¾´°Ìå£º'+IntToStr(FNum);
  Inc(FNum);
  if  FLeft<800 then
    FLeft:=FLeft+20
  else FLeft:=20;
  if  FTop<600 then
    FTop:=FTop+120
  else
    FTop:=10;
  curForm.Show;
end;
  
procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FLeft:=10;
  FTop:=10;
  FNum:=1;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
   TConnector.ReleaseInstance;
end;

end.

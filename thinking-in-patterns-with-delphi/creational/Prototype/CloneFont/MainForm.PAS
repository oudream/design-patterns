unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,PrototypeFont, ExtCtrls;

type
  TfrmClient = class (TForm)
    Memo1: TMemo;
    btnSet1: TButton;
    btnClone1: TButton;
    btnClone2: TButton;
    Memo2: TMemo;
    btnSet2: TButton;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btnClone1Click(Sender: TObject);
    procedure btnSet1Click(Sender: TObject);
    procedure btnClone2Click(Sender: TObject);
    procedure btnSet2Click(Sender: TObject);
  private
    FPrototype_Font1: TPrototype_Font;
    FPrototype_Font2: TPrototype_Font;
  end;
  
var
  frmClient: TfrmClient;

implementation



{$R *.dfm}

procedure TfrmClient.FormCreate(Sender: TObject);
begin
  FPrototype_Font1:=TPrototype_Font1.Create;
  FPrototype_Font2:=TPrototype_Font2.Create;
  Memo1.Lines.Add(
    '这里演示调用Assign方法实现的字体克隆。') ;
  Memo2.Lines.Add(
    '这里演示通过自己编程实现的字体克隆。') ;
end;

procedure TfrmClient.btnClone1Click(Sender: TObject);
begin
  Memo1.Font:=TPrototype_Font(FPrototype_Font1.clone);
end;

procedure TfrmClient.btnSet1Click(Sender: TObject);
begin
  FPrototype_Font1.SetFont;
end;

procedure TfrmClient.btnClone2Click(Sender: TObject);
begin
  Memo2.Font:=TPrototype_Font(FPrototype_Font2.clone);
end;

procedure TfrmClient.btnSet2Click(Sender: TObject);
begin
  FPrototype_Font2.SetFont;
end;

end.



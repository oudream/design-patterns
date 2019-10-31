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

    最后更新时间：2004－06－23
_______________________________________________________
*******************************************************
}
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  StyleObserver, Menus, ActnMan, ActnColorMaps;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    btnApp: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    rgSubject: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnExit: TButton;
    Label8: TLabel;
    procedure btnAppClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FSubject:TColorSubject;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAppClick(Sender: TObject);
begin
  FSubject.Style:=rgSubject.ItemIndex;
  FSubject.Notify;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FSubject:=TColorSubject.Create(self);
  FSubject.Attach(TLstObserver.Create(FSubject));
  FSubject.Attach(TEdtObserver.Create(FSubject));
  FSubject.Attach(TMemoObserver.Create(FSubject));
  FSubject.Attach(TCkbObserver.Create(FSubject));
  FSubject.Attach(TLblObserver.Create(FSubject));
  FSubject.Attach(TRGObserver.Create(FSubject));
  FSubject.Attach(TCmbObserver.Create(FSubject));
  ComboBox1.Items.Assign(ListBox1.Items);
  ComboBox1.ItemIndex:=3;
  ListBox1.ItemIndex:=3;
  rgSubject.ItemIndex:=0;
end;

procedure TForm1.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FSubject.Free;
end;

end.

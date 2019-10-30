{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：TransferSys
    Ver：2.0

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
  Dialogs, StdCtrls, ExtCtrls,ComTransfer_TLB,
  ADODB, DB;

type
  Tclient = class(TForm)
    edtName: TLabeledEdit;
    edtID: TLabeledEdit;
    edtPSW: TLabeledEdit;
    btnExit: TButton;
    btnLogin: TButton;
    panTransfer: TPanel;
    Label2: TLabel;
    edtMoney: TLabeledEdit;
    btnTransfer: TButton;
    edtTransOut: TLabeledEdit;
    edtTransIn: TLabeledEdit;
    edtAccountOut: TLabeledEdit;
    edtAccountIn: TLabeledEdit;
    cbBankOut: TComboBox;
    cbBankIn: TComboBox;
    Label1: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure cbBankOutSelect(Sender: TObject);
    procedure cbBankInSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    PIN:OLEVariant;
    Transfer:ITransferFacade;
    OutAccountID,InAccountID:WideString;
    InValue,OutValue:Integer;
  public
    { Public declarations }
  end;

var
  client: Tclient;

implementation

{$R *.dfm}

procedure Tclient.btnLoginClick(Sender: TObject);
begin
  Transfer.NewCustomer(PIN,edtName.Text,edtPSW.Text);
  edtID.Text:=PIN;
  panTransfer.Visible:=True;
end;

procedure Tclient.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure Tclient.cbBankOutSelect(Sender: TObject);
begin
  Transfer.CheckBankAccount(PIN,cbBankOut.Items.Strings[cbBankOut.itemIndex],OutAccountID);
  edtTransOut.Text:=string(OutAccountID);
  Transfer.CheckSaving(OutAccountID,0,OutValue);
  edtAccountOut.Text:=IntToStr(OutValue);
end;

procedure Tclient.cbBankInSelect(Sender: TObject);
begin
  Transfer.CheckBankAccount(PIN,cbBankIn.Items.Strings[cbBankIn.itemIndex],InAccountID);
  edtTransIn.Text:=string(InAccountID);
  Transfer.CheckSaving(InAccountID,1,InValue);
  edtAccountIn.Text:=IntToStr(InValue);
end;

procedure Tclient.FormCreate(Sender: TObject);
begin
  //创建门面对象
  Transfer:=CoTransferFacade.Create;
end;

procedure Tclient.btnTransferClick(Sender: TObject);
var
  s:Widestring;
begin
  Transfer.DoTransfer(StrToInt(edtMoney.Text),InAccountID,OutAccountID,s);
  showmessage(s);
  Transfer.CheckSaving(OutAccountID,0,OutValue);
  edtAccountOut.Text:=IntToStr(OutValue);
  Transfer.CheckSaving(InAccountID,1,InValue);
  edtAccountIn.Text:=IntToStr(InValue);
end;

procedure Tclient.FormDestroy(Sender: TObject);
begin
  Transfer:=nil;
end;

end.

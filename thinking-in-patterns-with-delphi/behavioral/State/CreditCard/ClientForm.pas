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
  Dialogs, StdCtrls, ExtCtrls,CreditState;

type
  TClient = class(TForm)
    edtBalance: TLabeledEdit;
    edtAmount: TLabeledEdit;
    rgCreditState: TRadioGroup;
    btnDeposit: TButton;
    btnWithdraw: TButton;
    btnExit: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnDepositClick(Sender: TObject);
    procedure btnWithdrawClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCreditAccount:TAccount;
    FCreditLevel:integer;
    FState: TCreditState;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

procedure TClient.FormCreate(Sender: TObject);
begin
  FCreditAccount:=TAccount.Create('测试用户');
  //获取初始的余额和信用状态
  edtBalance.Text:=CurrToStr(FCreditAccount.Deposit(0,FCreditLevel));
  rgCreditState.ItemIndex:=FCreditLevel;
end;

procedure TClient.btnDepositClick(Sender: TObject);
begin
  edtBalance.Text:=CurrToStr(FCreditAccount.Deposit(StrToCurr(edtAmount.Text),FCreditLevel));
  //记录日志
  if FCreditLevel<100 then  rgCreditState.ItemIndex:=FCreditLevel;
  memo1.Lines.Add(FormatDateTime('yyyyy-mm-dd,hh:mm:ss ', Now )
       +'  存入：'+edtAmount.Text+'元；结余：'+edtBalance.Text
      +'元；信用等级：'+IntToStr(FCreditLevel));
end;

procedure TClient.btnWithdrawClick(Sender: TObject);
begin
  //showmessage(FCreditAccount.State.ClassName); //跟踪转态对象的变化
  edtBalance.Text:=CurrToStr(FCreditAccount.Withdraw(StrToCurr(edtAmount.Text),FCreditLevel));
  //记录日志
  if FCreditLevel=100 then
    memo1.Lines.Add(FormatDateTime('yyyyy-mm-dd,hh:mm:ss ', Now )
        +'  支取数目超出信用取款限额！操作取消。')
  else
  begin
    rgCreditState.ItemIndex:=FCreditLevel;
    memo1.Lines.Add(FormatDateTime('yyyyy-mm-dd,hh:mm:ss ', Now )
      +'  支取：'+edtAmount.Text+'元；结余：'+edtBalance.Text
      +'元；信用等级：'+IntToStr(FCreditLevel));
  end;
  //showmessage(FCreditAccount.State.ClassName); //跟踪转态对象的变化
end;

procedure TClient.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TClient.FormDestroy(Sender: TObject);
begin
  FCreditAccount.Free;
end;

end.

{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��23
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
  FCreditAccount:=TAccount.Create('�����û�');
  //��ȡ��ʼ����������״̬
  edtBalance.Text:=CurrToStr(FCreditAccount.Deposit(0,FCreditLevel));
  rgCreditState.ItemIndex:=FCreditLevel;
end;

procedure TClient.btnDepositClick(Sender: TObject);
begin
  edtBalance.Text:=CurrToStr(FCreditAccount.Deposit(StrToCurr(edtAmount.Text),FCreditLevel));
  //��¼��־
  if FCreditLevel<100 then  rgCreditState.ItemIndex:=FCreditLevel;
  memo1.Lines.Add(FormatDateTime('yyyyy-mm-dd,hh:mm:ss ', Now )
       +'  ���룺'+edtAmount.Text+'Ԫ�����ࣺ'+edtBalance.Text
      +'Ԫ�����õȼ���'+IntToStr(FCreditLevel));
end;

procedure TClient.btnWithdrawClick(Sender: TObject);
begin
  //showmessage(FCreditAccount.State.ClassName); //����ת̬����ı仯
  edtBalance.Text:=CurrToStr(FCreditAccount.Withdraw(StrToCurr(edtAmount.Text),FCreditLevel));
  //��¼��־
  if FCreditLevel=100 then
    memo1.Lines.Add(FormatDateTime('yyyyy-mm-dd,hh:mm:ss ', Now )
        +'  ֧ȡ��Ŀ��������ȡ���޶����ȡ����')
  else
  begin
    rgCreditState.ItemIndex:=FCreditLevel;
    memo1.Lines.Add(FormatDateTime('yyyyy-mm-dd,hh:mm:ss ', Now )
      +'  ֧ȡ��'+edtAmount.Text+'Ԫ�����ࣺ'+edtBalance.Text
      +'Ԫ�����õȼ���'+IntToStr(FCreditLevel));
  end;
  //showmessage(FCreditAccount.State.ClassName); //����ת̬����ı仯
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

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
unit CreditState;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TCreditState = class;

  TAccount = class (TObject)
  private
    FState: TCreditState;
    procedure SetState(Value: TCreditState);
  public
    constructor Create(AccountID:string);
    destructor Destroy; override;
    function Deposit(amount:currency;var  i:integer): Currency;
    function Withdraw(amount:currency;var  i:integer): Currency;
    property State: TCreditState read FState write SetState;
  end;
  
  TCreditState = class (TObject)
  private
    procedure StateInitialize; virtual; abstract;
  protected
    FAccount: TAccount;
    FBalance: Currency;
    FLowerLimit: Currency;
    FServiceFee: Currency;
    FUpperLimit: Currency;
  public
    function Deposit(amount:currency;var  i:integer): Currency; virtual;
            abstract;
    function StateCheck: Integer; virtual; abstract;
    function Withdraw(amount:currency;var  i:integer): Currency; virtual;
            abstract;
  end;
  
  TBadCreditState = class (TCreditState)
  public
    constructor Create(OldState:TCreditState);
    function Deposit(amount:currency;var  i:integer): Currency; override;
    function StateCheck: Integer; override;
    procedure StateInitialize; override;
    function Withdraw(amount:currency;var  i:integer): Currency; override;
  end;
  
  TNormalCreditState = class (TCreditState)
  public
    constructor Create(balance :Currency;account:TAccount); overload;
    constructor Create(OldState:TCreditState); overload;
    function Deposit(amount:currency;var  i:integer): Currency; override;
    function StateCheck: Integer; override;
    procedure StateInitialize; override;
    function Withdraw(amount:currency;var  i:integer): Currency; override;
  end;
  
  TGoodCreditState = class (TCreditState)
  public
    constructor Create(OldState:TCreditState);
    function Deposit(amount:currency;var  i:integer): Currency; override;
    function StateCheck: Integer; override;
    procedure StateInitialize; override;
    function Withdraw(amount:currency;var  i:integer): Currency; override;
  end;
  


implementation


{
*********************************** TAccount ***********************************
}
constructor TAccount.Create(AccountID:string);
begin
  {
  ���ݳ�ʼ�����벿�֣�
  �����û�AccountID�������ݿ��ȡ���ݣ������г�ʼ����
  �ⲿ�ִ���ʡ�� ���ٶ��˻���ʼ���Ϊ1000Ԫ��
  }
  //��ʼ����ȱʡ״̬����������״̬
  FState:=TNormalCreditState.Create(1000,self);
end;

destructor TAccount.Destroy;
begin
  if FState<>nil then freeandnil(FState);
  inherited;
end;

function TAccount.Deposit(amount:currency;var  i:integer): Currency;
begin
  result:=FState.Deposit(amount,i);
end;

procedure TAccount.SetState(Value: TCreditState);
begin
  FState:=Value;
end;

function TAccount.Withdraw(amount:currency;var  i:integer): Currency;
begin
  result:=FState.Withdraw(amount,i)
end;

{
******************************* TBadCreditState ********************************
ҵ���߼������õȼ�Ϊ0��ȡ��ÿ��֧�������20Ԫ�������޶�Ϊ1000Ԫ
}
constructor TBadCreditState.Create(OldState:TCreditState);
begin
  FAccount:=OldState.FAccount;
  FBalance:=OldState.FBalance;
  StateInitialize;
end;

function TBadCreditState.Deposit(amount:currency;var  i:integer): Currency;
begin
  FBalance:=FBalance+amount;
  i:=StateCheck;
  result:=FBalance;
end;

function TBadCreditState.StateCheck: Integer;
begin
  //1:��������״̬
  if( FBalance > FUpperLimit )   then
  begin
    FAccount.State := TNormalCreditState.Create(self);
    result:=1;
    self.Free;
  end
  else
    result:=0;
end;

procedure TBadCreditState.StateInitialize;
begin
  //ҵ���߼������趨��
  FLowerLimit := -1000.00;
  FUpperLimit := 0.00;
  FServiceFee := 20;
end;

function TBadCreditState.Withdraw(amount:currency;var  i:integer): Currency;
var
  test:currency;
begin
  test:=FBalance-amount-FServiceFee;
  //��������ȡ���޶�!
  if test<FLowerLimit  then
  begin
    i:=100;
    result:=FBalance;
    exit;
  end;
  FBalance:=test;
  i:=StateCheck;
  result:=FBalance;
end;

{
****************************** TNormalCreditState ******************************
���õȼ�Ϊ1��ȡ��ÿ��֧�������5Ԫ���޳����޶�
}
constructor TNormalCreditState.Create(balance:Currency;account:TAccount);
begin
  //���ع��캯��1��ϵͳ��ʼ��ʱ��
  FAccount:=account;
  FBalance:=balance;
  StateInitialize;
end;

constructor TNormalCreditState.Create(OldState:TCreditState);
begin
  //���ع��캯��2��״̬����ת��ʱ��
  FAccount:=OldState.FAccount;
  FBalance:=OldState.FBalance;
  StateInitialize;
end;

function TNormalCreditState.Deposit(amount:currency;var  i:integer): Currency;
begin
  FBalance:=FBalance+amount;
  i:=StateCheck;
  result:=FBalance;
end;

function TNormalCreditState.StateCheck: Integer;
begin
  result:=1;
  //2:��������״̬
  if( FBalance > FUpperLimit )   then
  begin
    FAccount.State := TGoodCreditState.Create(self);
    result:=2;
    self.Free;
  end;
  //0:��������״̬
  if( FBalance < FLowerLimit )   then
  begin
    FAccount.State := TBadCreditState.Create(self);
    result:=0;
    self.Free;
  end;
end;

procedure TNormalCreditState.StateInitialize;
begin
  //ҵ���߼������趨��
  FLowerLimit := 1.00;
  FUpperLimit := 10000.00;
  FServiceFee := 5;
end;

function TNormalCreditState.Withdraw(amount:currency;var  i:integer): Currency;
begin
  FBalance:=FBalance-amount-FServiceFee;
  i:=StateCheck;
  result:=FBalance;
end;

{
******************************* TGoodCreditState *******************************
���õȼ�Ϊ2���޷���ѣ��޳����޶
}
constructor TGoodCreditState.Create(OldState:TCreditState);
begin
  FAccount:=OldState.FAccount;
  FBalance:=OldState.FBalance;
  StateInitialize;
end;

function TGoodCreditState.Deposit(amount:currency;var  i:integer): Currency;
begin
  FBalance:=FBalance+amount;
  i:=StateCheck;
  result:=FBalance;
end;

function TGoodCreditState.StateCheck: Integer;
begin
  result:=2;
  //0:��������״̬
  if( FBalance < 0 )   then
  begin
    FAccount.State := TBadCreditState.Create(self);
    result:=0;
    self.Free;
  end
  //1:��������״̬
  else    if( FBalance < FLowerLimit )   then
  begin
    FAccount.State := TNormalCreditState.Create(self);
    result:=1;
    self.Free;
  end ;
end;

procedure TGoodCreditState.StateInitialize;
begin
  //ҵ���߼������趨��
  FLowerLimit := 10001.00;
  FUpperLimit := 1000000.00;
end;

function TGoodCreditState.Withdraw(amount:currency;var  i:integer): Currency;
begin
  FBalance:=FBalance-amount;
  i:=StateCheck;
  result:=FBalance;
end;


end.
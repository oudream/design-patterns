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
  数据初始化代码部分：
  根据用户AccountID，从数据库获取数据，并进行初始化。
  这部分代码省略 。假定账户初始金额为1000元。
  }
  //初始化，缺省状态是正常信用状态
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
业务逻辑：信用等级为0，取款每次支付服务费20元，赤字限额为1000元
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
  //1:正常信用状态
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
  //业务逻辑参数设定：
  FLowerLimit := -1000.00;
  FUpperLimit := 0.00;
  FServiceFee := 20;
end;

function TBadCreditState.Withdraw(amount:currency;var  i:integer): Currency;
var
  test:currency;
begin
  test:=FBalance-amount-FServiceFee;
  //超出信用取款限额!
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
信用等级为1，取款每次支付服务费5元，无赤字限额
}
constructor TNormalCreditState.Create(balance:Currency;account:TAccount);
begin
  //重载构造函数1：系统初始化时用
  FAccount:=account;
  FBalance:=balance;
  StateInitialize;
end;

constructor TNormalCreditState.Create(OldState:TCreditState);
begin
  //重载构造函数2：状态对象转化时用
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
  //2:良好信用状态
  if( FBalance > FUpperLimit )   then
  begin
    FAccount.State := TGoodCreditState.Create(self);
    result:=2;
    self.Free;
  end;
  //0:不良信用状态
  if( FBalance < FLowerLimit )   then
  begin
    FAccount.State := TBadCreditState.Create(self);
    result:=0;
    self.Free;
  end;
end;

procedure TNormalCreditState.StateInitialize;
begin
  //业务逻辑参数设定：
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
信用等级为2，无服务费，无赤字限额。
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
  //0:不良信用状态
  if( FBalance < 0 )   then
  begin
    FAccount.State := TBadCreditState.Create(self);
    result:=0;
    self.Free;
  end
  //1:正常信用状态
  else    if( FBalance < FLowerLimit )   then
  begin
    FAccount.State := TNormalCreditState.Create(self);
    result:=1;
    self.Free;
  end ;
end;

procedure TGoodCreditState.StateInitialize;
begin
  //业务逻辑参数设定：
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

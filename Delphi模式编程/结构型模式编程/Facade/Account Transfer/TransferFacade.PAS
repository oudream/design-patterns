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
unit TransferFacade;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, StdVcl,
  ComTransfer_TLB,ComCustomer_TLB,ComBank_TLB,ComTransaction_TLB,
  ComAccountIn_TLB,ComAccountOut_TLB;

type
  TTransferFacade = class(TTypedComObject, ITransferFacade)
  protected
    procedure CheckBankAccount(PIN: OleVariant; const BankName: WideString;
      out AccountID: WideString); stdcall;
    procedure CheckSaving(const AccountID: WideString; Tag: Integer;
      out Value: Integer); stdcall;
    procedure DoTransfer(amount: Integer; const IDofAccountIn,
      IDofAccountOut: WideString; out rtnMessage: WideString); stdcall;
    procedure NewCustomer(out PIN: OleVariant; const Name, PSW: WideString);
      stdcall;
    {Declare ITransfer methods here}
  end;

implementation

uses ComServ;

procedure TTransferFacade.NewCustomer(out PIN: OleVariant; const Name,
  PSW: WideString);
var
  Customer:ICustomer;
begin
  Customer:=CoCustomer.Create;
  Customer.create(PIN, Name, PSW);
  Customer:=nil;
end;


procedure TTransferFacade.CheckBankAccount(PIN: OleVariant;
  const BankName: WideString; out AccountID: WideString);
var
  Bank:IBank;
begin
  Bank:=CoBank.Create;
  Bank.CheckAvailableAccounts(PIN, BankName,AccountID);
  Bank:=nil;
end;

procedure TTransferFacade.CheckSaving(const AccountID: WideString; Tag: Integer;
  out Value: Integer);
var
    AccountOut:IAccountOut;
    AccountIn:IAccountIn;
begin
  if Tag=0 then
  begin
     AccountOut:=CoAccountOut.Create;
     Value:=AccountOut.GetSavings(AccountID);
     AccountOut:=nil;
  end
  else
  begin
    AccountIn:=CoAccountIn.Create;
    Value:=AccountIn.GetSavings(AccountID);
    AccountIn:=nil;
  end;
end;

procedure TTransferFacade.DoTransfer(amount: Integer; const IDofAccountIn,
  IDofAccountOut: WideString; out rtnMessage: WideString);
var
 Transfer:ITransfer;
begin
  Transfer:=CoTransfer.Create;
  rtnMessage:=Transfer.DoTransfer(amount,IDofAccountIn,IDofAccountOut);
  Transfer:=nil;
end;


initialization
  TTypedComObjectFactory.Create(ComServer, TTransferFacade, Class_TransferFacade,
    ciMultiInstance, tmApartment);
end.

{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�TransferSys
    Ver��2.0

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
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
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
unit Bank;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, ComBank_TLB, StdVcl,SysUtils,
  ComDB_TLB;

type
  TBank = class(TTypedComObject, IBank)
  protected
    procedure CheckAvailableAccounts(PIN: OleVariant;
      const BankName: WideString; out AccountID: WideString); stdcall;
    {Declare IBank methods here}
  end;

implementation

uses ComServ;

procedure TBank.CheckAvailableAccounts(PIN: OleVariant;
  const BankName: WideString; out AccountID: WideString);
var
  RDB:IRDB;
begin
  RDB:=CoRDB.Create;
  AccountID:=RDB.qryAccount(BankName);
  RDB:=nil;
end;

initialization
  TTypedComObjectFactory.Create(ComServer, TBank, Class_Bank,
    ciSingleInstance, tmSingle);
end.

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
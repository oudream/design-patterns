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
unit AccountOut;
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ActiveX, Mtsobj, Mtx, ComObj, ComAccountOut_TLB, StdVcl,
   ComDB_TLB;

type
  TAccountOut = class(TMtsAutoObject, IAccountOut)
  private
    FSavings:Integer;
  protected
    procedure TransferOut(Amount: Integer; const AccountID: WideString);
      safecall;
    function GetSavings(const AccountID: WideString): Integer; safecall;
  end;

implementation

uses ComServ;

procedure TAccountOut.TransferOut(Amount: Integer;
  const AccountID: WideString);
var
  RDB:IRDB;
begin
  //转出业务逻辑
  RDB:=CoRDB.Create;
  FSavings:=RDB.qryBalance(AccountID);
  FSavings:=FSavings-Amount;
  RDB.TransferUpdate(FSavings,AccountID);
  RDB:=nil;
end;

function TAccountOut.GetSavings(const AccountID: WideString): Integer;
var
  RDB:IRDB;
begin
  //余额查询
  RDB:=CoRDB.Create;
  result:=RDB.qryBalance(AccountID);
  RDB:=nil;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TAccountOut, Class_AccountOut,
    ciMultiInstance, tmApartment);
end.

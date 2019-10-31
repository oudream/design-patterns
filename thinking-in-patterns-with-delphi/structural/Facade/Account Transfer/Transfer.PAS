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
unit Transfer;
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ActiveX, Mtsobj, Mtx, ComObj, StdVcl,ADODB, DB,SysUtils,
  ComTransaction_TLB, ComAccountOut_TLB, ComAccountIn_TLB,ComDB_TLB;

type
  TTransfer = class(TMtsAutoObject, ITransfer)
  protected
    function DoTransfer(Amount: Integer; const IDofAccountIn,
      IDofAccountOut: WideString): WideString; safecall;
  end;

implementation

uses ComServ;


function TTransfer.DoTransfer(Amount: Integer; const IDofAccountIn,
  IDofAccountOut: WideString): WideString;
var
    AccountOut:IAccountOut;
    AccountIn:IAccountIn;
begin
  AccountIn:=CoAccountIn.Create;
  AccountOut:=CoAccountOut.Create;
  try
    AccountIn.TransferIn(amount,IDofAccountIn);
    AccountOut.TransferOut(amount,IDofAccountOut);
    result:='转帐成功！';
  except
    result:='转帐失败！';
  end;
  AccountIn:=nil;
  AccountOut:=nil;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTransfer, Class_Transfer,
    ciMultiInstance, tmApartment);
end.

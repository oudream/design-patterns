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
    result:='ת�ʳɹ���';
  except
    result:='ת��ʧ�ܣ�';
  end;
  AccountIn:=nil;
  AccountOut:=nil;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TTransfer, Class_Transfer,
    ciMultiInstance, tmApartment);
end.
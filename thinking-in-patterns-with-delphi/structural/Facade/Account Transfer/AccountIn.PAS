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
unit AccountIn;
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ActiveX, Mtsobj, Mtx, ComObj, ComAccountIn_TLB, StdVcl,
  ComDB_TLB;
  
type
  TAccountIn = class(TMtsAutoObject, IAccountIn)
  private
    FSavings:Integer;
  protected
    procedure TransferIn(Amount: Integer; const AccountID: WideString);
      safecall;
    function GetSavings(const AccountID: WideString): Integer; safecall;

  end;

implementation

uses ComServ;

procedure TAccountIn.TransferIn(Amount: Integer;
  const AccountID: WideString);
var
  RDB:IRDB;
begin
  //ת��ҵ���߼�
  RDB:=CoRDB.Create;
  FSavings:=RDB.qryBalance(AccountID);
  FSavings:=FSavings+Amount;
  RDB.TransferUpdate(FSavings,AccountID);
  RDB:=nil;
end;

function TAccountIn.GetSavings(const AccountID: WideString): Integer;
var
  RDB:IRDB;
begin
  //����ѯ
  RDB:=CoRDB.Create;
  result:=RDB.qryBalance(AccountID);
  RDB:=nil;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TAccountIn, Class_AccountIn,
    ciMultiInstance, tmApartment);
end.
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
unit Customer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, ComCustomer_TLB, StdVcl;

type
  TCustomer = class(TTypedComObject, ICustomer)
  protected
    procedure create(out PIN: OleVariant; const Name, PSW: WideString);
      stdcall;
    {Declare ICustomer methods here}
  end;

implementation

uses ComServ;

procedure TCustomer.create(out PIN: OleVariant; const Name,
  PSW: WideString);
begin
  //����Name��PSW��֤�����PIN(personal identification number),
  //�����Ǽ򻯵�ʾ�����
  PIN:=CreateClassID;
end;

initialization
  TTypedComObjectFactory.Create(ComServer, TCustomer, Class_Customer,
    ciMultiInstance, tmApartment);
end.

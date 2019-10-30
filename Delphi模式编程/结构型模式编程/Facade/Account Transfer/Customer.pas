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
  //根据Name和PSW验证并获得PIN(personal identification number),
  //以下是简化的示意代码
  PIN:=CreateClassID;
end;

initialization
  TTypedComObjectFactory.Create(ComServer, TCustomer, Class_Customer,
    ciMultiInstance, tmApartment);
end.

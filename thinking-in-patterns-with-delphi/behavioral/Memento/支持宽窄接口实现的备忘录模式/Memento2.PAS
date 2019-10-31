{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit Memento2;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,Memento1;

type
  TCareTaker = class (TObject)
  private
    FMemento: TMemento;
    procedure SetMemento(Value: TMemento);
  public
    destructor Destroy; override;
    property Memento: TMemento read FMemento write SetMemento;
  end;


implementation

{
********************************** TCareTaker **********************************
}
destructor TCareTaker.Destroy;
begin
  FMemento.Free;
end;

procedure TCareTaker.SetMemento(Value: TMemento);
begin
  FMemento:= Value;
end;


end.

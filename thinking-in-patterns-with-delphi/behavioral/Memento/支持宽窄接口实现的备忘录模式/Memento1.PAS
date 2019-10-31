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
unit Memento1;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TState=String;

  TMemento = class (TObject)
  private
    FState: TState;
  public
    constructor Create(state:TState);
  end;

  TOriginator = class (TObject)
  private
    FState: TState;
    procedure SetState(Value: TState);
  public
    function CreateMemento: TMemento;
    procedure SetMemento(Memento:TMemento);
    property State: TState read FState write SetState;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
*********************************** TMemento ***********************************
}
constructor TMemento.Create(state:TState);
begin
  FState:=state;
end;

{
********************************* TOriginator **********************************
}
function TOriginator.CreateMemento: TMemento;
begin
  result:=TMemento.Create(state);
end;

procedure TOriginator.SetMemento(Memento:TMemento);
begin
  //恢复原来状态
  State:=Memento.FState;
end;

procedure TOriginator.SetState(Value: TState);
begin
  FState:=Value;
end;


end.

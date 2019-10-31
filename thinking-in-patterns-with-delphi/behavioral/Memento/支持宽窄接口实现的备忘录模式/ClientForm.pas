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
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  Memento1,Memento2;

type
  TClient = class(TForm)
    btnStateSave: TButton;
    edtState: TLabeledEdit;
    btnStateRestore: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStateSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStateRestoreClick(Sender: TObject);
  private
    FOriginator:TOriginator;
    FCareTaker:TCareTaker;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

procedure TClient.FormCreate(Sender: TObject);
begin
   FOriginator:=TOriginator.Create;
   FCareTaker:=TCareTaker.Create;
end;

procedure TClient.btnStateSaveClick(Sender: TObject);
begin

  FOriginator.State:=edtState.Text;
{  这段代码不可以使用，即无法编译通过。
   为了保证TMemento对象对状态的封装性 ，
   已经在改进过的备忘录模式模板中进行了程序语义上的限制。

  if  assigned(FCareTaker.Memento)  then
    FCareTaker.Memento.FState:=FOriginator.State
  else
    FCareTaker.Memento:=FOriginator.CreateMemento;
}

  if  assigned(FCareTaker.Memento)  then
    FCareTaker.Memento.free;
  FCareTaker.Memento:=FOriginator.CreateMemento;

end;

procedure TClient.FormDestroy(Sender: TObject);
begin
   FOriginator.Free;
   FCareTaker.Free;
end;


procedure TClient.btnStateRestoreClick(Sender: TObject);
begin
  FOriginator.SetMemento(FCareTaker.Memento);
  edtState.Text:=FOriginator.State;
end;

end.

unit UndoCommand;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TReceiver = class (TObject)
  public
    procedure Action;
  end;
  
  TCommand = class (TObject)
  protected
    FReceiver: TReceiver;
  public
    constructor Create(receiver:TReceiver);
    procedure Execute; virtual; abstract;
  end;
  
  TConcreteCommand = class (TCommand)
  public
    procedure Execute; override;
  end;
  
  TFontUser = class (TObject)
  private
    FCommand: TCommand;
    procedure SetCommand(Value: TCommand);
  public
    procedure Action;
    property Command: TCommand read FCommand write SetCommand;
  end;
  
implementation


{TReceiver}
{
********************************** TReceiver ***********************************
}
procedure TReceiver.Action;
begin
  //填写执行命令的具体动作代码
  showmessage(ClassName+'对象接受命令，并执行与命令有关的动作...');
end;

{TCommand }
{
*********************************** TCommand ***********************************
}
constructor TCommand.Create(receiver:TReceiver);
begin
  FReceiver:= receiver;
end;

{ TConcreteCommand }
{
******************************* TConcreteCommand *******************************
}
procedure TConcreteCommand.Execute;
begin
  //填写执行命令的代码
  showmessage(ClassName+'对象正在执行命令...');
  FReceiver.Action;
end;

{TInvoker }
{
********************************** TFontUser ***********************************
}
procedure TFontUser.Action;
begin
  //填写传递命令的代码
  showmessage(ClassName+'对象正在传递命令...');
  Command.Execute;
end;

procedure TFontUser.SetCommand(Value: TCommand);
begin
  FCommand:=value;
end;


end.

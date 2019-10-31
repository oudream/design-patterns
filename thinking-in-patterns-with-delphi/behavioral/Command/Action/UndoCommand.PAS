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
  //��дִ������ľ��嶯������
  showmessage(ClassName+'������������ִ���������йصĶ���...');
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
  //��дִ������Ĵ���
  showmessage(ClassName+'��������ִ������...');
  FReceiver.Action;
end;

{TInvoker }
{
********************************** TFontUser ***********************************
}
procedure TFontUser.Action;
begin
  //��д��������Ĵ���
  showmessage(ClassName+'�������ڴ�������...');
  Command.Execute;
end;

procedure TFontUser.SetCommand(Value: TCommand);
begin
  FCommand:=value;
end;


end.
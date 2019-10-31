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
unit chatRoom;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TParticipant = class;

  IChatRoom = interface (IInterface)
    ['{89DEC5DF-0BE7-4374-A713-FC25E8A9AAEF}']
    function GetTalkers: TStrings;
    function send(from:TParticipant;sendTo,AMessage:String): string;
    procedure TalkerRegister(participant:TParticipant);
  end;
  
  TChatRoom = class (TInterfacedObject, IChatRoom)
  private
    FFemaleTalker: TParticipant;
    FMaleTalker: TParticipant;
    FTalkers: TStrings;
    function GetFemaleTalker: TParticipant;
    function GetMaleTalker: TParticipant;
    function GetTalkers: TStrings;
  public
    constructor Create;
    destructor Destroy; override;
    function send(from:TParticipant;sendTo,AMessage:String): string;
    procedure TalkerRegister(participant:TParticipant);
    property FemaleTalker: TParticipant read GetFemaleTalker write 
            FFemaleTalker;
    property MaleTalker: TParticipant read GetMaleTalker write FMaleTalker;
  end;
  
  TParticipant = class (TObject)
  private
    FChatRoom: IChatRoom;
    FName: string;
    procedure SetChatRoom(Value: IChatRoom);
    procedure SetName(Value: string);
  public
    constructor Create(talkerName:string);
    function Receive(from,receiveMessage:String): string; virtual; abstract;
    function Send(sendTo,sendMessage:String): string;
    property ChatRoom: IChatRoom read FChatRoom write SetChatRoom;
    property Name: string read FName write SetName;
  end;
  
  TMaleParticipant = class (TParticipant)
  public
    function Receive(from,receiveMessage:String): string; override;
  end;
  
  TFemaleParticipant = class (TParticipant)
  public
    function Receive(from,receiveMessage:String): string; override;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
********************************** TChatRoom ***********************************
}
constructor TChatRoom.Create;
begin
  FTalkers:=TStringList.Create;
end;

destructor TChatRoom.Destroy;
begin
  FTalkers.Free;
end;

function TChatRoom.GetFemaleTalker: TParticipant;
begin
  result:=FFemaleTalker;
end;

function TChatRoom.GetMaleTalker: TParticipant;
begin
  result:=FMaleTalker;
end;

function TChatRoom.GetTalkers: TStrings;
begin
  result:=FTalkers;
end;

function TChatRoom.send(from:TParticipant;sendTo,AMessage:String): string;
var
  talker: string;
  Receiver: TParticipant;
begin
  if from.ClassName='TMaleParticipant' then
     talker:='帅哥'+from.Name
  else
     talker:='靓女'+from.Name ;
  Receiver:=TParticipant(FTalkers.Objects[FTalkers.IndexOf(sendTo)]);
  result:=Receiver.Receive(talker,AMessage);
end;

procedure TChatRoom.TalkerRegister(participant:TParticipant);
begin
  if participant.name<>'' then
  begin
    FTalkers.AddObject(participant.name,participant);
    participant.ChatRoom:=self;
  end;
end;

{
********************************* TParticipant *********************************
}
constructor TParticipant.Create(talkerName:string);
begin
  Name:=talkerName;
end;

function TParticipant.Send(sendTo,sendMessage:String): string;
begin
  result:=ChatRoom.Send(self,sendTo,sendMessage);
end;

procedure TParticipant.SetChatRoom(Value: IChatRoom);
begin
  FChatRoom:=Value;
end;

procedure TParticipant.SetName(Value: string);
begin
  FName:=Value;
end;

{
******************************* TMaleParticipant *******************************
}
function TMaleParticipant.Receive(from,receiveMessage:String): string;
begin
  result:=FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)
    +'] '+from+'对帅哥'+name+'说：'+receiveMessage;
end;



{
****************************** TFemaleParticipant ******************************
}
function TFemaleParticipant.Receive(from,receiveMessage:String): string;
begin
  result:=FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)
    +'] '+from+'对靓女'+name+'说：'+receiveMessage;
end;



end.

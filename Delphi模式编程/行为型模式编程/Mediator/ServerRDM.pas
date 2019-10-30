unit ServerRDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Chat_TLB, StdVcl,MConnect,ChatRoom, DB;

type
  TChatAdm = class(TRemoteDataModule, IChatAdm)
    procedure RemoteDataModuleCreate(Sender: TObject);

  private
    FChatRoom:IChatRoom ;
    FTalkerList:TStrings;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Login(const IP, Name: WideString); safecall;
    procedure Logout(const IP: WideString); safecall;
    function GetTalkerList: WideString; safecall;
    procedure SendMsg(const IP,sendTo, Msg: WideString); safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}
uses ClientRDM;

class procedure TChatAdm.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TChatAdm.Login(const IP, Name: WideString);
begin
  FChatRoom:=TChatRoom.Create;
  FChatRoom.TalkerRegister(TMaleParticipant.Create(Name,IP));
end;

 

procedure TChatAdm.Logout(const IP: WideString);
begin
   //
end;



function TChatAdm.GetTalkerList: WideString;
var
  i:integer;
  str:string;
begin
  FTalkerList:= FChatRoom.GetTalkers;
  if FTalkerList.Count<1 then exit;
  str:=TParticipant(FTalkerList.Objects[0]).Name
                + '=' +TParticipant(FTalkerList.Objects[0]).IP;
  for i:=1 to FTalkerList.Count-1 do
  begin
    str:=str+ #13#10 +TParticipant(FTalkerList.Objects[i]).Name
                + '=' +TParticipant(FTalkerList.Objects[i]).IP;
  end;
  result:=str ;
end;



procedure TChatAdm.SendMsg(const IP, sendTo, Msg: WideString);
var
  talker:TParticipant;
begin
  FTalkerList:= FChatRoom.GetTalkers;
  talker:=TParticipant(FTalkerList.Objects[FTalkerList.IndexOf(IP)]);
  talker.Send(sendTo,Msg);
end;


procedure TChatAdm.RemoteDataModuleCreate(Sender: TObject);
begin
  FChatRoom:=TChatRoom.Create;
  FTalkerList:=TStrings.Create;
end;

initialization
  TComponentFactory.Create(ComServer, TChatAdm,
    Class_ChatAdm, ciMultiInstance, tmApartment);
end.

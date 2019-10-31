program Chat;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  chatRoom in 'chatRoom.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

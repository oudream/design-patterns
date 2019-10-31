program BridgePatten;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  Bridge in 'Bridge.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

program RomToNum;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  RomeInterpreter in 'RomeInterpreter.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

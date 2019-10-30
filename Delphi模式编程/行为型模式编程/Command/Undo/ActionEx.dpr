program ActionEx;

uses
  Forms,
  ActionForm in 'ActionForm.pas' {Form1},
  FontCommand in 'FontCommand.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

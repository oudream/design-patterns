program Audit;

uses
  Forms,
  clientform in 'clientform.pas' {Client},
  AuditChain in 'AuditChain.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

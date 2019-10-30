program CreditEx;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  CreditState in 'CreditState.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

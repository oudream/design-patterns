program FactoryMethod;

uses
  Forms,
  clientForm in 'clientForm.pas' {Client},
  FactoryByParameter in 'FactoryByParameter.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

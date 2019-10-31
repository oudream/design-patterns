program OfflineDB;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  OffLineDBMethod in 'OffLineDBMethod.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

program DBfactory;

uses
  Forms,
  Client in 'Client.PAS' {frmMain},
  DataFactory in 'DataFactory.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

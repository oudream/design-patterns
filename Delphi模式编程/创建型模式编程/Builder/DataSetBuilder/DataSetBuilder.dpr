program DataSetBuilder;

uses
  Forms,
  Client in 'Client.PAS' {frmMain},
  DBBuilder in 'DBBuilder.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

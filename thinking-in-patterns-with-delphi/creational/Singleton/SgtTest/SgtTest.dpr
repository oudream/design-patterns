program SgtTest;

uses
  Forms,
  ConnectorForm in 'ConnectorForm.pas' {frmConnector},
  Connector in 'Connector.pas',
  MainForm in 'MainForm.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  //Application.CreateForm(TfrmMain, frmMain);
  TfrmMain.Create(Application).ShowModal;
  Application.Run;
end.



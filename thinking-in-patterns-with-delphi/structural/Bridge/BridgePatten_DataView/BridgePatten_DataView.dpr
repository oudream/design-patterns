program BridgePatten_DataView;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  Data_Bridge in 'Data_Bridge.PAS',
  AddForm in 'AddForm.pas' {AddDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

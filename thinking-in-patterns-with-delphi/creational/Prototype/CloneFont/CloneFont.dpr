program CloneFont;

uses
  Forms,
  MainForm in 'MainForm.PAS' {frmClient},
  PrototypeFont in 'PrototypeFont.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.

program FromMaker;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  formmaker in 'formmaker.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

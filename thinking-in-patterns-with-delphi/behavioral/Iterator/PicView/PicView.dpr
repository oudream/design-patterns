program PicView;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {frmClient},
  PicIterator in 'PicIterator.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.

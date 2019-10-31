program StyleTest;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Form1},
  StyleObserver in 'StyleObserver.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

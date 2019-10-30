program firm;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Form1},
  composite_Org in 'composite_Org.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

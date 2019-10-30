program CloneStream;

uses
  Forms,
  PrototypeStreamForm in 'PrototypeStreamForm.PAS' {Form1},
  PrototypeByStream in 'PrototypeByStream.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program ActionEx;

uses
  Forms,
  ActionForm in 'ActionForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

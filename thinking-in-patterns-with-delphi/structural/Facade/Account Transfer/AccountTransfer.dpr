program AccountTransfer;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {client};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tclient, client);
  Application.Run;
end.

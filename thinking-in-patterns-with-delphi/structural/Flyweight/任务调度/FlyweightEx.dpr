program FlyweightEx;

uses
  Forms,
  clientform in 'clientform.pas' {client},
  Flyweight in 'Flyweight.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tclient, client);
  Application.Run;
end.

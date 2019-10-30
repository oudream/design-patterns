program MementoEx;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  Memento1 in 'Memento1.PAS',
  Memento2 in 'Memento2.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

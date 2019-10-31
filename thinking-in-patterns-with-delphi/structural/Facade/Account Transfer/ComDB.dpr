library ComDB;

uses
  ComServ,
  ComDB_TLB in 'ComDB_TLB.pas',
  RDBM in 'RDBM.pas' {RDB: TMtsDataModule} {RDB: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

library ComBank;

uses
  ComServ,
  ComBank_TLB in 'ComBank_TLB.pas',
  Bank in 'Bank.PAS' {Bank: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

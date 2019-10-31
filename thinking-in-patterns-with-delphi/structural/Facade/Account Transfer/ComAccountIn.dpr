library ComAccountIn;

uses
  ComServ,
  ComAccountIn_TLB in 'ComAccountIn_TLB.pas',
  AccountIn in 'AccountIn.PAS' {AccountIn: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

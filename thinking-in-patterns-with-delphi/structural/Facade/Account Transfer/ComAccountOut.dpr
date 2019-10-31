library ComAccountOut;

uses
  ComServ,
  ComAccountOut_TLB in 'ComAccountOut_TLB.pas',
  AccountOut in 'AccountOut.PAS' {AccountOut: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

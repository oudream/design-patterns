library ComTransfer;

uses
  ComServ,
  ComTransaction_TLB in 'ComTransaction_TLB.pas',
  Transfer in 'Transfer.PAS' {Transfer: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

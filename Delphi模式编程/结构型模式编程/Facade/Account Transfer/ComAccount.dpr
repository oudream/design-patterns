library ComAccount;

uses
  ComServ,
  ComAccount_TLB in 'ComAccount_TLB.pas',
  Account in 'Account.PAS' {Account: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

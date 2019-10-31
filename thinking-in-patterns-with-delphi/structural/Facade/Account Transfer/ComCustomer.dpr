library ComCustomer;

uses
  ComServ,
  ComCustomer_TLB in 'ComCustomer_TLB.pas',
  Customer in 'Customer.pas' {Customer: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

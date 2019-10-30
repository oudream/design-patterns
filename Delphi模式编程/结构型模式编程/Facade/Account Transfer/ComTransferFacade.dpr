library ComTransferFacade;

uses
  ComServ,
  ComTransfer_TLB in 'ComTransfer_TLB.pas',
  TransferFacade in 'TransferFacade.PAS' {TransferFacade: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

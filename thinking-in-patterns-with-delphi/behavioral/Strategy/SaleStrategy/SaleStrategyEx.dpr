program SaleStrategyEx;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  HotelSaleStrategy in 'HotelSaleStrategy.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.

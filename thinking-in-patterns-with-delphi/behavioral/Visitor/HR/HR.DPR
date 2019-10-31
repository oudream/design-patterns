program HR;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Client},
  visitorHR in 'visitorHR.PAS',
  VacationDlg in 'VacationDlg.pas' {dlgVacation},
  SalaryRateDlg in 'SalaryRateDlg.pas' {dlgSalaryRate};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClient, Client);
  Application.CreateForm(TdlgVacation, dlgVacation);
  Application.CreateForm(TdlgSalaryRate, dlgSalaryRate);
  Application.Run;
end.

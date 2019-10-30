unit ISP0;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TService = class (TObject)
  public
    procedure HandleA1;
    procedure HandleA2;
    procedure HandleB1;
    procedure HandleB2;
    procedure HandleB3;
    procedure HandleC;
  end;
  
  TClientA = class (TObject)
  private
    FService: TService;
  public
    procedure Request;
  end;
  
  TClientB = class (TObject)
  private
    FService: TService;
  public
    procedure Request;
  end;
  
  TClientC = class (TObject)
  private
    FService: TService;
  public
    procedure Request;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
*********************************** TService ***********************************
}
procedure TService.HandleA1;
begin
  ShowMessage('HandleA1');
end;

procedure TService.HandleA2;
begin
  ShowMessage('HandleA2');
end;

procedure TService.HandleB1;
begin
  ShowMessage('HandleB1');
end;

procedure TService.HandleB2;
begin
  ShowMessage('HandleB2');
end;

procedure TService.HandleB3;
begin
  ShowMessage('HandleB3');
end;

procedure TService.HandleC;
begin
  ShowMessage('HandleC');
end;

{
*********************************** TClientA ***********************************
}
procedure TClientA.Request;
begin
  FService:=TService.Create;
  try
    FService.HandleA1;
    FService.HandleA2;
  finally
    FService.Free;
  end;
end;

{
*********************************** TClientB ***********************************
}
procedure TClientB.Request;
begin
  FService:=TService.Create;
  try
    FService.HandleB1;
    FService.HandleB2;
    FService.HandleB3;
  finally
    FService.Free;
  end;
end;

{
*********************************** TClientC ***********************************
}
procedure TClientC.Request;
begin
  FService:=TService.Create;
  try
    FService.HandleC;
  finally
    FService.Free;
  end;
end;


end.

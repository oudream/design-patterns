unit ISP1;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  IServiceA = interface (IInterface)
    ['{FA340D63-F8CB-49F0-934B-CB9030E18050}']
    procedure HandleA1;
    procedure HandleA2;
  end;
  
  IServiceB = interface (IInterface)
    ['{5AA19C73-B24C-4A35-9A5C-2127B5D3EB5F}']
    procedure HandleB1;
    procedure HandleB2;
    procedure HandleB3;
  end;
  
  IServiceC = interface (IInterface)
    ['{348CC387-1677-4E5E-AF21-6F7325B77C37}']
    procedure HandleC;
  end;
  
  TService = class (TInterfacedObject, IServiceA, IServiceB, IServiceC)
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
    FService: IServiceA;
  public
    procedure Request;
  end;
  
  TClientB = class (TObject)
  private
    FService: IServiceB;
  public
    procedure Request;
  end;
  
  TClientC = class (TObject)
  private
    FService: IServiceC;
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
    FService:=nil;
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
    FService:=nil;
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
    FService:=nil;
  end;
end;


end.

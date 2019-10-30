unit Stream_Bridge;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TDataObject = class (TObject)
  public
    procedure OperationImp; virtual; abstract;
  end;
  
  TDataFile = class (TDataObject)
  public
    procedure OperationImp; override;
  end;
  
  TDataBase = class (TDataObject)
  public
    procedure OperationImp; override;
  end;
  
  TBusinessObject = class (TObject)
  private
    FImplementor: TDataObject;
    procedure SetImplementor(Value: TDataObject);
  public
    procedure Operation; virtual;
    property Implementor: TDataObject read FImplementor write SetImplementor;
  end;
  
  TCustomersBusinessObject = class (TBusinessObject)
  public
    procedure Operation; override;
  end;
  


implementation


{
********************************** TDataFile ***********************************
}
procedure TDataFile.OperationImp;
begin
  ShowMessage('ConcreteImplementorA Operation ');
end;

{
********************************** TDataBase ***********************************
}
procedure TDataBase.OperationImp;
begin
  ShowMessage('ConcreteImplementorB Operation ');
end;

{
******************************* TBusinessObject ********************************
}
procedure TBusinessObject.Operation;
begin
  FImplementor.OperationImp;
end;

procedure TBusinessObject.SetImplementor(Value: TDataObject);
begin
  FImplementor:=Value;
end;

{
*************************** TCustomersBusinessObject ***************************
}
procedure TCustomersBusinessObject.Operation;
begin
  inherited;
  //自己的修正代码
  ShowMessage('Do some other thing ...');
end;


end.

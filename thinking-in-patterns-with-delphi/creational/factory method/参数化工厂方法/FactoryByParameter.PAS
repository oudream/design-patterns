unit FactoryByParameter;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TProductID = (A, B, C);

  TProduct = class (TObject)
  public
    procedure operation; virtual; abstract;
  end;
  
  TConcreteProductA = class (TProduct)
  public
    procedure operation; override;
  end;
  
  TConcreteProductB = class (TProduct)
  public
    procedure operation; override;
  end;
  
  TConcreteProductC = class (TProduct)
  public
    procedure operation; override;
  end;
  
  TFactory = class (TObject)
  public
    function CreateProduct(ProductID: TProductID): TProduct; virtual;
  end;
  
  TFactoryExchanged = class (TFactory)
  public
    function CreateProduct(ProductID: TProductID): TProduct; override;
  end;

implementation

{
****************************** TConcreteProductA *******************************
}
procedure TConcreteProductA.operation;
begin
  ShowMessage('这是工厂方法创建的A产品');
end;


{
****************************** TConcreteProductB *******************************
}
procedure TConcreteProductB.operation;
begin
  ShowMessage('这是工厂方法创建的B产品');
end;

{
****************************** TConcreteProductC *******************************
}
procedure TConcreteProductC.operation;
begin
  ShowMessage('这是工厂方法创建的C产品');
end;

{
*********************************** TFactory ***********************************
}
function TFactory.CreateProduct(ProductID: TProductID): TProduct;
var
  product: TProduct;
begin
  product:=nil;
  case ProductID of
    A:product:=TConcreteProductA.Create;
    B:product:=TConcreteProductB.Create ;
    C:product:=TConcreteProductC.Create;
  end;
  Result := product;
end;

{
****************************** TFactoryExchanged *******************************
}
function TFactoryExchanged.CreateProduct(ProductID: TProductID): TProduct;
var
  product: TProduct;
begin
  case ProductID of
    A:product:=TConcreteProductB.Create;
    B:product:=TConcreteProductC.Create ;
    C:product:=TConcreteProductA.Create;
  end;
  Result := product;
end;


end.

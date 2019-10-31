unit clientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,FactoryByParameter;

type
  TClient = class (TForm)
    btnTest: TButton;
    ckbExchanged: TCheckBox;
    rgProductID: TRadioGroup;
    procedure btnTestClick(Sender: TObject);
  end;
  
var
  Client: TClient;

implementation

{$R *.dfm}

{
************************************ TForm1 ************************************
}
procedure TClient.btnTestClick(Sender: TObject);
var
  ID: TProductID;
  Product: TProduct;
  Factory: TFactory;
begin
  try
    if  ckbExchanged.Checked then
      Factory:=TFactoryExchanged.Create
    else
      Factory:=TFactory.Create;
    //��Ȼ���������ͬ,���ǲ�ͬ�Ĺ���������Ʒ�ķ�����ͬ��
    Product:=Factory.CreateProduct(TProductID(rgProductID.ItemIndex));
    Product.operation;
  finally
    Factory.Free;
    Product.Free;
  end;
end;

end.


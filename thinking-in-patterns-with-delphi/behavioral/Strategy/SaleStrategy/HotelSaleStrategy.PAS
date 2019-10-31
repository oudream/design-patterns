{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��23
_______________________________________________________
*******************************************************
}
unit HotelSaleStrategy;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TSaleStrategy = class (TObject)
  public
    function SalePrice(price:Currency;value:integer):Currency; virtual; abstract;
  end;
  
  TSeasonStrategy = class (TSaleStrategy)
  public
    function SalePrice(price:Currency;value:integer):Currency; override;
  end;
  
  TVIPStrategy = class (TSaleStrategy)
  public
    function SalePrice(price:Currency;value:integer):Currency; override;
  end;
  
  TTeamStrategy = class (TSaleStrategy)
  public
    function SalePrice(price:Currency;value:integer):Currency; override;
  end;
  
  TPriceContext = class (TObject)
  private
    FStrategy: TSaleStrategy;
    procedure SetStrategy(Value: TSaleStrategy);
  public
    function GetPrice(price:Currency;value:integer):Currency;
    property Strategy: TSaleStrategy read FStrategy write SetStrategy;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
******************************* TSeasonStrategy ********************************
}
function TSeasonStrategy.SalePrice(price:Currency;value:integer):Currency;
begin
  //�������۲���
  {
  2��3��11��8.5���Żݣ�
  4��6��9���Żݡ�
  8��9��9.5���Żݡ�
  }
  case value of
    2,3,11:result:=price*0.85;
    4,6:result:=price*0.9;
    8,9:result:=price*0.95;
    else
      result:=price;
  end;
end;

{
********************************* TVIPStrategy *********************************
}
function TVIPStrategy.SalePrice(price:Currency;value:integer):Currency;
begin
  //VIP�����۲���
  {
  0:VIP���� 9���Ż�
  1:VIP�� 8���Ż�
  2:VIP��ʯ�� 7 ���Ż�
  }

  case value of
    0:result:=price*0.9;
    1:result:=price*0.8;
    2:result:=price*0.7;
  end;
end;

{
******************************** TTeamStrategy *********************************
}
function TTeamStrategy.SalePrice(price:Currency;value:integer):Currency;
begin
  //�Ŷ����۲���
  {
  3-5���Ŷ�9���Żݣ�
  6-10���Ŷ�8���Żݣ�
  11-20���Ŷ�7���Żݣ�
  20�������Ŷ�6���Żݡ�
  }
  result:=price;
  if (value<6) and (value>2) then  result:=price*0.9;
  if (value<11) and (value>5) then  result:=price*0.8;
  if (value<21) and (value>10) then  result:=price*0.7;
  if (value>20) then  result:=price*0.6;
end;

{
*********************************** TPriceContext ***********************************
}
function TPriceContext.GetPrice(price:Currency;value:integer):Currency;
begin
  result:=Strategy.SalePrice(price,value);
end;

procedure TPriceContext.SetStrategy(Value: TSaleStrategy);
begin
  FStrategy:=Value;
end;


end.
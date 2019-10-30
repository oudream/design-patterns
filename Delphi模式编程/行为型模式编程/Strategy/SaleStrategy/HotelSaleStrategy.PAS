{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－23
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
  //季节销售策略
  {
  2、3、11月8.5折优惠，
  4、6月9折优惠。
  8、9月9.5折优惠。
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
  //VIP卡销售策略
  {
  0:VIP银卡 9折优惠
  1:VIP金卡 8折优惠
  2:VIP钻石卡 7 折优惠
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
  //团队销售策略
  {
  3-5人团队9折优惠；
  6-10人团队8折优惠；
  11-20人团队7折优惠；
  20人以上团队6折优惠。
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

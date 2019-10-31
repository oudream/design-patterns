
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
unit UpCast;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TFruit = class (TObject)
  protected
    FName: string;
  public
    constructor create(name:String);
    procedure eat; virtual; abstract;
  end;
  
  TApple = class (TFruit)
  public
    procedure eat; override;
  end;
  
  TBanana = class (TFruit)
  public
    procedure eat; override;
  end;
  
  TClient = class (TObject)
  public
    procedure eatFruit;
    procedure ShowClassName(o:TObject);
  end;
  
  TGrape = class (TFruit)
  public
    procedure eat; override;
  end;
  


implementation


{
************************************ TFruit ************************************
}
constructor TFruit.create(name:String);
begin
  FName:=name;
end;

{
************************************ TApple ************************************
}
procedure TApple.eat;
begin
  ShowMessage(FName+'削皮吃。');
end;

{
*********************************** TBanana ************************************
}
procedure TBanana.eat;
begin
  ShowMessage(FName+'剥皮吃。');
end;



{
************************************ TGrape ************************************
}
procedure TGrape.eat;
begin
  ShowMessage('吃'+FName+'要吐葡萄皮。');
end;

{
*********************************** TClient ************************************
}
procedure TClient.eatFruit;
var
  Fruit:TFruit;
  Banana:TBanana ;
begin
  Fruit:=TApple.create('红苹果');
  ShowClassName(Fruit);
  Fruit.eat;
  Fruit.Free;

  Fruit:=TBanana.create('进口香蕉');
  ShowClassName(Fruit);
  Fruit.eat;
  Fruit.Free;

  Fruit:=TGrape.create('吐鲁番葡萄');
  ShowClassName(Fruit);
  Fruit.eat;
  Fruit.Free;
end;

procedure TClient.ShowClassName(o:TObject);
var
  Name,ParentName:string;
begin
  Name:=o.ClassName;
  ParentName:=o.ClassParent.ClassName;
  ShowMessage('当前对象类的名称：'+Name+#10+'基类（父类）的名称：'+ParentName);
end;

end.

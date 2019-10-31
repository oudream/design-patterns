
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
unit Bridge;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  THardComputer = class (TObject)
  private
    FName: string;
  public
    constructor Create(name:string);
    procedure Run; virtual; abstract;
  end;
  
  THardDesktop = class (THardComputer)
  public
    procedure Run; override;
  end;
  
  THardPalmtop = class (THardComputer)
  public
    procedure Run; override;
  end;
  
  TSoftComputer = class (TObject)
  private
    FComputer: THardComputer;
    procedure SetComputer(Value: THardComputer);
  public
    procedure SysRun; virtual;
    property Computer: THardComputer read FComputer write SetComputer;
  end;
  
  TSoftPalmtop = class (TSoftComputer)
  public
    procedure SysRun; override;
  end;
  
  TSoftDesktop = class (TSoftComputer)
  public
    procedure SysRun; override;
  end;
  
implementation


{
******************************** THardComputer *********************************
}
constructor THardComputer.Create(name:string);
begin
  FName:=name;
end;

{
********************************* THardDesktop *********************************
}
procedure THardDesktop.Run;
begin
  ShowMessage(FName+'开机运行，加载220V电源...');
  ShowMessage('台式机：'+FName+'硬件工作正常！');
end;

{
********************************* THardPalmtop *********************************
}
procedure THardPalmtop.Run;
begin
  ShowMessage(FName+'开机运行,接通锂电池...');
  ShowMessage('掌上电脑：'+FName+'硬件工作正常！');
end;

{
******************************** TSoftComputer *********************************
}
procedure TSoftComputer.SetComputer(Value: THardComputer);
begin
  FComputer:=Value;
end;

procedure TSoftComputer.SysRun;
begin
  FComputer.Run;
end;

{
********************************* TSoftPalmtop *********************************
}
procedure TSoftPalmtop.SysRun;
begin
  inherited;
  //自己的修正代码
  ShowMessage('加载Palm OS 操作系统...');
  ShowMessage('掌上机软件系统运行正常!');
end;

{
********************************* TSoftDesktop *********************************
}
procedure TSoftDesktop.SysRun;
begin
  inherited;
  //自己的修正代码
  ShowMessage('加载Windows操作系统...');
  ShowMessage('台式机软件系统运行正常!');
end;

end.

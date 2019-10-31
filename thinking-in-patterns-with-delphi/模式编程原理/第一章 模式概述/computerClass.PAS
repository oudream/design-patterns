
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
unit computerClass;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TComputer = class (TObject)
  public
    procedure LoadOS;
    procedure PowerON; virtual; abstract;
    procedure Run;
    procedure SysCheck;
  end;
  
  THPDeskTop = class (TComputer)
  public
    procedure PowerON; override;
  end;
  
  TIBMThinkPad = class (TComputer)
  public
    procedure PowerON; override;
  end;

  
implementation


{
********************************** TComputer ***********************************
}
procedure TComputer.LoadOS;
begin
  ShowMessage('载入Windows操作系统');
end;

procedure TComputer.Run;
begin
  PowerON;
  SysCheck;
  LoadOS;
end;

procedure TComputer.SysCheck;
begin
  ShowMessage('检测硬件系统');
end;

{
********************************** THPDeskTop **********************************
}
procedure THPDeskTop.PowerON;
begin
  ShowMessage('开启HP台式电脑，电压220V，工作正常');
end;

{
********************************* TIBMThinkPad *********************************
}
procedure TIBMThinkPad.PowerON;
begin
  ShowMessage('开启IBM ThinkPad笔记本电脑，剩余电池80％');
end;


end.


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
unit UserForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Bridge, ExtCtrls,computerClass;

type
  TClient = class (TForm)
    btnRun: TButton;
    RadioGroup1: TRadioGroup;
    procedure btnRunClick(Sender: TObject);
  end;
  
var
  Client: TClient;

implementation

{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.btnRunClick(Sender: TObject);
var
  Computer: TComputer;
begin
  //客户端（TClient）使用电脑（TComputer）的示意代码
  try
    case RadioGroup1.ItemIndex of
      0: Computer:=TIBMThinkPad.Create;
      1: Computer:=THPDeskTop.Create;
    end;
    Computer.Run;
  finally
    Computer.Free;
  end;
end;


end.



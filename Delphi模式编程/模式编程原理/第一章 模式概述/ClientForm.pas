
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
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Bridge, ExtCtrls;

type
  TClient = class (TForm)
    btnTest: TButton;
    RadioGroup1: TRadioGroup;
    edtName: TLabeledEdit;
    procedure btnTestClick(Sender: TObject);
  end;
  
var
  Client: TClient;

implementation

{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.btnTestClick(Sender: TObject);
var
  AbstractComputer:TSoftComputer;
  Computer:THardComputer;
begin
  try
    if  RadioGroup1.ItemIndex=0 then
    //台式机
    begin
      AbstractComputer:=TSoftPalmtop.Create;
      AbstractComputer.Computer:=THardPalmtop.Create(edtName.Text);
    end
    else
    //掌上机
    begin
      AbstractComputer:=TSoftDesktop.Create;
      AbstractComputer.Computer:=THardDesktop.Create(edtName.Text);
    end;
    AbstractComputer.SysRun;
  finally
    AbstractComputer.Computer.Free;
    AbstractComputer.Free;
  end;
end;

end.


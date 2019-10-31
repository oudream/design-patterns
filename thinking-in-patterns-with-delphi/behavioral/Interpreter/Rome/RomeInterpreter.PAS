{
_______________________________________________________
*******************************************************

   《Thinking in patterns with Delphi》示例程序

    程序名称：罗马数字到阿拉伯数字的转换
    Ver：1.0
    说明：解释器模式的应用。


    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－8
_______________________________________________________
*******************************************************
}
unit RomeInterpreter;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type

  
  TContext = class (TObject)
  private
    FInput: string;
    FOutput: Integer;
    procedure SetInput(const Value: string);
    procedure SetOutput(const Value: Integer);
  public
    constructor Create(input:string);
    function BeginWith(value:string): Boolean;
    property Input: string read FInput write SetInput;
    property Output: Integer read FOutput write SetOutput;
  end;

  TAbstractExpression = class (TObject)
  public
    function Five: string; virtual; abstract;
    function Four: string; virtual; abstract;
    procedure Interpret(context:TContext); virtual;
    function Multiplier: Integer; virtual; abstract;
    function Nine: string; virtual; abstract;
    function One: string; virtual; abstract;
  end;

  TOneExp = class (TAbstractExpression)
  public
    function Five: string; override;
    function Four: string; override;
    function Multiplier: Integer; override;
    function Nine: string; override;
    function One: string; override;
  end;
  
  TTenExp = class (TAbstractExpression)
  public
    function Five: string; override;
    function Four: string; override;
    function Multiplier: Integer; override;
    function Nine: string; override;
    function One: string; override;
  end;

  THundredExp = class (TAbstractExpression)
  public
    function Five: string; override;
    function Four: string; override;
    function Multiplier: Integer; override;
    function Nine: string; override;
    function One: string; override;
  end;

  TThousandExp = class (TAbstractExpression)
  public
    function Five: string; override;
    function Four: string; override;
    function Multiplier: Integer; override;
    function Nine: string; override;
    function One: string; override;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
***************************** TAbstractExpression ******************************
}
procedure TAbstractExpression.Interpret(context:TContext);
begin
  if  Length(context.Input)= 0 then
    exit;
  if context.BeginWith(Nine) then
  begin
    context.Output:=context.Output+9*Multiplier;
    context.FInput:= Copy(context.FInput,
          3,(Length(context.FInput)-2));
  end
  else if context.BeginWith(Four) then
  begin
    context.Output:=context.Output+4*Multiplier;
    context.FInput:= Copy(context.FInput,
          3,(Length(context.FInput)-2));
  end
  else if context.BeginWith(Five) then
  begin
    context.Output:=context.Output+5*Multiplier;
    context.FInput:= Copy(context.FInput,
          2,(Length(context.FInput)-1));
  end;
  while context.BeginWith(One) do
  begin
    context.Output:=context.Output+1*Multiplier;
    context.FInput:= Copy(context.FInput,
          2,(Length(context.FInput)-1));
  end;
end;

{
*********************************** TContext ***********************************
}
constructor TContext.Create(input:string);
begin
  FInput:=input;
end;

function TContext.BeginWith(value:string): Boolean;
var
  i: Integer;
begin
  i:=Length(value);
  if Copy(FInput,0,i)=value then
    result:=true
  else
    result:=false;
end;

procedure TContext.SetInput(const Value: string);
begin
  FInput:=Value;
end;

procedure TContext.SetOutput(const Value: Integer);
begin
  FOutput:=Value;
end;

{
*********************************** TOneExp ************************************
}
// One checks for I, II, III, IV, V, VI, VII, VIII, IX
// "TerminalExpression"

function TOneExp.Five: string;
begin
  result:='V';
end;

function TOneExp.Four: string;
begin
  result:='IV';
end;

function TOneExp.Multiplier: Integer;
begin
  result:=1;
end;

function TOneExp.Nine: string;
begin
  result:='IX';
end;

function TOneExp.One: string;
begin
  result:='I';
end;

{
*********************************** TTenExp ************************************
}
// Ten checks for X, XL, L and XC
// "TerminalExpression"

function TTenExp.Five: string;
begin
  result:='L';
end;

function TTenExp.Four: string;
begin
  result:='XL';
end;

function TTenExp.Multiplier: Integer;
begin
  result:=10;
end;

function TTenExp.Nine: string;
begin
  result:='XC';
end;

function TTenExp.One: string;
begin
  result:='X';
end;
{
*********************************** THundredExp ************************************
}
// Hundred checks C, CD, D or CM
// "TerminalExpression"

function THundredExp.Five: string;
begin
  result:='D';
end;

function THundredExp.Four: string;
begin
  result:='CD';
end;

function THundredExp.Multiplier: Integer;
begin
  result:=100;
end;

function THundredExp.Nine: string;
begin
  result:='CM';
end;

function THundredExp.One: string;
begin
  result:='C';
end;
{
********************************* TThousandExp *********************************
}
// Thousand checks for the Roman Numeral M
// "TerminalExpression"

function TThousandExp.Five: string;
begin
  result:=' ';
end;

function TThousandExp.Four: string;
begin
  result:=' ';
end;

function TThousandExp.Multiplier: Integer;
begin
  result:=1000;
end;

function TThousandExp.Nine: string;
begin
  result:=' ';
end;

function TThousandExp.One: string;
begin
  result:='M';
end;


end.

{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：任务调度
    Ver：2.0

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit Flyweight;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,Contnrs;

type
  TEmployee = class (TObject)
  public
    procedure AssignTask(task:String); virtual; abstract;
  end;
  
  TWorker = class (TEmployee)
  public
    FWorker: String;
    FTask: String;
    constructor Create(workername:string);
    procedure AssignTask(task:String); override;
  end;
  

  TEmployeeFactory = class (TObject)
  public
    FEmployees: TStrings;
    constructor Create;
    function GetEmployee(workername:string): TEmployee;
  end;
  
implementation


{
*********************************** TWorker ************************************
}
constructor TWorker.Create(workername:string);
begin
  FWorker:=workername;
end;

procedure TWorker.AssignTask(task:String);
begin
  FTask:=task;
end;


{
******************************* TEmployeeFactory *******************************
}
constructor TEmployeeFactory.Create;
begin
  FEmployees:=TStringList.Create;
end;

function TEmployeeFactory.GetEmployee(workername:string): TEmployee;
var
  Employee: TEmployee;
  i: Integer;
begin
  i:=FEmployees.IndexOf(workername);
  if i = -1 then
  begin
    Employee:=TWorker.create(workername);
    FEmployees.AddObject(workername,Employee);
  end
  else
    Employee:=TEmployee(FEmployees.Objects[i]);
  result:=Employee;
end;


end.

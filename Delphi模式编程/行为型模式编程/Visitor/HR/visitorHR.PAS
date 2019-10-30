unit visitorHR;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,Contnrs,ComCtrls;

type
  TVisitor = class;

  TOrganizedMan = class (TObject)
  protected
    function GetSalary: Currency; virtual; abstract;
    function GetVacation: Integer; virtual; abstract;
    procedure SetSalary(Value:Currency); virtual; abstract;
    procedure SetVacation(value:integer); virtual; abstract;
  public
    function GetSalaries: Currency; virtual; abstract;
    constructor Create(name:string;salary:integer); virtual; abstract;
    procedure Accept(visitor:TVisitor); virtual; abstract;
    procedure Add(OrganizedMan:TOrganizedMan); virtual; abstract;
    procedure FreeChildren; virtual; abstract;
    function GetChild(index:Integer): TOrganizedMan; virtual; abstract;
    function GetName: string; virtual; abstract;
    procedure Remove(OrganizedMan:TOrganizedMan); virtual; abstract;
    procedure SetItems(items:TStrings;level:integer); virtual; abstract;
    property Salary: Currency read GetSalary write SetSalary;
    property Vacation: Integer read GetVacation write SetVacation;
  end;
  
  TEmployee = class (TOrganizedMan)
  private
    FName: string;
    FSalary: Currency;
    FVacation: Integer;
    function GetSalary: Currency; override;
    function GetVacation: Integer;override;
    procedure SetSalary(Value: Currency); override;
    procedure SetVacation(Value: Integer);override;
  public
    constructor Create(name:string;salary:integer); override;
    procedure Accept(visitor:TVisitor); override;
    procedure Add(OrganizedMan:TOrganizedMan); override;
    procedure FreeChildren; override;
    function GetChild(Index:Integer): TOrganizedMan; override;
    function getName: string; override;
    function GetSalaries: Currency; override;
    procedure Remove(OrganizedMan:TOrganizedMan); override;
    procedure SetItems(items:TStrings;level:integer); overload; override;
    property Salary: Currency read GetSalary write SetSalary;
    property Vacation: Integer read GetVacation write SetVacation;
  end;
  
  TManager = class (TOrganizedMan)
  private
    children: TObjectList;
    FName: string;
    FSalary: Currency;
    FVacation: Integer;
    function GetSalary: Currency; override;
    function GetVacation: Integer;override;
    procedure SetSalary(Value: Currency); override;
    procedure SetVacation(Value: Integer);override;
  public
    constructor Create(name:string;salary:integer); override;
    procedure Accept(visitor:TVisitor); override;
    procedure Add(OrganizedMan:TOrganizedMan); override;
    procedure FreeChildren; override;
    function GetChild(Index:Integer): TOrganizedMan; override;
    function getName: string; override;
    function GetSalaries: Currency; override;
    procedure Remove(OrganizedMan:TOrganizedMan); override;
    procedure SetItems(items:TStrings;level:integer); override;
    property Salary: Currency read GetSalary write SetSalary;
    property Vacation: Integer read GetVacation write SetVacation;
  end;
  
  TVisitor = class (TObject)
  public
    procedure VisitEmployee(Employee:TEmployee); virtual; abstract;
    procedure VisitManager(Manager:TManager); virtual; abstract;
  end;
  
  TSalaryVisitor = class (TVisitor)
  private
    FEmployeeSalaryRate: Double;
    FManagerSalaryRate: Double;
  public
    constructor Create(EmpRate,MangRate:Double);
    procedure VisitEmployee(Employee:TEmployee); override;
    procedure VisitManager(Manager:TManager); override;
  end;
  
  TVacationVisitor = class (TVisitor)
  private
    FEmployeeVacation: Integer;
    FManagerVacation: Integer;
  public
    constructor Create(EmpVaca,MangVaca:Integer);
    procedure VisitEmployee(Employee:TEmployee); override;
    procedure VisitManager(Manager:TManager); override;
  end;
  
implementation


{
********************************** TEmployee ***********************************
}
constructor TEmployee.Create(name:string;salary:integer);
begin
  FName:=name;
  FSalary:=salary;
  FVacation:=7;
end;

procedure TEmployee.Accept(visitor:TVisitor);
begin
  visitor.VisitEmployee(self);
end;

procedure TEmployee.Add(OrganizedMan:TOrganizedMan);
begin
  raise Exception.CreateFmt('%s类实例是叶节点对象,无法为其增加子节点对象！',
      [ClassName]);
end;

procedure TEmployee.FreeChildren;
var
  a: string;
begin
  if self<>nil then
  begin
    freeandnil(self);
  end;
end;

function TEmployee.GetChild(Index:Integer): TOrganizedMan;
begin
  result:=nil;
end;

function TEmployee.getName: string;
begin
  result:=FName;
end;

function TEmployee.GetSalaries: Currency;
begin
  result:=FSalary;
end;

function TEmployee.GetSalary: Currency;
begin
  result:=FSalary;
end;

function TEmployee.GetVacation: Integer;
begin
  result:=FVacation;
end;

procedure TEmployee.Remove(OrganizedMan:TOrganizedMan);
begin
  raise Exception.CreateFmt('%s类实例是叶节点对象,无法为其删除子节点对象！',
      [ClassName]);
end;

procedure TEmployee.SetItems(items:TStrings;level:integer);
var
  s: string;
  i: Integer;
begin
  for i:=1 to level  do  s:=s+'  ';
  s:=s+FName;
  items.AddObject(s,self);
end;

procedure TEmployee.SetSalary(Value: Currency);
begin
  FSalary:=Value;
end;

procedure TEmployee.SetVacation(Value: Integer);
begin
    FVacation:=value;
end;


{
*********************************** TManager ***********************************
}
constructor TManager.Create(name:string;salary:integer);
begin
  children:=TObjectList.Create;
  FName:=name;
  FSalary:=salary;
  FVacation:=10;
end;

procedure TManager.Accept(visitor:TVisitor);
var
  i: Integer;
  a: string;
  obj: TOrganizedMan;
begin
  if self<>nil then
  begin
    for i:=children.Count-1 downto 0  do
    begin
      obj:=TOrganizedMan(children.Items[i]);
      obj.Accept(visitor);
    end;
    visitor.VisitManager(self);
  end;
end;

procedure TManager.Add(OrganizedMan:TOrganizedMan);
begin
  children.Add(OrganizedMan);
end;

procedure TManager.FreeChildren;
var
  i: Integer;
  a: string;
  obj: TOrganizedMan;
begin
  if self<>nil then
  begin
    for i:=children.Count-1 downto 0  do
    begin
      obj:=TOrganizedMan(children.Items[i]);
      obj.FreeChildren;
    end;
    freeandnil(self);
  end;
end;

function TManager.GetChild(Index:Integer): TOrganizedMan;
begin
  result:=TOrganizedMan(children.Items[Index]);
end;

function TManager.getName: string;
begin
  result:=FName;
end;

function TManager.GetSalaries: Currency;
var
  i: Integer;
  nam: string;
  sum, salary: Currency;
begin
  sum:=GetSalary;
  for i:=0 to children.Count-1 do
  begin
  //调试中观察以下的nam值可以了解合成模式是如何递归遍历对象的。
  //  nam:=TOrganizedMan(children.Items[i]).getName;
    salary:=TOrganizedMan(children.Items[i]).getSalaries;
    sum:=sum+salary;
  end;
  result:=sum;
end;

function TManager.GetSalary: Currency;
begin
  result:=FSalary;
end;

function TManager.GetVacation: Integer;
begin
  result:=FVacation;
end;

procedure TManager.Remove(OrganizedMan:TOrganizedMan);
begin
  children.Remove(OrganizedMan);
end;

procedure TManager.SetItems(items:TStrings;level:integer);
var
  s: string;
  i: Integer;
  curItems: TStringList;
begin
  for i:=1 to level  do  s:=s+'  ';
  s:=s+'+'+FName;
  items.AddObject(s,self);
  for i:=0 to children.Count-1 do
  begin
    TOrganizedMan(children.Items[i]).SetItems(items,level+1)
  end;
end;

procedure TManager.SetSalary(Value: Currency);
begin
  FSalary:=Value;
end;

procedure TManager.SetVacation(Value: Integer);
begin
  FVacation:=value;
end;


{
******************************** TSalaryVisitor ********************************
}
constructor TSalaryVisitor.Create(EmpRate,MangRate:Double);
begin
  FEmployeeSalaryRate:=EmpRate;
  FManagerSalaryRate:=MangRate;
end;

procedure TSalaryVisitor.VisitEmployee(Employee:TEmployee);
begin
  //测试代码，演示访问者访问的当前元素对象
  //showmessage(self.ClassName+'访问了'+Employee.getName);
  Employee.Salary:=Employee.Salary*(1+FEmployeeSalaryRate);
end;

procedure TSalaryVisitor.VisitManager(Manager:TManager);
begin
  //测试代码，演示访问者访问的当前元素对象
  //showmessage(self.ClassName+'访问了'+Manager.getName);
  Manager.Salary:=Manager.Salary*(1+FManagerSalaryRate);
end;

{
******************************* TVacationVisitor *******************************
}
constructor TVacationVisitor.Create(EmpVaca,MangVaca:Integer);
begin
    FEmployeeVacation:=EmpVaca;
    FManagerVacation:=MangVaca;
end;

procedure TVacationVisitor.VisitEmployee(Employee:TEmployee);
begin
  //测试代码，演示访问者访问的当前元素对象
  //showmessage(self.ClassName+'访问了'+Employee.getName);
  Employee.Vacation:=FEmployeeVacation;
end;

procedure TVacationVisitor.VisitManager(Manager:TManager);
begin
  //测试代码，演示访问者访问的当前元素对象
  //showmessage(self.ClassName+'访问了'+Manager.getName);
  Manager.Vacation:=FManagerVacation;
end;



end.

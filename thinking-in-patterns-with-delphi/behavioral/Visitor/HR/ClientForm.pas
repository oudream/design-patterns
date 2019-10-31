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
  Dialogs, ComCtrls,visitorHR, StdCtrls;

type
  TClient = class(TForm)
    btnExit: TButton;
    Memo1: TMemo;
    ListBox1: TListBox;
    btnSalary: TButton;
    btnVacation: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure ListBox1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalaryClick(Sender: TObject);
    procedure btnVacationClick(Sender: TObject);
  private
    Root:TOrganizedMan;
    procedure DataIni;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

uses SalaryRateDlg, VacationDlg;



{$R *.dfm}

procedure TClient.DataIni;
var
    M_MKT:TManager;
    M_PRD:TManager;
    D_MKT1:TManager;
    D_MKT2:TManager;
    DisplayItems:TStrings;
    Employee:TEmployee;
begin
  Root:=TManager.Create('总经理',10000);
  Root.Add(TEmployee.Create('总经理秘书',2000));
  M_MKT:=TManager.Create('市场部经理',5000);
  D_MKT1:=TManager.Create('销售主管',3000);
  D_MKT1.Add(TEmployee.Create('高级推销员',2000));
  D_MKT1.Add(TEmployee.Create('见习推销员',1000));
  D_MKT2:=TManager.Create('市场主管',3000);
  D_MKT2.Add(TEmployee.Create('市场调研员',2000));
  M_PRD:=TManager.Create('制造部经理',5000);
  M_PRD.Add(TEmployee.Create('制造部雇员A',2000));
  M_PRD.Add(TEmployee.Create('制造部雇员B',2000));
  Root.Add(M_MKT);
  M_MKT.Add(D_MKT1);
  M_MKT.Add(D_MKT2);
  Root.Add(M_PRD);
  {叶节点不能加入子对象，以下语句用于测试异常：
  Employee:=TEmployee.Create('雇员',1000);
  Employee.Add(TEmployee.Create('其他雇员',2000));
  }
  DisplayItems:=TStringList.Create;
  Root.SetItems(DisplayItems,0);
  ListBox1.Items:=DisplayItems;
end;

procedure TClient.ListBox1Click(Sender: TObject);
var
  s:string;
  Person:TOrganizedMan;
begin
  Person:=TOrganizedMan(ListBox1.Items.Objects[ListBox1.ItemIndex]) ;
  s:=Person.getName;
  Memo1.Lines.Add(s);
  s:=CurrToStr(Person.GetSalaries);
  if Person.GetChild(0)<> nil then
      Memo1.Lines.Add('部门工资（元）:'+s);
  s:=CurrToStr(Person.Salary);
  Memo1.Lines.Add('个人工资（元）:'+s);
  s:=IntToStr(Person.Vacation);
  Memo1.Lines.Add('个人假期（天）:'+s);
  Memo1.Lines.Add('－－－－－－－－－－－－－－－');
end;

procedure TClient.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  DataIni;
end;

procedure TClient.FormDestroy(Sender: TObject);
begin
  Root.FreeChildren;
end;

procedure TClient.btnSalaryClick(Sender: TObject);
var
  visitor:TVisitor;
  r1,r2:Double;
begin
  dlgSalaryRate:=TdlgSalaryRate.Create(nil);
  try
    dlgSalaryRate.ShowModal;
    r1:=dlgSalaryRate.UpDown1.Position/100;
    r2:=dlgSalaryRate.UpDown2.Position/100;
    visitor:=TSalaryVisitor.Create(r1,r2);
    Root.Accept(visitor);
    Memo1.Lines.Add('个人工资调整完毕。员工增长'+inttostr(dlgSalaryRate.UpDown1.Position)
      +'%,经理增长'+inttostr(dlgSalaryRate.UpDown2.Position)+'%');
    Memo1.Lines.Add('－－－－－－－－－－－－－－－');
    visitor.Free;
  finally
    dlgSalaryRate.Free;
  end;
end;

procedure TClient.btnVacationClick(Sender: TObject);
var
  visitor:TVisitor;
  r1,r2:Integer;
begin
  dlgVacation:=TdlgVacation.Create(nil);
  try
    dlgVacation.ShowModal;
    r1:=dlgVacation.UpDown1.Position;
    r2:=dlgVacation.UpDown2.Position;
    visitor:=TVacationVisitor.Create(r1,r2);
    Root.Accept(visitor);
    Memo1.Lines.Add('带薪假期设置完毕。员工假期'+inttostr(dlgVacation.UpDown1.Position)
      +'天,经理假期'+inttostr(dlgVacation.UpDown2.Position)+'天');
    Memo1.Lines.Add('－－－－－－－－－－－－－－－');
    visitor.Free;
  finally
    dlgVacation.Free;
  end;
end;

end.

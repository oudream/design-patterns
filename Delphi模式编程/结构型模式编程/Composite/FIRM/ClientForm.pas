{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：Firm
    Ver：2.0

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,composite_Org, StdCtrls;

type
  TForm1 = class(TForm)
    btnExit: TButton;
    Memo1: TMemo;
    ListBox1: TListBox;
    procedure ListBox1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Root:TOrganizedMan;
    procedure DataIni;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation



{$R *.dfm}

procedure TForm1.DataIni;
var
    M_MKT:TManager;
    M_PRD:TManager;
    D_MKT1:TManager;
    D_MKT2:TManager;
    DisplayItems:TStrings;
    //Employee:TEmployee;
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

procedure TForm1.ListBox1Click(Sender: TObject);
var
  s:string;
  Person:TOrganizedMan;
begin
  Person:=TOrganizedMan(ListBox1.Items.Objects[ListBox1.ItemIndex]) ;
  s:=Person.getName;
  Memo1.Lines.Add(s);
  s:=IntToStr(Person.GetSalaries);
  if Person.GetChild(0)<> nil then
      Memo1.Lines.Add('部门工资:'+s);
  s:=IntToStr(Person.GetSalary);
  Memo1.Lines.Add('个人工资:'+s);
  Memo1.Lines.Add('－－－－－－－－－－－－－－－');
end;

procedure TForm1.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DataIni;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Root.FreeChildren;
end;

end.

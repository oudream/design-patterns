{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��23
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
  Root:=TManager.Create('�ܾ���',10000);
  Root.Add(TEmployee.Create('�ܾ�������',2000));
  M_MKT:=TManager.Create('�г�������',5000);
  D_MKT1:=TManager.Create('��������',3000);
  D_MKT1.Add(TEmployee.Create('�߼�����Ա',2000));
  D_MKT1.Add(TEmployee.Create('��ϰ����Ա',1000));
  D_MKT2:=TManager.Create('�г�����',3000);
  D_MKT2.Add(TEmployee.Create('�г�����Ա',2000));
  M_PRD:=TManager.Create('���첿����',5000);
  M_PRD.Add(TEmployee.Create('���첿��ԱA',2000));
  M_PRD.Add(TEmployee.Create('���첿��ԱB',2000));
  Root.Add(M_MKT);
  M_MKT.Add(D_MKT1);
  M_MKT.Add(D_MKT2);
  Root.Add(M_PRD);
  {Ҷ�ڵ㲻�ܼ����Ӷ�������������ڲ����쳣��
  Employee:=TEmployee.Create('��Ա',1000);
  Employee.Add(TEmployee.Create('������Ա',2000));
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
      Memo1.Lines.Add('���Ź��ʣ�Ԫ��:'+s);
  s:=CurrToStr(Person.Salary);
  Memo1.Lines.Add('���˹��ʣ�Ԫ��:'+s);
  s:=IntToStr(Person.Vacation);
  Memo1.Lines.Add('���˼��ڣ��죩:'+s);
  Memo1.Lines.Add('������������������������������');
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
    Memo1.Lines.Add('���˹��ʵ�����ϡ�Ա������'+inttostr(dlgSalaryRate.UpDown1.Position)
      +'%,��������'+inttostr(dlgSalaryRate.UpDown2.Position)+'%');
    Memo1.Lines.Add('������������������������������');
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
    Memo1.Lines.Add('��н����������ϡ�Ա������'+inttostr(dlgVacation.UpDown1.Position)
      +'��,�������'+inttostr(dlgVacation.UpDown2.Position)+'��');
    Memo1.Lines.Add('������������������������������');
    visitor.Free;
  finally
    dlgVacation.Free;
  end;
end;

end.

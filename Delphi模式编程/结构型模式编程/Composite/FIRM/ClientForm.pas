{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�Firm
    Ver��2.0

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
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
      Memo1.Lines.Add('���Ź���:'+s);
  s:=IntToStr(Person.GetSalary);
  Memo1.Lines.Add('���˹���:'+s);
  Memo1.Lines.Add('������������������������������');
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

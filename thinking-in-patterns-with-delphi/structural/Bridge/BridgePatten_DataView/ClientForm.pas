{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�BridgePatten_DataView
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
  Dialogs, StdCtrls,Data_Bridge, ExtCtrls, DBCtrls, DB, ADODB;

type
  TClient = class (TForm)
    btnExit: TButton;
    rgType: TRadioGroup;
    btnPrior: TButton;
    btnNew: TButton;
    btnDel: TButton;
    btnNext: TButton;
    edtName: TLabeledEdit;
    edtSex: TLabeledEdit;
    edtDep: TLabeledEdit;
    edtSalary: TLabeledEdit;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
  private
    FEmpView:TBusinessObject;
    FEmpDataFromFile,FEmpDataFromTable:TDataObject;
    FEmp:TEmp;
    procedure RefreshRec;
  end;

var
  Client: TClient;

implementation

uses AddForm;

{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.RefreshRec;
begin
  edtName.Text:=FEmp.Name;
  edtSex.Text:=FEmp.Sex;
  edtDep.Text:=FEmp.Dep;
  edtSalary.Text:=IntToStr(FEmp.Salary);
  case FEmp.tag of
    1:edtSalary.Color:=RGB(255,200,200) ;
    2:edtSalary.Color:=clInfoBk ;
    3:edtSalary.Color:=clMoneyGreen ;
    4:edtSalary.Color:=clSkyBlue;
  else
    edtSalary.Color:=clWindow ;
  end;

end;

procedure TClient.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  FEmpView:=TCustomersBusinessObject.Create;
  FEmpDataFromFile:=TDataFileObj.create;
  FEmpDataFromTable:=TDataBaseObj.create;
  FEmp:=TEmp.Create;
  FEmpView.EmpData:=FEmpDataFromTable;//ȱʡ����
end;

procedure TClient.btnPriorClick(Sender: TObject);
begin
  FEmpView.Prior(FEmp);
  RefreshRec;
end;

procedure TClient.btnNextClick(Sender: TObject);
begin
  FEmpView.Next(FEmp);
  RefreshRec;
end;

procedure TClient.btnDelClick(Sender: TObject);
begin
  FEmpView.Delete(FEmp);
  RefreshRec;
end;

procedure TClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FEmpView.Free;
  FEmp.Free;
  FEmpDataFromFile.Free;
  FEmpDataFromTable.Free;
end;

procedure TClient.btnNewClick(Sender: TObject);
var
  AddDlg: TAddDlg;
begin
  AddDlg:=TAddDlg.Create(nil);
  try
    AddDlg.ShowModal;
    if AddDlg.ModalResult=mrOk then
    begin
      FEmp.Name:=AddDlg.edtName.Text;
      FEmp.sex:=AddDlg.edtSex.Text;
      FEmp.Dep:=AddDlg.edtDep.Text;
      FEmp.Salary:=StrToInt64(AddDlg.edtSalary.Text);
      FEmpView.New(FEmp);
      RefreshRec;
    end;
  finally
    AddDlg.Free;
  end;
end;

procedure TClient.rgTypeClick(Sender: TObject);
begin
  if  rgType.ItemIndex=0 then
     FEmpView.EmpData:=FEmpDataFromTable
  else
     FEmpView.EmpData:=FEmpDataFromFile;
end;

end.


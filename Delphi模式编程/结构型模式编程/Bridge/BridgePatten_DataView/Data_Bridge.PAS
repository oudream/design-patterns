{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：BridgePatten_DataView
    Ver：2.0

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit Data_Bridge;

interface

uses
  SysUtils, Windows,Variants,Messages, Classes, Graphics, Controls,
  Forms, Dialogs,DB, ADODB;

type
  TEmp = class (TObject)
    Dep: string;
    Name: string;
    Salary: Int64;
    sex: string;
    tag: Integer;
  end;
  
  TDataObject = class (TObject)
  public
    constructor create; virtual; abstract;
    procedure DeleteRecord(Emp:TEmp); virtual; abstract;
    procedure NewRecord(Emp:TEmp); virtual; abstract;
    procedure NextRecord(Emp:TEmp); virtual; abstract;
    procedure PriorRecord(Emp:TEmp); virtual; abstract;
  end;
  
  TDataFileObj = class (TDataObject)
  private
    FEmployees: TStringList;
    FIndex: Integer;
    procedure RecordToEmp(Emp:TEmp);
  public
    constructor create; override;
    destructor destroy; override;
    procedure DeleteRecord(Emp:TEmp); override;
    procedure NewRecord(Emp:TEmp); override;
    procedure NextRecord(Emp:TEmp); override;
    procedure PriorRecord(Emp:TEmp); override;
  end;
  
  TDataBaseObj = class (TDataObject)
  private
    FEmployees: TADOTable;
    procedure RecordToEmp(Emp:TEmp);
  public
    constructor create; override;
    destructor destroy; override;
    procedure DeleteRecord(Emp:TEmp); override;
    procedure NewRecord(Emp:TEmp); override;
    procedure NextRecord(Emp:TEmp); override;
    procedure PriorRecord(Emp:TEmp); override;
  end;
  
  TBusinessObject = class (TObject)
  protected
    FEmp: TEmp;
    FEmpData: TDataObject;
    procedure SetEmpData(Value: TDataObject);
  public
    procedure Delete(Emp:TEmp); virtual;
    procedure New(Emp:TEmp); virtual;
    procedure Next(Emp:TEmp); virtual;
    procedure Prior(Emp:TEmp); virtual;
    property EmpData: TDataObject read FEmpData write SetEmpData;
  end;
  
  TCustomersBusinessObject = class (TBusinessObject)
  private
    procedure BizRule1(Emp:TEmp);
  public
    procedure Next(Emp:TEmp); override;
    procedure Prior(Emp:TEmp); override;
  end;
  


implementation


{
********************************* TDataFileObj *********************************
}
constructor TDataFileObj.create;
var
  i: Integer;
  a: string;
begin
  FEmployees:=TStringlist.Create;
  FEmployees.LoadFromFile('Test.txt');
  FIndex:=0;
end;

destructor TDataFileObj.destroy;
begin
  FEmployees.SaveToFile('Test.txt');
  FEmployees.Free;
  inherited;
end;

procedure TDataFileObj.DeleteRecord(Emp:TEmp);
begin
  if Emp<>nil then
  begin
    FEmployees.Delete(FIndex);
    Emp.Name:='';
    Emp.sex:='';
    Emp.Dep:='';
    Emp.Salary:=0;
  end;
end;

procedure TDataFileObj.NewRecord(Emp:TEmp);
begin
  if Emp<>nil then
  FEmployees.Add(Emp.Name+';'+Emp.sex+';'+Emp.Dep+';'+IntToStr(Emp.Salary))
end;

procedure TDataFileObj.NextRecord(Emp:TEmp);
begin
  if Emp<>nil then
  begin
    if FIndex<(FEmployees.Count-1) then
    begin
      Inc(FIndex);
      RecordToEmp(Emp);
    end
    else
      application.MessageBox('已到最后一条记录。','提示',
        MB_OK+MB_ICONINFORMATION) ;
  end;
end;

procedure TDataFileObj.PriorRecord(Emp:TEmp);
begin
  if Emp<>nil then
  begin
    if FIndex>0 then
    begin
      Dec(FIndex);
      RecordToEmp(Emp);
    end
    else
      application.MessageBox('已到第一条记录。','提示',
        MB_OK+MB_ICONINFORMATION) ;
  end;
end;

procedure TDataFileObj.RecordToEmp(Emp:TEmp);
var
  tmp: string;
  myStr: string;
  i: Integer;
  fieldList: TstringList;
begin
  fieldList:=TstringList.Create;
  myStr:=FEmployees.Strings[FIndex];
  //将string格式转换为TEmp
  i:=pos(';',myStr);//判断‘；’位置
  while i>0 do
  begin
    tmp:=copy(myStr,1,i-1);
    fieldList.Add(tmp);
    delete(myStr,1,i);
    i:=pos(';',myStr);
  end;
  fieldList.Add(myStr);
  fieldList.SaveToFile('fieldList.txt'); //test
  Emp.Name:=fieldList.Strings[0];
  Emp.sex:=fieldList.Strings[1];
  Emp.Dep:=fieldList.Strings[2];
  Emp.Salary:=StrToInt64(fieldList.Strings[3]);
  fieldList.Free;
end;

{
********************************* TDataBaseObj *********************************
}
constructor TDataBaseObj.create;
begin
  FEmployees:=TADOTable.Create(nil);
  FEmployees.connectionstring:=
   'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=TEST.MDB;Persist Security Info=False';
  FEmployees.TableName:='Employee';
  FEmployees.Open;
  FEmployees.First;
end;

destructor TDataBaseObj.destroy;
begin
  FEmployees.Close;
  FEmployees.Free;
end;

procedure TDataBaseObj.DeleteRecord(Emp:TEmp);
begin
  if  (Emp<>nil) and (Emp.Name<>'') then
  begin
    FEmployees.Locate('Name;Sex;Dep;Salary',
      VarArrayOf([Emp.Name,Emp.sex,Emp.Dep,Emp.Salary]),[loPartialKey]);
    FEmployees.Delete;
    application.MessageBox('已删除记录。','提示',
        MB_OK+MB_ICONINFORMATION) ;
            Emp.Name:='';
    Emp.sex:='';
    Emp.Dep:='';
    Emp.Salary:=0;
  end;
end;

procedure TDataBaseObj.NewRecord(Emp:TEmp);
begin
  if  (Emp<>nil) and (Emp.Name<>'') then
  begin
    FEmployees.Append;
    FEmployees.FieldValues['name']:=Emp.Name;
    FEmployees.FieldValues['Sex']:=Emp.sex;
    FEmployees.FieldValues['Dep']:=Emp.Dep;
    FEmployees.FieldValues['Salary']:=Emp.Salary;
    FEmployees.Post;
  end;
end;

procedure TDataBaseObj.NextRecord(Emp:TEmp);
begin
  if not FEmployees.Eof then
  begin
    FEmployees.Next;
    RecordToEmp(Emp);
  end
  else
    application.MessageBox('已到最后一条记录。','提示',
        MB_OK+MB_ICONINFORMATION) ;
end;

procedure TDataBaseObj.PriorRecord(Emp:TEmp);
begin
  if not FEmployees.Bof then
  begin
    FEmployees.Prior;
    RecordToEmp(Emp);
  end
  else
    application.MessageBox('已到第一条记录。','提示',
        MB_OK+MB_ICONINFORMATION) ;
end;

procedure TDataBaseObj.RecordToEmp(Emp:TEmp);
begin
  if  Emp<>nil then
  begin
    Emp.Name:=FEmployees.FieldByName('Name').AsString;
    Emp.sex:=FEmployees.FieldByName('Sex').AsString;
    Emp.Dep:=FEmployees.FieldByName('Dep').AsString;
    Emp.Salary:=FEmployees.FieldByName('Salary').AsInteger;
  end;
end;

{
******************************* TBusinessObject ********************************
}
procedure TBusinessObject.Delete(Emp:TEmp);
begin
  FEmpData.DeleteRecord(Emp);
end;

procedure TBusinessObject.New(Emp:TEmp);
begin
  FEmpData.NewRecord(Emp);
end;

procedure TBusinessObject.Next(Emp:TEmp);
begin
  FEmpData.NextRecord (Emp);
end;

procedure TBusinessObject.Prior(Emp:TEmp);
begin
  FEmpData.PriorRecord(Emp);
end;

procedure TBusinessObject.SetEmpData(Value: TDataObject);
begin
  FEmpData:=Value;
end;

{
*************************** TCustomersBusinessObject ***************************
}
procedure TCustomersBusinessObject.BizRule1(Emp:TEmp);
begin
  if Emp.Salary>10000 then
    Emp.tag:=1
  else if (Emp.Salary<10000) and (Emp.Salary>5000) then
        Emp.tag:=2
      else if (Emp.Salary<5000) and (Emp.Salary>2000) then
             Emp.tag:=3
           else Emp.tag:=4;
end;

procedure TCustomersBusinessObject.Next(Emp:TEmp);
begin
  inherited;
  BizRule1(Emp);
end;

procedure TCustomersBusinessObject.Prior(Emp:TEmp);
begin
  inherited;
  BizRule1(Emp);
end;


end.

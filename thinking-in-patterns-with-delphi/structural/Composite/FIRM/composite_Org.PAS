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

unit composite_Org;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,Contnrs,ComCtrls;

type
  TOrganizedMan = class (TObject)
  public
    constructor create(name:string;salary:integer); virtual; abstract;
    procedure Add(OrganizedMan:TOrganizedMan); virtual; abstract;
    procedure FreeChildren; virtual; abstract;
    function GetChild(index:Integer): TOrganizedMan; virtual; abstract;
    function getName: string; virtual; abstract;
    function GetSalaries: Integer; virtual; abstract;
    function getSalary: Integer; virtual; abstract;
    procedure Remove(OrganizedMan:TOrganizedMan); virtual; abstract;
    procedure SetItems(items:TStrings;level:integer); virtual; abstract;
  end;
  
  TEmployee = class (TOrganizedMan)
  private
    FName: string;
    FSalary: Integer;
    function GetSalary: Integer; override;
  public
    constructor Create(name:string;salary:integer); override;
    procedure Add(OrganizedMan:TOrganizedMan); override;
    procedure FreeChildren; override;
    function GetChild(Index:Integer): TOrganizedMan; override;
    function getName: string; override;
    function GetSalaries: Integer; override;
    procedure Remove(OrganizedMan:TOrganizedMan); override;
    procedure SetItems(items:TStrings;level:integer); overload; override;
  end;
  
  TManager = class (TOrganizedMan)
  private
    children: TObjectList;
    FName: string;
    FSalary: Integer;
    function GetSalary: Integer; override;
  public
    constructor Create(name:string;salary:integer); override;
    procedure Add(OrganizedMan:TOrganizedMan); override;
    procedure FreeChildren; override;
    function GetChild(Index:Integer): TOrganizedMan; override;
    function getName: string; override;
    function GetSalaries: Integer; override;
    procedure Remove(OrganizedMan:TOrganizedMan); override;
    procedure SetItems(items:TStrings;level:integer); override;
  end;

implementation


{
********************************** TEmployee ***********************************
}
constructor TEmployee.Create(name:string;salary:integer);
begin
  FName:=name;
  FSalary:=salary;
end;

procedure TEmployee.Add(OrganizedMan:TOrganizedMan);
begin
  raise Exception.CreateFmt('%s��ʵ����Ҷ�ڵ����,�޷�Ϊ�������ӽڵ����',
      [ClassName]);
end;

procedure TEmployee.FreeChildren;
var
  a:string;
begin
  if self<>nil then
  begin
      { ��ʾ���ٵĶ��� }
    a:='���ٵĶ���:'+getName;
    application.MessageBox(PCHAR(a),'��ʾ',0);
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

function TEmployee.GetSalaries: Integer;
begin
  result:=FSalary;
end;

function TEmployee.GetSalary: Integer;
begin
  result:=FSalary;
end;

procedure TEmployee.Remove(OrganizedMan:TOrganizedMan);
begin
  raise Exception.CreateFmt('%s��ʵ����Ҷ�ڵ����,�޷�Ϊ��ɾ���ӽڵ����',
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


{
*********************************** TManager ***********************************
}
constructor TManager.Create(name:string;salary:integer);
begin
  children:=TObjectList.Create;
  FName:=name;
  FSalary:=salary;
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
    { ��ʾ���ٵĶ��� }
    a:='���ٵĶ���:'+getName;
    application.MessageBox(PCHAR(a),'��ʾ',0);
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

function TManager.GetSalaries: Integer;
var
  i, sum, n: Integer;
  nam: string;
begin
  sum:=GetSalary;
  for i:=0 to children.Count-1 do
  begin
  //�����й۲����µ�namֵ�����˽�ϳ�ģʽ����εݹ��������ġ�
  //  nam:=TOrganizedMan(children.Items[i]).getName;
    n:=TOrganizedMan(children.Items[i]).getSalaries;
    sum:=sum+n;
  end;
  result:=sum;
end;

function TManager.GetSalary: Integer;
begin
  result:=FSalary;
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



end.
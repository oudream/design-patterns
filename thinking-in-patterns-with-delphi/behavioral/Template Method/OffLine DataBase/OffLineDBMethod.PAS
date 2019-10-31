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
unit OffLineDBMethod;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,ADODB, Provider, DB, DBClient;

type
  TDataObject = class (TObject)
  protected
    FDataSetProvider: TDataSetProvider;
    procedure Connect; virtual; abstract;
    procedure Disconnect; virtual; abstract;
    function Process:OLEvariant; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    function DownLoad:OLEvariant;
    procedure Transfer(ClientDataSet:TClientDataSet);
    procedure Update(ClientDataSet:TClientDataSet); virtual; abstract;
  end;
  
  TADODataObject = class (TDataObject)
  private
    FADOConnection: TADOConnection;
    FADOQuery: TADOQuery;
  protected
    procedure Connect; override;
    procedure Disconnect; override;
    function Process: OLEvariant; override;
    procedure Update(ClientDataSet:TClientDataSet); override;
  end;
  
const
  ADO_STRING='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'
    +'Data Source=TEST.MDB; Mode=Share Deny None;'
    +'Extended Properties="";Jet OLEDB:System database="";'
    +'Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";'
    +'Jet OLEDB:Engine Type=5;'
    +'Jet OLEDB:Database Locking Mode=1;'
    +'Jet OLEDB:Global Partial Bulk Ops=2;'
    +'Jet OLEDB:Global Bulk Transactions=1;'
    +'Jet OLEDB:New Database Password="";'
    +'Jet OLEDB:Create System Database=False';


implementation

{
********************************* TDataObject **********************************
}
constructor TDataObject.Create;
begin
  FDataSetProvider:=TDataSetProvider.Create(nil);
end;

destructor TDataObject.Destroy;
begin
  FDataSetProvider.Free;
end;

function TDataObject.DownLoad:OLEvariant;
begin
  Connect;
  result:=Process;
  Disconnect;
end;

procedure TDataObject.Transfer(ClientDataSet:TClientDataSet);
begin
  Connect;
  Update(ClientDataSet);
  Disconnect;
end;

{
******************************** TADODataObject ********************************
}
procedure TADODataObject.Connect;
begin
  FADOConnection:=TADOConnection.Create(nil);
  FADOQuery:=TADOQuery.Create(nil);
  FADOQuery.SQL.Add('Select ID,name,sex,job,Dep,Tel,Salary from Employee order by ID');
  FADOConnection.ConnectionString:=ADO_STRING;
  FADOConnection.LoginPrompt:=false;
  FADOConnection.Connected:=True;
  FADOQuery.Connection:=FADOConnection;
  FADOQuery.Active:=True;
end;

procedure TADODataObject.Disconnect;
begin
  FDataSetProvider.DataSet:=nil;
  FADOQuery.Close;
  FADOConnection.Connected:=false;
  FADOConnection.Free;
  FADOQuery.Free;
end;

function TADODataObject.Process: OLEvariant;
begin
  FDataSetProvider.DataSet:=FADOQuery;
  result:=FDataSetProvider.Data;
end;

procedure TADODataObject.Update(ClientDataSet:TClientDataSet);
begin
  FDataSetProvider.DataSet:=FADOQuery;
  ClientDataSet.SetProvider(FDataSetProvider);
  ClientDataSet.ApplyUpdates(0);
  ClientDataSet.SetProvider(nil);
end;


end.

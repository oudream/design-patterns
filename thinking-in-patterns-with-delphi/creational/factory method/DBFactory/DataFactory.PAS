unit DataFactory;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,ADODB, DB, DBTables;

type
  TDataFactory = class (TObject)
  public
    function CreateDataSet(AOwner:TComponent): TDataSet; virtual; abstract;
  end;
  
  TDataFactory_ADO = class (TDataFactory)
  public
    function CreateDataSet(AOwner:TComponent): TDataSet; override;
  end;
  
  TDataFactory_BDE = class (TDataFactory)
  public
    function CreateDataSet(AOwner:TComponent): TDataSet; override;
  end;
  
  TClient = class (TObject)
  end;
  

implementation


{
******************************* TDataFactory_ADO *******************************
}
function TDataFactory_ADO.CreateDataSet(AOwner:TComponent): TDataSet;
var
  ADOConnection: TADOConnection;
  DataSet: TADOTable;
begin
  ADOConnection:=TADOConnection.Create(AOwner);
  ADOConnection.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
    +' Data Source=country.mdb;'
    +' Persist Security Info=False ';
  ADOConnection.LoginPrompt:=False;
  ADOConnection.Connected:=True;
  DataSet:=TADOTable.Create(AOwner);
  DataSet.Connection:=ADOConnection;
  DataSet.TableName:='country';
  DataSet.Open;
  result:=DataSet;
end;

{
******************************* TDataFactory_BDE *******************************
}
function TDataFactory_BDE.CreateDataSet(AOwner:TComponent): TDataSet;
var
  Connection:TDatabase;
  DataSet: TTable;
begin
  Connection:=TDatabase.Create(AOwner);
  Connection.AliasName:='DBDEMOS';
  Connection.DatabaseName:='MyDB';
  Connection.LoginPrompt:=False;
  Connection.Connected:=True;
  DataSet:=TTable.Create(AOwner);
  DataSet.DatabaseName:=Connection.DatabaseName;
  DataSet.TableName:='Country';
  DataSet.Open;
  result:=DataSet;
end;


end.

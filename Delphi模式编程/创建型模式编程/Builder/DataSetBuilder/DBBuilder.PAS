unit DBBuilder;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,ADODB, DB, DBTables;

type
  TDBBuilder = class (TObject)
  protected
    FDataSet: TDataSet;
  public
    procedure BuildConnection(aOwner:TComponent); virtual; abstract;
    procedure BuildDataSet(aOwner:TComponent); virtual; abstract;
    function GetDataSet: TDataSet; virtual; abstract;
  end;
  
  TBDEBuilder = class (TDBBuilder)
  private
    FDatabase: TDataBase;
  public
    procedure BuildConnection(aOwner:TComponent); override;
    procedure BuildDataSet(aOwner:TComponent); override;
    function GetDataSet: TDataSet; override;
  end;
  
  TADOBuilder = class (TDBBuilder)
  private
    FADOConnection: TADOConnection;
  public
    procedure BuildConnection(aOwner:TComponent); override;
    procedure BuildDataSet(aOwner:TComponent); override;
    function GetDataSet: TDataSet; override;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;


{
********************************* TBDEBuilder **********************************
}
procedure TBDEBuilder.BuildConnection(aOwner:TComponent);
begin
  //建造部件:FDatabase
  if FDatabase=nil then
  begin
    FDatabase:=TDatabase.Create(AOwner);
    FDatabase.AliasName:='DBDEMOS';
    FDatabase.DatabaseName:='MyDB';
    FDatabase.LoginPrompt:=False;
    FDatabase.Connected:=True;
  end;
end;

procedure TBDEBuilder.BuildDataSet(aOwner:TComponent);
begin
  //建造部件:FDataSet
  if FDataSet=nil then
  begin
    FDataSet:=TTable.Create(AOwner);
    TTable(FDataSet).DatabaseName:=FDatabase.DatabaseName;
    TTable(FDataSet).TableName:='Country';
  end;
end;

function TBDEBuilder.GetDataSet: TDataSet;
begin
  if not FDataSet.Active then
      FDataSet.Open;
  result:=FDataSet;
end;

{
********************************* TADOBuilder **********************************
}
procedure TADOBuilder.BuildConnection(aOwner:TComponent);
begin
  //建造部件:FADOConnection
  if FADOConnection=nil then
  begin
    FADOConnection:=TADOConnection.Create(aOwner);
    FADOConnection.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
      +' Data Source=country.mdb;'
      +' Persist Security Info=False ';
    FADOConnection.LoginPrompt:=False;
    FADOConnection.Connected:=True;
  end;
end;

procedure TADOBuilder.BuildDataSet(aOwner:TComponent);
begin
  //建造部件:FDataSet
  if FDataSet=nil then
  begin
    FDataSet:=TADOTable.Create(AOwner);
    TADOTable(FDataSet).Connection:=FADOConnection;
    TADOTable(FDataSet).TableName:='country';
  end;
end;

function TADOBuilder.GetDataSet: TDataSet;
begin
  //返回产品
  if not FDataSet.Active then
      FDataSet.Open;
  result:=FDataSet;
end;




end.

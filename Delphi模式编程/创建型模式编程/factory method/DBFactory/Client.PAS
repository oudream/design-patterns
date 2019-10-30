unit Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, DBTables, StdCtrls, ExtCtrls, Grids, DBGrids,DataFactory;

type
  TfrmMain = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    btnExit: TButton;
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    //工厂
    FDataFactory_ADO:TDataFactory;
    FDataFactory_BDE:TDataFactory;
    //产品
    FdsADO:TDataSet;
    FdsBDE:TDataSet;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation


{$R *.dfm}

procedure TfrmMain.RadioGroup1Click(Sender: TObject);
begin
  // BDE/dBASE数据库
  if  RadioGroup1.Buttons[0].Checked then
  begin
    if (FDataFactory_BDE=nil) then
      FDataFactory_BDE:=TDataFactory_BDE.create;
    if (FdsBDE=nil) then
      FdsBDE:=FDataFactory_BDE.CreateDataSet(self);
    DataSource1.DataSet:=FdsBDE;
    DBGrid1.color:=clMoneyGreen;
  end;

  //ADO/Access数据库
  if  RadioGroup1.Buttons[1].Checked then
  begin
    if (FDataFactory_ADO=nil) then
      FDataFactory_ADO:=TDataFactory_ADO.create;
    if (FdsADO=nil) then
      FdsADO:=FDataFactory_ADO.CreateDataSet(self);
    DataSource1.DataSet:=FdsADO;
    DBGrid1.color:=clSkyBlue;
  end;

  //其他连接方式/其他数据库
  {
  if  RadioGroup1.Buttons[XXX].Checked then
  begin
    if (FDataFactory_XXX=nil) then
      FDataFactory_XXX:=TDataFactory_XXX.create;
    if (FdsXXX=nil) then
      FdsXXX:=FDataFactory_XXX.CreateDataSet(self);
    DataSource1.DataSet:=FdsXXX;
  end;
  }


end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

end.

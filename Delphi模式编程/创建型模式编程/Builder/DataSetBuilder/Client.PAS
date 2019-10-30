unit Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, DBTables, StdCtrls, ExtCtrls, Grids, DBGrids,DBBuilder;

type
  TfrmMain = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    btnExit: TButton;
    Label1: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    //建造者
    FADOBuilder:TADOBuilder;
    FBDEBuilder:TBDEBuilder;
    //产品
    FDataSet:TDataSet;
  public
    function BuildDataSet(aBuilder:TDBBuilder;aOwner:TWinControl): TDataSet;
  end;

var
  frmMain: TfrmMain;

implementation


{$R *.dfm}

function TfrmMain.BuildDataSet(aBuilder:TDBBuilder;aOwner:TWinControl): TDataSet;
begin
  with aBuilder do
  begin
    BuildConnection(aOwner);
    BuildDataSet(aOwner);
    result:=GetDataSet;
  end;
end;

procedure TfrmMain.RadioGroup1Click(Sender: TObject);
begin
  // BDE/dBASE数据库
  if  RadioGroup1.Buttons[0].Checked then
  begin
    if (FBDEBuilder=nil) then
      FBDEBuilder:=TBDEBuilder.create;
    FDataSet:=BuildDataSet(FBDEBuilder,self);
    DBGrid1.color:=clMoneyGreen;
  end;
  //ADO/Access数据库
  if  RadioGroup1.Buttons[1].Checked then
  begin
    if (FADOBuilder=nil) then
      FADOBuilder:=TADOBuilder.create;
    FDataSet:=BuildDataSet(FADOBuilder,self);
    DBGrid1.color:=clSkyBlue;
  end;

  DataSource1.DataSet:=FDataSet;

end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

end.

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
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, Provider, DB, DBClient, ExtCtrls, DBCtrls,
  Grids, DBGrids,
  OffLineDBMethod;

type
  TClient = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Memo1: TMemo;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    btnDownload: TButton;
    btnUpload: TButton;
    btnSave: TButton;
    btnExit: TButton;
    procedure btnDownloadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

procedure TClient.btnDownloadClick(Sender: TObject);
var
  DataObject:TDataObject;
begin
  DataObject:=TADODataObject.Create;
  try
    ClientDataSet1.Data:=DataObject.DownLoad;
    ClientDataSet1.Active:=True;
    DBGrid1.Color:=clInfoBK;
    Memo1.Lines.Add(FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)+']  下载数据。')
  finally
    DataObject.Free;
  end;
end;

procedure TClient.btnSaveClick(Sender: TObject);
begin
  ClientDataSet1.SaveToFile('LocalData.xml',dfXML);
  DBGrid1.Color:=clWindow;
  Memo1.Lines.Add(FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)+']  本地保存数据。')
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  try
    ClientDataSet1.LoadFromFile('LocalData.xml')
  except
    Application.MessageBox('目前没有本地数据，请下载数据！','操作提示',0);
  end;
end;

procedure TClient.btnUploadClick(Sender: TObject);
var
  DataObject:TDataObject;
  i:integer;
begin
  i:=ClientDataSet1.ChangeCount;
  if i>0 then
  begin
    DataObject:=TADODataObject.Create;
    try
      DataObject.Transfer(ClientDataSet1);
      Memo1.Lines.Add(FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)
      +']  上传改动数据记录'+ IntToStr(i) +'条');
      DBGrid1.Color:=clMoneyGreen;
    finally
      DataObject.Free;
    end;
  end
  else
    Application.MessageBox('目前没有数据更新，没有必要上传数据！','操作提示',0);
end;

procedure TClient.btnExitClick(Sender: TObject);
begin
  close;
end;

end.

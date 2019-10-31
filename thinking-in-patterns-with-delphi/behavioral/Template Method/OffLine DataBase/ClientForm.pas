{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��23
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
    Memo1.Lines.Add(FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)+']  �������ݡ�')
  finally
    DataObject.Free;
  end;
end;

procedure TClient.btnSaveClick(Sender: TObject);
begin
  ClientDataSet1.SaveToFile('LocalData.xml',dfXML);
  DBGrid1.Color:=clWindow;
  Memo1.Lines.Add(FormatDateTime('"["yyyy-mm-dd hh:mm:ss ', Now)+']  ���ر������ݡ�')
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  try
    ClientDataSet1.LoadFromFile('LocalData.xml')
  except
    Application.MessageBox('Ŀǰû�б������ݣ����������ݣ�','������ʾ',0);
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
      +']  �ϴ��Ķ����ݼ�¼'+ IntToStr(i) +'��');
      DBGrid1.Color:=clMoneyGreen;
    finally
      DataObject.Free;
    end;
  end
  else
    Application.MessageBox('Ŀǰû�����ݸ��£�û�б�Ҫ�ϴ����ݣ�','������ʾ',0);
end;

procedure TClient.btnExitClick(Sender: TObject);
begin
  close;
end;

end.

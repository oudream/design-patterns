unit ConnectorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TfrmConnector = class(TForm)
    GroupBox1: TGroupBox;
    edtWrite: TEdit;
    btnWrite: TButton;
    btnRead: TButton;
    edtRead: TEdit;
    GroupBox2: TGroupBox;
    UpDown1: TUpDown;
    btnBD: TSpeedButton;
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnBDClick(Sender: TObject);
  private
    procedure BDConnect;
  end;


implementation

uses Connector;

{$R *.dfm}

procedure TfrmConnector.BDConnect;
begin
  if TConnector.Instance.Connected then
    application.MessageBox('���ݿ�����æ�����Ժ����ԣ�','��ʾ',
        MB_OK+MB_ICONINFORMATION)
  else
  begin
    TConnector.Instance.StartConnect;
      {ģ�����ݿ⴦��}
    application.MessageBox('���ݿ⴦����ϣ�','��ʾ',
        MB_OK+MB_ICONINFORMATION);
    TConnector.Instance.EndConnect;
  end;
end;


procedure TfrmConnector.btnWriteClick(Sender: TObject);
begin
  TConnector.Instance.TestValue := StrToInt(edtWrite.Text);
end;

procedure TfrmConnector.btnReadClick(Sender: TObject);
begin
  edtRead.Text:=IntToStr(TConnector.Instance.TestValue);
end;

procedure TfrmConnector.btnBDClick(Sender: TObject);
begin
  BDConnect;
end;

end.


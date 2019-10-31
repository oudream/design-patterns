{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�TransferSys
    Ver��2.0

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
_______________________________________________________
*******************************************************
}
unit RDBM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, bdemts, DataBkr, DBClient,
  MtsRdm, Mtx, ComDB_TLB, ADODB, DB;

type
  TRDB = class(TMtsDataModule, IRDB)
    ADOCon: TADOConnection;
    adqBank: TADOQuery;
    adqAccount: TADOQuery;
    adqTransfer: TADOQuery;
    procedure ADOConBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function qryAccount(const BankName: WideString): WideString; safecall;
    function qryBalance(const AccountID: WideString): Integer; safecall;
    function TransferUpdate(Savings: Integer;
      const AccountID: WideString): Integer; safecall;

  public
    { Public declarations }
  end;

var
  RDB: TRDB;

implementation

{$R *.DFM}

class procedure TRDB.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TRDB.qryAccount(const BankName: WideString): WideString;
begin
  if not ADOCon.Connected then ADOCon.Connected:=True;
  if adqBank.Active then
    adqBank.Close;
  adqBank.Parameters.ParamByName('BankName').Value:=BankName;
  adqBank.Open;
  result:=adqBank.FieldValues['AccountID'];
end;

function TRDB.qryBalance(const AccountID: WideString): Integer;
begin
  if not ADOCon.Connected then ADOCon.Connected:=True;
  if adqAccount.Active then
    adqAccount.Close;
  adqAccount.Parameters.ParamByName('AccountID').Value:=AccountID;
  adqAccount.Open;
  result:=adqAccount.FieldValues['Balance'];
end;

procedure TRDB.ADOConBeforeConnect(Sender: TObject);
begin
  ADOCon.connectionstring:=
   'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Bank.MDB;Persist Security Info=False';
end;

function TRDB.TransferUpdate(Savings: Integer;
  const AccountID: WideString): Integer;
begin
  try
    if not ADOCon.Connected then ADOCon.Connected:=True;
    if adqTransfer.Active then
     adqTransfer.Close;
    adqTransfer.Parameters.ParamByName('AccountID').Value:=AccountID;
    adqTransfer.Parameters.ParamByName('Balance').Value:=Savings;
    adqTransfer.ExecSQL;
    SetComplete;
    result:=1;
  except
    SetAbort;
    result:=0;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDB,
    Class_RDB, ciMultiInstance, tmApartment);
end.
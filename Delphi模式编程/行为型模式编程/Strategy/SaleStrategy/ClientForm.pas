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
  Dialogs, StdCtrls, ExtCtrls,HotelSaleStrategy, ComCtrls,DateUtils;

type
  TClient = class(TForm)
    RadioGroup1: TRadioGroup;
    btnCheck: TButton;
    btnExit: TButton;
    dtpDate: TDateTimePicker;
    cmbVIP: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbPrice: TComboBox;
    edtPrice: TEdit;
    Label3: TLabel;
    edtCount: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    FSeasonStrategy:TSaleStrategy;
    FVIPStrategy:TSaleStrategy;
    FTeamStrategy:TSaleStrategy;
    FPriceSys:TPriceContext;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation


{$R *.dfm}

procedure TClient.FormCreate(Sender: TObject);
begin
  FSeasonStrategy:=TSeasonStrategy.Create;
  FVIPStrategy:=TVIPStrategy.Create;
  FTeamStrategy:=TTeamStrategy.Create;
  FPriceSys:=TPriceContext.Create;
  with cmbVIP.Items do
  begin
    Add('VIP����');
    Add('VIP��');
    Add('VIP��ʯ��');
  end;
  with cmbPrice.Items do
  begin
    Add('�����׼��300Ԫ');
    Add('�����׼��500Ԫ');
    Add('�����800Ԫ');
    Add('�����׷�1000Ԫ');
    Add('�����׷�2000Ԫ');
  end;
end;

procedure TClient.btnCheckClick(Sender: TObject);
var
  i:integer;
  price:Currency;
begin
  case RadioGroup1.ItemIndex of
    0:begin
        FPriceSys.Strategy:=FSeasonStrategy ;
        i:=MonthOf(dtpDate.DateTime);
      end;
    1:begin
        FPriceSys.Strategy:=FVIPStrategy ;
        i:=cmbVIP.ItemIndex;
      end;
    2:begin
        FPriceSys.Strategy:=FTeamStrategy  ;
        i:=StrToInt(edtCount.Text);
      end;
  end;
  case cmbPrice.ItemIndex of
    0:price:=300 ; //�����׼��300Ԫ
    1:price:=500 ; //�����׼��500Ԫ
    2:price:=800 ; //�����800Ԫ
    3:price:=1000; //�����׷�1000Ԫ
    4:price:=2000; // �����׷�2000Ԫ
  end;
  edtPrice.Text:=CurrToStr(FPriceSys.GetPrice(price,i));
end;

procedure TClient.FormDestroy(Sender: TObject);
begin
  FPriceSys.Free;
  FSeasonStrategy.Free;
  FVIPStrategy.Free;
  FTeamStrategy.Free;
end;

procedure TClient.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TClient.RadioGroup1Click(Sender: TObject);
begin
  dtpDate.Enabled:=false;
  edtCount.Enabled:=false;
  cmbVIP.Enabled:=false;
  case RadioGroup1.ItemIndex of
    0:dtpDate.Enabled:=true;
    1:cmbVIP.Enabled:=true;
    2:edtCount.Enabled:=true;
  end;
end;

end.

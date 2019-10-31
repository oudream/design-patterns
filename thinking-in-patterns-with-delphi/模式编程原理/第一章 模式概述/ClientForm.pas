
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
  Dialogs, StdCtrls,Bridge, ExtCtrls;

type
  TClient = class (TForm)
    btnTest: TButton;
    RadioGroup1: TRadioGroup;
    edtName: TLabeledEdit;
    procedure btnTestClick(Sender: TObject);
  end;
  
var
  Client: TClient;

implementation

{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.btnTestClick(Sender: TObject);
var
  AbstractComputer:TSoftComputer;
  Computer:THardComputer;
begin
  try
    if  RadioGroup1.ItemIndex=0 then
    //̨ʽ��
    begin
      AbstractComputer:=TSoftPalmtop.Create;
      AbstractComputer.Computer:=THardPalmtop.Create(edtName.Text);
    end
    else
    //���ϻ�
    begin
      AbstractComputer:=TSoftDesktop.Create;
      AbstractComputer.Computer:=THardDesktop.Create(edtName.Text);
    end;
    AbstractComputer.SysRun;
  finally
    AbstractComputer.Computer.Free;
    AbstractComputer.Free;
  end;
end;

end.



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
unit UserForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Bridge, ExtCtrls,computerClass;

type
  TClient = class (TForm)
    btnRun: TButton;
    RadioGroup1: TRadioGroup;
    procedure btnRunClick(Sender: TObject);
  end;
  
var
  Client: TClient;

implementation

{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.btnRunClick(Sender: TObject);
var
  Computer: TComputer;
begin
  //�ͻ��ˣ�TClient��ʹ�õ��ԣ�TComputer����ʾ�����
  try
    case RadioGroup1.ItemIndex of
      0: Computer:=TIBMThinkPad.Create;
      1: Computer:=THPDeskTop.Create;
    end;
    Computer.Run;
  finally
    Computer.Free;
  end;
end;


end.



{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    �������ƣ�BridgePatten_DataView
    Ver��2.0

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
_______________________________________________________
*******************************************************
}
unit AddForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TAddDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    edtSex: TLabeledEdit;
    edtName: TLabeledEdit;
    edtDep: TLabeledEdit;
    edtSalary: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

end.

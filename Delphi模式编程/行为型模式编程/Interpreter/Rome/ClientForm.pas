{
_______________________________________________________
*******************************************************

   ��Thinking in patterns with Delphi��ʾ������

    �������ƣ��������ֵ����������ֵ�ת��
    Ver��1.0
    ˵����������ģʽ��Ӧ�á�


    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��8
_______________________________________________________
*******************************************************
}
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,RomeInterpreter;

type
  TClient = class(TForm)
    btnInt: TBitBtn;
    edtRome: TLabeledEdit;
    edtNum: TLabeledEdit;
    procedure btnIntClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    parse:TList;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

procedure TClient.btnIntClick(Sender: TObject);
var
  Context:TContext;
  i:integer;
begin
  Context:=TContext.Create(edtRome.Text);
  for  i:=0  to parse.Count-1 do
  begin
    TAbstractExpression(parse.Items[i]).Interpret(Context);
  end;
  edtNum.Text:=IntToStr(Context.Output);
  Context.Free;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  parse:=TList.Create;
  parse.Add(TThousandExp.Create);
  parse.Add(THundredExp.Create);
  parse.Add(TTenExp.Create);
  parse.Add(TOneExp.Create);
end;

procedure TClient.FormDestroy(Sender: TObject);
var
  i:integer;
begin
  for  i:=0  to parse.Count-1 do
    TAbstractExpression(parse.Items[i]).Free;
  parse.free;
end;

end.

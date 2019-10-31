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

    ������ʱ�䣺2004��06��29
_______________________________________________________
*******************************************************
}
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  Memento1,Memento2;

type
  TClient = class(TForm)
    btnStateSave: TButton;
    edtState: TLabeledEdit;
    btnStateRestore: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStateSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStateRestoreClick(Sender: TObject);
  private
    FOriginator:TOriginator;
    FCareTaker:TCareTaker;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

procedure TClient.FormCreate(Sender: TObject);
begin
   FOriginator:=TOriginator.Create;
   FCareTaker:=TCareTaker.Create;
end;

procedure TClient.btnStateSaveClick(Sender: TObject);
begin

  FOriginator.State:=edtState.Text;
{  ��δ��벻����ʹ�ã����޷�����ͨ����
   Ϊ�˱�֤TMemento�����״̬�ķ�װ�� ��
   �Ѿ��ڸĽ����ı���¼ģʽģ���н����˳��������ϵ����ơ�

  if  assigned(FCareTaker.Memento)  then
    FCareTaker.Memento.FState:=FOriginator.State
  else
    FCareTaker.Memento:=FOriginator.CreateMemento;
}

  if  assigned(FCareTaker.Memento)  then
    FCareTaker.Memento.free;
  FCareTaker.Memento:=FOriginator.CreateMemento;

end;

procedure TClient.FormDestroy(Sender: TObject);
begin
   FOriginator.Free;
   FCareTaker.Free;
end;


procedure TClient.btnStateRestoreClick(Sender: TObject);
begin
  FOriginator.SetMemento(FCareTaker.Memento);
  edtState.Text:=FOriginator.State;
end;

end.

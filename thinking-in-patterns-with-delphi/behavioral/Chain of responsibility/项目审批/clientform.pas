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
unit clientform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,AuditChain, ComCtrls;

type
  TClient = class (TForm)
    btnClose: TButton;
    btnHandler: TButton;
    edtCost: TLabeledEdit;
    edtID: TLabeledEdit;
    edtPrj: TLabeledEdit;
    Label1: TLabel;
    twInfo: TTreeView;
    procedure btnHandlerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    RootNode,PrjNode:TTreeNode;
  public
    procedure ShowProcess(prj:TAuditRequest);
  end;
  
var
  Client: TClient;

implementation

{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.btnHandlerClick(Sender: TObject);
var
  project: TAuditRequest;
  Director, Manager, President: TApprover;
begin
  project:=TAuditRequest.create(edtID.text,edtPrj.text,
            StrToInt(edtCost.text));
  Director:=TDirector.create('����');
  Manager:=TManager.create('����');
  President:=TPresident.create('����');
  try
    Director.Successor:=Manager;
    Manager.Successor:=President;
    Director.HandleRequest(project);
    ShowProcess(project);
  finally
    project.Free;
    Director.Free;
    Manager.Free;
    President.Free;
  end;
  
  
  
end;

procedure TClient.ShowProcess(prj:TAuditRequest);
var
  i:integer;
begin
  prjNode:=twInfo.Items.AddChild(RootNode,'���:'+prj.ID
   +'   ����: '+prj.Project+'   ����: '+IntToStr(prj.cost));
  for  i:=0  to prj.FInfoList.Count-1 do
    twInfo.Items.AddChild(prjNode,prj.FInfoList.Strings[i]) ;
  twInfo.FullExpand;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  RootNode:=twInfo.Items.Add(nil,'��Ŀ');
end;

procedure TClient.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.


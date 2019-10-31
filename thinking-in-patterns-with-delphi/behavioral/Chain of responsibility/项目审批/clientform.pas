{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
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
  Director:=TDirector.create('张三');
  Manager:=TManager.create('李四');
  President:=TPresident.create('王五');
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
  prjNode:=twInfo.Items.AddChild(RootNode,'编号:'+prj.ID
   +'   名称: '+prj.Project+'   经费: '+IntToStr(prj.cost));
  for  i:=0  to prj.FInfoList.Count-1 do
    twInfo.Items.AddChild(prjNode,prj.FInfoList.Strings[i]) ;
  twInfo.FullExpand;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  RootNode:=twInfo.Items.Add(nil,'项目');
end;

procedure TClient.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.


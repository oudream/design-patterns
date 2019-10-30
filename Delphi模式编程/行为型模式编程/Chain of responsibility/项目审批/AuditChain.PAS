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
unit AuditChain;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TAuditRequest = class (TObject)
  private
    FCost: Integer;
    FID: string;
    FProject: string;
    procedure SetCost(Value: Integer);
    procedure SetID(const Value: string);
    procedure SetProject(const Value: string);
  public
    FInfoList: TStrings;
    constructor create(id,prj:string;cost:integer);
    destructor destroy; override;
    property Cost: Integer read FCost write SetCost;
    property ID: string read FID write SetID;
    property Project: string read FProject write SetProject;
  end;
  
  TApprover = class (TObject)
  private
    FName: string;
    FSuccessor: TApprover;
    function GetSuccessor: TApprover;
    procedure SetSuccessor(Value: TApprover);
  public
    constructor create(name:string);
    procedure HandleRequest(request:TAuditRequest); virtual; abstract;
    property Successor: TApprover read GetSuccessor write SetSuccessor;
  end;
  
  TManager = class (TApprover)
  public
    procedure HandleRequest(request:TAuditRequest); override;
  end;
  
  TDirector = class (TApprover)
  public
    procedure HandleRequest(request:TAuditRequest); override;
  end;
  
  TPresident = class (TApprover)
  public
    procedure HandleRequest(request:TAuditRequest); override;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
******************************** TAuditRequest *********************************
}
constructor TAuditRequest.create(id,prj:string;cost:integer);
begin
  self.ID:=id;
  self.Project:=prj;
  self.Cost:=cost;
  FInfoList:=TStringList.Create;
end;

destructor TAuditRequest.destroy;
begin
  FInfoList.Free;
end;

procedure TAuditRequest.SetCost(Value: Integer);
begin
  if value>0 then FCost:=value;
end;

procedure TAuditRequest.SetID(const Value: string);
begin
  if value<>'' then FID:=Value;
end;

procedure TAuditRequest.SetProject(const Value: string);
begin
  if value<>'' then FProject:=Value;
end;

{
********************************** TApprover ***********************************
}
constructor TApprover.create(name:string);
begin
  FName:=name;
end;

function TApprover.GetSuccessor: TApprover;
begin
  result:=FSuccessor;
end;

procedure TApprover.SetSuccessor(Value: TApprover);
begin
  FSuccessor:=value;
end;

{
*********************************** TManager ***********************************
}
procedure TManager.HandleRequest(request:TAuditRequest);
begin
  if  (request.Cost<=50000) and (request.Cost>5000) then
    //责任自负
    request.FInfoList.Add('['+TimeToStr(now)+']    '+
    self.FName+'经理审批通过！')
  else
    if Successor<>nil then
    begin
      //传递责任
      request.FInfoList.Add('['+TimeToStr(now)+']    '+
      self.FName+'经理把项目上报给'+Successor.FName+'总裁审批。');
      Successor.HandleRequest(request);
    end;
end;

{
********************************** TDirector ***********************************
}
procedure TDirector.HandleRequest(request:TAuditRequest);
begin
  if request.Cost<=5000 then
    //责任自负
    request.FInfoList.Add('['+TimeToStr(now)+']    '+
    self.FName+'主任审批通过！')
  else
    if (Successor<>nil)  then
    begin
      //传递责任
      request.FInfoList.Add('['+TimeToStr(now)+']    '+
        self.FName+'主任把项目上报给'+Successor.FName+'经理审批。');
      Successor.HandleRequest(request);
    end;
end;

{
********************************** TPresident **********************************
}
procedure TPresident.HandleRequest(request:TAuditRequest);
begin
  if (request.Cost<=500000) and (request.Cost>50000)  then
    //责任自负
    request.FInfoList.Add('['+TimeToStr(now)+']    '+
    self.FName+'总裁审批通过！')
  else
    begin
      //传递责任
      request.FInfoList.Add('['+TimeToStr(now)+']    '+
      self.FName+'总裁把项目上报给董事会审批。');
    end;
end;


end.

{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：任务调度
    Ver：2.0

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
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  Flyweight;

type
  TClient = class (TForm)
    btnClose: TBitBtn;
    btnFactory: TBitBtn;
    edtName: TLabeledEdit;
    edtTask: TLabeledEdit;
    Label1: TLabel;
    lsbPool: TListBox;
    memTask: TMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnFactoryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lsbPoolClick(Sender: TObject);
  private
    FEmployeeFactory: TEmployeeFactory;
  end;
  
var
  client: Tclient;

implementation


{$R *.dfm}

{
*********************************** TClient ************************************
}
procedure TClient.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TClient.btnFactoryClick(Sender: TObject);
var
  Employee: TEmployee;
begin
  Employee:=FEmployeeFactory.GetEmployee(trim(edtName.Text));
  Employee.AssignTask(edtTask.Text);
  memTask.Lines.Add('  [ '+TimeToStr(now)+' ]   '+
  TWorker(Employee).FWorker
  +' -----> '+TWorker(Employee).FTask );
  lsbPool.Items:=FEmployeeFactory.FEmployees;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  FEmployeeFactory:=TEmployeeFactory.Create;
end;

procedure TClient.FormDestroy(Sender: TObject);
begin
  FEmployeeFactory.FEmployees.Free;
  FEmployeeFactory.Free;
end;

procedure TClient.lsbPoolClick(Sender: TObject);
var
  Employee: TWorker;
begin
  Employee:=TWorker(lsbPool.Items.Objects[lsbPool.ItemIndex]);
  edtName.Text:=Employee.FWorker;
  edtTask.Text:=Employee.FTask;
end;

end.


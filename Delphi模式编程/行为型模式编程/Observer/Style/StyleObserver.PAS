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

    最后更新时间：2004－06－23
_______________________________________________________
*******************************************************
}
unit StyleObserver;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,StdCtrls, ExtCtrls;

type
  TStyleObserver = class;

  TSubject = class (TObject)
  private
    FObservers: TList;
  protected
    FForm: TCustomForm;
  public
    constructor Create(form:TCustomForm);
    destructor Destroy; override;
    procedure Attach(observer:TStyleObserver);
    procedure Detach(observer:TStyleObserver);
    procedure Notify;
  end;
  
  TColorSubject = class (TSubject)
  private
    FStyle: Integer;
    function GetStyle: Integer;
    procedure SetStyle(Value: Integer);
  public
    property Style: Integer read GetStyle write SetStyle;
  end;
  
  TStyleObserver = class (TObject)
  protected
    FBGColor: TColor;
    FBGFontColor: TColor;
    FCaptionColor: TColor;
    FControls: TList;
    FEdtColor: TColor;
    FEdtFontColor: TColor;
    FHotColor: TColor;
    FSelectedColor: TColor;
    FStyle: Integer;
    FSubject: TColorSubject;
    FWinColor: TColor;
  public
    constructor Create(subject:TColorSubject); virtual;
    procedure Update; virtual;
  end;
  
  TEdtObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
  TMemoObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
  TLstObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
  TCkbObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
  TLblObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
  TRGObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
  TCmbObserver = class (TStyleObserver)
  public
    constructor Create(subject:TColorSubject); override;
    procedure Update; override;
  end;
  
procedure Register;

implementation

procedure Register;
begin
end;

{
*********************************** TSubject ***********************************
}
constructor TSubject.Create(form:TCustomForm);
begin
  FObservers := TList.Create;
  FForm:=form;
end;

destructor TSubject.Destroy;
var
  i: Integer;
begin
  for i := 0 to FObservers.Count - 1 do
    TStyleObserver(FObservers[i]).Free;
  FObservers.Free;
end;

procedure TSubject.Attach(observer:TStyleObserver);
begin
  if FObservers.IndexOf(observer) < 0 then
     FObservers.Add(observer);
end;

procedure TSubject.Detach(observer:TStyleObserver);
begin
  FObservers.Remove(Observer);
end;

procedure TSubject.Notify;
var
  i: Integer;
begin
  for i := 0 to FObservers.Count - 1 do
    TStyleObserver(FObservers[i]).Update;
end;

{
******************************** TColorSubject *********************************
}
function TColorSubject.GetStyle: Integer;
begin
  result:=FStyle;
end;

procedure TColorSubject.SetStyle(Value: Integer);
begin
  FStyle:=value;
end;



{
******************************** TStyleObserver ********************************
}
constructor TStyleObserver.Create(subject:TColorSubject);
begin
  FSubject:=subject;
  FControls:=TList.Create;
end;

procedure TStyleObserver.Update;
var
  i: Integer;
begin
  case FSubject.FStyle of
    0:begin
        FEdtFontColor:=clBlack; //编辑文字字体色
        FEdtColor:=clWhite; //编辑文字背景色
        FBGFontColor:=clBlack;//只读文字字体色
        FBGColor:=clWhite; //只读文字背景色
        FCaptionColor:=clBlack; //Caption文字字体色
        FSelectedColor:=clBlack;
        FHotColor:=clRed;
        FWinColor:=clBtnFace;
      end;
    1:begin
        FEdtFontColor:=clNavy; //编辑文字字体色
        FEdtColor:=clWhite; //编辑文字背景色
        FBGFontColor:=clBlack;//只读文字字体色
        FBGColor:=clSkyBlue; //只读文字背景色
        FCaptionColor:=clWhite; //Caption文字字体色
        FSelectedColor:=clAqua;
        FHotColor:=clRed;
        FWinColor:=clBackground;
      end;
    2:begin
        FEdtFontColor:=clGreen; //编辑文字字体色
        FEdtColor:=clInfoBk; //编辑文字背景色
        FBGFontColor:=clBlack;//只读文字字体色
        FBGColor:=clMoneyGreen; //只读文字背景色
        FCaptionColor:=clYellow; //Caption文字字体色
        FSelectedColor:=clLime;
        FHotColor:=clRed;
        FWinColor:=clTeal;
      end;
    3:begin
        FEdtFontColor:=clWhite; //编辑文字字体色
        FEdtColor:=clPurple; //编辑文字背景色
        FBGFontColor:=clWhite;//只读文字字体色
        FBGColor:=clBlue; //只读文字背景色
        FCaptionColor:=clFuchsia; //Caption文字字体色
        FSelectedColor:=$00FF66B3;
        FHotColor:=clRed;
        FWinColor:=clNavy;
      end;
    4:begin
        FEdtFontColor:=clWhite; //编辑文字字体色
        FEdtColor:=clFuchsia; //编辑文字背景色
        FBGFontColor:=clBlack;//只读文字字体色
        FBGColor:=$00A8BDFD; //只读文字背景色
        FCaptionColor:=clBlack; //Caption文字字体色
        FSelectedColor:=$007D2277;
        FHotColor:=clRed;
        FWinColor:=$00E9C5EF;
      end;
  end;
  FSubject.FForm.color:=FWinColor;
end;


{
********************************* TCkbObserver *********************************
}
constructor TCkbObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TCheckBox then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TCkbObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TCheckBox(FControls[i]).Font.Color:=FSelectedColor;
    TCheckBox(FControls[i]).Color:=FWinColor;
  end;
end;

{
********************************* TLstObserver *********************************
}
constructor TLstObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TListBox then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TLstObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TListBox(FControls[i]).Font.Color:=FBGFontColor;
    TListBox(FControls[i]).Color:=FBGColor;
  end;
end;

{
********************************* TCmbObserver *********************************
}
constructor TCmbObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TComboBox then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TCmbObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TComboBox(FControls[i]).Font.Color:=FBGFontColor;
    TComboBox(FControls[i]).Color:=FBGColor;
  end;
end;

{
********************************* TEdtObserver *********************************
}
constructor TEdtObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TEdit then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TEdtObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TEdit(FControls[i]).Color:=FEdtColor;
    TEdit(FControls[i]).Font.Color:=FEdtFontColor;
  end;
end;

{
******************************** TMemoObserver *********************************
}
constructor TMemoObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TMemo then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TMemoObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TMemo(FControls[i]).Font.Color:=FBGFontColor;
    TMemo(FControls[i]).Color:=FBGColor;
  end;
end;


{
********************************* TRGObserver **********************************
}
constructor TRGObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TRadioGroup then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TRGObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TRadioGroup(FControls[i]).Font.Color:=FSelectedColor;
    TRadioGroup(FControls[i]).Color:=FWinColor;
  end;
end;

{
********************************* TLblObserver *********************************
}
constructor TLblObserver.Create(subject:TColorSubject);
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FSubject.FForm.ControlCount-1 do
  begin
    if FSubject.FForm.Controls[i] is TLabel then
     FControls.Add(FSubject.FForm.Controls[i]);
  end;
end;

procedure TLblObserver.Update;
var
  i: Integer;
begin
  inherited;
  for i:=0 to  FControls.Count-1 do
  begin
    TLabel(FControls[i]).Font.Color:=FCaptionColor;
    TLabel(FControls[i]).Color:=FWinColor;
  end;
end;

end.

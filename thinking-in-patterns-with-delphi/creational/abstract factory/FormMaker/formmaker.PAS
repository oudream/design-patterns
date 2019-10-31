unit formmaker;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,StdCtrls,
  Forms, Dialogs,janTiledPanel, janRoundedButton,ExtCtrls,Buttons;

type
  //产品类1：Button
  IButton = interface (IInterface)
    ['{012EA2E3-13BB-4A70-834A-DDA682BCD7C3}']
  end;
  
  TStandardButton = class (TButton, IButton)
  end;
  
  TArtButton = class (TBitBtn, IButton)
  end;

  //产品类2：Panel
  IPanel = interface (IInterface)
    ['{81D5D952-E6DF-4C6B-BC3B-0410CC916351}']
  end;
  
  TArtPanel = class (TjanTiledPanel, IPanel)
  end;
  
  TStandardPanel = class (TPanel, IPanel)
  end;

  //工厂类：
  TFormMaker = class (TObject)
  public
    function CreateButton(aOwner : TWinControl ; vText : string; vTop : Integer;
            vLeft : Integer): IButton; virtual; abstract;
    function CreatePanel(aOwner :TWinControl): IPanel; virtual; abstract;
  end;
  
  TStandardFormMaker = class (TFormMaker)
  public
    function CreateButton(aOwner : TWinControl ; vText : string; vTop : Integer;
            vLeft : Integer): IButton; override;
    function CreatePanel(aOwner : TWinControl): IPanel; override;
  end;
  
  TArtFormMaker = class (TFormMaker)
  public
    function CreateButton(aOwner : TWinControl ; vText : string; vTop : Integer;
            vLeft : Integer): IButton; override;
    function CreatePanel(aOwner : TWinControl): IPanel; override;
  end;
  
implementation


{
******************************** TArtFormMaker *********************************
}
function TArtFormMaker.CreateButton(aOwner : TWinControl ; vText : string; vTop 
        : Integer; vLeft : Integer): IButton;
var
  TempButton: TArtButton;
begin
  TempButton :=TArtButton.Create(aOwner);
  TempButton.Parent := aOwner;
  TempButton.Caption := vText;
  TempButton.Top := vTop;
  TempButton.Left := vLeft;
  if  vText='OK' then
  begin
    TempButton.kind:=bkOK;
    TempButton.ModalResult:=mrOk;
  end
  else
  begin
    TempButton.kind:=bkCancel;
    TempButton.ModalResult:=mrCancel;
  end;
  result := TempButton;
end;

function TArtFormMaker.CreatePanel(aOwner : TWinControl): IPanel;
var
  TempPanel: TArtPanel;
  Bitmap: TBitmap;
begin
  Bitmap:=TBitmap.Create;
  Bitmap.LoadFromFile('BG1.bmp');
  TempPanel :=TArtPanel.Create(aOwner);
  TempPanel.Parent := aOwner;
  TempPanel.Align:=alClient;
  TempPanel.Height:=100;
  TempPanel.BackBitmap:=Bitmap;
  Bitmap.Free;
  result := TempPanel;
end;



{
********************************** TFormMaker **********************************
}


{
****************************** TStandardFormMaker ******************************
}
function TStandardFormMaker.CreateButton(aOwner : TWinControl ; vText : string; 
        vTop : Integer; vLeft : Integer): IButton;
var
  TempButton: TStandardButton;
begin
  TempButton :=TStandardButton.Create(aOwner);
  TempButton.Parent := aOwner;
  TempButton.Caption := vText;
  TempButton.Top := vTop;
  TempButton.Left := vLeft;
  TempButton.ModalResult:=mrOk;
  result := TempButton;
end;

function TStandardFormMaker.CreatePanel(aOwner : TWinControl): IPanel;
var
  TempPanel: TStandardPanel;
begin
  TempPanel :=TStandardPanel.Create(aOwner);
  TempPanel.Parent := aOwner;
  TempPanel.Align:=alClient;
  TempPanel.Height:=100;
  result := TempPanel;
end;

end.

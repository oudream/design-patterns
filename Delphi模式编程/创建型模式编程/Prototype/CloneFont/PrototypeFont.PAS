unit PrototypeFont;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type

  TPrototype_Font = class (TFont)
  public
    function Clone: TObject; virtual; abstract;
    procedure SetFont; virtual; abstract;
  end;
  
  TPrototype_Font1 = class (TPrototype_Font)
  public
    function Clone: TObject; override;
    procedure SetFont; override;
  end;
  
  TPrototype_Font2 = class (TPrototype_Font)
  public
    function Clone: TObject; override;
    procedure SetFont; override;
  end;
  

implementation


{TPrototype_Font1调用Assign方法实现的字体克隆。}
function TPrototype_Font1.Clone: TObject;
var
  Temp: TPrototype_Font1;
begin
  Temp:=TPrototype_Font1.Create;
  Temp.Assign(self);
  result:=Temp;
end;

procedure TPrototype_Font1.SetFont;
var
  FontDialog: TFontDialog;
begin
  FontDialog:= TFontDialog.Create(nil);
  try
    if  FontDialog.Execute then
      TFont(self).Assign(FontDialog.Font);
  finally
    FontDialog.Free;
  end;
end;

{TPrototype_Font2 通过自己编程实现的字体克隆。}
function TPrototype_Font2.Clone: TObject;
var
  Temp: TPrototype_Font2;
begin
  Temp:=TPrototype_Font2.Create;
  Temp.Name:=self.Name;
  Temp.Size:=self.Size;
  Temp.Color:=self.Color;
  result:=Temp;
end;

procedure TPrototype_Font2.SetFont;
var
  FontDialog: TFontDialog;
begin
  FontDialog:= TFontDialog.Create(nil);
  try
    if  FontDialog.Execute then
    begin
      self.Name:=FontDialog.Font.Name;
      self.Size:=FontDialog.Font.Size;
      self.Color:=FontDialog.Font.Color;
    end;
  finally
    FontDialog.Free;
  end;
end;


end.

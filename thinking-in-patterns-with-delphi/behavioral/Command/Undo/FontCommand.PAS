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
unit FontCommand;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TFormat = class (TObject)
  protected
    FFontDialog: TFontDialog;
  public
    constructor Create(FontDialog: TFontDialog);
    function Execute: TFont; virtual; abstract;
  end;
  
  TFontFormat = class (TFormat)
  public
    function Execute: TFont; override;
  end;
  
  TFontUser = class (TObject)
  private
    FCount: Integer;
    FFontDialog: TFontDialog;
    FFontFormat: TFormat;
    FFonts: TStringlist;
  public
    constructor Create;
    destructor destroy; override;
    function NewFont(var log:string): TFont;
    function RedoFont(var log:string): TFont;
    function UndoFont(var log:string): TFont;
  end;
  
implementation


{ TFormat }
{
*********************************** TFormat ************************************
}
constructor TFormat.Create(FontDialog: TFontDialog);
begin
  FFontDialog:=FontDialog;
end;

{ TFontFormat }
{
********************************* TFontFormat **********************************
}
function TFontFormat.Execute: TFont;
begin
  if FFontDialog.Execute then
    result:=FFontDialog.Font;
end;


{ TFontUser }
{
********************************** TFontUser ***********************************
}
constructor TFontUser.Create;
begin
  FFonts:=TStringlist.Create;
  FFontDialog:=TFontDialog.Create(nil);
end;

destructor TFontUser.destroy;
var
  i:integer;
begin
  FFontDialog.Free;
  for i:=FFonts.Count-1 downto 0 do
    FFonts.Objects[i].Free;
  FFonts.Clear;
  FFonts.Free;
end;

function TFontUser.NewFont(var log:string): TFont;
var
  FontInfo: string;
  Font: TFont;
begin
  Font:=TFont.Create;
  FFontFormat:=TFontFormat.Create(FFontDialog);
  try
    Font.Assign(FFontFormat.Execute);
    FFonts.AddObject(FontInfo,Font);
    FCount:=FFonts.Count;
    FontInfo:='第'+IntToStr(FCount)+'次设置字体';
    log:=FontInfo;
    result:=Font;
  finally
    FFontFormat.Free;
  end;
end;

function TFontUser.RedoFont(var log:string): TFont;
var
  Font: TFont;
begin
  if FFonts.Count>FCount then
  begin
    Inc(FCount);
    log:='重做至第'+IntToStr(FCount)+'次设置字体';
  end
  else
    log:='已到重做极限,无法继续重做!';
  Font:=TFont(FFonts.Objects[FCount-1]);
  result:=Font;
end;

function TFontUser.UndoFont(var log:string): TFont;
var
  Font: TFont;
begin
  if FCount>1 then
  begin
    Dec(FCount);
    log:='撤销至第'+IntToStr(FCount)+'次设置字体';
  end
  else
    log:='已到撤销极限,无法继续撤销!';
  Font:=TFont(FFonts.Objects[FCount-1]);
  result:=Font;
end;


end.

{
_______________________________________________________
*******************************************************

   《Delphi模式编程》
   (Thinking in patterns with Delphi)
   示例程序

    程序名称：PicDeco
    Ver：2.0

    作者： 刘艺
    （http://www.liu-yi.net）

    版权所有 侵权必究   All rights reserved worldwide
    警告：本程序供读者学习使用，未经同意不得作商业用途。

    最后更新时间：2004－06－29
_______________________________________________________
*******************************************************
}
unit PicDecorator;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,ComCtrls,ExtCtrls,Jpeg;

type
  TPicShow = class (TObject)
  public
    procedure Display(Owner:TForm;ImgFile:string); virtual; abstract;
  end;
  
  TPic = class (TPicShow)
  public
    procedure Display(Owner:TForm;ImgFile:string); override;
  end;
  
  TDecoratedPic = class (TPicShow)
  private
    FComponent: TPicShow;
  public
    constructor Creat(PicShow:TPicShow);
    procedure Display(Owner:TForm;ImgFile:string); overload; override;
  end;
  
  TPicWithFrame = class (TDecoratedPic)
  public
    procedure Display(Owner:TForm;ImgFile:string); override;
    destructor destroy; override;
  end;

  TPicWithMusic = class (TDecoratedPic)
  public
    destructor destroy; override;
    procedure AddMusic;
    procedure Display(Owner:TForm;ImgFile:string); override;
  end;
  
implementation

uses
  mmsystem;

{
************************************* TPic *************************************
}
procedure TPic.Display(Owner:TForm;ImgFile:string);
var
  Img: TImage;
begin
  Img:=TImage.Create(Owner);
  Img.Picture.LoadFromFile(ImgFile);
  Img.AutoSize:=True;
  Img.Stretch:=True;
  Owner.Width:=Img.Width+32;
  Owner.Height:=Img.Height+64;
  Owner.Caption:=ImgFile;
  Img.Left:=11;
  Img.Top:=13;
  Img.Parent:=Owner;
end;

{
******************************** TDecoratedPic *********************************
}
constructor TDecoratedPic.Creat(PicShow:TPicShow);
begin
  self.FComponent:=PicShow;
end;

procedure TDecoratedPic.Display(Owner:TForm;ImgFile:string);
begin
  if FComponent<>nil then
     FComponent.Display(Owner,ImgFile);
end;

{
******************************** TPicWithFrame *********************************
}
procedure TPicWithFrame.Display(Owner:TForm;ImgFile:string);
var
  FrmOut: TBevel;
  FrmIn: TBevel;
begin
  inherited Display(Owner,ImgFile);
  
  FrmIn:=TBevel.Create(Owner);
  FrmIn.Parent:=Owner;
  FrmIn.Width:=Owner.Width-30;
  FrmIn.Height:=Owner.Height-62;
  FrmIn.Left:=10;
  FrmIn.Top:=12;
  FrmIn.Shape:=bsBox;
  FrmIn.Style:=bsLowered;
  
  FrmOut:=TBevel.Create(Owner);
  FrmOut.Parent:=Owner;
  FrmOut.Width:=Owner.Width-18;
  FrmOut.Height:=Owner.Height-48;
  FrmOut.Left:=4;
  FrmOut.Top:=6;
  FrmOut.Shape:=bsBox;
  FrmOut.Style:=bsRaised;
  
end;

destructor TPicWithFrame.destroy;
begin
  if FComponent<>nil then FComponent.Free;
end;

{
******************************** TPicWithMusic *********************************
}
destructor TPicWithMusic.destroy;
begin
  sndPlaySound(nil,SND_NODEFAULT);
  if FComponent<>nil then FComponent.Free;
end;

procedure TPicWithMusic.AddMusic;
begin
  sndPlaySound('SONG8.wav',SND_ASYNC or SND_NODEFAULT);
end;

procedure TPicWithMusic.Display(Owner:TForm;ImgFile:string);
begin
  inherited Display(Owner,ImgFile);
  AddMusic;
end;


end.

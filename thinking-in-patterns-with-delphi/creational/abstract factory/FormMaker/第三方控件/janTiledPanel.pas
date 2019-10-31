unit janTiledPanel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TjanTiledPanel = class(TPanel)
  private
    FBackBitmap: TBitmap;
    procedure SetBackBitmap(const Value: TBitmap);
    procedure BackBitmapChanged(sender:Tobject);
    { Private declarations }
  protected
    { Protected declarations }
    procedure paint; override;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
    destructor  Destroy; override;
  published
    { Published declarations }
    property BackBitmap:TBitmap read FBackBitmap write SetBackBitmap;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('janBasic', [TjanTiledPanel]);
end;




{ TjanTiledPanel }

procedure TjanTiledPanel.BackBitmapChanged(sender:Tobject);
begin
  invalidate;
end;

constructor TjanTiledPanel.Create(AOwner: TComponent);
begin
  inherited;
  FBackBitmap:=Tbitmap.create;
  FBackBitmap.OnChange:=BackBitmapChanged;
end;

destructor TjanTiledPanel.Destroy;
begin
  FBackBitmap.free;
  inherited;

end;

procedure TjanTiledPanel.paint;
var
  ix, iy: Integer;
  BmpWidth, BmpHeight: Integer;
  BmpCanvas: THandle;
  hCanvas:HDC;
  bm:Tbitmap;
  R:Trect;
begin
    canvas.font.assign(font);
    bm:=FBackBitmap;
    if assigned(bm) and (bm.Height <> 0) and
        (bm.Width <> 0) then
      begin
        BmpWidth := bm.Width;
        BmpHeight := bm.Height;
        BmpCanvas := bm.Canvas.Handle;
        for iy := 0 to ClientHeight div BmpHeight do
          for ix := 0 to ClientWidth div BmpWidth do
            BitBlt(Canvas.handle, ix * BmpWidth, iy * BmpHeight,
              BmpWidth, BmpHeight, BmpCanvas,
              0, 0, SRCCOPY);
        R:=clientRect;
        drawText(canvas.handle,@caption[1],-1,R,DT_SINGLELINE or DT_CENTER or DT_VCENTER);
        R:=rect(0,0,width,height);
        Frame3D(canvas,R,clBtnHighlight,clBtnshadow,BevelWidth);
      end
      else
       inherited;
end;

procedure TjanTiledPanel.SetBackBitmap(const Value: TBitmap);
begin
  FBackBitmap.assign(Value);
end;










end.

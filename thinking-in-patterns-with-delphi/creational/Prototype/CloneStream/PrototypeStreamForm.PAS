unit PrototypeStreamForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,PrototypeByStream;

type
  TForm1 = class(TForm)
    btnClone: TButton;
    btnDeepClone: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloneClick(Sender: TObject);
    procedure btnDeepCloneClick(Sender: TObject);
  private
    FPrototype1:TMemoPrototype;
    FPrototype2:TStreamableClass;
    n:integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation



{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPrototype1:=TMemoPrototype.create(self) ;
  n:=1;
end;

procedure TForm1.btnCloneClick(Sender: TObject);
var
  tmp:TMemoPrototype;
begin
  tmp:=TMemoPrototype(FPrototype1.clone);
  tmp.Name:='Memo'+IntToStr(n);
  tmp.Parent:=self;
  tmp.Lines.Add('��¡�ı���֮'+IntToStr(n));
  tmp.Left:=tmp.Left+30*n;
  tmp.Top:=tmp.Top+30*n;
  inc(n);
end;

procedure TForm1.btnDeepCloneClick(Sender: TObject);
var
  AInstance,a: TStreamableClass;
begin
  FPrototype2:=TStreamableClass.create(self);
  AInstance:=TStreamableClass(FPrototype2.Clone);
  showmessage(inttostr(AInstance.ContainedClass.SomeData));
  AInstance.ContainedClass.SomeData:=30;
  showmessage(inttostr(AInstance.ContainedClass.SomeData));
  AInstance.FMemo.Parent:=self;
  AInstance.FMemo.Lines.Add('Deep Clone OK!');

  //���Ա���¡�����ö�����һ���¶�����ԭʼ�����һ�����á�
  if (AInstance.FMemo=FPrototype2.FMemo) or
     (AInstance.ContainedClass=FPrototype2.ContainedClass)
  then
  begin
    showmessage('��¡���Ƕ������ã�');
  end;

end;

end.
unit PrototypeByStream;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,StdCtrls;

type

  TMemoPrototype = class (TMemo)
  public
    constructor create(AOwner:TComponent);override;
  published
    function Clone: TObject;
  end;

  TContainedClass = class(TPersistent)
  private
    FSomeData: Integer;
    procedure SetSomeData(Value: Integer);
  public
    constructor Create;
  published
    property SomeData: Integer read FSomeData write SetSomeData;
  end;

  TStreamableClass = class(TComponent)
  private
    FContainedClass: TContainedClass;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    FMemo:TMemoPrototype;
    function Clone: TObject;
    property ContainedClass: TContainedClass read FContainedClass write FContainedClass;
  end;

implementation

procedure TContainedClass.SetSomeData(Value: Integer);
begin
  FSomeData := Value;
end;

constructor TContainedClass.Create;
begin
  FSomeData := 42;
end;

constructor TStreamableClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FContainedClass := TContainedClass.Create;
  FMemo:=TMemoPrototype.create(AOwner);
end;

destructor TStreamableClass.Destroy;
begin
  FContainedClass.Free;
end;

function TStreamableClass.Clone: TObject;
var
  AClassInstance: TStreamableClass;
begin
  AClassInstance := TStreamableClass.Create(nil);
  WriteComponentResFile('DeepClone', AClassInstance);
  FreeAndNil(AClassInstance);
  AClassInstance := ReadComponentResFile('DeepClone', nil) as TStreamableClass;
  result:=AClassInstance;
end;

{TMemoPrototype}
function TMemoPrototype.Clone: TObject;
var
  tmp:TMemoPrototype;
  TmpStream:TStream;
begin
  WriteComponentResFile('MemoPrototype.dat',self);
  tmp:=TMemoPrototype(ReadComponentResFile('MemoPrototype.dat',nil));
  result:=tmp;
end;

constructor TMemoPrototype.create(AOwner:TComponent);
begin
  inherited;
  Width:=100;
  Height:=50;
  Left:=50;
  Top:=50;
  Font.Color:=clBlue;
end;

initialization
  RegisterClasses([TMemoPrototype,TContainedClass, TStreamableClass]);
finalization
end.


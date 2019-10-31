{
_______________________________________________________
*******************************************************

   ��Delphiģʽ��̡�
   (Thinking in patterns with Delphi)
   ʾ������

    ���ߣ� ����
    ��http://www.liu-yi.net��

    ��Ȩ���� ��Ȩ�ؾ�   All rights reserved worldwide
    ���棺�����򹩶���ѧϰʹ�ã�δ��ͬ�ⲻ������ҵ��;��

    ������ʱ�䣺2004��06��29
_______________________________________________________
*******************************************************
}
unit PicIterator;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,Contnrs;

type
  IIterator = interface;

  TPicIterator = class;

  IFiles = interface (IInterface)
    ['{D0C7F61C-5EF6-4E5D-A9B1-B20EE9329BB6}']
    function GetCount: Integer;
    function CreateIterator: IIterator;
    procedure SetObjects(Index: Integer; Value: TObject);
    procedure Clear;
    function GetObjects(Index: Integer): TObject;
    property Objects[Index: Integer]: TObject read GetObjects write SetObjects; 
            default;
    property Count: Integer read GetCount;
  end;
  
  IIterator = interface (IInterface)
    ['{F9A1AA56-DC0F-4AFA-A288-843A11722456}']
    procedure SetStep(Value: Integer);
    function CurrentItem: TObject;
    function First: TObject;
    function IsDone: Boolean;
    function Next: TObject;
    property Step: Integer  write SetStep;
  end;
  
  TPicFiles = class (TInterfacedObject,IFiles)
  private
    FObjectList: TObjectList;
    function GetCount: Integer;
    function GetObjects(Index: Integer): TObject;
    procedure SetObjects(Index: Integer; Value: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function CreateIterator: IIterator;
    property Count: Integer read GetCount;
    property Objects[Index: Integer]: TObject read GetObjects write SetObjects; 
            default;
  end;
  
  TPicIterator = class (TInterfacedObject, IIterator)
  private
    FAggregate: IFiles;
    FCurrentIndex: Integer;
    FStep: Integer;
    procedure SetStep(Value: Integer);
  public
    constructor Create(PicFiles:IFiles);
    function CurrentItem: TObject;
    function First: TObject;
    function IsDone: Boolean;
    function Next: TObject; 
    property Step: Integer read FStep write SetStep;
  end;
  
implementation


{
********************************** TPicFiles ***********************************
}
constructor TPicFiles.Create;
begin
  FObjectList:=TObjectList.Create;
end;

destructor TPicFiles.Destroy;
begin
  FObjectList.Free;
end;

function TPicFiles.CreateIterator: IIterator;
begin
  result:=TPicIterator.Create(self);
end;

function TPicFiles.GetCount: Integer;
begin
  result:=FObjectList.Count;
end;

function TPicFiles.GetObjects(Index: Integer): TObject;
begin
  result:=FObjectList.Items[Index];
end;

procedure TPicFiles.SetObjects(Index: Integer; Value: TObject);
begin
  Index:=FObjectList.Add(Value);
end;

procedure TPicFiles.Clear;
begin
  FObjectList.Clear;
end;

{
********************************* TPicIterator *********************************
}
constructor TPicIterator.Create(PicFiles:IFiles);
begin
  FAggregate:=PicFiles;
  FCurrentIndex:=0;
end;

function TPicIterator.CurrentItem: TObject;
begin
  result:=FAggregate[FCurrentIndex];
end;

function TPicIterator.First: TObject;
begin
  result:=FAggregate[0];
end;

function TPicIterator.IsDone: Boolean;
begin
  if FCurrentIndex<FAggregate.Count then
    result:=False
  else
    result:=True;
end;

function TPicIterator.Next: TObject;
begin
  //�����ṩ�������㷨
  case step of
      0: FCurrentIndex:=Trunc(Random(FAggregate.Count+1));
      1:Inc(FCurrentIndex);
      2:FCurrentIndex:=FCurrentIndex+2;
  end;
  //���Ʊ߽�
  if IsDone then
     result:=nil
  else
    result:=CurrentItem;
end;

procedure TPicIterator.SetStep(Value: Integer);
begin
  FStep:=Value;
end;


end.
unit Connector;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TConnector = class (TObject)
  private
    FConnected: Boolean;
    FTestValue: Integer;
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TConnector;
    procedure SetTestValue(Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure EndConnect;
    class function Instance: TConnector;
    class procedure ReleaseInstance;
    procedure StartConnect; virtual;
    property Connected: Boolean read FConnected;
    property TestValue: Integer read FTestValue write SetTestValue;
  end;
  
implementation

{$J+}

{
********************************** TConnector **********************************
}
constructor TConnector.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('ֻ��ͨ��Instance�����������ͷ���%s��ʵ����',
      [ClassName]);
end;

constructor TConnector.CreateInstance;
begin
  inherited Create;
end;

destructor TConnector.Destroy;
begin
  if AccessInstance(0) = Self then AccessInstance(2);
  inherited Destroy;
end;

class function TConnector.AccessInstance(Request: Integer): TConnector;
  
  const
    FInstance: TConnector = nil;
  
begin
  {
  AccessInstance(0):�����κδ������ͷ�ʵ������ʱʹ�á�
  AccessInstance(1):���ڸ�ʵ��ʱֱ��ʹ�ã�������ʱ�򴴽���ʵ����
  AccessInstance(2):����һ����ָ�룬������������ʵ����
  }
  case Request of
    0 : ;
    1 : if not Assigned(FInstance) then
        begin
          FInstance := CreateInstance;
          FInstance.FConnected:=false;
        end;
    2 : FInstance := nil;
  else
    raise Exception.CreateFmt(' %d ��AccessInstance()�еķǷ����ò�����',
        [Request]);
  end;
  Result := FInstance;
end;

procedure TConnector.EndConnect;
begin
  //ShowMessage('�ͷ����ݿ�����!');
  FConnected:=false;
end;

class function TConnector.Instance: TConnector;
begin
  //����ʵ��
  Result := AccessInstance(1);
end;

class procedure TConnector.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;

procedure TConnector.SetTestValue(Value: Integer);
begin
  FTestValue:=Value;
end;

procedure TConnector.StartConnect;
begin
  //ShowMessage('�������ݿ����ӣ�');
  FConnected:=true;
end;


end.

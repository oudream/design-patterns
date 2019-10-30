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
  raise Exception.CreateFmt('只能通过Instance方法来创建和访问%s的实例！',
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
  AccessInstance(0):不作任何处理，供释放实例对象时使用。
  AccessInstance(1):存在该实例时直接使用，不存在时则创建该实例。
  AccessInstance(2):返回一个空指针，用于重新设置实例。
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
    raise Exception.CreateFmt(' %d 是AccessInstance()中的非法调用参数。',
        [Request]);
  end;
  Result := FInstance;
end;

procedure TConnector.EndConnect;
begin
  //ShowMessage('释放数据库连接!');
  FConnected:=false;
end;

class function TConnector.Instance: TConnector;
begin
  //返回实例
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
  //ShowMessage('创建数据库连接！');
  FConnected:=true;
end;


end.

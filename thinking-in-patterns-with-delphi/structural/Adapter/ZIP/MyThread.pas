unit MyThread;

//
// Copyright 2002, Neal C. Stublen
// Commercial use requires permission.
//
// Contact: nstublen_public@yahoo.com
//

interface

uses
  Classes,
  SyncObjs;

type
  TMyThread = class(TThread)
  private
    { Private declarations }
  protected
    FTerminateEvent: TEvent;
    //procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy(); override;
    procedure TerminateWithEvent();
  end;

implementation

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMyThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TMyThread }

constructor TMyThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FTerminateEvent := TEvent.Create(nil, True, False, '');
end;

destructor TMyThread.Destroy;
begin
  FTerminateEvent.Free();
  inherited;
end;

{
procedure TMyThread.Execute;
begin

end;
}

procedure TMyThread.TerminateWithEvent;
begin
  // Adding event termination to the thread allows the thread to sleep when
  // it's not doing anything.  Without the event, we must sit in a loop
  // checking the Terminated flag.

  // NOTE TO VCL DESIGNERS:
  // If TThread.Terminate() were a virtual function, we could have simply
  // overridden it (which would have been preferred).

  FTerminateEvent.SetEvent();
  inherited Terminate();
end;

end.

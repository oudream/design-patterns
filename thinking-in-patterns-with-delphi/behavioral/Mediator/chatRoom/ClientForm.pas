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
unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,ChatRoom;

type
  TClient = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memChat: TMemo;
    lbTalkers: TListBox;
    edtMessage: TEdit;
    btnSend: TButton;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Label1: TLabel;
    cmbUser: TComboBox;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    FChatRoom:IChatRoom ;
    A,B,C,D:TParticipant;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation

{$R *.dfm}

procedure TClient.btnLoginClick(Sender: TObject);
begin
 // FChatRoom

end;

procedure TClient.FormCreate(Sender: TObject);
begin
  FChatRoom:=TChatRoom.Create;
  A:=TMaleParticipant.Create('张三');
  B:=TMaleParticipant.Create('李四');
  C:=TFemaleParticipant.Create('丽丽');
  D:=TFemaleParticipant.Create('小娟');
  FChatRoom.TalkerRegister(A);
  FChatRoom.TalkerRegister(B);
  FChatRoom.TalkerRegister(C);
  FChatRoom.TalkerRegister(D);
  lbTalkers.Items:=FChatRoom.GetTalkers;
  cmbUser.Items.Assign(FChatRoom.GetTalkers);
  lbTalkers.ItemIndex:=0;
end;

procedure TClient.FormDestroy(Sender: TObject);
begin
  A.Free;
  B.Free;
  C.Free;
  D.Free;
  FChatRoom:=nil;
end;

procedure TClient.btnSendClick(Sender: TObject);
var
 tmpstr:string;
 UserList:TStrings;
 User:TParticipant;
begin
  UserList:=FChatRoom.GetTalkers;
  User:=TParticipant(UserList.Objects[cmbUser.ItemIndex]);
  tmpstr:=User.Send(lbTalkers.Items[lbTalkers.ItemIndex],edtMessage.Text);
  memChat.Lines.add(tmpstr);
end;

end.

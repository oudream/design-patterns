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
unit ActionForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StdActns, ActnList, ImgList, ComCtrls, ToolWin, Menus,
  FontCommand;

type
  TClient = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    mFile: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Memo1: TMemo;
    N1: TMenuItem;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditUndo1: TEditUndo;
    EditSelectAll1: TEditSelectAll;
    ToolButton9: TToolButton;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    SelectAll1: TMenuItem;
    Undo1: TMenuItem;
    Exit: TAction;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ToolButton10: TToolButton;
    FileNew: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    FontSet: TAction;
    FontRedo: TAction;
    FontUndo: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Memo2: TMemo;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    procedure FileOpen1Accept(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure FileNewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FontSetExecute(Sender: TObject);
    procedure FontRedoExecute(Sender: TObject);
    procedure FontUndoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FFontUser:TFontUser;
  public
    { Public declarations }
  end;

var
  Client: TClient;

implementation


{$R *.dfm}



procedure TClient.FileOpen1Accept(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
  FontSetExecute(nil);
end;

procedure TClient.ExitExecute(Sender: TObject);
begin
  close;
end;

procedure TClient.FileSaveAs1Accept(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(FileSaveAs1.Dialog.FileName);
end;

procedure TClient.FileNewExecute(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TClient.FormCreate(Sender: TObject);
begin
  FFontUser:=TFontUser.create;
end;

procedure TClient.FontSetExecute(Sender: TObject);
var
  log:string;
begin
  Memo1.Font.Assign(FFontUser.NewFont(log));
  Memo2.Lines.Add(log);
end;

procedure TClient.FontRedoExecute(Sender: TObject);
var
  log:string;
begin
  Memo1.Font.Assign(FFontUser.RedoFont(log));
  Memo2.Lines.Add(log);
end;

procedure TClient.FontUndoExecute(Sender: TObject);
var
  log:string;
begin
  Memo1.Font.Assign(FFontUser.UndoFont(log));
  Memo2.Lines.Add(log);
end;

procedure TClient.FormDestroy(Sender: TObject);
begin
  FFontUser.Free;
end;

end.

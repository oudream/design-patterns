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
  Dialogs, StdCtrls, StdActns, ActnList, ImgList, ComCtrls, ToolWin, Menus;

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
    procedure FileOpen1Accept(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure FileNewExecute(Sender: TObject);
  private

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

end.

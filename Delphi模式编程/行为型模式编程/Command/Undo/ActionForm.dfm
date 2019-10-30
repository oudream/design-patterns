object Client: TClient
  Left = 319
  Top = 206
  Width = 696
  Height = 391
  Caption = #21629#20196'(Command)'#27169#24335#33539#20363':'#25991#26412#32534#36753#22120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 23
    AutoSize = True
    ButtonHeight = 21
    ButtonWidth = 55
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    Flat = True
    ShowCaptions = True
    TabOrder = 0
    object ToolButton10: TToolButton
      Left = 0
      Top = 0
      Action = FileNew
    end
    object ToolButton1: TToolButton
      Left = 55
      Top = 0
      Action = FileOpen1
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 0
      Action = FileSaveAs1
    end
    object ToolButton3: TToolButton
      Left = 165
      Top = 0
      Action = Exit
    end
    object ToolButton4: TToolButton
      Left = 220
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 44
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 0
      Action = EditCopy1
    end
    object ToolButton6: TToolButton
      Left = 283
      Top = 0
      Action = EditCut1
    end
    object ToolButton7: TToolButton
      Left = 338
      Top = 0
      Action = EditPaste1
    end
    object ToolButton8: TToolButton
      Left = 393
      Top = 0
      Action = EditSelectAll1
    end
    object ToolButton9: TToolButton
      Left = 448
      Top = 0
      Action = EditUndo1
    end
    object ToolButton11: TToolButton
      Left = 503
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 511
      Top = 0
      Action = FontSet
    end
    object ToolButton13: TToolButton
      Left = 566
      Top = 0
      Action = FontUndo
    end
    object ToolButton14: TToolButton
      Left = 621
      Top = 0
      Action = FontRedo
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 23
    Width = 688
    Height = 225
    Align = alClient
    ImeMode = imClose
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    Lines.Strings = (
      '')
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 0
    Top = 248
    Width = 688
    Height = 89
    Align = alBottom
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    Lines.Strings = (
      #23383#20307#35774#32622#26085#24535':')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 336
    Top = 72
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = #25171#24320
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      OnAccept = FileOpen1Accept
    end
    object FileSaveAs1: TFileSaveAs
      Category = 'File'
      Caption = #20445#23384
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
      OnAccept = FileSaveAs1Accept
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = #21098#20999
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = #22797#21046
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = #31896#36148
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = #25764#38144#32534#36753
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = #20840#36873
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object Exit: TAction
      Category = 'File'
      Caption = #36864#20986
      OnExecute = ExitExecute
    end
    object FileNew: TAction
      Category = 'File'
      Caption = #26032#24314
      OnExecute = FileNewExecute
    end
    object FontSet: TAction
      Caption = #35774#32622#23383#20307
      OnExecute = FontSetExecute
    end
    object FontRedo: TAction
      Caption = #24674#22797#23383#20307
      OnExecute = FontRedoExecute
    end
    object FontUndo: TAction
      Caption = #25764#38144#23383#20307
      OnExecute = FontUndoExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 80
    object mFile: TMenuItem
      Caption = #25991#20214
      object N10: TMenuItem
        Action = FileNew
      end
      object Open1: TMenuItem
        Action = FileOpen1
      end
      object SaveAs1: TMenuItem
        Action = FileSaveAs1
      end
      object Exit1: TMenuItem
        Action = Exit
      end
    end
    object N1: TMenuItem
      Caption = #32534#36753
      object Copy1: TMenuItem
        Action = EditCopy1
      end
      object Cut1: TMenuItem
        Action = EditCut1
      end
      object Paste1: TMenuItem
        Action = EditPaste1
      end
      object SelectAll1: TMenuItem
        Action = EditSelectAll1
      end
      object Undo1: TMenuItem
        Action = EditUndo1
      end
    end
    object N12: TMenuItem
      Caption = #26684#24335
      object N13: TMenuItem
        Action = FontSet
      end
      object N14: TMenuItem
        Action = FontUndo
      end
      object N15: TMenuItem
        Action = FontRedo
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 72
    object N11: TMenuItem
      Action = FileNew
    end
    object N2: TMenuItem
      Action = FileOpen1
    end
    object N3: TMenuItem
      Action = FileSaveAs1
    end
    object N9: TMenuItem
      Action = Exit
    end
    object N4: TMenuItem
      Action = EditCopy1
      Break = mbBarBreak
    end
    object N5: TMenuItem
      Action = EditCut1
    end
    object N6: TMenuItem
      Action = EditPaste1
    end
    object N7: TMenuItem
      Action = EditSelectAll1
    end
    object N8: TMenuItem
      Action = EditUndo1
      Break = mbBarBreak
    end
    object N16: TMenuItem
      Action = FontSet
      Break = mbBarBreak
    end
    object N17: TMenuItem
      Action = FontUndo
    end
    object N18: TMenuItem
      Action = FontRedo
    end
  end
end

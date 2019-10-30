object Client: TClient
  Left = 323
  Top = 259
  Width = 378
  Height = 148
  Caption = #22791#24536#24405#65288'Memento'#65289#27169#24335#28436#31034#31243#24207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnStateSave: TButton
    Left = 176
    Top = 48
    Width = 75
    Height = 25
    Caption = #20445#23384#29366#24577
    TabOrder = 0
    OnClick = btnStateSaveClick
  end
  object edtState: TLabeledEdit
    Left = 32
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = #24403#21069#29366#24577#65306
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 1
    Text = #29366#24577'A'
  end
  object btnStateRestore: TButton
    Left = 264
    Top = 48
    Width = 75
    Height = 25
    Caption = #24674#22797#29366#24577
    TabOrder = 2
    OnClick = btnStateRestoreClick
  end
end

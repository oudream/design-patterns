object Client: TClient
  Left = 259
  Top = 114
  Width = 492
  Height = 447
  Caption = #36131#20219#38142#27169#24335#31034#20363#31243#24207#65306#39033#30446#23457#25209
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 16
    Top = 112
    Width = 98
    Height = 14
    Caption = #39033#30446#21463#29702#35760#24405#65306
  end
  object edtID: TLabeledEdit
    Left = 16
    Top = 32
    Width = 81
    Height = 22
    EditLabel.Width = 70
    EditLabel.Height = 14
    EditLabel.Caption = #39033#30446#32534#21495#65306
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 0
  end
  object edtCost: TLabeledEdit
    Left = 328
    Top = 32
    Width = 121
    Height = 22
    EditLabel.Width = 70
    EditLabel.Height = 14
    EditLabel.Caption = #39033#30446#39044#31639#65306
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 1
    Text = '1000'
  end
  object edtPrj: TLabeledEdit
    Left = 112
    Top = 32
    Width = 209
    Height = 22
    EditLabel.Width = 70
    EditLabel.Height = 14
    EditLabel.Caption = #39033#30446#21517#31216#65306
    ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
    TabOrder = 2
    Text = #26032#39033#30446
  end
  object btnHandler: TButton
    Left = 272
    Top = 72
    Width = 75
    Height = 25
    Caption = #30003#25253
    TabOrder = 3
    OnClick = btnHandlerClick
  end
  object btnClose: TButton
    Left = 368
    Top = 72
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object twInfo: TTreeView
    Left = 16
    Top = 128
    Width = 449
    Height = 265
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Indent = 19
    ParentFont = False
    TabOrder = 5
  end
end

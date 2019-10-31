object Client: TClient
  Left = 295
  Top = 222
  Width = 431
  Height = 323
  Caption = #26725#25509#27169#24335#24212#29992#28436#31034#65306#25968#25454#35270#22270
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object btnExit: TButton
    Left = 336
    Top = 256
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 0
    OnClick = btnExitClick
  end
  object rgType: TRadioGroup
    Left = 48
    Top = 16
    Width = 321
    Height = 65
    Caption = #36873#39033
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25968#25454#26469#33258#25968#25454#24211#34920
      #25968#25454#26469#33258#25968#25454#25991#20214)
    TabOrder = 1
    OnClick = rgTypeClick
  end
  object btnPrior: TButton
    Left = 16
    Top = 256
    Width = 75
    Height = 25
    Caption = #12296#65293
    TabOrder = 2
    OnClick = btnPriorClick
  end
  object btnNew: TButton
    Left = 96
    Top = 256
    Width = 75
    Height = 25
    Caption = #26032#22686
    TabOrder = 3
    OnClick = btnNewClick
  end
  object btnDel: TButton
    Left = 176
    Top = 256
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 4
    OnClick = btnDelClick
  end
  object btnNext: TButton
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = #65293#12297
    TabOrder = 5
    OnClick = btnNextClick
  end
  object edtName: TLabeledEdit
    Left = 64
    Top = 120
    Width = 121
    Height = 22
    EditLabel.Width = 42
    EditLabel.Height = 14
    EditLabel.Caption = #22995#21517#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 6
  end
  object edtSex: TLabeledEdit
    Left = 232
    Top = 120
    Width = 121
    Height = 22
    EditLabel.Width = 42
    EditLabel.Height = 14
    EditLabel.Caption = #24615#21035#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 7
  end
  object edtDep: TLabeledEdit
    Left = 64
    Top = 184
    Width = 121
    Height = 22
    EditLabel.Width = 42
    EditLabel.Height = 14
    EditLabel.Caption = #37096#38376#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 8
  end
  object edtSalary: TLabeledEdit
    Left = 232
    Top = 184
    Width = 121
    Height = 22
    EditLabel.Width = 42
    EditLabel.Height = 14
    EditLabel.Caption = #34218#36164#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 9
  end
end

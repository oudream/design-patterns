object Client: TClient
  Left = 359
  Top = 199
  Width = 551
  Height = 344
  Caption = #29366#24577#65288'State'#65289#27169#24335#65306#20449#29992#21345#25903#20184
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object edtBalance: TLabeledEdit
    Left = 40
    Top = 40
    Width = 121
    Height = 22
    Color = clMoneyGreen
    EditLabel.Width = 70
    EditLabel.Height = 14
    EditLabel.Caption = #36134#38754#20313#39069#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 0
  end
  object edtAmount: TLabeledEdit
    Left = 176
    Top = 40
    Width = 121
    Height = 22
    EditLabel.Width = 105
    EditLabel.Height = 14
    EditLabel.Caption = #23384#20837'/'#25903#21462#37329#39069#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 1
    Text = '0'
  end
  object rgCreditState: TRadioGroup
    Left = 8
    Top = 72
    Width = 529
    Height = 81
    Caption = #24403#21069#20449#29992#29366#24577#65306
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Items.Strings = (
      #19981#33391#8212#8212#20449#29992#31561#32423#20026'0'#65292#36134#38754#37329#39069#23567#20110#25110#31561#20110'0'#12290#21462#27454#27599#27425#25903#20184#26381#21153#36153'20'#20803#65292#36196#23383#38480#39069#20026'1000'#20803#12290
      #27491#24120'--'#20449#29992#31561#32423#20026'1'#65292#36134#38754#37329#39069#22823#20110'0'#65292#23567#20110'10000'#12290#21462#27454#27599#27425#25903#20184#26381#21153#36153'5'#20803#65292#26080#36196#23383#38480#39069#12290
      #33391#22909'--'#20449#29992#31561#32423#20026'2'#65292#36134#38754#37329#39069#22823#20110'10000'#65292#23567#20110'1000000'#12290#21462#27454#20813#26381#21153#36153#65292#26080#36196#23383#38480#39069#12290)
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object btnDeposit: TButton
    Left = 312
    Top = 40
    Width = 57
    Height = 25
    Caption = #23384#20837
    TabOrder = 3
    OnClick = btnDepositClick
  end
  object btnWithdraw: TButton
    Left = 384
    Top = 40
    Width = 57
    Height = 25
    Caption = #25903#21462
    TabOrder = 4
    OnClick = btnWithdrawClick
  end
  object btnExit: TButton
    Left = 456
    Top = 40
    Width = 57
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = btnExitClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 153
    Width = 543
    Height = 157
    Align = alBottom
    Color = clInfoBk
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    Lines.Strings = (
      #20132#26131#26085#24535#65306)
    ScrollBars = ssVertical
    TabOrder = 6
  end
end

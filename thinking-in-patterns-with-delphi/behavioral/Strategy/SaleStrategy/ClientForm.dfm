object Client: TClient
  Left = 285
  Top = 107
  Width = 607
  Height = 279
  Caption = #31574#30053#65288'Strategy'#65289#27169#24335#33539#20363#65306#37202#24215#20248#24800#25151#20215#26597#35810
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
  object Label1: TLabel
    Left = 176
    Top = 152
    Width = 77
    Height = 14
    Caption = 'VIP'#21345#31867#21035#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 152
    Width = 70
    Height = 14
    Caption = #20837#20303#26102#38388#65306
  end
  object Label3: TLabel
    Left = 432
    Top = 216
    Width = 14
    Height = 14
    Caption = #20803
  end
  object Label4: TLabel
    Left = 432
    Top = 176
    Width = 14
    Height = 14
    Caption = #20154
  end
  object Label5: TLabel
    Left = 328
    Top = 152
    Width = 70
    Height = 14
    Caption = #20837#20303#20154#25968#65306
  end
  object Bevel1: TBevel
    Left = 24
    Top = 200
    Width = 425
    Height = 9
    Shape = bsTopLine
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 24
    Width = 585
    Height = 113
    Caption = #36873#25321#20248#24800#26041#24335#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #23395#33410#20248#24800#65306#23545#20110#28129#23395#26376#20221#36827#34892#20248#24800#12290'2'#12289'3'#12289'11'#26376'8.5'#25240#20248#24800#65292'4'#12289'6'#26376'9'#25240#20248#24800#65292'8'#12289'9'#26376'9.5'#25240#20248#24800#12290
      'VIP'#20248#24800#65306#38480#20110#25345#26377'VIP'#21345#30340#23458#20154#12290'VIP'#38134#21345#20139#21463'9'#25240#20248#24800#65307'VIP'#37329#21345#20139#21463'8'#25240#20248#24800#65307'VIP'#38075#30707#21345#20139#21463'7'#25240#20248#24800#12290
      #22242#38431#20248#24800#65306'3-5'#20154#22242#38431'9'#25240#20248#24800#65307'6-10'#20154#22242#38431'8'#25240#20248#24800#65307'11-20'#20154#22242#38431'7'#25240#20248#24800#65307'20'#20154#20197#19978#22242#38431'6'#25240#20248#24800#12290)
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object btnCheck: TButton
    Left = 176
    Top = 208
    Width = 129
    Height = 25
    Caption = #26597#35810#20248#24800#25151#20215'-->'
    TabOrder = 1
    OnClick = btnCheckClick
  end
  object btnExit: TButton
    Left = 488
    Top = 200
    Width = 73
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = btnExitClick
  end
  object dtpDate: TDateTimePicker
    Left = 24
    Top = 168
    Width = 137
    Height = 22
    Date = 38049.464642511570000000
    Time = 38049.464642511570000000
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 3
  end
  object cmbVIP: TComboBox
    Left = 176
    Top = 168
    Width = 129
    Height = 22
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ItemHeight = 14
    TabOrder = 4
    Text = 'VIP'#38134#21345
  end
  object cmbPrice: TComboBox
    Left = 24
    Top = 208
    Width = 137
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ItemHeight = 14
    TabOrder = 5
    Text = #30002#31867#26631#20934#38388'300'#20803
  end
  object edtPrice: TEdit
    Left = 328
    Top = 208
    Width = 97
    Height = 22
    BiDiMode = bdLeftToRight
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ParentBiDiMode = False
    TabOrder = 6
    Text = '300'
  end
  object edtCount: TEdit
    Left = 328
    Top = 168
    Width = 97
    Height = 22
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 7
    Text = '1'
  end
end

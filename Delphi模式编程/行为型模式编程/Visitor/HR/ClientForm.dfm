object Client: TClient
  Left = 303
  Top = 147
  Width = 586
  Height = 448
  Caption = #35775#38382#32773#27169#24335#33539#20363#65306#20154#21147#36164#28304#31995#32479#34218#37228#31119#21033#31649#29702#27169#22359
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
    Left = 32
    Top = 16
    Width = 168
    Height = 14
    Caption = #36873#25321#33410#28857#65292#26597#30475#35814#32454#20449#24687#65306
  end
  object Label2: TLabel
    Left = 288
    Top = 16
    Width = 98
    Height = 14
    Caption = #26597#30475#20449#24687#35760#24405#65306
  end
  object btnExit: TButton
    Left = 480
    Top = 368
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 0
    OnClick = btnExitClick
  end
  object Memo1: TMemo
    Left = 272
    Top = 32
    Width = 281
    Height = 305
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 24
    Top = 32
    Width = 225
    Height = 361
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    OnClick = ListBox1Click
  end
  object btnSalary: TButton
    Left = 288
    Top = 368
    Width = 75
    Height = 25
    Caption = #22686#34218
    TabOrder = 3
    OnClick = btnSalaryClick
  end
  object btnVacation: TButton
    Left = 384
    Top = 368
    Width = 75
    Height = 25
    Caption = #20551#26399
    TabOrder = 4
    OnClick = btnVacationClick
  end
end

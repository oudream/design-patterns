object Form1: TForm1
  Left = 276
  Top = 154
  Width = 586
  Height = 448
  Caption = #21512#25104#27169#24335#33539#20363#65306#32452#32455#32467#26500#21644#24037#36164#20998#24067
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
  object btnExit: TButton
    Left = 392
    Top = 360
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 0
    OnClick = btnExitClick
  end
  object Memo1: TMemo
    Left = 272
    Top = 24
    Width = 281
    Height = 313
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 24
    Top = 24
    Width = 225
    Height = 369
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
end

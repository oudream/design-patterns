object frmMain: TfrmMain
  Left = 253
  Top = 151
  Width = 614
  Height = 235
  Caption = #24037#21378#26041#27861#27169#24335#65306#21160#24577#25968#25454#24211#35775#38382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 401
    Height = 169
    Color = clInfoBk
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RadioGroup1: TRadioGroup
    Left = 432
    Top = 16
    Width = 153
    Height = 121
    Caption = #36830#25509#26041#24335'/ '#25968#25454#24211#31867#22411
    Items.Strings = (
      'BDE/dBASE'#25968#25454#24211
      'ADO/Access'#25968#25454#24211)
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object btnExit: TButton
    Left = 480
    Top = 152
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = btnExitClick
  end
  object DataSource1: TDataSource
    Left = 120
    Top = 96
  end
end

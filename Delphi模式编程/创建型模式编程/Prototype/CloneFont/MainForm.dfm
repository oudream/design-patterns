object frmClient: TfrmClient
  Left = 241
  Top = 167
  Width = 503
  Height = 280
  Caption = 'Prototype'#27169#24335#65306#20811#38534#23383#20307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 120
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 369
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnSet1: TButton
    Left = 392
    Top = 20
    Width = 89
    Height = 39
    Caption = #35774#32622#23383#20307
    TabOrder = 1
    OnClick = btnSet1Click
  end
  object btnClone1: TButton
    Left = 392
    Top = 64
    Width = 89
    Height = 39
    Caption = '<- '#20811#38534
    TabOrder = 2
    OnClick = btnClone1Click
  end
  object btnClone2: TButton
    Left = 392
    Top = 187
    Width = 89
    Height = 39
    Caption = '<- '#20811#38534' '
    TabOrder = 3
    OnClick = btnClone2Click
  end
  object Memo2: TMemo
    Left = 7
    Top = 128
    Width = 370
    Height = 105
    TabOrder = 4
  end
  object btnSet2: TButton
    Left = 392
    Top = 139
    Width = 89
    Height = 39
    Caption = #35774#32622#23383#20307
    TabOrder = 5
    OnClick = btnSet2Click
  end
end

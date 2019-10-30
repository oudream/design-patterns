object Client: TClient
  Left = 309
  Top = 114
  Width = 405
  Height = 281
  Caption = #21442#25968#21270#24037#21378#26041#27861#28436#31034
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object rgProductID: TRadioGroup
    Left = 96
    Top = 32
    Width = 185
    Height = 57
    Caption = #36873#25321#20135#21697#20195#30721
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'A'
      'B'
      'C')
    TabOrder = 0
  end
  object ckbExchanged: TCheckBox
    Left = 128
    Top = 112
    Width = 129
    Height = 17
    Caption = #20132#25442#24335#21019#24314#20135#21697#26041#27861
    TabOrder = 1
  end
  object btnTest: TButton
    Left = 160
    Top = 192
    Width = 75
    Height = 25
    Caption = #27979#35797
    TabOrder = 2
    OnClick = btnTestClick
  end
end

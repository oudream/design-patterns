object Client: TClient
  Left = 192
  Top = 107
  Width = 363
  Height = 219
  Caption = #26725#25509#27169#24335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnTest: TButton
    Left = 152
    Top = 144
    Width = 75
    Height = 25
    Caption = #27979#35797
    TabOrder = 0
    OnClick = btnTestClick
  end
  object RadioGroup1: TRadioGroup
    Left = 64
    Top = 64
    Width = 225
    Height = 57
    Caption = #20855#20307#23454#29616
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25484#19978#30005#33041
      #21488#24335#30005#33041)
    TabOrder = 1
  end
  object edtName: TLabeledEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = #30005#33041#21517#31216#65306
    LabelPosition = lpLeft
    TabOrder = 2
    Text = 'Sony PEG-SL10'
  end
end

object frmConnector: TfrmConnector
  Left = 459
  Top = 186
  Width = 403
  Height = 149
  Caption = #20351#29992#21333#20363#23545#35937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 97
    Caption = #27979#35797#20840#23616#25928#26524#30340#25968#25454
    TabOrder = 0
    object edtWrite: TEdit
      Left = 16
      Top = 24
      Width = 73
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object btnWrite: TButton
      Left = 112
      Top = 24
      Width = 75
      Height = 25
      Caption = '> '#20889#20837
      TabOrder = 1
      OnClick = btnWriteClick
    end
    object btnRead: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = #35835#20986' >'
      TabOrder = 2
      OnClick = btnReadClick
    end
    object edtRead: TEdit
      Left = 96
      Top = 60
      Width = 89
      Height = 21
      Color = clMenuBar
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 3
    end
    object UpDown1: TUpDown
      Left = 89
      Top = 24
      Width = 16
      Height = 21
      Associate = edtWrite
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 248
    Top = 8
    Width = 137
    Height = 97
    Caption = #27979#35797#20840#23616#25928#26524#30340#26041#27861
    TabOrder = 1
    object btnBD: TSpeedButton
      Left = 16
      Top = 40
      Width = 97
      Height = 33
      Caption = #25968#25454#24211#25805#20316
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337FF3333333333330003333333333333777F333333333333080333
        3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
        33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
        B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
        BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
        B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
        3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
        333333333337F33333333333333B333333333333333733333333}
      NumGlyphs = 2
      OnClick = btnBDClick
    end
  end
end

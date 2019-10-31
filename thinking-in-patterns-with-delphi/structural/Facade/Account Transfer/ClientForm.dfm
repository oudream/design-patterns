object client: Tclient
  Left = 376
  Top = 207
  Width = 506
  Height = 350
  Caption = #38376#38754#27169#24335#24212#29992#31034#20363#65306#36716#24080#31995#32479
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
  object edtName: TLabeledEdit
    Left = 28
    Top = 32
    Width = 121
    Height = 22
    EditLabel.Width = 63
    EditLabel.Height = 14
    EditLabel.Caption = #29992#25143#22995#21517':'
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 0
    Text = #26032#29992#25143
  end
  object edtID: TLabeledEdit
    Left = 28
    Top = 80
    Width = 285
    Height = 22
    Color = clBtnFace
    EditLabel.Width = 35
    EditLabel.Height = 14
    EditLabel.Caption = 'PIN'#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 1
  end
  object edtPSW: TLabeledEdit
    Left = 188
    Top = 32
    Width = 121
    Height = 22
    EditLabel.Width = 70
    EditLabel.Height = 14
    EditLabel.Caption = #29992#25143#21475#20196#65306
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    PasswordChar = '*'
    TabOrder = 2
    Text = '1234'
  end
  object btnExit: TButton
    Left = 384
    Top = 72
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 3
    OnClick = btnExitClick
  end
  object btnLogin: TButton
    Left = 384
    Top = 32
    Width = 75
    Height = 25
    Caption = #30331#24405
    TabOrder = 4
    OnClick = btnLoginClick
  end
  object panTransfer: TPanel
    Left = 24
    Top = 112
    Width = 449
    Height = 191
    TabOrder = 5
    Visible = False
    object Label2: TLabel
      Left = 24
      Top = 83
      Width = 70
      Height = 14
      Caption = #36716#20837#38134#34892#65306
    end
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 70
      Height = 14
      Caption = #36716#20986#38134#34892#65306
    end
    object edtMoney: TLabeledEdit
      Left = 28
      Top = 155
      Width = 121
      Height = 22
      EditLabel.Width = 112
      EditLabel.Height = 14
      EditLabel.Caption = #36716#36134#37329#39069#65288#20803#65289#65306
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 0
      Text = '1000'
    end
    object btnTransfer: TButton
      Left = 348
      Top = 144
      Width = 75
      Height = 25
      Caption = #36716#24080
      TabOrder = 1
      OnClick = btnTransferClick
    end
    object edtTransOut: TLabeledEdit
      Left = 164
      Top = 99
      Width = 121
      Height = 22
      EditLabel.Width = 98
      EditLabel.Height = 14
      EditLabel.Caption = #36716#20986#24080#25143#24080#21495#65306
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 2
    end
    object edtTransIn: TLabeledEdit
      Left = 164
      Top = 35
      Width = 121
      Height = 22
      EditLabel.Width = 98
      EditLabel.Height = 14
      EditLabel.Caption = #36716#20837#24080#25143#24080#21495#65306
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 3
    end
    object edtAccountOut: TLabeledEdit
      Left = 308
      Top = 99
      Width = 121
      Height = 22
      Color = clBtnFace
      EditLabel.Width = 126
      EditLabel.Height = 14
      EditLabel.Caption = #36716#20986#24080#25143#24080#38754#37329#39069#65306
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 4
    end
    object edtAccountIn: TLabeledEdit
      Left = 308
      Top = 35
      Width = 121
      Height = 22
      Color = clBtnFace
      EditLabel.Width = 126
      EditLabel.Height = 14
      EditLabel.Caption = #36716#20986#24080#25143#24080#38754#37329#39069#65306
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 5
    end
    object cbBankOut: TComboBox
      Left = 24
      Top = 99
      Width = 121
      Height = 22
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      ItemHeight = 14
      TabOrder = 6
      OnSelect = cbBankOutSelect
      Items.Strings = (
        #20013#22269#38134#34892
        #24037#21830#38134#34892
        #25307#21830#38134#34892
        #20892#19994#38134#34892
        #24314#35774#38134#34892)
    end
    object cbBankIn: TComboBox
      Left = 24
      Top = 35
      Width = 121
      Height = 22
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      ItemHeight = 14
      TabOrder = 7
      OnSelect = cbBankInSelect
      Items.Strings = (
        #20013#22269#38134#34892
        #24037#21830#38134#34892
        #25307#21830#38134#34892
        #20892#19994#38134#34892
        #24314#35774#38134#34892)
    end
  end
end

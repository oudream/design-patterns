object Client: TClient
  Left = 263
  Top = 107
  Width = 613
  Height = 480
  Caption = #20013#20171#32773#27169#24335#65306#22312#32447#32842#22825#23460
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
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 605
    Height = 41
    Align = alBottom
    TabOrder = 0
    object edtMessage: TEdit
      Left = 8
      Top = 8
      Width = 505
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 0
    end
    object btnSend: TButton
      Left = 520
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#36865
      TabOrder = 1
      OnClick = btnSendClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 405
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 1
    object lbTalkers: TListBox
      Left = 1
      Top = 18
      Width = 175
      Height = 335
      Align = alClient
      Color = clMoneyGreen
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      ItemHeight = 13
      TabOrder = 0
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 175
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #35831#36873#25321#22312#32447#32842#21451#65306
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 1
      Top = 353
      Width = 175
      Height = 51
      Align = alBottom
      TabOrder = 2
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 48
        Height = 13
        Caption = #29992#25143#21517#65306
      end
      object cmbUser: TComboBox
        Left = 64
        Top = 19
        Width = 105
        Height = 21
        ImeName = #20013#25991#20043#26143#26234#33021#29378#25340#8545#26631#20934#29256
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object memChat: TMemo
    Left = 177
    Top = 0
    Width = 428
    Height = 405
    Align = alClient
    Color = clInfoBk
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 2
  end
end

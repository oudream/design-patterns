object frmClient: TfrmClient
  Left = 326
  Top = 146
  Width = 569
  Height = 414
  Caption = #36845#20195#23376#65288'Iterator'#65289#27169#24335#65306#22270#24418#27983#35272#25773#25918#22120
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
  object Image1: TImage
    Left = 128
    Top = 280
    Width = 105
    Height = 105
    Stretch = True
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 377
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 7
      Height = 14
    end
    object lsbPic: TListBox
      Left = 1
      Top = 42
      Width = 559
      Height = 262
      Align = alClient
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      ItemHeight = 14
      MultiSelect = True
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 304
      Width = 559
      Height = 72
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object btnExit: TButton
        Left = 472
        Top = 39
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 0
        OnClick = btnExitClick
      end
      object btnView: TButton
        Left = 472
        Top = 7
        Width = 75
        Height = 25
        Caption = #33258#21160#27983#35272
        TabOrder = 1
        OnClick = btnViewClick
      end
      object btnAddDir: TButton
        Left = 352
        Top = 7
        Width = 97
        Height = 25
        Caption = #28155#21152#22270#24418#25991#20214
        TabOrder = 2
        OnClick = btnAddDirClick
      end
      object rgStep: TRadioGroup
        Left = 8
        Top = 15
        Width = 169
        Height = 49
        Caption = #27983#35272#27169#24335
        Columns = 3
        ItemIndex = 1
        Items.Strings = (
          #38543#26426
          #39034#24207
          #38388#38548)
        TabOrder = 3
      end
      object rgTime: TRadioGroup
        Left = 184
        Top = 15
        Width = 153
        Height = 49
        Caption = #22270#29255#20572#30041#26102#38388
        Columns = 3
        ItemIndex = 1
        Items.Strings = (
          '1'#31186
          '2'#31186
          '3'#31186)
        TabOrder = 4
      end
      object btnClear: TButton
        Left = 352
        Top = 39
        Width = 97
        Height = 25
        Caption = #28165#31354#25991#20214#21015#34920
        TabOrder = 5
        OnClick = btnClearClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 559
      Height = 41
      Align = alTop
      BevelOuter = bvLowered
      Caption = #22270#24418#25991#20214#21015#34920':'
      TabOrder = 2
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '*.jpg'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 440
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 472
    Top = 8
  end
end

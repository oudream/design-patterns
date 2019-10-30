object Client: TClient
  Left = 241
  Top = 107
  Width = 614
  Height = 415
  Caption = #27169#26495#26041#27861#27169#24335':'#31163#32447#25968#25454#24211#31995#32479
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 606
    Height = 241
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 0
    Top = 241
    Width = 606
    Height = 99
    Align = alBottom
    Color = clGradientActiveCaption
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    Lines.Strings = (
      #25805#20316#26085#24535':')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 340
    Width = 606
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 0
    end
    object btnDownload: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #19979#36733#25968#25454
      TabOrder = 1
      OnClick = btnDownloadClick
    end
    object btnUpload: TButton
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = #19978#20256#25968#25454
      TabOrder = 2
      OnClick = btnUploadClick
    end
    object btnSave: TButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = #26412#22320#20445#23384
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btnExit: TButton
      Left = 510
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 4
      OnClick = btnExitClick
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 208
    Top = 40
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 40
  end
end

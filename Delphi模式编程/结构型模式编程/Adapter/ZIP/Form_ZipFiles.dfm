object FormZipFiles: TFormZipFiles
  Left = 334
  Top = 169
  Width = 583
  Height = 227
  Caption = #19968#20010#21033#29992'Adapter'#27169#24335#23454#29616#25991#20214#21387#32553#30340#28436#31034#31383#20307
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    575
    193)
  PixelsPerInch = 96
  TextHeight = 12
  object Label4: TLabel
    Left = 53
    Top = 92
    Width = 96
    Height = 12
    Anchors = [akTop, akRight]
    Caption = #21387#32553#23384#26723#25991#20214#21517#65306
  end
  object Label2: TLabel
    Left = 53
    Top = 52
    Width = 108
    Height = 12
    Anchors = [akTop, akRight]
    Caption = #35201#21387#32553#30340#28304#25991#20214#21517#65306
  end
  object cmdZip: TButton
    Left = 446
    Top = 88
    Width = 83
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #21387#32553#25991#20214
    TabOrder = 0
    OnClick = cmdZipClick
  end
  object cmdAddFile: TButton
    Left = 446
    Top = 48
    Width = 83
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #36873#25321#25991#20214
    TabOrder = 1
    OnClick = cmdAddFileClick
  end
  object edtFilename2: TEdit
    Left = 173
    Top = 88
    Width = 265
    Height = 20
    Anchors = [akTop, akRight]
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 2
    Text = 'C:\MyZipFile.zip'
  end
  object cmdAbort: TButton
    Left = 262
    Top = 136
    Width = 83
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #36864#20986
    TabOrder = 3
    OnClick = cmdAbortClick
  end
  object edtFilename1: TEdit
    Left = 173
    Top = 48
    Width = 265
    Height = 20
    Anchors = [akTop, akRight]
    ImeName = #20013#25991' ('#31616#20307') - '#25340#38899#21152#21152
    TabOrder = 4
  end
  object odSelectFile: TOpenDialog
    Filter = 'All Files|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 96
    Top = 16
  end
end

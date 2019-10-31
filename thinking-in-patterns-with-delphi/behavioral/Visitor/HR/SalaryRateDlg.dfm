object dlgSalaryRate: TdlgSalaryRate
  Left = 462
  Top = 243
  BorderStyle = bsDialog
  Caption = #35774#32622#24037#36164#22686#38271#27604#29575
  ClientHeight = 200
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 257
    Height = 137
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 96
    Width = 161
    Height = 14
    Caption = #32463#29702#38454#23618#24037#36164#22686#38271#29575'(%)'#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 161
    Height = 14
    Caption = #21592#24037#38454#23618#24037#36164#22686#38271#29575'(%)'#65306
  end
  object OKBtn: TButton
    Left = 111
    Top = 164
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 184
    Top = 32
    Width = 41
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 1
    Text = '10'
  end
  object Edit2: TEdit
    Left = 184
    Top = 88
    Width = 41
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 2
    Text = '20'
  end
  object UpDown1: TUpDown
    Left = 225
    Top = 32
    Width = 15
    Height = 22
    Associate = Edit1
    Position = 10
    TabOrder = 3
  end
  object UpDown2: TUpDown
    Left = 225
    Top = 88
    Width = 15
    Height = 22
    Associate = Edit2
    Position = 20
    TabOrder = 4
  end
end

object dlgVacation: TdlgVacation
  Left = 462
  Top = 243
  BorderStyle = bsDialog
  Caption = #35774#32622#20241#20551#22825#25968
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
    Left = 48
    Top = 96
    Width = 98
    Height = 14
    Caption = #32463#29702#20241#20551#22825#25968#65306
  end
  object Label2: TLabel
    Left = 48
    Top = 40
    Width = 98
    Height = 14
    Caption = #21592#24037#20241#20551#22825#25968#65306
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
    Left = 152
    Top = 32
    Width = 41
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 1
    Text = '10'
  end
  object Edit2: TEdit
    Left = 152
    Top = 88
    Width = 41
    Height = 22
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 2
    Text = '15'
  end
  object UpDown1: TUpDown
    Left = 193
    Top = 32
    Width = 15
    Height = 22
    Associate = Edit1
    Position = 10
    TabOrder = 3
  end
  object UpDown2: TUpDown
    Left = 193
    Top = 88
    Width = 15
    Height = 22
    Associate = Edit2
    Position = 15
    TabOrder = 4
  end
end

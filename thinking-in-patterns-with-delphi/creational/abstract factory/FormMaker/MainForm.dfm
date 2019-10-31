object frmMain: TfrmMain
  Left = 192
  Top = 114
  Width = 393
  Height = 186
  Caption = #25277#35937#24037#21378#27169#24335#31034#20363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnArt: TjanRoundedButton
    Left = 248
    Top = 80
    Width = 81
    Height = 33
    Color = clSkyBlue
    Gray = True
    TrackGlyph = True
    Flat = True
    Shape = rbsRounded
    HotTrackColor = clBlue
    Caption = #33402#26415
    onclick = btnArtclick
  end
  object btnStandard: TButton
    Left = 96
    Top = 80
    Width = 78
    Height = 31
    Caption = #26631#20934
    TabOrder = 0
    OnClick = btnStandardClick
  end
end

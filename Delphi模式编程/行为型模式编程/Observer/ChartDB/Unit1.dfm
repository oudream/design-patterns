object Form1: TForm1
  Left = 185
  Top = 34
  Width = 774
  Height = 509
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 329
    Height = 161
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 192
    Width = 329
    Height = 289
    BackWall.Brush.Color = clWhite
    Title.Text.Strings = (
      'Size')
    Chart3DPercent = 20
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Perspective = 23
    View3DOptions.Rotation = 357
    View3DOptions.Zoom = 102
    TabOrder = 1
    object Series1: TBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = True
      DataSource = Table1
      SeriesColor = clRed
      XLabelsSource = 'NAME'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'SIZE'
    end
  end
  object DBChart2: TDBChart
    Left = 536
    Top = 0
    Width = 225
    Height = 161
    BackWall.Brush.Color = clWhite
    Title.Text.Strings = (
      'Weight')
    Chart3DPercent = 35
    Legend.Visible = False
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Perspective = 79
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 102
    TabOrder = 2
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      DataSource = Table1
      SeriesColor = clRed
      XLabelsSource = 'NAME'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'WEIGHT'
    end
  end
  object DBImage1: TDBImage
    Left = 328
    Top = 0
    Width = 209
    Height = 161
    DataField = 'BMP'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBChart3: TDBChart
    Left = 329
    Top = 162
    Width = 435
    Height = 319
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Text.Strings = (
      'Size')
    AxisVisible = False
    Chart3DPercent = 35
    ClipPoints = False
    Frame.Visible = False
    Legend.Visible = False
    View3DOptions.Elevation = 320
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    TabOrder = 4
    object Series3: TPieSeries
      Marks.ArrowLength = 8
      Marks.Visible = True
      DataSource = Table1
      SeriesColor = clRed
      XLabelsSource = 'NAME'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'SIZE'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 160
    Width = 330
    Height = 33
    DataSource = DataSource1
    TabOrder = 5
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'animals.dbf'
    Left = 384
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 344
    Top = 168
  end
end

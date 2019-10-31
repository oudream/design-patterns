object RDB: TRDB
  OldCreateOrder = False
  Pooled = False
  Left = 315
  Top = 107
  Height = 206
  Width = 279
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = ADOConBeforeConnect
    Left = 48
    Top = 40
  end
  object adqBank: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'BankName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select AccountID from Bank '
      ' where BankName=:BankName')
    Left = 144
    Top = 40
  end
  object adqAccount: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'AccountID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select Balance from Account where AccountID=:AccountID')
    Left = 144
    Top = 104
  end
  object adqTransfer: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'Balance'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'AccountID'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update Account set Balance=:Balance'
      ' where AccountID=:AccountID'
      '')
    Left = 48
    Top = 112
  end
end

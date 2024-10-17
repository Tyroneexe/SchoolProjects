object dmData: TdmData
  Height = 480
  Width = 640
  object conData: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\Documents\ITPAT\' +
      'Win32\Debug\HealthHarmony.mdb;Mode=ReadWrite;Persist Security In' +
      'fo=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 64
  end
  object tblUsers: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 176
    Top = 64
  end
  object tblDiet: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblDiet'
    Left = 176
    Top = 144
  end
  object qryData: TADOQuery
    Active = True
    Connection = conData
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tblUsers')
    Left = 176
    Top = 336
  end
  object dsDataQuery: TDataSource
    DataSet = qryData
    Left = 360
    Top = 344
  end
  object tblHealthData: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblHealthData'
    Left = 176
    Top = 216
  end
  object dsHealthData: TDataSource
    DataSet = tblHealthData
    Left = 368
    Top = 240
  end
  object dsDiet: TDataSource
    DataSet = tblDiet
    Left = 368
    Top = 144
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 368
    Top = 80
  end
end

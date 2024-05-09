object dmData: TdmData
  Height = 480
  Width = 640
  object ADOCon: TADOConnection
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
    Connection = ADOCon
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 176
    Top = 64
  end
  object tblDiet: TADOTable
    Active = True
    Connection = ADOCon
    CursorType = ctStatic
    TableName = 'tblDiet'
    Left = 176
    Top = 168
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 288
    Top = 72
  end
end

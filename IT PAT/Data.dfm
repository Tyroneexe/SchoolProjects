object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=RoderUsers.mdb;Mode' +
      '=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 80
    Top = 184
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tblRoderUsers'
    Left = 176
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 304
    Top = 192
  end
end

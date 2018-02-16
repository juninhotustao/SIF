object dmCon: TdmCon
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 122
  Width = 185
  object Con: TSQLConnection
    ConnectionName = 'KaneksConnect'
    DriverName = 'DevartSQLServer'
    LoginPrompt = False
    Params.Strings = (
      'GetDriverFunc=getSQLDriverSQLServer'
      'LibraryName=dbexpsda40.dll'
      'VendorLib=sqloledb.dll'
      'BlobSize=-1'
      'SchemaOverride=%.dbo'
      'HostName=(local)'
      'DataBase=Kaneks'
      'User_Name=sa'
      'Password=aram98'
      'ProductName=DevartSQLServer'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver210.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartMSSQLMetaDataCommandFactory,DbxD' +
        'evartSQLServerDriver210.bpl'
      'DriverUnit=DBXDevartSQLServer')
    BeforeConnect = ConBeforeConnect
    Connected = True
    Left = 76
    Top = 39
  end
end

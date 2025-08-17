object DM: TDM
  OldCreateOrder = False
  Left = 472
  Top = 316
  Height = 472
  Width = 542
  object ADOConnectionDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Archi' +
      'tect.mdb;Mode=Share Deny None;Extended Properties="";Persist Sec' +
      'urity Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry' +
      ' Path="";Jet OLEDB:Database Password="1";Jet OLEDB:Engine Type=5' +
      ';Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk' +
      ' Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Databa' +
      'se Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:' +
      'Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=Fa' +
      'lse;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP' +
      '=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object Users_Table: TADOTable
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    TableName = 'WorkmansTbl'
    Left = 24
    Top = 72
    object Users_TableId_Workman: TAutoIncField
      FieldName = 'Id_Workman'
      ReadOnly = True
    end
    object Users_TableWorkmanName: TWideStringField
      FieldName = 'WorkmanName'
      Size = 50
    end
    object Users_TablePassword: TWideStringField
      FieldName = 'Password'
      Size = 255
    end
    object Users_TableRF_Otdel: TIntegerField
      FieldName = 'RF_Otdel'
    end
    object Users_TableRF_Dolg: TIntegerField
      FieldName = 'RF_Dolg'
    end
    object Users_TableOtdel: TStringField
      FieldKind = fkLookup
      FieldName = 'Otdel'
      LookupDataSet = Otdel_Table
      LookupKeyFields = 'Id_Otdel'
      LookupResultField = 'OtdelName'
      KeyFields = 'RF_Otdel'
      Lookup = True
    end
    object Users_TableDolg: TStringField
      FieldKind = fkLookup
      FieldName = 'Dolg'
      LookupDataSet = Dolgnosti_Tbl
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'RF_Dolg'
      Lookup = True
    end
    object Users_TableShow: TBooleanField
      FieldName = 'Show'
    end
    object Users_TablePrava: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Prava'
      LookupDataSet = Dolgnosti_Tbl
      LookupKeyFields = 'id'
      LookupResultField = 'Prava'
      KeyFields = 'RF_Dolg'
      Lookup = True
    end
  end
  object Users_DS: TDataSource
    DataSet = Users_Table
    Left = 24
    Top = 136
  end
  object Projects_Query: TADOQuery
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from projectstbl'
      '')
    Left = 136
    Top = 72
    object Projects_QueryId_Project: TAutoIncField
      FieldName = 'Id_Project'
      ReadOnly = True
    end
    object Projects_QueryProjectName: TWideStringField
      FieldName = 'ProjectName'
      Size = 255
    end
    object Projects_QueryProjectDescription: TMemoField
      FieldName = 'ProjectDescription'
      BlobType = ftMemo
    end
    object Projects_QueryDateRealization: TDateTimeField
      FieldName = 'DateRealization'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Projects_QueryDateVidachi: TDateTimeField
      FieldName = 'DateVidachi'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Projects_QueryRF_GIP: TIntegerField
      FieldName = 'RF_GIP'
    end
    object Projects_QueryNumDogovora: TIntegerField
      FieldName = 'NumDogovora'
    end
    object Projects_QueryKomment: TMemoField
      FieldName = 'Komment'
      BlobType = ftMemo
    end
    object Projects_QueryTZ_File: TWideStringField
      FieldName = 'TZ_File'
      Size = 255
    end
    object Projects_QueryTU_File: TWideStringField
      FieldName = 'TU_File'
      Size = 255
    end
    object Projects_QueryGrGIP_File: TWideStringField
      FieldName = 'GrGIP_File'
      Size = 255
    end
    object Projects_QuerySostav_File: TWideStringField
      FieldName = 'Sostav_File'
      Size = 255
    end
    object Projects_QueryZakazchik: TWideStringField
      FieldName = 'Zakazchik'
      Size = 255
    end
    object Projects_QueryGIP: TStringField
      FieldKind = fkLookup
      FieldName = 'GIP'
      LookupDataSet = Users_Table
      LookupKeyFields = 'Id_Workman'
      LookupResultField = 'WorkmanName'
      KeyFields = 'RF_GIP'
      Lookup = True
    end
    object Projects_QueryGotov: TIntegerField
      DefaultExpression = '0'
      FieldKind = fkLookup
      FieldName = 'Gotov'
      LookupDataSet = Tasks_Query_Gotov
      LookupKeyFields = 'RF_Project'
      LookupResultField = 'Gotovo'
      KeyFields = 'Id_Project'
      Lookup = True
    end
  end
  object Tasks_Query: TADOQuery
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TasksTbl')
    Left = 224
    Top = 72
    object Tasks_QueryId_Task: TAutoIncField
      FieldName = 'Id_Task'
      ReadOnly = True
    end
    object Tasks_QueryTaskName: TWideStringField
      FieldName = 'TaskName'
      Size = 50
    end
    object Tasks_QueryTaskDescription: TMemoField
      FieldName = 'TaskDescription'
      BlobType = ftMemo
    end
    object Tasks_QueryRf_Workman: TIntegerField
      FieldName = 'Rf_Workman'
    end
    object Tasks_QueryDateRealization: TDateTimeField
      FieldName = 'DateRealization'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Tasks_QueryDatePrinjatia: TDateTimeField
      FieldName = 'DatePrinjatia'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Tasks_QueryRF_Project: TIntegerField
      FieldName = 'RF_Project'
    end
    object Tasks_QueryDataVidachi: TDateTimeField
      FieldName = 'DataVidachi'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object Tasks_QueryRf_Otdel: TIntegerField
      FieldName = 'Rf_Otdel'
    end
    object Tasks_QueryRf_OtdelW: TIntegerField
      FieldName = 'Rf_OtdelW'
    end
    object Tasks_QueryPrinjal: TBooleanField
      FieldName = 'Prinjal'
    end
    object Tasks_QueryRecenz: TMemoField
      FieldName = 'Recenz'
      BlobType = ftMemo
    end
    object Tasks_QueryGotovo: TBooleanField
      FieldName = 'Gotovo'
    end
    object Tasks_QueryZdanie: TMemoField
      FieldName = 'Zdanie'
      BlobType = ftMemo
    end
    object Tasks_QueryOtdel: TStringField
      FieldKind = fkLookup
      FieldName = 'Otdel'
      LookupDataSet = Otdel_Table
      LookupKeyFields = 'Id_Otdel'
      LookupResultField = 'OtdelName'
      KeyFields = 'Rf_Otdel'
      Lookup = True
    end
    object Tasks_QueryPereplet: TWideStringField
      FieldName = 'Pereplet'
      Size = 50
    end
    object Tasks_QueryCountZakazchiku: TIntegerField
      FieldName = 'CountZakazchiku'
    end
    object Tasks_QueryCountVArhiv: TIntegerField
      FieldName = 'CountVArhiv'
    end
    object Tasks_QueryDateGotovo: TDateTimeField
      FieldName = 'DateGotovo'
    end
    object Tasks_QueryOtdelW: TStringField
      FieldKind = fkLookup
      FieldName = 'OtdelW'
      LookupDataSet = Otdel_Table
      LookupKeyFields = 'Id_Otdel'
      LookupResultField = 'OtdelName'
      KeyFields = 'Rf_OtdelW'
      Lookup = True
    end
    object Tasks_QueryWorkman: TStringField
      FieldKind = fkLookup
      FieldName = 'Workman'
      LookupDataSet = Users_Table
      LookupKeyFields = 'Id_Workman'
      LookupResultField = 'WorkmanName'
      KeyFields = 'Rf_Workman'
      Lookup = True
    end
  end
  object Files_Query: TADOQuery
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    Filter = 'Rf_Task = 1'
    BeforePost = Files_QueryBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from FilesTbl')
    Left = 304
    Top = 72
    object Files_QueryId_File: TAutoIncField
      FieldName = 'Id_File'
      ReadOnly = True
    end
    object Files_QueryFileName: TWideStringField
      FieldName = 'FileName'
      Size = 255
    end
    object Files_QueryFileView: TWideStringField
      FieldName = 'FileView'
      Size = 255
    end
    object Files_QueryRf_Task: TIntegerField
      FieldName = 'Rf_Task'
    end
    object Files_QueryIspolnitelyu: TBooleanField
      FieldName = 'Ispolnitelyu'
    end
  end
  object Otdel_Table: TADOTable
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    TableName = 'OtdelTbl'
    Left = 376
    Top = 72
    object Otdel_TableId_Otdel: TAutoIncField
      FieldName = 'Id_Otdel'
      ReadOnly = True
    end
    object Otdel_TableOtdelName: TWideStringField
      FieldName = 'OtdelName'
      Size = 50
    end
    object Otdel_TableShow: TBooleanField
      FieldName = 'Show'
    end
  end
  object Otdel_DS: TDataSource
    DataSet = Otdel_Table
    Left = 376
    Top = 144
  end
  object Users_Table1: TADOTable
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    TableName = 'WorkmansTbl'
    Left = 24
    Top = 200
    object Users_Table1Id_Workman: TAutoIncField
      FieldName = 'Id_Workman'
      ReadOnly = True
    end
    object Users_Table1WorkmanName: TWideStringField
      FieldName = 'WorkmanName'
      Size = 100
    end
    object Users_Table1Password: TWideStringField
      FieldName = 'Password'
      Size = 255
    end
    object Users_Table1RF_Otdel: TIntegerField
      FieldName = 'RF_Otdel'
    end
    object Users_Table1RF_Dolg: TIntegerField
      FieldName = 'RF_Dolg'
    end
    object Users_Table1Show: TBooleanField
      FieldName = 'Show'
    end
    object Users_Table1Prava: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Prava'
      LookupDataSet = Dolgnosti_Tbl
      LookupKeyFields = 'id'
      LookupResultField = 'Prava'
      KeyFields = 'RF_Dolg'
      Lookup = True
    end
  end
  object Dolgnosti_Tbl: TADOTable
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    TableName = 'Dolgnosti'
    Left = 448
    Top = 72
    object Dolgnosti_Tblid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Dolgnosti_TblName: TWideStringField
      FieldName = 'Name'
      Size = 50
    end
    object Dolgnosti_TblPrava: TWordField
      FieldName = 'Prava'
    end
  end
  object Tasks_Query_Gotov: TADOQuery
    Active = True
    Connection = ADOConnectionDB
    CursorType = ctStatic
    Filter = 'goto'
    Parameters = <>
    SQL.Strings = (
      'SELECT TasksTbl.RF_Project, Max(TasksTbl.Gotovo)*(-1) AS Gotovo'
      'FROM TasksTbl'
      'GROUP BY TasksTbl.RF_Project;')
    Left = 224
    Top = 8
    object Tasks_Query_GotovRF_Project: TIntegerField
      FieldName = 'RF_Project'
    end
    object Tasks_Query_GotovGotovo: TIntegerField
      FieldName = 'Gotovo'
      ReadOnly = True
    end
  end
end

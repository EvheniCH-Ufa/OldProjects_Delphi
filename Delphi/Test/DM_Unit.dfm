object DM: TDM
  OldCreateOrder = False
  Left = 343
  Top = 196
  Height = 366
  Width = 430
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=TestB' +
      'D.mdb;Mode=Share Deny None;Extended Properties="";Jet OLEDB:Syst' +
      'em database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Pas' +
      'sword="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode' +
      '=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tra' +
      'nsactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create ' +
      'System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB' +
      ':Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without Re' +
      'plica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
  end
  object ADOQ_OtwetTbl: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeClose = ADOQ_OtwetTblBeforeClose
    BeforePost = ADOQ_OtwetTblBeforePost
    BeforeDelete = ADOQ_OtwetTblBeforeDelete
    Parameters = <>
    SQL.Strings = (
      'Select *from  OtwetTbl')
    Left = 40
    Top = 72
    object ADOQ_OtwetTblid_Otwet: TAutoIncField
      FieldName = 'id_Otwet'
      ReadOnly = True
    end
    object ADOQ_OtwetTblOtwet: TWideStringField
      FieldName = 'Otwet'
      Size = 50
    end
  end
  object ADOQ_TestTbl: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select *From TestTbl')
    Left = 136
    Top = 72
    object ADOQ_TestTblid_Test: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id_Test'
      ReadOnly = True
    end
    object ADOQ_TestTblFIO: TWideStringField
      DisplayWidth = 37
      FieldName = 'FIO'
      Size = 50
    end
    object ADOQ_TestTblDate: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Date'
    end
    object ADOQ_TestTblResult: TWordField
      DisplayWidth = 12
      FieldName = 'Result'
    end
  end
  object ADOQ_WoprosTbl: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeClose = ADOQ_WoprosTblBeforeClose
    BeforeInsert = ADOQ_WoprosTblBeforeInsert
    BeforeEdit = ADOQ_WoprosTblBeforeEdit
    BeforePost = ADOQ_WoprosTblBeforePost
    BeforeDelete = ADOQ_WoprosTblBeforeDelete
    Parameters = <>
    SQL.Strings = (
      'Select *From WoprosTbl')
    Left = 232
    Top = 72
    object ADOQ_WoprosTblid_wopros: TAutoIncField
      DisplayWidth = 12
      FieldName = 'id_wopros'
      ReadOnly = True
    end
    object ADOQ_WoprosTblWopros: TWideStringField
      DisplayWidth = 36
      FieldName = 'Wopros'
      Size = 150
    end
    object ADOQ_WoprosTblTime: TSmallintField
      DisplayWidth = 12
      FieldName = 'Time'
    end
    object ADOQ_WoprosTblrf_Otwet: TIntegerField
      DisplayWidth = 12
      FieldName = 'rf_Otwet'
    end
    object ADOQ_WoprosTblOtwet: TStringField
      FieldKind = fkLookup
      FieldName = 'Otwet'
      LookupDataSet = ADOQ_OtwetTbl
      LookupKeyFields = 'id_Otwet'
      LookupResultField = 'Otwet'
      KeyFields = 'rf_Otwet'
      Lookup = True
    end
  end
  object DS_WoprosTbl: TDataSource
    DataSet = ADOQ_WoprosTbl
    OnDataChange = DS_WoprosTblDataChange
    Left = 232
    Top = 128
  end
  object DS_OtwetTbl: TDataSource
    DataSet = ADOQ_OtwetTbl
    OnDataChange = DS_OtwetTblDataChange
    Left = 40
    Top = 128
  end
  object DS_TestTbl: TDataSource
    DataSet = ADOQ_TestTbl
    OnDataChange = DS_TestTblDataChange
    Left = 136
    Top = 128
  end
end

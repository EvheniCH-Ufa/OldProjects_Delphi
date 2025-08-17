unit Data_Unit;

interface

uses
  SysUtils, Classes, DB, ADODB, dialogs;

type
  TDM = class(TDataModule)
    ADOConnectionDB: TADOConnection;
    Users_Table: TADOTable;
    Users_DS: TDataSource;
    Projects_Query: TADOQuery;
    Tasks_Query: TADOQuery;
    Files_Query: TADOQuery;
    Users_TableId_Workman: TAutoIncField;
    Users_TableWorkmanName: TWideStringField;
    Users_TablePassword: TWideStringField;
    Users_TableRF_Otdel: TIntegerField;
    Users_TableRF_Dolg: TIntegerField;
    Otdel_Table: TADOTable;
    Users_TableOtdel: TStringField;
    Otdel_DS: TDataSource;
    Users_Table1: TADOTable;
    Tasks_QueryId_Task: TAutoIncField;
    Tasks_QueryTaskName: TWideStringField;
    Tasks_QueryTaskDescription: TMemoField;
    Tasks_QueryRf_Workman: TIntegerField;
    Tasks_QueryDateRealization: TDateTimeField;
    Tasks_QueryRF_Project: TIntegerField;
    Tasks_QueryDataVidachi: TDateTimeField;
    Tasks_QueryRf_Otdel: TIntegerField;
    Tasks_QueryRf_OtdelW: TIntegerField;
    Tasks_QueryPrinjal: TBooleanField;
    Tasks_QueryDatePrinjatia: TDateTimeField;
    Tasks_QueryRecenz: TMemoField;
    Tasks_QueryGotovo: TBooleanField;
    Tasks_QueryZdanie: TMemoField;
    Otdel_TableId_Otdel: TAutoIncField;
    Otdel_TableOtdelName: TWideStringField;
    Users_Table1Id_Workman: TAutoIncField;
    Users_Table1WorkmanName: TWideStringField;
    Users_Table1Password: TWideStringField;
    Users_Table1RF_Otdel: TIntegerField;
    Users_Table1RF_Dolg: TIntegerField;
    Tasks_QueryOtdel: TStringField;
    Tasks_QueryPereplet: TWideStringField;
    Tasks_QueryCountZakazchiku: TIntegerField;
    Tasks_QueryCountVArhiv: TIntegerField;
    Users_TableDolg: TStringField;
    Dolgnosti_Tbl: TADOTable;
    Dolgnosti_Tblid: TAutoIncField;
    Dolgnosti_TblName: TWideStringField;
    Tasks_QueryDateGotovo: TDateTimeField;
    Tasks_QueryOtdelW: TStringField;
    Tasks_Query_Gotov: TADOQuery;
    Tasks_Query_GotovRF_Project: TIntegerField;
    Tasks_Query_GotovGotovo: TIntegerField;
    Projects_QueryId_Project: TAutoIncField;
    Projects_QueryProjectName: TWideStringField;
    Projects_QueryProjectDescription: TMemoField;
    Projects_QueryDateRealization: TDateTimeField;
    Projects_QueryDateVidachi: TDateTimeField;
    Projects_QueryRF_GIP: TIntegerField;
    Projects_QueryNumDogovora: TIntegerField;
    Projects_QueryKomment: TMemoField;
    Projects_QueryTZ_File: TWideStringField;
    Projects_QueryTU_File: TWideStringField;
    Projects_QueryGrGIP_File: TWideStringField;
    Projects_QuerySostav_File: TWideStringField;
    Projects_QueryZakazchik: TWideStringField;
    Projects_QueryGIP: TStringField;
    Projects_QueryGotov: TIntegerField;
    Files_QueryId_File: TAutoIncField;
    Files_QueryFileName: TWideStringField;
    Files_QueryFileView: TWideStringField;
    Files_QueryRf_Task: TIntegerField;
    Files_QueryIspolnitelyu: TBooleanField;
    Tasks_QueryWorkman: TStringField;
    Users_TableShow: TBooleanField;
    Otdel_TableShow: TBooleanField;
    Users_Table1Show: TBooleanField;
    Users_TablePrava: TIntegerField;
    Dolgnosti_TblPrava: TWordField;
    Users_Table1Prava: TIntegerField;
    procedure Files_QueryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
  //  procedure NewTaskOpr();
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Basic_Unit;

{$R *.dfm}

{
|-------|-------------|--------------|----------|
| Новый | Исполнителю | Пользователь | Рецензия |
|-------|-------------|--------------|----------|
|   +   |     Нет     |     Все      |    нет   |
|-------|-------------|--------------|----------|
|   -   |     Нет     |     Все      |   есть   |
|-------|-------------|--------------|----------|
|   -   |     Нет     |     Юзер     |    нет   |
|-------|-------------|--------------|----------|
|   +   |     Нет     |     Юзер     |   есть   |
|-------|-------------|--------------|----------|
|   -   |     Да      |     Все      |    нет   |
|-------|-------------|--------------|----------|
|   +   |     Да      |     Все      |   есть   |
|-------|-------------|--------------|----------|
|   +   |     Да      |     Юзер     |    нет   |
|-------|-------------|--------------|----------|
|   -   |     Да      |     Юзер     |   есть   |
|-------|-------------|--------------|----------|
________________________________________________________________________________

|-------|-------------|--------------|----------|
| Новый | Исполнителю | Пользователь | Рецензия |
|-------|-------------|--------------|----------|
|   +   |     Нет     |     Все      |    нет   |
|-------|-------------|--------------|----------|
|   +   |     Нет     |     Юзер     |   есть   |
|-------|-------------|--------------|----------|
|   +   |     Да      |     Все      |   есть   |
|-------|-------------|--------------|----------|
|   +   |     Да      |     Юзер     |    нет   |
|-------|-------------|--------------|----------|
|   -   |     Да      |     Все      |    нет   |
|-------|-------------|--------------|----------|
|   -   |     Да      |     Юзер     |   есть   |
|-------|-------------|--------------|----------|
|   -   |     Нет     |     Все      |   есть   |
|-------|-------------|--------------|----------|
|   -   |     Нет     |     Юзер     |    нет   |
|-------|-------------|--------------|----------|
}

procedure TDM.Files_QueryBeforePost(DataSet: TDataSet);
  begin
  if Trim(Files_QueryFileName.AsString) = '' then
    begin //if
    Files_Query.Cancel;
    end   //if
  else
    begin //else
    end;  //else
  end;

end.

unit DM_Unit;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQ_OtwetTbl: TADOQuery;
    ADOQ_TestTbl: TADOQuery;
    ADOQ_WoprosTbl: TADOQuery;
    DS_WoprosTbl: TDataSource;
    DS_OtwetTbl: TDataSource;
    DS_TestTbl: TDataSource;
    ADOQ_OtwetTblid_Otwet: TAutoIncField;
    ADOQ_OtwetTblOtwet: TWideStringField;
    ADOQ_TestTblid_Test: TAutoIncField;
    ADOQ_TestTblFIO: TWideStringField;
    ADOQ_TestTblDate: TDateTimeField;
    ADOQ_TestTblResult: TWordField;
    ADOQ_WoprosTblid_wopros: TAutoIncField;
    ADOQ_WoprosTblWopros: TWideStringField;
    ADOQ_WoprosTblTime: TSmallintField;
    ADOQ_WoprosTblrf_Otwet: TIntegerField;
    ADOQ_WoprosTblOtwet: TStringField;
    procedure ADOQ_OtwetTblBeforeDelete(DataSet: TDataSet);
    procedure ADOQ_OtwetTblBeforePost(DataSet: TDataSet);
    procedure ADOQ_OtwetTblBeforeClose(DataSet: TDataSet);
    procedure ADOQ_WoprosTblBeforeClose(DataSet: TDataSet);
    procedure ADOQ_WoprosTblBeforeEdit(DataSet: TDataSet);
    procedure ADOQ_WoprosTblBeforeInsert(DataSet: TDataSet);
    procedure ADOQ_WoprosTblBeforeDelete(DataSet: TDataSet);
    procedure ADOQ_WoprosTblBeforePost(DataSet: TDataSet);
    procedure DS_OtwetTblDataChange(Sender: TObject; Field: TField);
    procedure DS_TestTblDataChange(Sender: TObject; Field: TField);
    procedure DS_WoprosTblDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Variants, Basic_Unit;

{$R *.dfm}

procedure TDM.ADOQ_OtwetTblBeforeDelete(DataSet: TDataSet);
begin
if DS_OtwetTbl.State = dsInsert
  then ADOQ_OtwetTbl.Cancel;
end;

procedure TDM.ADOQ_OtwetTblBeforePost(DataSet: TDataSet);
begin
if ADOQ_OtwetTbl['Otwet'] = Null then
 begin
 if MessageDlg('Не заполнено поле "Ответ"', mtError, mbOKCancel,0) = 2
  then ADOQ_OtwetTbl.Cancel;
 Abort;
 Exit;
 end;
end;

procedure TDM.ADOQ_OtwetTblBeforeClose(DataSet: TDataSet);
begin
if ((DS_OtwetTbl.State = dsInsert) or (DS_OtwetTbl.State = dsEdit))
  then ADOQ_OtwetTbl.Cancel;
end;

procedure TDM.ADOQ_WoprosTblBeforeClose(DataSet: TDataSet);
begin
if ((DS_WoprosTbl.State = dsInsert) or (DS_WoprosTbl.State = dsEdit))
  then ADOQ_WoprosTbl.Cancel;
end;

procedure TDM.ADOQ_WoprosTblBeforeEdit(DataSet: TDataSet);
begin
if ((DS_WoprosTbl.State = dsInsert) or (DS_WoprosTbl.State = dsEdit))
  then ADOQ_WoprosTbl.Cancel;
end;

procedure TDM.ADOQ_WoprosTblBeforeInsert(DataSet: TDataSet);
begin
if ((DS_WoprosTbl.State = dsInsert) or (DS_WoprosTbl.State = dsEdit))
  then ADOQ_WoprosTbl.Cancel;
end;

procedure TDM.ADOQ_WoprosTblBeforeDelete(DataSet: TDataSet);
begin
if (DS_WoprosTbl.State = dsInsert)
  then ADOQ_WoprosTbl.Cancel;
end;

procedure TDM.ADOQ_WoprosTblBeforePost(DataSet: TDataSet);
var
MessStr : String;
//i : Integer;
begin
MessStr := '';
//if ((DS_WoprosTbl.State <> dsInsert) and (DS_WoprosTbl.State <> dsEdit)) then
// begin
// Abort;
// Exit;
// end;


if ADOQ_WoprosTbl['Wopros'] = Null
 then MessStr := MessStr + 'Не заполнено поле "Вопрос"' + #13+#10;
if ADOQ_WoprosTbl['Time'] = Null
 then MessStr := MessStr + 'Не установлено время ответа' + #13+#10;
if ADOQ_WoprosTbl['rf_Otwet'] = Null
 then MessStr := MessStr + 'Не выбран правильный ответ' + #13+#10;

if MessStr <> '' then
 begin
 MessStr := MessStr + 'Заполните указанные поля и нажмите кнопку "Ввод"';
 if MessageDlg(MessStr, mtError, mbOKCancel,0) = 2
  then ADOQ_WoprosTbl.Cancel;
 Abort;
 Exit;
 end;

end;

procedure TDM.DS_OtwetTblDataChange(Sender: TObject; Field: TField);
begin
Basic_Frm.BttnState(DS_OtwetTbl.State, ADOQ_OtwetTbl.RecordCount);
end;

procedure TDM.DS_TestTblDataChange(Sender: TObject; Field: TField);
begin
 Basic_Frm.BttnState(DS_TestTbl.State, ADOQ_TestTbl.RecordCount);
 Basic_Frm.BBtn_Add.Enabled    := false;
 Basic_Frm.BBtn_Post.Enabled   := false;
 Basic_Frm.BBtn_Cansel.Enabled := false;
end;

procedure TDM.DS_WoprosTblDataChange(Sender: TObject; Field: TField);
begin
 Basic_Frm.BttnState(DS_WoprosTbl.State, ADOQ_WoprosTbl.RecordCount);
end;

end.

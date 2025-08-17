unit NewTask_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, Mask, DB, Types_Unit, ADODB, Grids,
  DBGrids, ExtCtrls, dbcgrids, Menus, Buttons, QDialogs;

type
  TTask_Frm = class(TForm)
    OtdelsTbl: TADOTable;
    OtdelsTblId_Otdel: TAutoIncField;
    OtdelsTblOtdelName: TWideStringField;
    Tasks_DS: TDataSource;
    Panel3: TPanel;
    Cancel_Bttn: TButton;
    Panel1: TPanel;
    BasicProperty_GrBox: TGroupBox;
    Label1: TLabel;
    NameZdanie_GrBox: TGroupBox;
    DBMem_Zdanie: TDBMemo;
    Apply_Bttn: TButton;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    DBMem_Desc: TDBMemo;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    DBEd_TaskName: TDBEdit;
    Label2: TLabel;
    Cmb_Otdel: TComboBox;
    Label6: TLabel;
    Cmb_User: TComboBox;
    CountEx_GrBox: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEd_CountZakaz: TDBEdit;
    DBEd_CountArhiv: TDBEdit;
    Srok_GrBox: TGroupBox;
    DateRealiz_DTPicker: TDateTimePicker;
    TipPerpleta_DBRGrp: TDBRadioGroup;
    UsersTbl: TADOTable;
    UsersTblId_Workman: TAutoIncField;
    UsersTblWorkmanName: TWideStringField;
    UsersTblPassword: TWideStringField;
    UsersTblRF_Otdel: TIntegerField;
    UsersTblRF_Dolg: TIntegerField;
    GroupBox2: TGroupBox;
    Files_DBGrid: TDBGrid;
    OpenDialog: TOpenDialog;
    Ok_Bttn: TButton;
    GroupBox3: TGroupBox;
    TaskPrin_Lbl: TLabel;
    TaskGotovo_Lbl: TLabel;
    GroupBox4: TGroupBox;
    DBMem_Komment: TDBMemo;
    UsersTblPrava: TWordField;
    UsersTblShow: TBooleanField;
    OtdelsTblShow: TBooleanField;
    NewFile_BitBtn: TBitBtn;
    EditFile_BitBtn: TBitBtn;
    DeleteFile_BitBtn: TBitBtn;
    LoadFile_BitBtn: TBitBtn;
    LoadPrFiles_BitBtn: TBitBtn;
    Files_DS: TDataSource;
    Button1: TButton;
    procedure Ok_BttnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Cmb_OtdelKeyPress(Sender: TObject; var Key: Char);
    procedure Cmb_OtdelChange(Sender: TObject);
    procedure Cmb_UserChange(Sender: TObject);
    procedure Cmb_UserKeyPress(Sender: TObject; var Key: Char);
    procedure Cmb_OtdelWKeyPress(Sender: TObject; var Key: Char);
    procedure Cmb_OtdelWChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cancel_BttnClick(Sender: TObject);
    procedure Files_DBGridEditButtonClick(Sender: TObject);
    procedure Apply_BttnClick(Sender: TObject);
    procedure Add_PMClick(Sender: TObject);
    procedure Edit_PMClick(Sender: TObject);
    procedure Del_PMClick(Sender: TObject);
    procedure Files_DBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Files_DBGridCellClick(Column: TColumn);
    procedure TaskPrin_LblClick(Sender: TObject);
    procedure TaskGotovo_LblClick(Sender: TObject);
    procedure DateRealiz_DTPickerChange(Sender: TObject);
    procedure NewFile_BitBtnClick(Sender: TObject);
    procedure DeleteFile_BitBtnClick(Sender: TObject);
    procedure LoadFile_BitBtnClick(Sender: TObject);
    procedure LoadPrFiles_BitBtnClick(Sender: TObject);
    procedure Files_DSDataChange(Sender: TObject; Field: TField);
    procedure EditFile_BitBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Task_Frm: TTask_Frm;
  Users, Otdels, OtdelsW : pSPRValues;
  AOtdel, AUser, AOtdelW : Integer;

 Edit,
 EditFile,
 EditRab,
 Autor, Rab, NachRab : Boolean;

implementation

uses Data_Unit, Basic_Unit, Types, Copy_Unit;

{$R *.dfm}

procedure TTask_Frm.Ok_BttnClick(Sender: TObject);
// var
// i : Integer;
  begin

  if  DM.Tasks_Query.State <> dsBrowse then
    begin //if
    Apply_BttnClick(Apply_Bttn);
    end;   //if
  Close;
  end;

procedure TTask_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    try
    DM.Tasks_Query.Cancel;
    except
    end; //try

    try
    DM.Files_Query.Post;
    except
    end; //try
    try
    DM.Files_Query.Cancel;
    except
    end; //try

  Basic_Frm.Tasks_DBGrid.Invalidate;
  Basic_Frm.Projects_DBGrd.Invalidate;
  end;

procedure TTask_Frm.FormShow(Sender: TObject);
 var
 i : Integer;
  begin
  Caption := 'Задание отдела ' + DM.Tasks_QueryOtdelW.AsString + ' отделу ' + DM.Tasks_QueryOtdel.AsString;
  // заполняем комбо боксы и выбираем нужную позицию ===========================
  OtdelsTbl.Close;
  OtdelsTbl.Open;

  SetLength(Otdels, OtdelsTbl.RecordCount);
  Cmb_Otdel.Items.Clear;
  AOtdel := -1;
  i := 1;
  while i <= OtdelsTbl.RecordCount do
    begin //while
    OtdelsTbl.RecNo := i;

    if OtdelsTblShow.AsBoolean then
      begin //if
      Otdels[Cmb_Otdel.Items.Count].Id    := OtdelsTblId_Otdel.Value;

      if DM.Tasks_QueryRf_Otdel.Value = Otdels[Cmb_Otdel.Items.Count].Id then
         begin //if
         AOtdel := Cmb_Otdel.Items.Count;
         end;  //if

      Otdels[Cmb_Otdel.Items.Count].Value := OtdelsTblOtdelName.Value;
      Cmb_Otdel.Items.Add(OtdelsTblOtdelName.Value);
      end;  //if

    Inc(i);
    end;  //while
  Cmb_Otdel.ItemIndex := AOtdel;
  Cmb_OtdelChange(Cmb_Otdel);

  UsersTbl.Close;
  UsersTbl.Open;

  if Cmb_Otdel.ItemIndex > -1 then
    begin //if
    UsersTbl.Filter := 'RF_Otdel = ' + IntToStr(Otdels[AOtdel].Id);
    UsersTbl.Filtered := true;
    end   //if
  else
    begin //else
    UsersTbl.Filtered := False;
    end;  //else


  SetLength(Users, UsersTbl.RecordCount);
  Cmb_User.Items.Clear;
  AUser := -1;
  i := 1;
  while i <= UsersTbl.RecordCount do
    begin //while
    UsersTbl.RecNo := i;

    if UsersTblShow.AsBoolean then
      begin //if
      Users[Cmb_User.Items.Count].Id    := UsersTblId_Workman.Value;
      if DM.Tasks_QueryRf_Workman.Value = Users[Cmb_User.Items.Count].Id then
         begin //if
         AUser := Cmb_User.Items.Count;
         end;  //if
      Users[Cmb_User.Items.Count].Value := UsersTblWorkmanName.Value;
      Cmb_User.Items.Add(UsersTblWorkmanName.Value);
      end;  //if

    Inc(i);
    end;  //while
  Cmb_User.ItemIndex := AUser;

  // заполняем комбо боксы и выбираем нужную позицию ===========================

    DateRealiz_DTPicker.Date := DM.Tasks_Query.Fields.Fields[4].AsDateTime;
    if (DateRealiz_DTPicker.Date < 2) then
      DateRealiz_DTPicker.Date := Now;
    Cmb_User.Enabled := False;


  // Раскрашиваем принял - выполнил  ===========================================
  if DM.Tasks_QueryPrinjal.AsBoolean then
    begin //if
    TaskPrin_Lbl.Font.Color := clGreen;
    TaskPrin_Lbl.Caption := 'Задание принято ' + FormatDateTime('dd.mm.yyyy в hh:nn', DM.Tasks_QueryDatePrinjatia.AsDateTime);
    end   //if
  else
    begin //else
    TaskPrin_Lbl.Font.Color := clPurple;
    TaskPrin_Lbl.Caption := 'Задание не принято';
    end; //else

  if DM.Tasks_QueryGotovo.AsBoolean then
    begin //if
    TaskGotovo_Lbl.Font.Color := clGreen;
    TaskGotovo_Lbl.Caption := 'Задание выполнено ' + FormatDateTime('dd.mm.yyyy в hh:nn', DM.Tasks_QueryDatePrinjatia.AsDateTime);
    end   //if
  else
    begin //else
    TaskGotovo_Lbl.Font.Color := clPurple;
    TaskGotovo_Lbl.Caption := 'Задание не выполнено';
    end; //else
  // Раскрашиваем принял - выполнил  ===========================================


  // выбираем активность элементов ==============
  if DM.Tasks_Query.State = dsInsert then  // ecli noviy
    begin //if
    Autor := True;
    Rab := False;
    NachRab := false;
    end   //if
  else
    begin //else                          // izmenjaem chto-to

  Autor   := False;
  Rab     := False;
  NachRab := false;

    case CurrentUser.Prava of
      0 : begin
          Autor := False;
          Rab := False;
          NachRab := false;
          end;
      1 : begin
          // GIP, vydavshiy zadanie
          Rab := False;
          NachRab := false;

          if CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger then
            begin //if
            Autor := True;
            end   //if
          else
            begin //else
            Autor := False;
            end;  //else
          end;
      2 : begin
          // Nach otdela, vydavshiy zadanie
          if CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger then
            begin //if
            Autor := True;
            end   //if
          else
            begin //else
            Autor := False;
            end;  //else

          // Nach otdela, poluch zadanie
          if CurrentUser.RF_Otdel = DM.Tasks_QueryRf_Otdel.AsInteger then
            begin //if
            NachRab := True;
            end   //if
          else
            begin //else
            NachRab := False;
            end;  //else
          // Nach otdela, razrabotchik
          if CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger then
            begin //if
            Rab := True;
            end   //if
          else
            begin //else
            Rab := False;
            end;  //else
          end;
      3 : begin
          // Rab - razrabotchik
          if CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger then
            begin //if
            Rab := True;
            end   //if
          else
            begin //else
            Rab := False;
            end;  //else
          end;
      end; // case
    end;  //else

    if DM.Tasks_QueryPrinjal.AsBoolean then
      begin //if
      Edit     := False;
      EditFile := Rab;
      EditRab := False;
      if DM.Tasks_QueryGotovo.AsBoolean then
        begin //if
        Edit     := False;
        EditFile := False;
        end   //if
      else
        begin //else
        end;  //else
      end   //if
    else
      begin //else
      Edit     := Autor;
      EditFile := Autor;
      EditRab := Autor or NachRab;
      end;  //else


  DBEd_TaskName.ReadOnly       := not Edit;
  Cmb_Otdel.Enabled            :=     Edit;
  DBMem_Zdanie.ReadOnly        := not Edit;
  DBMem_Desc.ReadOnly          := not Edit;
  TipPerpleta_DBRGrp.ReadOnly  := not Edit;
  DBEd_CountZakaz.ReadOnly     := not Edit;
  DBEd_CountArhiv.ReadOnly     := not Edit;
  DateRealiz_DTPicker.Enabled  :=     Edit;

  Cmb_User.Enabled             := EditRab;
  DBMem_Komment.ReadOnly       := not EditFile;
 // NewFile_BitBtn.Enabled       := EditFile;

  Files_DSDataChange(Files_DS, DM.Files_QueryFileName);
  end;

procedure TTask_Frm.Cmb_OtdelKeyPress(Sender: TObject; var Key: Char);
  begin
  if (Key = #27) and (Cmb_User.ItemIndex = -1) then
    begin //if
    Cmb_Otdel.ItemIndex := -1;
    Cmb_OtdelChange(Cmb_Otdel);
    try
      DM.Tasks_Query.Edit;
      except
      end; //try
    end;  //if
  end;

procedure TTask_Frm.Cmb_OtdelChange(Sender: TObject);
 var
 i : Integer;
  begin

  if Cmb_Otdel.ItemIndex <> AOtdel then
    begin //if
    try
      DM.Tasks_Query.Edit;
      except
      end; //try

    if Cmb_Otdel.ItemIndex > -1 then
      begin //if
      UsersTbl.Close;
      UsersTbl.Open;

      UsersTbl.Filter := 'RF_Otdel = ' + IntToStr(Otdels[Cmb_Otdel.ItemIndex].Id);
      UsersTbl.Filtered := true;
      end   //if
    else
      begin //else
      UsersTbl.Filtered := False;
      end;  //else

    SetLength(Users, UsersTbl.RecordCount);
    Cmb_User.Items.Clear;
    i := 1;
    while i <= UsersTbl.RecordCount do
      begin //while
      UsersTbl.RecNo := i;
      Users[i-1].Id    := UsersTblId_Workman.Value;
      Users[i-1].Value := UsersTblWorkmanName.Value;
      Cmb_User.Items.Add(UsersTblWorkmanName.Value);
      Inc(i);
      end;  //while
    AOtdel := Cmb_Otdel.ItemIndex;
    end   //if
  else
    begin //else
    end;  //else

  if Cmb_Otdel.Text = 'ООВТД' then
    begin //if
    TipPerpleta_DBRGrp.Visible := True;
    CountEx_GrBox.Visible := True;

    Srok_GrBox.Left  := 334;
    Srok_GrBox.Width := 162;
    end   //if
  else
    begin //else
    TipPerpleta_DBRGrp.Visible := False;
    CountEx_GrBox.Visible := False;

    Srok_GrBox.Left  := 4;
    Srok_GrBox.Width := 492;
    end;  //else


  end;

procedure TTask_Frm.Cmb_UserChange(Sender: TObject);
 var
 i : Integer;
 OtdelTmp : Integer;
 UserTmp : Integer;
  begin
    try
      DM.Tasks_Query.Edit;
      except
      end; //try

  if ((Cmb_Otdel.ItemIndex = -1) and {(Cmb_User.ItemIndex <> AUser) and} (Cmb_User.ItemIndex > -1)) then
    begin //if
    UsersTbl.RecNo := Cmb_User.ItemIndex + 1;
    OtdelTmp := UsersTblRF_Otdel.Value;
    UserTmp  := UsersTblId_Workman.Value;

    i := 0;
    while i < Length(Otdels) do
      begin //while
      if Otdels[i].Id = OtdelTmp then
        begin //if
        Cmb_Otdel.ItemIndex := i;
        Cmb_OtdelChange(Cmb_Otdel);
        AOtdel := i;
        Break;
        end;  //if

      Inc(i);
      end;  //while

    i := 0;
    while i < Length(Users) do
      begin //while
      if Users[i].Id = UserTmp then
        begin //if
        Cmb_User.ItemIndex := i;
        AUser := i;
        Break;
        end;  //if
      Inc(i);
      end;  //while


    end   //if
  else
    begin //else
    end;  //else

end;

procedure TTask_Frm.Cmb_UserKeyPress(Sender: TObject; var Key: Char);
  begin
  if (Key = #27) then
    begin //if
    Cmb_User.ItemIndex := -1;
    try
      DM.Tasks_Query.Edit;
      except
      end; //try

    end;  //if
  end;

procedure TTask_Frm.Cmb_OtdelWKeyPress(Sender: TObject; var Key: Char);
  begin
  if (Key = #27)then
    begin //if
    TComboBox(Sender).ItemIndex := -1;
    end;  //if
  end;

procedure TTask_Frm.Cmb_OtdelWChange(Sender: TObject);
  begin
  if ((DM.Tasks_Query.State <> dsEdit) and (DM.Tasks_Query.State <> dsInsert)) then
      begin //if
      DM.Tasks_Query.Edit;
      end;   //if
  end;

procedure TTask_Frm.FormCreate(Sender: TObject);
  begin
  Color := clWhite;
{  TaskPrin_Lbl_V.Left := TaskPrin_Lbl.Left;
  TaskPrin_Lbl_V.Top  := TaskPrin_Lbl.Top;

  TaskVipoln_Lbl_V.Left := TaskVipoln_Lbl.Left;
  TaskVipoln_Lbl_V.Top  := TaskVipoln_Lbl.Top;}
  end;

procedure TTask_Frm.Cancel_BttnClick(Sender: TObject);
  begin
  Close;
//  ShowMessage(IntToStr(Basic_Frm.Rf_Task));
  end;

procedure TTask_Frm.Files_DBGridEditButtonClick(Sender: TObject);
 var
 Str{, Dir} : String;
// LenFiles : Integer;
  begin

  if DM.Tasks_Query.State = dsInsert then
    begin //if
    if MessageDlg('Перед добавлением файлов, необходимо сохранить новое задание!' + #13 + #10 +
                  'Сохранить задание?', mtWarning, mbOKCancel, 1) = 1 then
       begin //if
       try
         Apply_BttnClick(Apply_Bttn);
         except
         Abort;
         end; //try
       end   //if
    else
       begin //else
       Exit;
       end;  //else
    end;  //if

  if OpenDialog.Execute then
    begin //if

    try
      DM.Files_Query.Edit;
      Str := OpenDialog.FileName;

      DM.Files_Query['FileView'] := ExtractFileName(Str);

      EditFileName(Str);

      DM.Files_Query['FileName'] := Str;
      DM.Files_Query['Rf_Task'] := Basic_Frm.Rf_Task;

      if CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger then
        begin //if
        DM.Files_Query['Ispolnitelyu'] := True;
        end;   //if

      if CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger then
        begin //if
        DM.Files_Query['Ispolnitelyu'] := False;
        end;   //if


      if Basic_Frm.PredCopy(OpenDialog.FileName, false) then
        begin
        Copy_Form.Hide;
        DM.Files_Query.Post;
        end
      else
        begin
        Copy_Form.Hide;
        DM.Files_Query.Cancel;
        end;

      except
      end; //try

    end  //if
  else
    begin
    try
      DM.Files_Query.Cancel;
      DM.Files_Query.Next;
      DM.Files_Query.Prior;
      except

      end; //try

    end;
  end;

procedure TTask_Frm.Apply_BttnClick(Sender: TObject);
  begin

  if (DM.Tasks_Query.State = dsInsert)then
    begin //if
    DM.Tasks_Query['RF_Project'] := Basic_Frm.Rf_Project;
    DM.Tasks_Query['DataVidachi'] := Now;
    end;  //if

  if (DM.Tasks_Query.State = dsEdit) and (not DM.Tasks_QueryPrinjal.AsBoolean) then
    begin //if
    if MessageDlg('Установить в дату выдачи задания текущее время?', mtWarning, mbOKCancel, 1) = 1 then
      begin //if
      DM.Tasks_Query['DataVidachi'] := Now;
      end;  //if
    end;  //if

  if ((DM.Tasks_Query.State = dsInsert) or (DM.Tasks_Query.State = dsEdit)) then
    begin //if
    DM.Tasks_Query['DateRealization'] := DateRealiz_DTPicker.Date;

    // проверки ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if Cmb_User.ItemIndex = -1 then
      begin //if
      DM.Tasks_Query['Rf_Workman'] := Null;
      end   //if
    else
      begin //else
      DM.Tasks_Query['Rf_Workman'] := Users[Cmb_User.ItemIndex].Id;
      end;  //else

    if Trim(DM.Tasks_QueryTaskName.AsString) = '' then
      begin //if
      MessageBox(Application.Handle,
                 pChar('Не введено имя задания!' + #13 + #10 + 'Ведите имя задания, а затем продолжите.'),
                 'Ошибка',
                 16);
      Abort;
      end;   //if

    if Cmb_Otdel.ItemIndex = -1 then
      begin //if
      MessageBox(Application.Handle,
                 pChar('Не выбран отдел - исполнитель!' + #13 + #10 + 'Выберите отдел, а затем продолжите.'),
                 'Ошибка',
                 16);
      Abort;
      end   //if
    else
      begin //else
      DM.Tasks_Query['Rf_Otdel'] := Otdels[Cmb_Otdel.ItemIndex].Id;
      ShowMessage(Otdels[Cmb_Otdel.ItemIndex].Value);
      ShowMessage(Cmb_Otdel.Items[Cmb_Otdel.ItemIndex]);
      end;  //else
    // проверки ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    try
       DM.Tasks_Query.Post;
       except
       MessageBox(Application.Handle,
                  pChar('Задание не записано, проверьте правильность заполнения полей.'),
                  'Ошибка',
                  16);
       end; //try
    end;  //if
  end;

procedure TTask_Frm.Add_PMClick(Sender: TObject);
  begin
  try
    DM.Files_Query.Insert;
    except
    end; //try
  end;

procedure TTask_Frm.Edit_PMClick(Sender: TObject);
  begin
  try
    DM.Files_Query.Edit;
    except
    end; //try
  end;

procedure TTask_Frm.Del_PMClick(Sender: TObject);
  begin
//  Basic_Frm.DelFile;
  end;

procedure TTask_Frm.Files_DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
 var
 Rect1 : TRect;
 str : String;
  begin
  {прорисовываем cheked-ы вместо false-true}
  if (Column.FieldName = 'Ispolnitelyu') then
    begin
    Rect1.Left   := Rect.Left ;
    Rect1.Top    := Rect.Top  ;
    Rect1.Right  := Rect.Right - 1;
    Rect1.Bottom := Rect.Bottom - 1;

    //     файл исполнителю                            и автор
    if ((Column.Field.AsBoolean) and (((CurrentUser.Prava = 2) or (CurrentUser.Prava = 1)) and (CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger)))or
         // от исполнителя                  и    исполнитель
       ((not Column.Field.AsBoolean) and (CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger))  then
      str := 'Исходящий'
    else
      str := 'Входящий';

    Files_DBGrid.Canvas.Brush.Color := Files_DBGrid.Color;
    Files_DBGrid.Canvas.Font.Color := Files_DBGrid.Font.Color;
    Files_DBGrid.Canvas.FillRect(Rect1);
    Files_DBGrid.Canvas.TextOut(Rect1.Left + round((Rect1.Right - Rect1.Left  - Files_DBGrid.Canvas.TextWidth(str))/2),
                                Rect1.Top + round((Rect1.Bottom - Rect1.Top - Files_DBGrid.Canvas.TextHeight(str))/2),
                                str);

    end;
  end;

procedure TTask_Frm.Files_DBGridCellClick(Column: TColumn);
// var
// DGOptions : TDBGridOptions;
// Edit, Rab, AutorT, AutorF : Boolean;
  begin
{  DGOptions := Files_DBGrid.Options;
  Edit := False;
  // Поле Имя файла
  if (Column.FieldName = 'FileView') then
    begin //if

     // АВТОР ------------------------------------------------
    //                ((( ГИП)  или (начальник отдела))       и   (из отдела - автора))
    AutorF := False;
    if (((CurrentUser.Prava = 1) or (CurrentUser.Prava = 2)) and (CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger)) then
      begin //if
      AutorT := True;

      AutorF := DM.Files_QueryIspolnitelyu.AsBoolean;
      end   //if
    else
      begin //else
      AutorT := False;
      end;  //else

    // Исполнитель?
    if CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger then
      begin //if
      Rab := True;
      AutorF := not DM.Files_QueryIspolnitelyu.AsBoolean;
      end   //if
    else
      begin //else
      Rab := False;
      end;  //else


    // Задание еще не готово
    if (not DM.Tasks_QueryGotovo.AsBoolean) then
       begin
       Edit := AutorF and ((DM.Tasks_QueryPrinjal.AsBoolean and Rab) or
                           (not DM.Tasks_QueryPrinjal.AsBoolean and AutorT));
       end
    // Задание готово
    else
       begin //else
       Edit := False;
       end  //else
    end;  //if




  if Edit then
    begin
    if not (dgEditing in DGOptions) then
      begin
      Include(DGOptions, dgEditing);
      NewFile_BitBtn.Enabled := True;
      end;
    end
  else
    begin
      Exclude(DGOptions, dgEditing);
      NewFile_BitBtn.Enabled := False;
    end;  //else     }
{
  if (not DM.Tasks_QueryGotovo.AsBoolean) and (Column.FieldName = 'FileView') and (((CurrentUser.Prava = 3) and (not DM.Files_QueryIspolnitelyu.AsBoolean)) or ((CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger) and (DM.Files_QueryIspolnitelyu.AsBoolean))) then
    begin
    if not (dgEditing in DGOptions) then
      begin
      Include(DGOptions, dgEditing);
      end;
    end
  else
    begin
      Exclude(DGOptions, dgEditing);
{   // исполнитель или начальник отдела    и им входящий
    if ((Basic_Frm.User.Prava > 1) and (DM.Files_QueryIspolnitelyu.AsBoolean)) then
      begin //if
      Exclude(DGOptions, dgEditing);
      end   //if
    else
      begin //else

      end;  //else
 }//   end;

 // Files_DBGrid.Options := DGOptions;
  end;

procedure TTask_Frm.TaskPrin_LblClick(Sender: TObject);
 var
 CurrentTime : Double;
  begin
  //начальник отдела и ещё не принял.
//  if ((Basic_Frm.User.Prava = 2) and (not DM.Tasks_QueryPrinjal.AsBoolean)) then

  //исполнитель и ещё не принял.
  if ((CurrentUser.Name = Cmb_User.Text) and (not DM.Tasks_QueryPrinjal.AsBoolean)) then
    begin //if
    CurrentTime := Now;
    if (MessageBox(Application.Handle,
                   pChar('Вы принимаете задание: "' + DM.Tasks_QueryTaskName.AsString + '" ' + FormatDateTime('dd.mm.yyyy в hh:nn', CurrentTime) + '!' + #13 + #10 + 'Отказ будет невозможен, продолжать?'),
                   'Предупреждение',
                   52
                   ) <> 6) then
      begin //if
      Abort;
      end;   //if

    try
      DM.Tasks_Query.Edit;
      finally
      DM.Tasks_Query['Rf_Workman'] := Users[Cmb_User.ItemIndex].Id;

      if Cmb_Otdel.ItemIndex = -1 then
        begin //if
        MessageBox(Application.Handle,
                   pChar('Не выбран отдел - исполнитель!' + #13 + #10 + 'Выберите отдел, а затем продолжите.'),
                   'Ошибка',
                   16);
        end   //if
      else
        begin //else
        DM.Tasks_Query['Rf_Otdel'] := Otdels[Cmb_Otdel.ItemIndex].Id;
        end;  //else

      DM.Tasks_QueryPrinjal.Value := True;
      DM.Tasks_QueryDatePrinjatia.Value := CurrentTime;
      DM.Tasks_Query.Post;
     { TaskPrin_Lbl.Caption := 'Задание принято ' + FormatDateTime('dd.mm.yyyy в hh:nn', CurrentTime);
      TaskPrin_Lbl.Font.Color := clGreen;
      Cmb_User.Enabled := False;}
      end;
    end;  //if
  FormShow(Sender);
  end;

procedure TTask_Frm.TaskGotovo_LblClick(Sender: TObject);
 var
 CurrentTime : Double;
  begin
               //исполнитель                       начальник отдела уже принял               ещё не сделано.
  if ((CurrentUser.Name = Cmb_User.Text) and (DM.Tasks_QueryPrinjal.AsBoolean) and (not DM.Tasks_QueryGotovo.AsBoolean)) then
    begin //if
    CurrentTime := Now;
    if (MessageBox(Application.Handle,
                   pChar('Вы завершаете работу над заданием: "' + DM.Tasks_QueryTaskName.AsString + '" ' + FormatDateTime('dd.mm.yyyy в hh:nn', CurrentTime) + '!' + #13 + #10 + 'Дальнейшие изменения будут невозможны, продолжать?'),
                   'Предупреждение',
                   52
                   ) <> 6) then
      begin //if
      Abort;
      end;   //if

    try
      DM.Tasks_Query.Edit;
      finally
      DM.Tasks_QueryGotovo.Value := True;
      DM.Tasks_QueryDateGotovo.Value := CurrentTime;
      DM.Tasks_Query.Post;
    {  TaskGotovo_Lbl.Caption := 'Задание выполнено ' + FormatDateTime('dd.mm.yyyy в hh:nn', CurrentTime);
      TaskGotovo_Lbl.Font.Color := clGreen;}
      end;
    end;  //if
  FormShow(Sender);
  end;

procedure TTask_Frm.DateRealiz_DTPickerChange(Sender: TObject);
  begin
  try
    DM.Tasks_Query.Edit;
    except
    end; //try
  try
    DM.Tasks_QueryDateRealization.Value := DateRealiz_DTPicker.DateTime;
    except
    end; //try

  end;

procedure TTask_Frm.NewFile_BitBtnClick(Sender: TObject);
  begin
  try
    DM.Files_Query.Last;
    DM.Files_Query.Insert;
    Files_DBGridEditButtonClick(Files_DBGrid);
    case CurrentUser.Prava of
      1 : begin
          DM.Files_Query['Ispolnitelyu'] := True;
          end;
      2 : begin
          if CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger then
            begin //if
            DM.Files_Query['Ispolnitelyu'] := False;
            end   //if
          else
            begin //else
            DM.Files_Query['Ispolnitelyu'] := True;
            end;  //else
          end;
      3 : begin
          DM.Files_Query['Ispolnitelyu'] := False;
          end;
      end;  //case


    except
    end; //try
  end;

procedure TTask_Frm.DeleteFile_BitBtnClick(Sender: TObject);
  begin
  if MessageBox(Application.Handle, pChar('Удаляется запись файла "' + DM.Files_QueryFileView.AsString + '"!' + #13 + #10 +
                                          'Продолжить?'),
               'Предупреждение', 52) = 6 then
     begin //if
     try
        DM.Files_Query.Delete;
        except
        end; //try
     end;  //if
  end;

procedure TTask_Frm.LoadFile_BitBtnClick(Sender: TObject);
 var
 Dir : WideString;
 FileName, SourceFileName, TargetFileName : String;
  begin
  if SelectDirectory('Выберите каталог для сохранения файла', '', Dir) then
    begin //if
    FileName := DM.Files_QueryFileName.Value;

    if (Dir[Length(Dir)] = '\') then
      begin //if
      TargetFileName := Dir + FileName;
      end   //if
    else
      begin //else
      TargetFileName := Dir + '\' + FileName;
      end;  //else

    SourceFileName := ExtractFilePath(Application.ExeName) + '\Проекты\' + Basic_Frm.Project + '\' + Basic_Frm.Task + '\' +  Basic_Frm.Otdel + '\' + FileName;
    CopyFile(SourceFileName, TargetFileName);
    end   //if
  else
    begin //else
    end;  //else
  end;

procedure TTask_Frm.LoadPrFiles_BitBtnClick(Sender: TObject);
 var
 Dir : WideString;
 FileName, SourceFileName, TargetFileName : String;
  begin
  if SelectDirectory('Выберите каталог для сохранения файлов проекта', '', Dir) then
    begin //if
    if (Dir[Length(Dir)] = '\') then
      begin //if
      end   //if
    else
      begin //else
      Dir := Dir + '\';
      end;  //else

    Copy_Form.Show;

    FileName := DM.Projects_QueryTZ_File.Value;
    if FileName <> '' then
      begin //if
      TargetFileName := Dir + FileName;

      SourceFileName := ExtractFilePath(Application.ExeName) + '\Проекты\' + Basic_Frm.Project + '\' + FileName;
      CopyFile(SourceFileName, TargetFileName);
      end;  //if

    FileName := DM.Projects_QueryTU_File.Value;
    if FileName <> '' then
      begin //if
      TargetFileName := Dir + FileName;

      SourceFileName := ExtractFilePath(Application.ExeName) + '\Проекты\' + Basic_Frm.Project + '\' + FileName;
      CopyFile(SourceFileName, TargetFileName);
      end;  //if

    FileName := DM.Projects_QueryGrGIP_File.Value;
    if FileName <> '' then
      begin //if
      TargetFileName := Dir + FileName;

      SourceFileName := ExtractFilePath(Application.ExeName) + '\Проекты\' + Basic_Frm.Project + '\' + FileName;
      CopyFile(SourceFileName, TargetFileName);
      end;  //if

    FileName := DM.Projects_QuerySostav_File.Value;
    if FileName <> '' then
      begin //if
      TargetFileName := Dir + FileName;

      SourceFileName := ExtractFilePath(Application.ExeName) + '\Проекты\' + Basic_Frm.Project + '\' + FileName;
      CopyFile(SourceFileName, TargetFileName);
      end;  //if
    Copy_Form.Hide;
    end   //if
  else
    begin //else
    end;  //else
end;

procedure TTask_Frm.Files_DSDataChange(Sender: TObject; Field: TField);
 var
 DGOptions : TDBGridOptions;
 AddFile : Boolean;
  begin
  DGOptions := Files_DBGrid.Options;

    if DM.Tasks_QueryPrinjal.AsBoolean then
      begin //if
      if DM.Tasks_QueryGotovo.AsBoolean then
        begin //if
        EditFile := False;
        AddFile  := False;
        end   //if
      else
        begin //else
        EditFile := Rab;
        AddFile  := Rab;
        end;  //else
      end   //if
    else
      begin //else
      EditFile := Autor;
      AddFile  := Autor;
      end;  //else

  NewFile_BitBtn.Enabled       := AddFile;

  if DM.Files_Query.RecordCount = 0 then
    begin //if
    EditFile := False;
    end;  //if


    //     файл исполнителю                            и автор
    if ((DM.Files_QueryIspolnitelyu.AsBoolean) and (((CurrentUser.Prava = 2) or (CurrentUser.Prava = 1)) and (CurrentUser.RF_Otdel = DM.Tasks_QueryRf_OtdelW.AsInteger)))or
  //или     // от исполнителя                  и    исполнитель
       ((not DM.Files_QueryIspolnitelyu.AsBoolean) and (CurrentUser.Id = DM.Tasks_QueryRf_Workman.AsInteger))  then
      EditFile := EditFile
    else
      EditFile := False;


  EditFile_BitBtn.Enabled      := EditFile;
  DeleteFile_BitBtn.Enabled    := EditFile;




  if EditFile or (DM.Files_Query.State = dsInsert) or (DM.Files_Query.State = dsedit) then
    begin
    if not (dgEditing in DGOptions) then
      begin
      Include(DGOptions, dgEditing);
      end;
    end
  else
    begin
      Exclude(DGOptions, dgEditing);
    end;  //else     }

  Files_DBGrid.Options := DGOptions;
  end;

procedure TTask_Frm.EditFile_BitBtnClick(Sender: TObject);
  begin
  try
    DM.Files_Query.Edit;
    Files_DBGridEditButtonClick(Files_DBGrid);
    except

    end; //try

  end;

procedure TTask_Frm.Button1Click(Sender: TObject);
var
i : Integer;
begin
i := 0;

while i < Cmb_Otdel.Items.Count do
  begin //while
  ShowMessage('kom = ' +  Cmb_Otdel.Items[i]);
  ShowMessage('mas = ' +  Otdels[i].Value);
  Inc(i);
  end;  //while


end;

end.

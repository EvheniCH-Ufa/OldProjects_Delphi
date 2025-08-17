unit Basic_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Menus, QDialogs, Buttons, Types_Unit,
  Mask, DBCtrls, ExtCtrls, ComCtrls, TabNotBk, Tabs, ImgList, Registry;

type
  TBasic_Frm = class(TForm)
    Tasks_DS: TDataSource;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    Admin_MM: TMenuItem;
    UserChange_MM: TMenuItem;
    N7: TMenuItem;
    Button2: TButton;
    PageControl: TPageControl;
    Projects_TabSheet: TTabSheet;
    Tasks_TabSheet: TTabSheet;
    Projects_DS: TDataSource;
    Projects_DBGrd: TDBGrid;
    Tasks_DBGrid: TDBGrid;
    BBtn_Vpered: TBitBtn;
    BBtn_Back: TBitBtn;
    BBtn_Exit: TBitBtn;
    ImageList1: TImageList;
    NewProject_BitBtn: TBitBtn;
    NewTask_BitBtn: TBitBtn;
    Panel1: TPanel;
    ViewSettings_MM: TMenuItem;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    TaskDescription_Lbl: TLabel;
    GroupBox2: TGroupBox;
    ProjectDescription_Lbl: TLabel;
    OpenProject_BitBtn: TBitBtn;
    ProjectView_PageCtrl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DeleteProject_BitBtn: TBitBtn;
    OpenTask_BitBtn: TBitBtn;
    DeleteTask_BitBtn: TBitBtn;
    TaskView_PageCtrl: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Timer1: TTimer;
    procedure Projects_DSDataChange(Sender: TObject; Field: TField);
    procedure Tasks_DSDataChange(Sender: TObject; Field: TField);
    procedure Projects_DBGrdDblClick(Sender: TObject);
    procedure Tasks_DBGridDblClick(Sender: TObject);
    procedure Add2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Files_PMPopup(Sender: TObject);
    procedure Tasks_DBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Projects_DBGrdDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure BBtn_BackClick(Sender: TObject);
    procedure BBtn_VperedClick(Sender: TObject);
    procedure Exit_MMClick(Sender: TObject);
    procedure ViewSettings_MMClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PrViewAll_PMClick(Sender: TObject);
    procedure PrViewGot_PMClick(Sender: TObject);
    procedure PrViewNegot_PMClick(Sender: TObject);
    procedure ProjectView_PageCtrlChange(Sender: TObject);
    procedure OpenProject_BitBtnClick(Sender: TObject);
    procedure NewProject_BitBtnClick(Sender: TObject);
    procedure DeleteProject_BitBtnClick(Sender: TObject);
    procedure NewTask_BitBtnClick(Sender: TObject);
    procedure OpenTask_BitBtnClick(Sender: TObject);
    procedure DeleteTask_BitBtnClick(Sender: TObject);
    procedure TaskView_PageCtrlChange(Sender: TObject);
    procedure UserChange_MMClick(Sender: TObject);
    procedure Admin_MMClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

    { Private declarations }
  public
    Rf_Project : Integer;
    Project    : String;
    Rf_Task    : Integer;
    Task       : String;
//    Rf_Otdel   : Integer;
    Otdel      : String;

    RootDir    : String;
    SettingsDir: String;
    ActiveGrid : TDBGrid;

    function PredCopy(SourceFileName : String; Design : Boolean) : Boolean ;

    { Public declarations }
  end;

var
  Basic_Frm: TBasic_Frm;
  CurrentUser : TUser;
//  SelectPr, SelectTask, SelectFiles : String;
//  SelectPr, SelectTask, SelectFiles : String;

//  DBGridNotNewColor, DBGridNewColor : TColor;
  RowNum : Integer;
  
  NewFiles : array of Integer;
  NewTask  : array of Integer;
  NewProj  : array of Integer;

   HRgn: THandle;

  BmpChTrue, BmpChFalse : TBitmap;


implementation
  //  {$R resfile.res}
uses Data_Unit, StrUtils, NewProject_Unit, NewTask_Unit,
  Identification_Unit, Admin_Unit, Copy_Unit, Settings_Unit,
  PasswordChange_Unit;

{$R *.dfm}

procedure TBasic_Frm.Projects_DSDataChange(Sender: TObject; Field: TField);
 var
 str : String;
  begin
 // ShowMessage(IntToStr(DM.Projects_QueryGotov.AsInteger));
  ProjectDescription_Lbl.Caption := DM.Projects_QueryProjectDescription.AsString;
  Rf_Project := DM.Projects_QueryId_Project.AsInteger;
  Project := DM.Projects_QueryProjectName.AsString;

  if (Rf_Project = 0) then
    begin //if
    Tasks_DBGrid.Enabled := False;
    end   //if
  else
    begin //else
    Tasks_DBGrid.Enabled := True;
    end;  //else

  str := 'where Rf_project = ' + IntToStr(Rf_Project);

  case CurrentUser.Prava of
    0 : begin   // Admin и директор
        // Показываем всё...
        end;
    1 : begin   // ГИП
        // Показываем всё задачи...
        end;
    2 : begin // Начальник отдела видит все задания своего отдела, также и которые сам создал
        str := str + ' and (Rf_otdel = ' + IntToStr(CurrentUser.RF_Otdel) + ' or Rf_otdelW = '  + IntToStr(CurrentUser.RF_Otdel) + ')';
        end;
    3 : begin   // Исполнитель видит только свои задания, либо без исполнителя
        str := str + ' and Rf_otdel = ' + IntToStr(CurrentUser.RF_Otdel) + '  and (Rf_workman = ' + IntToStr(CurrentUser.Id) + ' or IsNull(Rf_workman))';
        end;
    end;  //case

  DM.Tasks_Query.SQL.Text := SelectAllTasks + '' + str;
  Memo1.Text := DM.Tasks_Query.SQL.Text;
  DM.Tasks_Query.Open;

  end;

procedure TBasic_Frm.Tasks_DSDataChange(Sender: TObject; Field: TField);
  begin
  TaskDescription_Lbl.Caption := DM.Tasks_QueryTaskDescription.Value;


  Rf_Task := DM.Tasks_QueryId_Task.Value;
  Task := DM.Tasks_QueryTaskName.Value;
  Otdel := DM.Tasks_QueryOtdel.Value;

      //    (ГИП              или     нач. отдела)         и                (не принято)             и   (автор)
  if ((CurrentUser.Prava = 1) or (CurrentUser.Prava = 2)) and (not DM.Tasks_QueryPrinjal.AsBoolean) and (DM.Tasks_QueryRf_OtdelW.AsInteger = CurrentUser.RF_Otdel) then
    begin //if
    DeleteTask_BitBtn.Enabled := True;
    end  //if
  else
    begin //else
    DeleteTask_BitBtn.Enabled := False;
    end;  //else


  DM.Files_Query.Filter := 'Rf_Task = ' + IntToStr(Rf_Task);
  DM.Files_Query.Filtered := true;
  end;

procedure TBasic_Frm.Projects_DBGrdDblClick(Sender: TObject);
  begin
  Project_Frm.ShowModal;
  end;

procedure TBasic_Frm.Tasks_DBGridDblClick(Sender: TObject);
  begin
  if (DM.Tasks_Query.RecordCount > 0) then
    begin
    Task_Frm.ShowModal;
    Basic_Frm.Invalidate;
    end;
  end;

procedure TBasic_Frm.Add2Click(Sender: TObject);
  begin
  try
    DM.Files_Query.Insert;
//    Files_Frm.ShowModal;
  except
  end;
  end;

procedure TBasic_Frm.Edit2Click(Sender: TObject);
  begin
  try
    DM.Files_Query.Edit;
//    Files_Frm.ShowModal;
  except
  end;
  end;

procedure TBasic_Frm.Delete2Click(Sender: TObject);
  begin
  try
    DM.Files_Query.Delete;
  except
  end;
  end;

procedure TBasic_Frm.FormCreate(Sender: TObject);
 var
  reg : TRegistry;
  begin
  GetDir(0, RootDir);

  BBtn_Back.Left := BBtn_Vpered.Left; 

  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.LazyWrite := false;
  reg.OpenKey(
              'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',
              false);
  SettingsDir := reg.ReadString('AppData');
  reg.CloseKey;
  reg.free;

  RowNum := -1;
  Color := clWhite;
  PageControl.ActivePageIndex := 0;
  PageControlChange(PageControl);

   BmpChTrue := TBitmap.Create;
   BmpChTrue.Width := 14;
   BmpChTrue.Height := 13;
 {  BmpChTrue.Canvas.Brush.Color := clGreen;
   BmpChTrue.Canvas.Pen.Color := clGreen;
   BmpChTrue.Canvas.Rectangle(0, 0, BmpChTrue.Width, BmpChTrue.Height);
{   Bmp1.Canvas.Pen.Color := clBlack;

   Bmp1.Canvas.MoveTo(1, 2);
   Bmp1.Canvas.LineTo(1, 11);
   Bmp1.Canvas.LineTo(10, 11);
   Bmp1.Canvas.LineTo(10, 2);
   Bmp1.Canvas.LineTo(1, 2);

}
   BmpChFalse := TBitmap.Create;
   BmpChFalse.Width := 14;
   BmpChFalse.Height := 13;
{   BmpChFalse.Canvas.Brush.Color := clPurple;
   BmpChFalse.Canvas.Pen.Color := clPurple;
   BmpChFalse.Canvas.Rectangle(0, 0, BmpChFalse.Width, BmpChFalse.Height);
   Bmp2.Canvas.Pen.Color := clBlack;

   Bmp2.Canvas.MoveTo(1, 2);
   Bmp2.Canvas.LineTo(1, 11);
   Bmp2.Canvas.LineTo(10, 11);
   Bmp2.Canvas.LineTo(10, 2);
   Bmp2.Canvas.LineTo(1, 2);    }

   ImageList1.Draw(BmpChTrue.Canvas, 0, -1, 7, true);
   ImageList1.Draw(BmpChFalse.Canvas, -1, -1, 8, true);

  end;

procedure TBasic_Frm.Files_PMPopup(Sender: TObject);
  begin
{  case CurrentUser.Prava of
    0 : begin   // Admin и директор
        // Показываем всё...
        end;
    1 : begin   // ГИП
        // Показываем всё задачи...
        end;
    2 : begin // Начальник отдела видит все задания своего отдела, также и которые сам создал

        str := str + ' and (Rf_otdel = ' + IntToStr(CurrentUser.RF_Otdel) + ' or Rf_otdelW = '  + IntToStr(CurrentUser.RF_Otdel) + ')';
        end;
    3 : begin   // Исполнитель видит только свои задания, либо без исполнителя
        str := str + ' and Rf_otdel = ' + IntToStr(CurrentUser.RF_Otdel)+ ' and (Rf_workman = Null or Rf_workman = ' + IntToStr(CurrentUser.Id)+ ')';
        end;
    end;  //case

 }





  if ((DM.Files_QueryFileName.Value = '') or
      (DM.Files_QueryFileView.Value = ''))   then
    begin //if
    Task_Frm.LoadFile_BitBtn.Enabled := False;
    end   //if
  else
    begin //else
    Task_Frm.LoadFile_BitBtn.Enabled := True;
    end;  //else

  end;

procedure TBasic_Frm.Tasks_DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  begin
  if DM.Tasks_QueryGotovo.AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := Settings_Frm.TaskGotov_ClrBx.Selected;
    end
  else
    begin
      if (DM.Tasks_QueryDateRealization.AsFloat < Now) then
         begin
           TDBGrid(Sender).Canvas.Brush.Color := Settings_Frm.TaskNeVSrok_ClrBx.Selected;
         end
      else
         begin
        TDBGrid(Sender).Canvas.Brush.Color := Settings_Frm.TaskNegotov_ClrBx.Selected;
         end;

    end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;

procedure TBasic_Frm.Projects_DBGrdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if DM.Projects_QueryGotov.AsInteger = 1 then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := Settings_Frm.PrGotov_ClrBx.Selected;
    end
  else
    begin
      if (DM.Projects_QueryDateRealization.AsFloat < Now) then
         begin
           TDBGrid(Sender).Canvas.Brush.Color := Settings_Frm.PrNeVSrok_ClrBx.Selected;
         end
      else
         begin
         TDBGrid(Sender).Canvas.Brush.Color := Settings_Frm.PrNegotov_ClrBx.Selected;
         end;
    end;



  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TBasic_Frm.Button1Click(Sender: TObject);
 var
   s: string;
 begin
   DeleteObject(HRgn);
   s := InputBox('Region Text', 'Please enter some text to set to the region', 'CoolRgn');

   BeginPath(Canvas.Handle);
   with Canvas do
   begin
//      Rectangle();
     Font.Name  := 'Comic Sans MS';
      Font.Size  := 64;
      Font.Style := [fsBold];
     TextOut(0, 0, s);
   end;

   EndPath(Canvas.Handle);
   HRgn := PathToRegion(Canvas.Handle);
//   SetWindowRgn(DBEdit1.Handle, HRgn, True);

 //  button1.Visible := False;
 //  Color           := clRed;
  end;

procedure TBasic_Frm.Button2Click(Sender: TObject);
var
i : Integer;
begin
//ShowMessage(FloatToStr(Now));
  i := 0;
  while true do
    begin //while
    ShowMessage(IntToStr(    MessageBox(Handle, '22', pchar(IntToStr(i)), i)));

 //   MessageBox(Handle, '22', pchar(IntToStr(i)), 68);
    Inc(i);
    end;  //while


//Copy_Form.Show;
//ADOQuery1.LoadFromFile('ww.txt');
//DM.Tasks_Query.SaveToFile('11.xml', pfADTG);
end;

procedure TBasic_Frm.PageControlChange(Sender: TObject);
 var
 T, P, F : Integer;
  begin
  P := DM.Projects_Query.RecNo;
  T := DM.Tasks_Query.RecNo;
  F := DM.Files_Query.RecNo;

  case PageControl.ActivePageIndex of
    0 : begin  // проекты
        BBtn_Back.Visible := False;

        BBtn_Vpered.Visible := True;
{        BBtn_Vpered.Caption := 'Задания';
        BBtn_Vpered.Hint := 'Перейти к заданиям';

 }       DM.Tasks_Query_Gotov.Close;
        DM.Tasks_Query_Gotov.Open;

        DM.Projects_Query.Close;
        DM.Projects_Query.Open;

        DM.Tasks_Query.Close;
        DM.Tasks_Query.Open;

        DM.Files_Query.Close;
        DM.Files_Query.Open;

        end;
    1 : begin  // задания
        BBtn_Back.Visible := True;
//        BBtn_Back.Caption := 'Проекты';
//        BBtn_Back.Hint := 'Перейти к проектам';

        BBtn_Vpered.Visible := False;
//        BBtn_Vpered.Caption := 'Файлы';
//        BBtn_Vpered.Hint := 'Перейти к файлам';

        DM.Tasks_Query.Close;
        DM.Tasks_Query.Open;

        DM.Files_Query.Close;
        DM.Files_Query.Open;
        end;
    2 : begin  // Файлы
        BBtn_Back.Visible := True;
        BBtn_Back.Caption := 'Задания';
        BBtn_Back.Hint := 'Перейти к заданиям';

        BBtn_Vpered.Visible := false;

        DM.Files_Query.Close;
        DM.Files_Query.Open;

        end;
    end; // case
  try
    DM.Projects_Query.RecNo := P;
    DM.Tasks_Query.RecNo    := T;
    DM.Files_Query.RecNo    := F;
    except
    end; //try
  end;

procedure TBasic_Frm.BBtn_BackClick(Sender: TObject);
  begin
//  PageControl.ActivePageIndex := PageControl.ActivePageIndex - 1;
  PageControl.ActivePageIndex := 0;
  PageControlChange(PageControl);
  end;

procedure TBasic_Frm.BBtn_VperedClick(Sender: TObject);
  begin
//  PageControl.ActivePageIndex := PageControl.ActivePageIndex + 1;
  PageControl.ActivePageIndex := 1;
  PageControlChange(PageControl);
  end;

procedure TBasic_Frm.Exit_MMClick(Sender: TObject);
  begin
  Close;
  end;

function TBasic_Frm.PredCopy(SourceFileName: String; Design : Boolean) : Boolean;
 var
 TargetFileName : String;
 Dir : String;

  begin
  Copy_Form.Show;
  TargetFileName := SourceFileName;


  Dir := Basic_Frm.RootDir + '\Проекты';
  if not DirectoryExists(Dir) then
    try
       MkDir(Dir);
       except
       MessageBox(Application.Handle, pChar('Не удается создать папку в указанном месте:' + #13 + #10 + Dir), 'Ошибка', 16);
       Result := False;
       exit;
       end; //try

  Dir := Dir + '\' + Basic_Frm.Project;// + '\' + Basic_Frm.Task + '\' + TargetFileName;
  if not DirectoryExists(Dir) then
    try
       MkDir(Dir);
       except
       MessageBox(Application.Handle, pChar('Не удается создать папку в указанном месте:' + #13 + #10 + Dir), 'Ошибка', 16);
       Result := False;
       exit;
       end; //try

  if not Design then
    begin //if
    Dir := Dir + '\' + Basic_Frm.Task;// + '\' + TargetFileName;
    if not DirectoryExists(Dir) then
      try
         MkDir(Dir);
         except
         MessageBox(Application.Handle, pChar('Не удается создать папку в указанном месте:' + #13 + #10 + Dir), 'Ошибка', 16);
         Result := False;
         exit;
         end; //try


    Dir := Dir + '\' + Basic_Frm.Otdel;
    if not DirectoryExists(Dir) then
      try
         MkDir(Dir);
         except
         MessageBox(Application.Handle, pChar('Не удается создать папку в указанном месте:' + #13 + #10 + Dir), 'Ошибка', 16);
         Result := False;
         exit;
         end; //try

    EditFileName(TargetFileName);
    TargetFileName := RootDir + '\Проекты\' + Project + '\' + Task + '\' + Otdel + '\' + TargetFileName;
    end   //if
  else
    begin
    TargetFileName := ExtractFileName(TargetFileName);
    TargetFileName := RootDir + '\Проекты\' + Project + '\' + TargetFileName;
    end;

  if not FileExists(SourceFileName) then
    begin
    MessageBox(Application.Handle, pChar('Не удается скопировать файл:' + #13 + #10 +
                 SourceFileName + '!' + #13 + #10 + 'Неверное имя файла.'), 'Ошибка', 16);
    Result := False;
    Exit;
    end; //try

  try
     CopyFile(SourceFileName, TargetFileName);
     except
     MessageBox(Application.Handle,
                pChar('Не удается скопировать файл:' + #13 + #10 + SourceFileName + #13 + #10 + 'Возможно диск защищен от записи.'),
                'Ошибка',
                16);
     Result := False;
     Exit;
     end; //try
  Copy_Form.Close;
  Result := True;
  end;

procedure TBasic_Frm.ViewSettings_MMClick(Sender: TObject);
  begin
  Settings_Frm.ShowModal;
  end;

procedure TBasic_Frm.N7Click(Sender: TObject);
  begin
  Password_Frm.ShowModal;
  end;

procedure TBasic_Frm.PrViewAll_PMClick(Sender: TObject);
  begin
  DM.Projects_Query.Filter := '';
  end;

procedure TBasic_Frm.PrViewGot_PMClick(Sender: TObject);
  begin
  DM.Projects_Query.Filter := 'Gotov = 1';
  DM.Projects_Query.Filtered := true;
  end;

procedure TBasic_Frm.PrViewNegot_PMClick(Sender: TObject);
  begin
  DM.Projects_Query.Filter := 'Gotov = 0';
  DM.Projects_Query.Filtered := true;
  end;

procedure TBasic_Frm.ProjectView_PageCtrlChange(Sender: TObject);
 var
 Str : String;
  begin
  Str := '';
  case ProjectView_PageCtrl.ActivePageIndex of
    0 : begin  // все
        DM.Projects_Query.Filtered := False;
        end;
    1 : begin  // готово
        DM.Tasks_Query_Gotov.Filter := 'Gotovo = 1';
        DM.Tasks_Query_Gotov.Filtered := true;

        DM.Tasks_Query_Gotov.First;
        while not DM.Tasks_Query_Gotov.Eof do
          begin //while
          Str := Str + 'ID_Project=' + DM.Tasks_Query_GotovRF_Project.AsString + ' or ';
          DM.Tasks_Query_Gotov.Next;
          end;  //while

        Delete(Str, Length(str)-3, 3);

        DM.Projects_Query.Filter := Str;
        Memo1.Text :=Str;
        DM.Projects_Query.Filtered := true;
        end;
    2 : begin  // не готово
        DM.Tasks_Query_Gotov.Filter := 'Gotovo = 1';
        DM.Tasks_Query_Gotov.Filtered := true;

        DM.Tasks_Query_Gotov.First;
        while not DM.Tasks_Query_Gotov.Eof do
          begin //while
          Str := Str + 'ID_Project <>' + DM.Tasks_Query_GotovRF_Project.AsString + ' and ';
          DM.Tasks_Query_Gotov.Next;
          end;  //while

        Delete(Str, Length(str)-4, 4);

        DM.Projects_Query.Filter := Str;
        Memo1.Text :=Str;
        DM.Projects_Query.Filtered := true;
        end;
    end; // case
  end;

procedure TBasic_Frm.OpenProject_BitBtnClick(Sender: TObject);
  begin
  try
    Project_Frm.ShowModal;
    except
    end;
  end;

procedure TBasic_Frm.NewProject_BitBtnClick(Sender: TObject);
  begin
  try
    DM.Projects_Query.Last;
    DM.Projects_Query.Insert;
    DM.Projects_Query['DateRealization'] := Now;
    Project_Frm.ShowModal;
    except
    Exit;
    end;
  end;

procedure TBasic_Frm.DeleteProject_BitBtnClick(Sender: TObject);
  begin
  if MessageBox(Application.Handle,
                pChar('Удаляеся проект "' + Project + '"!' + #13 + #10 +
                      'Будут удалены все записи заданий и файлов.' + #13 + #10 +
                      'Продолжить?'),
                'Предупреждение', 52) = 6 then

     begin //if
     //Удаляем все записи заданий
     while DM.Tasks_Query.RecordCount > 0 do
       begin //while
       DM.Tasks_Query.First;

       //Удаляем все записи файлов
       while DM.Files_Query.RecordCount > 0 do
         begin //while
         DM.Files_Query.First;
         try
            DM.Files_Query.Delete;
            except
            end; //try
         end;  //while
       try
          DM.Tasks_Query.Delete;
          except
          end; //try
       end;  //while
     end;  //if
  end;

procedure TBasic_Frm.NewTask_BitBtnClick(Sender: TObject);
  begin
  try
    DM.Tasks_Query.Last;
    DM.Tasks_Query.Insert;
    DM.Tasks_QueryRf_OtdelW.Value := CurrentUser.RF_Otdel;
    Task_Frm.ShowModal;
    except
    end;
  end;

procedure TBasic_Frm.OpenTask_BitBtnClick(Sender: TObject);
  begin
  try
    Task_Frm.ShowModal;
    except
    end;
  end;

procedure TBasic_Frm.DeleteTask_BitBtnClick(Sender: TObject);
  begin
  if MessageBox(Application.Handle,
                pChar('Удаляеся задание "' + DM.Tasks_QueryTaskName.AsString + '"!' + #13 + #10 +
                      'Будут удалены все записи файлов.' + #13 + #10 +
                      'Продолжить?'),
                'Предупреждение', 52) = 6 then
     begin //if
     while DM.Files_Query.RecordCount > 0 do
       begin //while
       DM.Files_Query.First;

       try
          DM.Files_Query.Delete;
          except
          end; //try
       end;  //while

     try
        DM.Tasks_Query.Delete;
        except
        end; //try
     end;  //if
  end;

procedure TBasic_Frm.TaskView_PageCtrlChange(Sender: TObject);
  begin
  case TaskView_PageCtrl.ActivePageIndex of
    0 : begin  // все
        DM.Tasks_Query.Filtered := False;
        end;
    1 : begin  // готово
        DM.Tasks_Query.Filter := 'Gotovo = true';
        DM.Tasks_Query.Filtered := true;
        end;
    2 : begin  // не готово
        DM.Tasks_Query.Filter := 'Gotovo = false';
        DM.Tasks_Query.Filtered := true;
        end;
    end; // case
  end;

procedure TBasic_Frm.UserChange_MMClick(Sender: TObject);
  begin
  DM.Users_Table.Close;
  DM.Users_Table.Open;
  Identification_Frm.ShowModal;
  end;

procedure TBasic_Frm.Admin_MMClick(Sender: TObject);
  begin
  Admin_Frm.ShowModal;
  end;

procedure TBasic_Frm.Timer1Timer(Sender: TObject);
  begin
  if (DM.Projects_Query.State = dsBrowse)    and
     (DM.Tasks_Query.State = dsBrowse)       and
     (DM.Files_Query.State = dsBrowse)       and
     (DM.Users_Table.State = dsBrowse)       and
     (DM.Otdel_Table.State = dsBrowse)       and
     (DM.Dolgnosti_Tbl.State = dsBrowse)     and
     (DM.Tasks_Query_Gotov.State = dsBrowse) and
     (DM.Files_Query.State = dsBrowse)
 then
    begin //if
    PageControlChange(PageControl);
    end;  //if


  end;

end.

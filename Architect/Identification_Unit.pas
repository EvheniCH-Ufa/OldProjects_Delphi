unit Identification_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TIdentification_Frm = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Ok_Bttn: TButton;
    Cancel_Bttn: TButton;
    Image1: TImage;
    Pass_Edit: TEdit;
    Name_CmbBx: TComboBox;
    procedure Ok_BttnClick(Sender: TObject);
    procedure Cancel_BttnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Identification_Frm: TIdentification_Frm;

implementation

uses Data_Unit, Types_Unit, Basic_Unit, NewTask_Unit,
  NewProject_Unit;

var
  Users : pUsers;

{$R *.dfm}

procedure TIdentification_Frm.Ok_BttnClick(Sender: TObject);
 var
  str, str1 : String;

  EditProject : Boolean;
  begin
  WriteUser;
                      //user
  if ((Name_CmbBx.ItemIndex < 0) or (Pass_Edit.Text <> Users[Name_CmbBx.ItemIndex].Password)) then
    begin //if
    MessageBox(Application.Handle, pChar('Неверный пароль или имя пользователя'), 'Ошибка', 16);
    Name_CmbBx.SetFocus;
    Exit;
    end   //if
  else
    begin //else
    ModalResult := 1;
    end;  //else

  CurrentUser  := Users[Name_CmbBx.ItemIndex];
  Basic_Frm.Caption := 'Architect: ' + CurrentUser.Name + '(' + CurrentUser.Otdel + ')';
  str := SelectAllProjects;

  EditProject := False;
  case CurrentUser.Prava of
    0 : begin   // Admin и директор
        ChangeText(str, '"ANDD"', '');

        Basic_Frm.NewProject_BitBtn.Enabled := False;
        Basic_Frm.DeleteProject_BitBtn.Enabled := False;

        Basic_Frm.NewTask_BitBtn.Enabled := False;
        Basic_Frm.DeleteTask_BitBtn.Enabled := False;


        Task_Frm.Files_DBGrid.PopupMenu     := nil;

        Basic_Frm.NewTask_BitBtn.Enabled    := False;

        EditProject := False;

        Basic_Frm.Admin_MM.Enabled := true;
        end;
    1 : begin   // ГИП
        ChangeText(str, '"ANDD"', 'where Rf_GIP = ' + IntToStr(CurrentUser.Id));

        Basic_Frm.NewProject_BitBtn.Enabled := True;
        Basic_Frm.DeleteProject_BitBtn.Enabled := True;

        Basic_Frm.NewTask_BitBtn.Enabled    := True;

        Basic_Frm.OpenProject_BitBtn.Enabled := True;

        Basic_Frm.NewTask_BitBtn.Enabled := True;

        EditProject := True;
        Basic_Frm.Admin_MM.Enabled := False;
        end;
    2 : begin   // Начальник отдела
        str1 := WhereForOtdel;
        ChangeText(str1, '"OTDEL"', IntToStr(CurrentUser.RF_Otdel));
        ChangeText(str1, '"OTDEL"', IntToStr(CurrentUser.RF_Otdel));

        ChangeText(str, '"ANDD"', str1);


        Basic_Frm.NewProject_BitBtn.Enabled := False;
        Basic_Frm.DeleteProject_BitBtn.Enabled := False;

        Basic_Frm.NewTask_BitBtn.Enabled    := True;

        Basic_Frm.NewProject_BitBtn.Enabled := False;
        Basic_Frm.NewTask_BitBtn.Enabled := True;

        EditProject := False;
        Basic_Frm.Admin_MM.Enabled := False;
        end;
    3 : begin   // Исполнитель
        str1 := WhereForUser;
        ChangeText(str1, '"USER"', IntToStr(CurrentUser.Id));
        ChangeText(str1, '"OTDEL"', IntToStr(CurrentUser.RF_Otdel));

        ChangeText(str, '"ANDD"', str1);

        Basic_Frm.NewProject_BitBtn.Enabled := False;
        Basic_Frm.DeleteProject_BitBtn.Enabled := False;

        Basic_Frm.NewTask_BitBtn.Enabled := False;
        Basic_Frm.DeleteTask_BitBtn.Enabled := False;

        Basic_Frm.NewProject_BitBtn.Enabled := False;
        Basic_Frm.NewTask_BitBtn.Enabled    := False;

        Basic_Frm.NewTask_BitBtn.Enabled := False;

        EditProject := False;
        Basic_Frm.Admin_MM.Enabled := False;
        end;
    end;  //case

  Basic_Frm.Memo1.Text := str;
  DM.Projects_Query.SQL.Text := str;
  DM.Projects_Query.Open;

  Basic_Frm.NewProject_BitBtn.Enabled := EditProject;
  Basic_Frm.Projects_DS.AutoEdit := EditProject;

  Project_Frm.DateRealiz_DTPicker.Enabled := EditProject;
  Project_Frm.TU_File_SpButton.Enabled := EditProject;
  Project_Frm.TZ_File_SpButton.Enabled := EditProject;
  Project_Frm.Sostav_File_SpButton.Enabled := EditProject;
  Project_Frm.GrGIP_File_SpButton.Enabled := EditProject;

  Basic_Frm.PageControl.ActivePageIndex := 0;
  Basic_Frm.PageControlChange(Basic_Frm.PageControl);
  end;

procedure TIdentification_Frm.Cancel_BttnClick(Sender: TObject);
  begin
  Close;
  end;

procedure TIdentification_Frm.FormShow(Sender: TObject);
 var
 i, {Active,} Count : Integer;
  begin
  DM.ADOConnectionDB.Open;
  DM.Users_Table.Open;
  DM.Users_Table.First;
//  Active := -1;
  i := 0;
  Count := DM.Users_Table.RecordCount;

  SetLength(Users, Count);
  Name_CmbBx.Items.Clear;

  while i < Count do
    begin //while
    Users[i].Id       := DM.Users_TableId_Workman.Value;
    Users[i].Name     := DM.Users_TableWorkmanName.Value;
    Users[i].Password := DM.Users_TablePassword.Value;
    Users[i].Prava    := DM.Users_TablePrava.Value;
    Users[i].RF_Otdel := DM.Users_TableRF_Otdel.Value;
    Users[i].Otdel    := DM.Users_TableOtdel.Value;
    Users[i].RF_Dolg  := DM.Users_TableRF_Dolg.Value;
    Users[i].Dolgn    := DM.Users_TableDolg.Value;

    Name_CmbBx.Items.Add(Users[i].Name + ' - ' + Users[i].Dolgn + '(' + Users[i].Otdel + ')');
    DM.Users_Table.Next;
    Inc(i);
    end;  //while

  Name_CmbBx.SetFocus;
  ReadUser;
  end;

procedure TIdentification_Frm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
  if (Key = 13) then
    begin //if
    Ok_BttnClick(Ok_Bttn);
    end;  //if

  if (Key = 27) then
    begin //if
    Cancel_BttnClick(Cancel_Bttn);
    end;  //if
  end;

end.

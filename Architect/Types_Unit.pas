unit Types_Unit;

interface

 Uses Windows, Classes, SysUtils, Dialogs, IniFiles;

type
  TUser = record
    Name     : String;
    Password : String;
    Prava    : Byte;
    Id       : Integer;
    RF_Otdel : Integer;
    Otdel    : String;
    RF_Dolg  : Integer;
    Dolgn    : String;
  end;

  pUsers = array of TUser;

  TSPRValue = record
    Id    : Integer;
    Value : String;
  end;

  pSPRValues = array of TSPRValue;

const

{  SelectAllProjects = 'SELECT *,  0 AS Gotov' + #13 + #10 +
                      'from ProjectsTbl '+ #13 + #10 +
                      'WHERE id_project  in (select rf_project from taskstbl where gotovo = false) "ANDD"' + #13 + #10 +
                      'union' + #13 + #10 +
                      'SELECT *,  1  AS Gotov' + #13 + #10 +
                      'from ProjectsTbl '+ #13 + #10 +
                      'WHERE id_project not in (select rf_project from taskstbl where gotovo = false) "ANDD"' + #13 + #10;

  SelectAllProjects = 'SELECT DISTINCTROW ProjectsTbl.ID_Project, ProjectsTbl.ProjectName, ProjectsTbl.DateRealization, ProjectsTbl.IsNew, ' + #13 + #10 +
                       '                   ProjectsTbl.DateVidachi, ProjectsTbl.RF_GIP, ProjectsTbl.NumDogovora,    ' + #13 + #10 +
                       '                   ProjectsTbl.TZ_File, ProjectsTbl.TU_File, ProjectsTbl.GrGIP_File,        ' + #13 + #10 +
                       '                   ProjectsTbl.Sostav_File, ProjectsTbl.Zakazchik,                          ' + #13 + #10 +
                       '                   First(ProjectsTbl.ProjectDescription) AS ProjectDescription,             ' + #13 + #10 +
                       '                   First(ProjectsTbl.Komment) AS Komment, Max(TasksTbl.Gotovo)*(-1) AS Gotov    ' + #13 + #10 +
                       'FROM ProjectsTbl, TasksTbl                                                                  ' + #13 + #10 +
                       'where ProjectsTbl.Id_Project=TasksTbl.RF_Project "ANDD"                                     ' + #13 + #10 +
                       'GROUP BY ProjectsTbl.Id_Project, ProjectsTbl.ProjectName, ProjectsTbl.DateRealization,      ' + #13 + #10 +
                       '         ProjectsTbl.IsNew, ProjectsTbl.DateVidachi, ProjectsTbl.RF_GIP,                    ' + #13 + #10 +
                       '         ProjectsTbl.NumDogovora, ProjectsTbl.TZ_File, ProjectsTbl.TU_File,                 ' + #13 + #10 +
                       '         ProjectsTbl.GrGIP_File, ProjectsTbl.Sostav_File, ProjectsTbl.Zakazchik             ' + #13 + #10 ;
}
  SelectAllProjects = 'SELECT * from ProjectsTbl "ANDD"';


  WhereForUser      = ' where id_Project in (select rf_project'                                                       + #13 + #10 +
                      '                   from TasksTbl'                                                       + #13 + #10 +
                      '                   where rf_workman = "USER" or (RF_Otdel = "OTDEL" and IsNull(RF_WORKMAN))'                                                       + #13 + #10 +
                      '                   )';





  WhereForOtdel     = ' where id_Project in (select rf_project '                                                                + #13 + #10 +
                      '                    from TasksTbl '                                                                    + #13 + #10 +
                      '                    where RF_Otdel = "OTDEL" or RF_OtdelW = "OTDEL"'                                                         + #13 + #10 +
                      '                                             )';


  SelectAllTasks    = 'select * ' +
                      'from TasksTbl ';
  WhereForProject   = 'where rf_Project = RF_PROJECT';

  procedure ChangeText(var Sourse : String; Substr, Newsubstr : String);
  procedure EditFileName(var FileName : String);
  procedure CopyFile(SourceFileName, TargetFileName : String);

  procedure ReadUser();
  procedure WriteUser();
  procedure ReadColors();
  procedure WriteColors();

var
  TempDir : String;
  Ini : TIniFile;

implementation

uses Basic_Unit, Copy_Unit, Identification_Unit, Settings_Unit;

procedure ChangeText(var Sourse : String; Substr, Newsubstr : String);
 var
 Poz : Integer;
  begin
  Poz := Pos(Substr, Sourse);
  if (Poz = 0) then
    Exit;

  delete(Sourse, Poz, length(Substr));
  Insert(Newsubstr, Sourse, Poz);
  end;

procedure CopyFile(SourceFileName, TargetFileName : String);
 var
  Sourse, Target : TFileStream;
  begin
  if not FileExists(SourceFileName) then
    begin //if
    MessageBox(Copy_Form.Handle, 'Отсутствует загружаемый файл', 'Ошибка', 16);
    Copy_Form.Hide;
    Exit;
    end;  //if

  Sourse := TFileStream.Create(SourceFileName, fmOpenRead);
  try
    Target := TFileStream.Create(TargetFileName, fmOpenWrite or fmCreate);
    try
      Target.CopyFrom(Sourse, Sourse.Size );

      FileSetDate(Target.Handle, FileGetDate(Sourse.Handle));
      finally
      Target.Free;
      end;
    finally
    Sourse.Free;
    end;
  end;

procedure EditFileName(var FileName : String);
 var
 str : String;
  begin
  str := ExtractFileName(FileName);

  ChangeText(str, ExtractFileExt(FileName), '');

  FileName := str + ' (' + FormatDateTime('yyyy-mm-dd;hh-nn', Now) + ')' + ExtractFileExt(FileName);
  end;

procedure ReadUser();
  begin
  Ini := TIniFile.Create(Basic_Frm.SettingsDir + '\Settings.ini');
  Identification_Frm.Name_CmbBx.ItemIndex := Ini.ReadInteger('User', 'Pos', -1);
  end;

procedure WriteUser();
  begin
  Ini := TIniFile.Create(Basic_Frm.SettingsDir + '\Settings.ini');
  Ini.WriteInteger('User', 'Pos', Identification_Frm.Name_CmbBx.ItemIndex);
  end;

procedure ReadColors();
  begin
  Ini := TIniFile.Create(Basic_Frm.SettingsDir + '\Settings.ini');

  Settings_Frm.PrBackgr_ClrBx.Selected    := Ini.ReadInteger('Colors', 'PrB',  $FFFFFF);
  Settings_Frm.PrGotov_ClrBx.Selected     := Ini.ReadInteger('Colors', 'PrG',  $808000);
  Settings_Frm.PrNegotov_ClrBx.Selected   := Ini.ReadInteger('Colors', 'PrN',  $00B9B9FF);
  Settings_Frm.PrNeVSrok_ClrBx.Selected   := Ini.ReadInteger('Colors', 'PrNS', $00FFD988);

  Settings_Frm.TaskBackgr_ClrBx.Selected  := Ini.ReadInteger('Colors', 'TB',  $FFFFFF);
  Settings_Frm.TaskGotov_ClrBx.Selected   := Ini.ReadInteger('Colors', 'TG',  $808000);
  Settings_Frm.TaskNegotov_ClrBx.Selected := Ini.ReadInteger('Colors', 'TN',  $00B9B9FF);
  Settings_Frm.TaskNeVSrok_ClrBx.Selected := Ini.ReadInteger('Colors', 'TNS', $00FFD988);

  Basic_Frm.Projects_DBGrd.Invalidate;
  Basic_Frm.Tasks_DBGrid.Invalidate;
  end;

procedure WriteColors();
  begin
  Ini := TIniFile.Create(Basic_Frm.SettingsDir + '\Settings.ini');

  Ini.WriteInteger('Colors', 'PrB',  Settings_Frm.PrBackgr_ClrBx.Selected);
  Ini.WriteInteger('Colors', 'PrG',  Settings_Frm.PrGotov_ClrBx.Selected);
  Ini.WriteInteger('Colors', 'PrN',  Settings_Frm.PrNegotov_ClrBx.Selected);
  Ini.WriteInteger('Colors', 'PrNS', Settings_Frm.PrNeVSrok_ClrBx.Selected);

  Ini.WriteInteger('Colors', 'TB',  Settings_Frm.TaskBackgr_ClrBx.Selected);
  Ini.WriteInteger('Colors', 'TG',  Settings_Frm.TaskGotov_ClrBx.Selected);
  Ini.WriteInteger('Colors', 'TN',  Settings_Frm.TaskNegotov_ClrBx.Selected);
  Ini.WriteInteger('Colors', 'TNS', Settings_Frm.TaskNeVSrok_ClrBx.Selected);
  end;

end.

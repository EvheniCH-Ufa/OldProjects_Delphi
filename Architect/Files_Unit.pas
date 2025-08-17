unit Files_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB;

type
  TFiles_Frm = class(TForm)
    SelectFile_Bttn: TButton;
    FileDescription_DBMm: TDBMemo;
    Komment_DBMm: TDBMemo;
    Recenz_DBMm: TDBMemo;
    OK_Bttn: TButton;
    Cancel_Bttn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    FileName_DBText: TDBText;
    OpenDialog1: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OK_BttnClick(Sender: TObject);
    procedure SelectFile_BttnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SourceFileName,
    TargetFileName :String;

  end;

var
  Files_Frm: TFiles_Frm;

implementation

uses Basic_Unit, Data_Unit, Types_Unit;

{$R *.dfm}

procedure TFiles_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
  try
    DM.Files_Query.Cancel;
  except
  end;
  Basic_Frm.Files_DBGrid.Invalidate;
  Basic_Frm.Tasks_DBGrid.Invalidate;
  Basic_Frm.Projects_DBGrd.Invalidate;
  end;

procedure TFiles_Frm.OK_BttnClick(Sender: TObject);
 var
 Dir : String;
  begin
  Files_Frm.Cursor := crHourGlass;
  Application.ProcessMessages;


  if DM.Files_Query.State = dsInsert then
     begin
     SourceFileName := OpenDialog1.FileName;

     TargetFileName := SourceFileName;
     EditFileName(TargetFileName);


     Dir := Basic_Frm.RootDir + '\Проекты';
     if not DirectoryExists(Dir) then
        try
           MkDir(Dir);
           except
           ShowMessage('Не удается создать папку в указанном месте:' + #13 + #10 + Dir);
           exit;
           end; //try

     Dir := Dir + '\' + Basic_Frm.Project;// + '\' + Basic_Frm.Task + '\' + TargetFileName;
     if not DirectoryExists(Dir) then
        try
           MkDir(Dir);
           except
           ShowMessage('Не удается создать папку в указанном месте:' + #13 + #10 + Dir);
           exit;
           end; //try

     Dir := Dir + '\' + Basic_Frm.Task;// + '\' + TargetFileName;
     if not DirectoryExists(Dir) then
        try
           MkDir(Dir);
           except
           ShowMessage('Не удается создать папку в указанном месте:' + #13 + #10 + Dir);
           exit;
           end; //try


     Dir := Dir + '\' + Basic_Frm.Otdel;
     if not DirectoryExists(Dir) then
        try
           MkDir(Dir);
           except
           ShowMessage('Не удается создать папку в указанном месте:' + #13 + #10 + Dir);
           exit;
           end; //try

     TargetFileName := Basic_Frm.RootDir + '\Проекты\' + Basic_Frm.Project + '\' + Basic_Frm.Task + '\' + Basic_Frm.Otdel + '\' + TargetFileName;

     if not FileExists(SourceFileName) then
        begin
        ShowMessage('Не удается скопировать файл:' + #13 + #10 +
                     SourceFileName + #13 + #10 + 'Отсутствует файл.');
        exit;
        end; //try


     try
        CopyFile(SourceFileName, TargetFileName);
        except
        ShowMessage('Не удается скопировать файл:' + #13 + #10 +
                     SourceFileName                + #13 + #10 +
                    'Возможно диск защищен от записи.');
        Exit;
        end; //try

     try
       DM.Files_Query['Rf_Task'] := Basic_Frm.Rf_Task;
       DM.Files_Query.Post;
       Close;
       except
       ShowMessage('InsertPost');
       Exit;
       end;
     end;

  if DM.Files_Query.State = dsEdit then
     begin
     try
       DM.Files_Query['IsNew'] := True;
       DM.Files_Query.Post;
       Close;
       except
       ShowMessage('EditPost');
       Exit;
       end;
     end;

  Close;
  Files_Frm.Cursor := crDefault;
  Application.ProcessMessages;
  end;

procedure TFiles_Frm.SelectFile_BttnClick(Sender: TObject);
 var
 Str : String;
  begin
  if OpenDialog1.Execute then
    begin
    Str := OpenDialog1.FileName;

    DM.Files_Query['FileView'] := ExtractFileName(Str);
    EditFileName(Str);

    DM.Files_Query['FileName'] := Str;
    end;

  end;

procedure TFiles_Frm.FormShow(Sender: TObject);
 var
 Useru, RecText, IsNew : Boolean;
  begin
  // filename не пусто - изменяем
  if DM.Files_QueryFileName.Value <> '' then
    begin //if
    FileName_DBText.Enabled := False;
    SelectFile_Bttn.Enabled := False;

    Useru := DM.Files_QueryIspolnitelyu.Value;

{    if not(CurrentUser.ShowAll xor Useru) then
      begin //if
      if not RecText then
        begin //if
        FileDescription_DBMm.Enabled := True;
        Komment_DBMm.Enabled := True;
        Recenz_DBMm.Enabled := False;
        end   //if
      else
        begin //else
        FileDescription_DBMm.Enabled := False;
        Komment_DBMm.Enabled := False;
        Recenz_DBMm.Enabled := False;
        end;  //else
      end   //if
    else
      begin //else
      FileDescription_DBMm.Enabled := False;
      Komment_DBMm.Enabled := False;
      Recenz_DBMm.Enabled := True;
      end;  //else}
    end   //if
  else
    begin //else - NEW.
    DM.Files_Query['IsNew'] := True;
    IsNew := true;

    DM.Files_Query['Ispolnitelyu'] := CurrentUser.ShowAll;
    Useru := CurrentUser.ShowAll;     // Юзеру файл?
    CurrentUser.ShowAll := CurrentUser.ShowAll;              // Все - да, юзер - нет

    FileName_DBText.Enabled := True;
    SelectFile_Bttn.Enabled := True;
    FileDescription_DBMm.Enabled := True;
    Komment_DBMm.Enabled := True;
    Recenz_DBMm.Enabled := False;

{
|-------------|--------------|----------||------------|-----------|
| Исполнителю | Пользователь | Рецензия || Коментарий | Рецензия  |
|-------------|--------------|----------||------------|-----------|
|     Да      |     Все      |   есть   || Неактивен  | Неактивен |
|-------------|--------------|----------||------------|-----------|
|     Да      |     Все      |    нет   ||  Aктивен   | Неактивен |
|-------------|--------------|----------||------------|-----------|
|     Да      |     Юзер     |   есть   || Неактивен  |  Активен  |
|-------------|--------------|----------||------------|-----------|
|     Да      |     Юзер     |    нет   || Неактивен  |  Активен  |
|-------------|--------------|----------||------------|-----------|
|     Нет     |     Все      |   есть   || Неактивен  |  Активен  |
|-------------|--------------|----------||------------|-----------|
|     Нет     |     Все      |    нет   || Неактивен  |  Активен  |
|-------------|--------------|----------||------------|-----------|
|     Нет     |     Юзер     |   есть   || Неактивен  | Неактивен |
|-------------|--------------|----------||------------|-----------|
|     Нет     |     Юзер     |    нет   ||  Aктивен   | Неактивен |
|-------------|--------------|----------||------------|-----------|
}

  {  if (Useru xor Basic_Frm.ShowAll)  then
      begin //if
      Recenz_DBMm.Enabled  := True;
      Komment_DBMm.Enabled := False;
      end   //if
    else
      begin //else
      Recenz_DBMm.Enabled := False;
      Komment_DBMm.Enabled := not RecText;
      end;  //else
   }
    end;  //else




  if (IsNew and
                ((not Useru) and (    CurrentUser.ShowAll) and (not RecText)) or
                ((not Useru) and (not CurrentUser.ShowAll) and (    RecText)) or
                ((    Useru) and (    CurrentUser.ShowAll) and (    RecText)) or
                ((    Useru) and (not CurrentUser.ShowAll) and (not RecText))
                                                                                )then
    begin //if
    DM.Files_Query.Edit;
    DM.Files_Query['IsNew'] := False;
    DM.Files_Query.Post;
    end   //if
  else
    begin //else

    end;  //else
  end;
  
end.

unit NewProject_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, DB, ExtCtrls, Buttons;

type
  TProject_Frm = class(TForm)
    Cancel_Bttn: TButton;
    Panel1: TPanel;
    Panel3: TPanel;
    OK_Bttn: TButton;
    GroupBox4: TGroupBox;
    DateRealiz_DTPicker: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    ProjectName_DBEdit: TDBEdit;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox3: TGroupBox;
    DBMemo2: TDBMemo;
    GroupBox5: TGroupBox;
    TZ_File_DBEdit: TDBEdit;
    TZ_File_SpButton: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    TU_File_DBEdit: TDBEdit;
    TU_File_SpButton: TSpeedButton;
    Label5: TLabel;
    GrGIP_File_DBEdit: TDBEdit;
    GrGIP_File_SpButton: TSpeedButton;
    Label6: TLabel;
    Sostav_File_DBEdit: TDBEdit;
    Sostav_File_SpButton: TSpeedButton;
    Zakazchik_DBEdit: TDBEdit;
    OpenDialog: TOpenDialog;
    procedure DateRealiz_DTPickerChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OK_BttnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TZ_File_SpButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Project_Frm: TProject_Frm;
  TU_File, TZ_File, Sostav_File, GrGIP_File : String;

implementation

uses Basic_Unit, Data_Unit;

{$R *.dfm}

procedure TProject_Frm.DateRealiz_DTPickerChange(Sender: TObject);
  begin
  try
    DM.Projects_Query.Edit;
    except

    end; //try
  DM.Projects_Query['DateRealization'] := DateRealiz_DTPicker.Date;
  end;

procedure TProject_Frm.FormShow(Sender: TObject);
  begin
  DateRealiz_DTPicker.Date := DM.Projects_QueryDateRealization.Value;
  TZ_File := '';
  TU_File := '';
  GrGIP_File := '';
  Sostav_File := '';
  end;

procedure TProject_Frm.OK_BttnClick(Sender: TObject);
  begin

  if DM.Projects_Query.State = dsBrowse then
    begin //if
    Close;
    Exit;
    end;   //if

  if TZ_File <> '' then
    begin //if
    Basic_Frm.PredCopy(TZ_File, True);
    end;  //if

  if TU_File <> '' then
    begin //if
    Basic_Frm.PredCopy(TU_File, True);
    end;  //if

  if GrGIP_File <> '' then
    begin //if
    Basic_Frm.PredCopy(GrGIP_File, True);
    end;  //if

  if Sostav_File <> '' then
    begin //if
    Basic_Frm.PredCopy(Sostav_File, True);
    end;  //if

  if DM.Projects_Query.State = dsInsert then
    begin //if
    if ((DateRealiz_DTPicker.DateTime < Now)) then
      begin //if
      if MessageDlg('Текущее время больше, чем время сдачи проекта.' + #13 + #10 +'Оставить?', mtWarning, mbOKCancel, 1) <> 1 then
        begin //if
        Exit;
        end;  //if
      end;  //if

      try
         DM.Projects_Query['DateRealization'] := DateRealiz_DTPicker.Date;
         DM.Projects_Query['RF_GIP'] := CurrentUser.Id;
         DM.Projects_Query['DateVidachi'] := Now;
         DM.Projects_Query.Post;

         Close;
         except
         end; //try
    end;  //if

  if DM.Projects_Query.State = dsEdit then
    begin //if
    try
       if MessageDlg('Установить в дату выдачи проекта текущее время?', mtWarning, mbOKCancel, 1) = 1 then
          begin //if
          DM.Projects_Query['DateVidachi'] := Now;
          end;  //if

         DM.Projects_Query['DateRealization'] := DateRealiz_DTPicker.Date;
         DM.Projects_Query['RF_GIP'] := CurrentUser.Id;
         DM.Projects_Query.Post;
         Close;
         except
         end; //try
    end;  //if

  end;

procedure TProject_Frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DM.Projects_Query.Cancel;
    except
    end; //try
  Basic_Frm.Tasks_DBGrid.Invalidate;
  Basic_Frm.Projects_DBGrd.Invalidate;
end;

procedure TProject_Frm.FormCreate(Sender: TObject);
  begin
  Color := clWhite;
  end;

procedure TProject_Frm.TZ_File_SpButtonClick(Sender: TObject);
// var
//  i : Integer;
  begin
  if OpenDialog.Execute then
    begin //if
    if ((DM.Projects_Query.State <> dsInsert) and (DM.Projects_Query.State <> dsEdit)) then
      begin //if
      DM.Projects_Query.Edit;
      end;  //if

    case TSpeedButton(Sender).Tag of
      0: begin // TZ
         TZ_File := OpenDialog.FileName;
         TZ_File_DBEdit.Field.Value := ExtractFileName(OpenDialog.FileName);
         end;
      1: begin // TU
         TU_File := OpenDialog.FileName;
         TU_File_DBEdit.Field.Value := ExtractFileName(OpenDialog.FileName);
         end;
      2: begin // TZ
         GrGIP_File := OpenDialog.FileName;
         GrGIP_File_DBEdit.Field.Value := ExtractFileName(OpenDialog.FileName);
         end;
      3: begin // TZ
         Sostav_File := OpenDialog.FileName;
         Sostav_File_DBEdit.Field.Value := ExtractFileName(OpenDialog.FileName);
         end;
      end; // case
    end;  //if

  end;

end.

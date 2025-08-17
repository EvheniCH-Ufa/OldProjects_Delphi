unit Admin_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TAdmin_Frm = class(TForm)
    AdminDolgnostiDBGrid: TDBGrid;
    BBtn_Last: TBitBtn;
    BBtn_Preor: TBitBtn;
    BBtn_Next: TBitBtn;
    BBtn_First: TBitBtn;
    BBtn_Add: TBitBtn;
    BBtn_Delete: TBitBtn;
    BBtn_Post: TBitBtn;
    BBtn_Cansel: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    AdminDS_Dolgnosti: TDataSource;
    AdminTbl_Dolgnosti: TADOTable;
    TabSheet2: TTabSheet;
    AdminWorkMansDBGrid: TDBGrid;
    AdminTbl_WorkMans: TADOTable;
    AdminDS_WorkMans: TDataSource;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    AdminTbl_Otdels: TADOTable;
    AdminDS_Otdels: TDataSource;
    AdminTbl_Projects: TADOTable;
    AdminDS_Projects: TDataSource;
    AdminTbl_Tasks: TADOTable;
    AdminDS_Tasks: TDataSource;
    AdminTbl_Files: TADOTable;
    AdminDS_Files: TDataSource;
    AdminTbl_ProjectsId_Project: TAutoIncField;
    AdminTbl_ProjectsProjectName: TWideStringField;
    AdminTbl_ProjectsDateRealization: TDateTimeField;
    AdminTbl_ProjectsDateVidachi: TDateTimeField;
    AdminTbl_ProjectsRF_GIP: TIntegerField;
    AdminTbl_ProjectsNumDogovora: TIntegerField;
    AdminTbl_TasksId_Task: TAutoIncField;
    AdminTbl_TasksTaskName: TWideStringField;
    AdminTbl_TasksRf_Workman: TIntegerField;
    AdminTbl_TasksDateRealization: TDateTimeField;
    AdminTbl_TasksRF_Project: TIntegerField;
    AdminTbl_TasksDataVidachi: TDateTimeField;
    AdminTbl_TasksRf_Otdel: TIntegerField;
    AdminTbl_TasksRf_OtdelW: TIntegerField;
    AdminTbl_WorkMansId_Workman: TAutoIncField;
    AdminTbl_WorkMansWorkmanName: TWideStringField;
    AdminTbl_WorkMansPassword: TWideStringField;
    AdminTbl_WorkMansRF_Otdel: TIntegerField;
    AdminTbl_WorkMansRF_Dolg: TIntegerField;
    AdminTbl_WorkMansDolgnost: TStringField;
    AdminTbl_WorkMansOtdel: TStringField;
    AdminTbl_ProjectsGIP: TStringField;
    AdminTbl_TasksProject: TStringField;
    AdminTbl_TasksOtdel: TStringField;
    AdminTbl_TasksOtdelW: TStringField;
    AdminTbl_TasksWorkman: TStringField;
    AdminTbl_FilesRf_Task: TIntegerField;
    AdminTbl_FilesTask: TStringField;
    AdminTbl_ProjectsKomment: TMemoField;
    AdminTbl_ProjectsTZ_File: TWideStringField;
    AdminTbl_ProjectsTU_File: TWideStringField;
    AdminTbl_ProjectsGrGIP_File: TWideStringField;
    AdminTbl_ProjectsSostav_File: TWideStringField;
    AdminTbl_ProjectsZakazchik: TWideStringField;
    AdminTbl_ProjectsProjectDescription: TMemoField;
    AdminTbl_TasksTaskDescription: TMemoField;
    AdminTbl_TasksPrinjal: TBooleanField;
    AdminTbl_TasksDatePrinjatia: TDateTimeField;
    AdminTbl_TasksRecenz: TMemoField;
    AdminTbl_TasksGotovo: TBooleanField;
    AdminTbl_TasksZdanie: TMemoField;
    AdminTbl_WorkMansShow: TBooleanField;
    AdminTbl_TasksPereplet: TWideStringField;
    AdminTbl_TasksCountZakazchiku: TIntegerField;
    AdminTbl_TasksCountVArhiv: TIntegerField;
    AdminTbl_TasksDateGotovo: TDateTimeField;
    AdminTbl_FilesId_File: TAutoIncField;
    AdminTbl_FilesFileName: TWideStringField;
    AdminTbl_FilesFileView: TWideStringField;
    AdminTbl_FilesIspolnitelyu: TBooleanField;
    procedure AdminDolgnostiDBGridEnter(Sender: TObject);
    procedure BBtn_LastClick(Sender: TObject);
    procedure BBtn_PreorClick(Sender: TObject);
    procedure BBtn_NextClick(Sender: TObject);
    procedure BBtn_FirstClick(Sender: TObject);
    procedure BBtn_AddClick(Sender: TObject);
    procedure BBtn_DeleteClick(Sender: TObject);
    procedure BBtn_PostClick(Sender: TObject);
    procedure BBtn_CanselClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdminWorkMansDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure AdminWorkMansDBGridDblClick(Sender: TObject);
    procedure AdminWorkMansDBGridCellClick(Column: TColumn);
  private
    { Private declarations }
    ActiveGrid : TDBGrid;
  public
    { Public declarations }
  end;

var
  Admin_Frm: TAdmin_Frm;

implementation

uses Data_Unit, Basic_Unit;

{$R *.dfm}

procedure TAdmin_Frm.AdminDolgnostiDBGridEnter(Sender: TObject);
  begin
  ActiveGrid := TDBGrid(Sender);
  end;

procedure TAdmin_Frm.BBtn_LastClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.First;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_PreorClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Prior;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_NextClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Next;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_FirstClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Last;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_AddClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Insert;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_DeleteClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Delete;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_PostClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Post;
    except
    end; //try
  end;

procedure TAdmin_Frm.BBtn_CanselClick(Sender: TObject);
  begin
  try
    ActiveGrid.DataSource.DataSet.Cancel;
    except
    end; //try
  end;

procedure TAdmin_Frm.FormCreate(Sender: TObject);
  begin
  PageControl1.ActivePage := TabSheet1;
  end;

procedure TAdmin_Frm.FormShow(Sender: TObject);
  begin
  AdminTbl_Dolgnosti.Open;
  AdminTbl_Files.Open;
  AdminTbl_Otdels.Open;
  AdminTbl_Projects.Open;
  AdminTbl_Tasks.Open;
  AdminTbl_WorkMans.Open;
  end;

procedure TAdmin_Frm.AdminWorkMansDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
 var
 Rect1 : TRect;
// FColor : TColor;
  begin
//  FColor := TDBGrid(Sender).Font.Color;
  {ןנמנטסמגûגאול cheked-û גלוסעמ false-true}
  if (Column.FieldName = 'Show') or
     (Column.FieldName = 'Ispolnitelyu') or
     (Column.FieldName = 'Prinjal') or
     (Column.FieldName = 'Gotovo')

      then
    begin
    Rect1.Left := Rect.Left +1 + round((Rect.Right - Rect.Left - 2 - BmpChTrue.Width)/2);
    Rect1.Top := Rect.Top + 1  + round((Rect.Bottom - Rect.Top - 2 - BmpChTrue.Height)/2);
    Rect1.Right := Rect1.Left + BmpChTrue.Width + 1;
    Rect1.Bottom := Rect1.Top + BmpChTrue.Height + 1;

    TDBGrid(Sender).Canvas.Brush.Color := clWhite;
  //  TDBGrid(Sender).Font.Color := clWhite;
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if (Column.Field.AsBoolean) then
       TDBGrid(Sender).Canvas.Draw(Rect1.Left, Rect1.Top, BmpChTrue)
    else
       TDBGrid(Sender).Canvas.Draw(Rect1.Left, Rect1.Top, BmpChFalse);

    if (Column.Width < BmpChTrue.Width + 2) then
      begin //if
      Column.Width := BmpChTrue.Width + 2;
      end;  //if
    end
  else
    begin
//  TDBGrid(Sender).Font.Color := clBlack;
//TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

  end;

procedure TAdmin_Frm.AdminWorkMansDBGridDblClick(Sender: TObject);
  begin
   if ((TDBGrid(Sender).Columns.Items[TStringGrid(Sender).Col - 1].FieldName = 'Show') or
       (TDBGrid(Sender).Columns.Items[TStringGrid(Sender).Col - 1].FieldName = 'Ispolnitelyu') or
       (TDBGrid(Sender).Columns.Items[TStringGrid(Sender).Col - 1].FieldName = 'Show') or
       (TDBGrid(Sender).Columns.Items[TStringGrid(Sender).Col - 1].FieldName = 'Show')) then
     begin
     if ((TDBGrid(Sender).DataSource.DataSet.State = dsEdit) or (TDBGrid(Sender).DataSource.DataSet.State = dsInsert)) then
       TDBGrid(Sender).Columns.Items[TStringGrid(TDBGrid(Sender)).Col - 1].Field.Value := not TDBGrid(Sender).Columns.Items[TStringGrid(TDBGrid(Sender)).Col - 1].Field.AsBoolean
     else
       try
         TDBGrid(Sender).DataSource.DataSet.Edit;
         TDBGrid(Sender).Columns.Items[TStringGrid(TDBGrid(Sender)).Col - 1].Field.Value := not TDBGrid(Sender).Columns.Items[TStringGrid(TDBGrid(Sender)).Col - 1].Field.AsBoolean;
       except
       end; //try
     end;
  end;

procedure TAdmin_Frm.AdminWorkMansDBGridCellClick(Column: TColumn);
 var
  fff : TDBGridOptions;
  begin
  fff := ActiveGrid.Options;

  if ((Column.FieldName <> 'Show'   ) and
      (Column.FieldName <> 'Ispolnitelyu') and
      (Column.FieldName <> 'Prinjal') and
     (Column.FieldName <> 'Gotovo') and
     (Column.FieldName <> 'NalHolod') and
      (Column.FieldName <> 'NalMebel')) then
    begin
    if not (dgEditing in fff) then
      begin
      Include(fff, dgEditing);
      end;
    end
  else
    begin
    Exclude(fff, dgEditing);
    end;

 ActiveGrid.Options := fff;
end;

end.

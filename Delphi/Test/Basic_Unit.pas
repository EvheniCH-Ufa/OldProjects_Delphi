unit Basic_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Tabs,
  Buttons, DBCtrls, DB;

const
 ProgTitle = 'Приложение для тестирования';
 RegimNone = 0;
 RegimAdmn = 1;
 RegimTest = 2;
 ZapFrom = 'Select *From ';
 ZapOrderBy = 'Order By ';
 ColWopr   : Byte = 10;
 ColOtwet  : Byte = 5;
 Password  = '2079';
type
  TBasic_Frm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    MM_Close: TMenuItem;
    MM_Prilog: TMenuItem;
    MM_Testing: TMenuItem;
    MM_Admin: TMenuItem;
    None_Pnl: TPanel;
    MM_Exit: TMenuItem;
    Timer_Second: TTimer;
    MM_NewTest: TMenuItem;
    Test_Pnl: TPanel;
    Label1: TLabel;
    FIO_Lbl: TLabel;
    GrBx_Wopr: TGroupBox;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    StatBar: TStatusBar;
    Btn_NextWopr: TButton;
    Otwet_RG: TRadioGroup;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Btn_StopTest: TButton;
    Pnl_Time: TPanel;
    Pnl_TimePaint: TPanel;
    Lbl_Wopros: TLabel;
    Admin_Pnl: TPanel;
    PgCtrl: TPageControl;
    TbSht_Statistic: TTabSheet;
    GroupBox3: TGroupBox;
    DBGrd_Statistic: TDBGrid;
    TbSht_EditWopr: TTabSheet;
    GroupBox1: TGroupBox;
    Splitter2: TSplitter;
    DBGrd_EditDB: TDBGrid;
    DBMemo1: TDBMemo;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    DBGrd_Otw: TDBGrid;
    DBMem_Otw: TDBMemo;
    BBtn_Preor: TBitBtn;
    BBtn_First: TBitBtn;
    BBtn_Add: TBitBtn;
    BBtn_Post: TBitBtn;
    BBtn_Next: TBitBtn;
    BBtn_Last: TBitBtn;
    BBtn_Delete: TBitBtn;
    BBtn_Cansel: TBitBtn;
    procedure MM_AdminClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MM_CloseClick(Sender: TObject);
    procedure MM_TestingClick(Sender: TObject);
    procedure MM_ExitClick(Sender: TObject);
    procedure BBtn_PreorClick(Sender: TObject);
    procedure BBtn_NextClick(Sender: TObject);
    procedure BBtn_FirstClick(Sender: TObject);
    procedure BBtn_LastClick(Sender: TObject);
    procedure BBtn_AddClick(Sender: TObject);
    procedure BBtn_DeleteClick(Sender: TObject);
    procedure BBtn_PostClick(Sender: TObject);
    procedure BBtn_CanselClick(Sender: TObject);
    procedure DBGrd_EditDBDblClick(Sender: TObject);
    procedure PgCtrlChange(Sender: TObject);
    procedure DBGrd_StatisticTitleClick(Column: TColumn);
    procedure Timer_SecondTimer(Sender: TObject);
    procedure Btn_NextWoprClick(Sender: TObject);
    procedure Btn_StopTestClick(Sender: TObject);
    procedure MM_NewTestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
  private
    { Private declarations }
  public
    procedure UstRegim();
    procedure BttnState(State : TDataSetState; RC : Integer);
    procedure ExitTest();
    procedure WoprosInit();
    function  OtwetInit(RF : Int64) : Byte;
    procedure  ZadatWopros(Num : Byte);



    { Public declarations }
  end;

var
  Basic_Frm : TBasic_Frm;
  Regim     : Byte; // 0 - none, 1 - admin, 2 - test
  ClmnIndex : Integer;
  FIO       : String;
  MassWprs  : array of Cardinal;
  MassOtwtw : array of Cardinal;
  Otwet     : Byte;
  TimeOtwet : Byte;
  FlagIzmKnopok : Boolean = False;
  NumWopros : Byte;
  ColPrOtwet: Byte;

implementation

uses DM_Unit, Ws_Unit;

{$R *.dfm}

procedure TBasic_Frm.MM_AdminClick(Sender: TObject);
begin
ExitTest;
Ws_Frm.Pass_Ed.PasswordChar := '*';
Ws_Frm.Label1.Caption := 'Ведите пароль';

while True do begin
 Ws_Frm.Pass_Ed.Text := '';
 if (Ws_Frm.ShowModal = 1)
  then begin
        if Ws_Frm.Pass_Ed.Text = Password
         then begin
              Regim := 1;
              UstRegim;
              FlagIzmKnopok := True;
              DM.ADOQ_OtwetTbl.First;
              DM.ADOQ_WoprosTbl.First;
              DM.ADOQ_TestTbl.First;
              Break;
              end
        else
         begin
          Application.MessageBox('Введен неверный пароль!!!' + #13 + #10 + 'Проверте не нажат ли ' + #147 + 'Caps Lock' + #147,
           'Ошибка', MB_OK + MB_ICONERROR);
         end;
       end
  else
   Break;
end;
end;

procedure TBasic_Frm.FormCreate(Sender: TObject);
begin
 Regim := 0;
 UstRegim;
 ClmnIndex := -1;
end;

procedure TBasic_Frm.UstRegim();
begin
  // 0 - none, 1 - admin, 2 - test
  case Regim of
    0: begin
       None_Pnl.Visible  := True;
       Admin_Pnl.Visible := False;
       Test_Pnl.Visible  := False;

       MM_Exit.Enabled   := False;
       MM_Admin.Enabled  := True;
       MM_Testing.Enabled:= True;
       MM_NewTest.Visible:= False;

       Caption           := ProgTitle;
       end;
    1: begin
       None_Pnl.Visible  := False;
       Admin_Pnl.Visible := True;
       Test_Pnl.Visible  := False;

       MM_Exit.Enabled   := True;
       MM_Admin.Enabled  := False;
       MM_Testing.Enabled:= True;
       MM_NewTest.Visible:= False;

       Caption           := ProgTitle + ': "Администрирование"';
       end;
    2: begin
       None_Pnl.Visible  := False;
       Admin_Pnl.Visible := False;
       Test_Pnl.Visible  := True;

       MM_Exit.Enabled   := True;
       MM_Admin.Enabled  := True;
       MM_Testing.Enabled:= False;
       MM_NewTest.Visible:= True;

       Pnl_TimePaint.Caption := '';

       Caption           := ProgTitle + ': "Тестирование"';
       end;
  end;

end;

procedure TBasic_Frm.MM_CloseClick(Sender: TObject);
begin
Close;
end;

procedure TBasic_Frm.MM_TestingClick(Sender: TObject);
begin
Ws_Frm.Pass_Ed.PasswordChar := #0;
Ws_Frm.Label1.Caption := 'Введите ФИО';

while True do begin
 Ws_Frm.Pass_Ed.Text := '';
 if (Ws_Frm.ShowModal = 1)
  then begin
        if Ws_Frm.Pass_Ed.Text <> ''
         then begin
              Regim := 2;
              UstRegim;

              FIO := Ws_Frm.Pass_Ed.Text;
              FIO_Lbl.Caption := FIO;

              StatBar.Panels[0].Text := FIO;
              GrBx_Wopr.Caption := ' Вопрос № 1 из ' + IntToStr(ColWopr);
              StatBar.Panels[1].Text := 'Вопрос № 1';
              Label2.Caption := 'Осталось времени:';

              FlagIzmKnopok := False;
              SetLength(MassWprs,  ColWopr);
              SetLength(MassOtwtw, ColOtwet);

              Btn_NextWopr.Enabled := True;
              Btn_StopTest.Enabled := True;

              WoprosInit;
              NumWopros := 0;
              ZadatWopros(NumWopros);
              Break;
              end
        else
         begin
          Application.MessageBox('Введите свою фамилию, имя, отчество', 'Ошибка', MB_OK + MB_ICONERROR);
         end;
       end
  else
   Break;
end;


end;

procedure TBasic_Frm.MM_ExitClick(Sender: TObject);
begin
 ExitTest;
 Regim := 0;
 UstRegim;
end;

procedure TBasic_Frm.BBtn_PreorClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Prior;
  1 : DM.ADOQ_WoprosTbl.Prior;
  2 : DM.ADOQ_OtwetTbl.Prior;
 end;
end;

procedure TBasic_Frm.BBtn_NextClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Next;
  1 : DM.ADOQ_WoprosTbl.Next;
  2 : DM.ADOQ_OtwetTbl.Next;
 end;
end;

procedure TBasic_Frm.BBtn_FirstClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.First;
  1 : DM.ADOQ_WoprosTbl.First;
  2 : DM.ADOQ_OtwetTbl.First;
 end;
end;

procedure TBasic_Frm.BBtn_LastClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Last;
  1 : DM.ADOQ_WoprosTbl.Last;
  2 : DM.ADOQ_OtwetTbl.Last;
 end;
end;

procedure TBasic_Frm.BBtn_AddClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Insert;
  1 : DM.ADOQ_WoprosTbl.Insert;
  2 : DM.ADOQ_OtwetTbl.Insert;
 end;
end;

procedure TBasic_Frm.BBtn_DeleteClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Delete;
  1 : DM.ADOQ_WoprosTbl.Delete;
  2 : DM.ADOQ_OtwetTbl.Delete;
 end;
end;

procedure TBasic_Frm.BBtn_PostClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Post;
  1 : DM.ADOQ_WoprosTbl.Post;
  2 : DM.ADOQ_OtwetTbl.Post;
 end;
end;

procedure TBasic_Frm.BBtn_CanselClick(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0 : DM.ADOQ_TestTbl.Cancel;
  1 : DM.ADOQ_WoprosTbl.Cancel;
  2 : DM.ADOQ_OtwetTbl.Cancel;
 end;
end;

procedure TBasic_Frm.DBGrd_EditDBDblClick(Sender: TObject);
begin
//ShowMessage('sdtrh');
end;

procedure TBasic_Frm.PgCtrlChange(Sender: TObject);
begin
 case PgCtrl.TabIndex of
  0:
   begin
   BttnState(DM.DS_TestTbl.State, DM.ADOQ_TestTbl.RecordCount);   
   BBtn_Add.Enabled    := false;
   BBtn_Post.Enabled   := false;
   BBtn_Cansel.Enabled := false;
   end;
  1: BttnState(DM.DS_WoprosTbl.State, DM.ADOQ_WoprosTbl.RecordCount);
  2: BttnState(DM.DS_OtwetTbl.State, DM.ADOQ_OtwetTbl.RecordCount);
 end;
end;

procedure TBasic_Frm.BttnState(State: TDataSetState; RC : Integer);
begin
if not FlagIzmKnopok
 then Exit; 
case State of
  dsBrowse:
   begin
   BBtn_Post.Enabled   := False;
   BBtn_Cansel.Enabled := False;
   BBtn_Preor.Enabled  := True;
   BBtn_First.Enabled  := True;
   BBtn_Add.Enabled    := True;
   BBtn_Next.Enabled   := True;
   BBtn_Last.Enabled   := True;
   BBtn_Delete.Enabled := True;
   end;
  dsEdit:
   begin
   BBtn_Preor.Enabled  := False;
   BBtn_First.Enabled  := False;
   BBtn_Add.Enabled    := False;
   BBtn_Next.Enabled   := False;
   BBtn_Last.Enabled   := False;
   BBtn_Post.Enabled   := True;
   BBtn_Cansel.Enabled := True;
   BBtn_Delete.Enabled := True;
   end;
  dsInsert:
   begin
   BBtn_Preor.Enabled  := False;
   BBtn_First.Enabled  := False;
   BBtn_Add.Enabled    := False;
   BBtn_Next.Enabled   := False;
   BBtn_Last.Enabled   := False;
   BBtn_Post.Enabled   := True;
   BBtn_Cansel.Enabled := True;
   BBtn_Delete.Enabled := True;
   end;
  dsInactive:
   begin
   BBtn_Preor.Enabled  := False;
   BBtn_First.Enabled  := False;
   BBtn_Add.Enabled    := False;
   BBtn_Next.Enabled   := False;
   BBtn_Last.Enabled   := False;
   BBtn_Post.Enabled   := False;
   BBtn_Cansel.Enabled := False;
   BBtn_Delete.Enabled := False;
   end;
else
   begin
   BBtn_Preor.Enabled  := True;
   BBtn_First.Enabled  := True;
   BBtn_Add.Enabled    := True;
   BBtn_Next.Enabled   := True;
   BBtn_Last.Enabled   := True;
   BBtn_Post.Enabled   := True;
   BBtn_Cansel.Enabled := True;
   BBtn_Delete.Enabled := True;
   end;
end;

if RC <= 0 then
 begin
   BBtn_Preor.Enabled  := False;
   BBtn_First.Enabled  := False;
   BBtn_Next.Enabled   := False;
   BBtn_Last.Enabled   := False;
   BBtn_Post.Enabled   := False;
   BBtn_Cansel.Enabled := False;
   BBtn_Delete.Enabled := False;
 end;

end;

procedure TBasic_Frm.DBGrd_StatisticTitleClick(Column: TColumn);
var
Zapr : String;
FontSt : TFontStyles;
begin
 if ClmnIndex = Column.Index
  then Exit;
 Zapr := ZapFrom + 'TestTbl ' + ZapOrderBy + Column.FieldName;
 try
   DM.ADOQ_TestTbl.SQL.Text := Zapr;
   DM.ADOQ_TestTbl.Open;
 except
 end;
 Include(FontSt, fsItalic);

 try
  DBGrd_Statistic.Columns.Items[ClmnIndex].Title.Font.Style := FontSt;
  DBGrd_Statistic.Columns.Items[ClmnIndex].Title.Font.Color := clFuchsia;
 except
 end;

 Include(FontSt, fsBold);
 Column.Title.Font.Style := FontSt;
 Column.Title.Font.Color := clBlack;
 ClmnIndex := Column.Index;
end;

procedure TBasic_Frm.WoprosInit;
var
I,J, RC : Cardinal;
Flag : Boolean;
begin
RC := DM.ADOQ_WoprosTbl.RecordCount;
Randomize;
MassWprs[0] := random(RC)+1;
for I := 1 to ColWopr-1 do
 begin
 Flag := true;
 while Flag do
  begin
  MassWprs[I] := random(RC)+1;
  J := I;
  Flag := False;
  while J > 0 do
   begin
   if MassWprs[I] = MassWprs[J-1] then
    begin
    Flag := True;
    Break;
    end;
   Dec(J);
   end;
  end;
 end;

end;

function TBasic_Frm.OtwetInit(RF: Int64): Byte;
var
I,J, RC, RecNo : Cardinal;
Flag : Boolean;
begin
RC := DM.ADOQ_OtwetTbl.RecordCount;
RecNo := DM.ADOQ_OtwetTbl.RecNo;

for I := 1 to RC do
 begin
 DM.ADOQ_OtwetTbl.RecNo := I;
 if DM.ADOQ_OtwetTbl['id_Otwet'] = RF
  then Break;
 end;

MassOtwtw[0] := DM.ADOQ_OtwetTbl.RecNo;
Randomize;

for I := 1 to ColOtwet-1 do
 begin
 Flag := true;
 while Flag do
  begin
  MassOtwtw[I] := random(RC)+1;
  J := I;
  Flag := False;
  while J > 0 do
   begin
   if MassOtwtw[I] = MassOtwtw[J-1] then
    begin
    Flag := True;
    Break;
    end;
   Dec(J);
   end;
  end;
 end;

I := random(ColOtwet);
if I <> 0 then
 begin
 J := MassOtwtw[I];
 MassOtwtw[I] := MassOtwtw[0];
 MassOtwtw[0] := J;
 end;
Result := I;

Otwet_RG.Items.Clear;
for I := 0 to ColOtwet-1 do
 begin
 DM.ADOQ_OtwetTbl.RecNo := MassOtwtw[I];
 Otwet_RG.Items.Add(DM.ADOQ_OtwetTbl['Otwet']);
 end;
Otwet_RG.ItemIndex := -1;

DM.ADOQ_OtwetTbl.RecNo := RecNo;
end;

procedure TBasic_Frm.ZadatWopros(Num: Byte);
var
//wopr  : String;
TextHeigt, TextWidth, Ost : Integer;
begin
 DM.ADOQ_WoprosTbl.RecNo := MassWprs[Num];
 Lbl_Wopros.Caption := DM.ADOQ_WoprosTbl['Wopros'];
 TextWidth := Lbl_Wopros.Canvas.TextWidth(Lbl_Wopros.Caption);
 TextHeigt :=  TextWidth div (ScrollBox1.Width - 4) * 16;
 Ost :=  TextWidth mod (ScrollBox1.Width - 4);
 if Ost <> 0 then TextHeigt := TextHeigt + 16;

 Lbl_Wopros.Top := Round((ScrollBox1.Height - 4 - TextHeigt)/2);
 TimeOtwet := DM.ADOQ_WoprosTbl['Time'];
 Otwet := OtwetInit(DM.ADOQ_WoprosTbl['rf_Otwet']);
 Timer_Second.Enabled := True;

 if (TimeOtwet >= 10) then Pnl_TimePaint.Font.Color := clBlack;
 if ((TimeOtwet > 5) and (TimeOtwet < 10))then Pnl_TimePaint.Font.Color := clBlue;
 if (TimeOtwet < 5) then Pnl_TimePaint.Font.Color := clRed;
 Pnl_TimePaint.Caption := IntToStr(TimeOtwet);
end;

procedure TBasic_Frm.Timer_SecondTimer(Sender: TObject);
begin
 Dec(TimeOtwet);
 if ((TimeOtwet > 5) and (TimeOtwet < 10))then Pnl_TimePaint.Font.Color := clBlue;
 if (TimeOtwet < 5) then Pnl_TimePaint.Font.Color := clRed;
 if TimeOtwet = 0 then Btn_NextWoprClick(Self)
 else Pnl_TimePaint.Caption := IntToStr(TimeOtwet);
end;

procedure TBasic_Frm.Btn_NextWoprClick(Sender: TObject);
begin
Timer_Second.Enabled := False;
Pnl_TimePaint.Caption := '';
 if Otwet_RG.ItemIndex = Otwet
  then Inc(ColPrOtwet);
 StatBar.Panels[2].Text := 'Задано вопросов - ' + IntToStr(NumWopros + 1);
 StatBar.Panels[3].Text := 'Правильных ответов - ' + IntToStr(ColPrOtwet);
 Inc(NumWopros);
 if NumWopros < ColWopr then
  begin
  GrBx_Wopr.Caption := ' Вопрос № ' + IntToStr(NumWopros + 1) + ' из ' + IntToStr(ColWopr);
  StatBar.Panels[1].Text := 'Вопрос № ' + IntToStr(NumWopros + 1);

  ZadatWopros(NumWopros);
  end
 else Btn_StopTestClick(Self);

end;

procedure TBasic_Frm.Btn_StopTestClick(Sender: TObject);
var
Procent1 : Real;
Procent  : Byte;
DataT    : TDateTime;
Ocenka   : Byte;
begin
 ExitTest;
 Btn_NextWopr.Enabled := False;
 Btn_StopTest.Enabled := False;
 Procent1 := ColPrOtwet / ColWopr *100;
 Procent  := Round(Procent1);
 DataT := Date;
 Ocenka := Round(Procent/20);
 if Ocenka < 2 then Ocenka := 2;

 Label2.Caption := 'Оценка: ';
 Pnl_TimePaint.Caption := IntToStr(Ocenka);

 DM.ADOQ_TestTbl.Insert;
 DM.ADOQ_TestTbl['FIO'] := FIO;
 DM.ADOQ_TestTbl['Date'] := DataT;
 DM.ADOQ_TestTbl['Result'] := Ocenka;
 DM.ADOQ_TestTbl.Post;

end;

procedure TBasic_Frm.MM_NewTestClick(Sender: TObject);
begin
 ExitTest;
 MM_TestingClick(Self);
end;
procedure TBasic_Frm.ExitTest;
begin
if Timer_Second.Enabled then
 begin
 Timer_Second.Enabled := False;
 if Application.MessageBox('Вы преждевременно завершаете тест' + #13 + #10 + 'Сохранить результат?', 'Подтверждение', MB_OKCANCEL + MB_ICONEXCLAMATION) = 1
   then Btn_StopTestClick(Self);
 end;
end;

procedure TBasic_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ExitTest;
end;

procedure TBasic_Frm.FormConstrainedResize(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
MinWidth := 697;
MinHeight := 475;
MaxWidth := 697;
MaxHeight := 475;
end;

end.

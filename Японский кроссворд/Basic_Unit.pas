unit Basic_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ExtCtrls, Functions_Unit, IniFiles, ImgList,
  ComCtrls, Menus;

type

  TcPanel = class(TPanel)
 public
   property Canvas;
  end;


  TBasic_Frm = class(TForm)
    BasicPanel_Pnl: TPanel;
    Cross_Pnl: TPanel;
    Panel8: TPanel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    TopPoint_Img: TImage;
    LeftPoint_Img: TImage;
    TopCopy_Img: TImage;
    LeftCopy_Img: TImage;
    MainMenu1: TMainMenu;
    File_MM: TMenuItem;
    Open_MM: TMenuItem;
    SaveAs_MM: TMenuItem;
    Save_MM: TMenuItem;
    Exit_MM: TMenuItem;
    CrossWord_MM: TMenuItem;
    Create_MM: TMenuItem;
    Prover_MM: TMenuItem;
    Button1: TButton;
    Clear_MM: TMenuItem;
    Razgad_MM: TMenuItem;
    procedure FormCreate(Sender: TObject);

    procedure TopPanelMouseUp(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure TopPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LeftPanelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LeftPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ResPanelMouseUp(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure ResPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure Save_MMClick(Sender: TObject);
    procedure Open_MMClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SaveAs_MMClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TopCopy_ImgClick(Sender: TObject);
    procedure LeftCopy_ImgClick(Sender: TObject);
    procedure TopPoint_ImgClick(Sender: TObject);
    procedure LeftPoint_ImgClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Prover_MMClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Exit_MMClick(Sender: TObject);
    procedure Create_MMClick(Sender: TObject);
    procedure Clear_MMClick(Sender: TObject);
    procedure Razgad_MMClick(Sender: TObject);
  private
    { Private declarations }
    function RazgadFirst() : Boolean;
    function NullRow(RowNum : Integer) : Boolean;
  public
    { Public declarations }
    procedure CreateField();
    procedure RasmeshPaneley();
  end;

var
  Basic_Frm: TBasic_Frm;
  TopTask, LeftTask : TTaskField;
  Resultat : TResultField;
  Modifed : Boolean = false;

  CurrCol, CurrRow : Integer;
  Next : Boolean = false;
//  TopPanels, LeftPanels : array of array of TPanel;
//  ResultPanels          : array of array of TPanel;

// const
   KV : Integer = 17;

implementation

uses Create_Unit;

{$R *.dfm}

procedure TBasic_Frm.CreateField;
 var
 i, j : Integer;
 StartLeftTask_X,
 StartLeftTask_Y,
 StartTopTask_X,
 StartTopTask_Y//,
// StartResTask_X,
// StartResTask_Y
 : Integer;

  begin
  LeftPoint_Img.Parent := BasicPanel_Pnl;
  TopPoint_Img.Parent := BasicPanel_Pnl;
  BasicPanel_Pnl.Hide;
  i := 0;
  while i < TopTask.X do
    begin //while
    j := 0;
    while j < TopTask.Y do
      begin //while
      TopTask.TaskField[i][j].Cell.Destroy;
      TopTask.TaskField[i][j].Cell := Nil;
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  i := 0;
  while i < LeftTask.X do
    begin //while
    j := 0;
    while j < LeftTask.Y do
      begin //while
      LeftTask.TaskField[i][j].Cell.Destroy;
      LeftTask.TaskField[i][j].Cell := Nil;
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  i := 0;
  while i < Resultat.X do
    begin //while
    j := 0;
    while j < Resultat.Y do
      begin //while
      Resultat.ResultField[i][j].Cell.Destroy;
      Resultat.ResultField[i][j].Cell := Nil;
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  TopTask.X  := StrToInt(Create_Frm.TopX_Edit.Text);
  TopTask.Y  := StrToInt(Create_Frm.TopY_Edit.Text);
  LeftTask.X := StrToInt(Create_Frm.LeftX_Edit.Text);
  LeftTask.Y := StrToInt(Create_Frm.LeftY_Edit.Text);

  Cross_Pnl.Height := 5 + (KV + 1) * (TopTask.Y + LeftTask.Y) + 2*round(int((TopTask.Y + LeftTask.Y)/5));
  Cross_Pnl.Width  := 5 + (KV + 1) * (TopTask.X + LeftTask.X) + 2*round(int((TopTask.X + LeftTask.X)/5));

  BasicPanel_Pnl.Width := Cross_Pnl.Width;
  BasicPanel_Pnl.Height := Cross_Pnl.Height;

  Basic_Frm.ClientWidth  := BasicPanel_Pnl.Width  + 28;
  Basic_Frm.ClientHeight := BasicPanel_Pnl.Height + 28;

  Panel8.Height := 3 + (KV + 1) * (TopTask.Y) + 2*round(int(TopTask.Y/5));
  Panel8.Width  := 1 + (KV + 1) * (LeftTask.X) + 2*round(int(LeftTask.X/5));

  StartLeftTask_X := 0;
  StartLeftTask_Y := Panel8.Height + 2;
  StartTopTask_X  := Panel8.Width + 2;
  StartTopTask_Y  := 0;
//  StartResTask_X  := StartTopTask_X;
//  StartResTask_Y  := StartLeftTask_Y;

  SetLength(TopTask.TaskField, TopTask.X);
  i := 0;
  while i < TopTask.X do
    begin //while
    SetLength(TopTask.TaskField[i], TopTask.Y);
    j := 0;
    while j < TopTask.Y do
      begin //while
      TopTask.TaskField[i][j].Cell  := TPanel.Create(Cross_Pnl);
      TopTask.TaskField[i][j].Value := 0;

      with TopTask.TaskField[i][j].Cell do
        begin //with
        Parent := Cross_Pnl;
        Left := StartTopTask_X + 2 + i * (KV + 1) + 2*round(int(i/5));
        Top  := StartTopTask_Y + 3 + j * (KV + 1);
        Height := KV;
        Width := KV;
        Caption := '';
        ParentBackground := False;
        Color := clWhite;

        Tag := i * TopTask.Y + j;
      //  Caption := IntToStr(Tag);

        OnMouseUp := TopPanelMouseUp;
        OnMouseMove := TopPanelMouseMove;

        BevelInner := bvNone;
        BevelOuter := bvNone;
        end;  //with
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while



  SetLength(LeftTask.TaskField, LeftTask.X);
  i := 0;
  while i < LeftTask.X do
    begin //while
    SetLength(LeftTask.TaskField[i], LeftTask.Y);
    j := 0;
    while j < LeftTask.Y do
      begin //while
      LeftTask.TaskField[i][j].Cell  := TPanel.Create(Cross_Pnl);
      LeftTask.TaskField[i][j].Value := 0;

      with LeftTask.TaskField[i][j].Cell do
        begin //with
        Parent := Cross_Pnl;
        Left := StartLeftTask_X + 3 + i * (KV + 1);
        Top  := StartLeftTask_Y + 0 + j * (KV + 1) + 2*round(int(j/5));
        Height := KV;
        Width := KV;
        Caption := '';
        ParentBackground := False;
        Color := clWhite;
        BevelInner := bvNone;
        BevelOuter := bvNone;

        Tag := i * LeftTask.Y + j;
   ///    Caption := IntToStr(Tag);
        OnMouseUp := LeftPanelMouseUp;
        OnMouseMove := LeftPanelMouseMove;
        end;  //with
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while




  Resultat.X := TopTask.X;
  Resultat.Y := LeftTask.Y;
  SetLength(Resultat.ResultField, Resultat.X);
  i := 0;
  while i < TopTask.X do
    begin //while
    SetLength(Resultat.ResultField[i], LeftTask.Y);
    j := 0;
    while j < LeftTask.Y do
      begin //while
      Resultat.ResultField[i][j].Cell    := TPanel.Create(Cross_Pnl);
      Resultat.ResultField[i][j].Chekced := 0;

      with Resultat.ResultField[i][j].Cell do
        begin //with
        Parent := Cross_Pnl;
        Left := StartTopTask_X  + 2 + i * (KV + 1) + 2*round(int(i/5));
        Top  := StartLeftTask_Y + 0 + j * (KV + 1) + 2*round(int(j/5));
        Height := KV;
        Width := KV;
        Caption := '?';
        ParentBackground := False;

        OnMouseUp := ResPanelMouseUp;
        OnMouseMove := ResPanelMouseMove;
        BevelInner := bvNone;
        BevelOuter := bvNone;

        Tag := i * Resultat.Y + j;
  //      Caption := IntToStr(Tag);
        end;  //with
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  Panel8.Width  := Panel8.Width - 1;
  Panel8.Height := Panel8.Height- 1;
  BasicPanel_Pnl.Show;
  LeftCopy_Img.Show;
  TopCopy_Img.Show;
  TopCopy_Img.Left := BasicPanel_Pnl.Left + Resultat.ResultField[0][0].Cell.Left;
  LeftCopy_Img.Top := BasicPanel_Pnl.Top + Resultat.ResultField[0][0].Cell.Top;
  end;

procedure TBasic_Frm.FormCreate(Sender: TObject);
  begin
  Cross_Pnl.BevelOuter := bvNone;
  SaveDialog1.InitialDir := Application.ExeName;
  OpenDialog1.InitialDir := SaveDialog1.InitialDir;

  TopTask.X  := 0;
  TopTask.Y  := 0;
  LeftTask.X := 0;
  LeftTask.Y := 0;
  Resultat.X := 0;
  Resultat.Y := 0;


  LeftPoint_Img.Picture := nil;
  TopPoint_Img.Picture := nil;
  LeftCopy_Img.Picture := nil;
  TopCopy_Img.Picture := nil;

  ImageList1.Draw(TopPoint_Img.Canvas, 0, 0, 0, true);
  ImageList1.Draw(LeftPoint_Img.Canvas, 0, 0, 1, true);
  ImageList1.Draw(TopCopy_Img.Canvas, 0, 0, 1, true);
  ImageList1.Draw(LeftCopy_Img.Canvas, 0, 0, 0, true);

  end;

procedure TBasic_Frm.TopPanelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 Label
 FF;

 var
 s : String;

 T, i, j : Integer;

  begin
  Modifed := True;

  T := TPanel(Sender).Tag;
  i := T div TopTask.Y;
  j := T mod TopTask.Y;


  if Button = mbLeft then
     begin
     if TPanel(Sender).Caption = '' then
       begin //if
       GoTo FF;
       end;  //if


     TopTask.TaskField[i][j].Chekced := not(TopTask.TaskField[i][j].Chekced);

     if (TopTask.TaskField[i][j].Chekced) then
        TopTask.TaskField[i][j].Cell.Color := clRed
     else
        TopTask.TaskField[i][j].Cell.Color := clWhite;

     {  with TcPanel(Sender) do
        begin //with
        Canvas.Pen.Color := clRed;
        Canvas.Pen.Width := 0;
        Canvas.MoveTo(0, 0);
        Canvas.LineTo(Width, Height);
        Canvas.MoveTo(0, Height);
        Canvas.LineTo(Width, 0);
        end;  //with
        }
     end;  //mbRight

  if Button = mbRight then
     begin
     FF:;
     s := InputBox('Запрос', 'Введите значение этой ячейки', TPanel(Sender).Caption);
     if s <> '' then
       begin //if
       try
          TopTask.TaskField[i][j].Value := StrToInt(s);
          TopTask.TaskField[i][j].Cell.Caption := s;
          except
          end; //try
       end  //if
     else
       begin //else
       TopTask.TaskField[i][j].Value := 0;
       TopTask.TaskField[i][j].Cell.Caption := '';
       end;  //else
     if TopTask.TaskField[i][j].Value = 0 then
       begin //if
       TopTask.TaskField[i][j].Cell.Caption := '';
       end;  //if

    end;   //mbLeft

  end;

procedure TBasic_Frm.LeftPanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 label
 FF;
 var
 s : String;

 T, i, j : Integer;

  begin
  Modifed := True;

  T := TPanel(Sender).Tag;
  i := T div LeftTask.Y;
  j := T mod LeftTask.Y;

  if Button = mbLeft then
     begin
     if TPanel(Sender).Caption = '' then
       begin //if
       GoTo FF; // Переходим по метке
       end;  //if


     LeftTask.TaskField[i][j].Chekced := not (LeftTask.TaskField[i][j].Chekced);

     if (LeftTask.TaskField[i][j].Chekced) then
        LeftTask.TaskField[i][j].Cell.Color := clRed
     else
        LeftTask.TaskField[i][j].Cell.Color := clWhite;
     end;  //mbRight

  if Button = mbRight then
     begin
     FF: // Метка

     s := InputBox('Запрос', 'Введите значение этой ячейки', TPanel(Sender).Caption);
     if s <> '' then
       begin //if
       try
          LeftTask.TaskField[i][j].Value := StrToInt(s);
          LeftTask.TaskField[i][j].Cell.Caption := s;
          except
          end; //try
       end  //if
     else
       begin //else
       LeftTask.TaskField[i][j].Value := 0;
       LeftTask.TaskField[i][j].Cell.Caption := '';
       end;  //else
     if LeftTask.TaskField[i][j].Value = 0 then
       begin //if
       LeftTask.TaskField[i][j].Cell.Caption := '';
       end;  //if
    end;   //mbLeft


  end;

procedure TBasic_Frm.ResPanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var
// s : String;

 T, i, j : Integer;

  begin
  Modifed := True;
{  if Button = mbLeft then
     begin
     s := InputBox('Запрос', 'Введите значение этой ячейки', '');
     try
        if ((s = '') or (StrToInt(s) = 0)) then
           TPanel(Sender).Caption := ''
        else
           TPanel(Sender).Caption := s;
     except
     end; //try
    end;   //mbLeft
 }

  if Button = mbLeft then
     begin
     T := TPanel(Sender).Tag;
     j := T mod Resultat.Y;
     i := T div Resultat.Y;

     Resultat.ResultField[i][j].Chekced := (Resultat.ResultField[i][j].Chekced + 1) mod 3;

     case Resultat.ResultField[i][j].Chekced of
          0 : begin
              Resultat.ResultField[i][j].Cell.Caption := '?';
              Resultat.ResultField[i][j].Cell.Color := clBtnFace;
              end;
          1 : begin
              Resultat.ResultField[i][j].Cell.Color := cl3DDkShadow;
              Resultat.ResultField[i][j].Cell.Caption := '';
              end;
          2 : begin
              Resultat.ResultField[i][j].Cell.Caption := #149;
              Resultat.ResultField[i][j].Cell.Color := clBtnFace;
              end;
     end;  //case

     end;  //mbRight
  end;

procedure TBasic_Frm.Save_MMClick(Sender: TObject);
 var
 IniFile : TIniFile;
 j, i : Integer;
 s : String;
  begin
  if (SaveDialog1.FileName <> '') or SaveDialog1.Execute then
    begin //if
    if ExtractFileExt(SaveDialog1.FileName) <> '.jcw' then
      begin //if
      IniFile := TIniFile.Create(SaveDialog1.FileName + '.jcw');
      end  //if
    else
      begin //else
      IniFile := TIniFile.Create(SaveDialog1.FileName);
      end;  //else

    OpenDialog1.FileName := IniFile.FileName;

    IniFile.EraseSection('Top');
    IniFile.EraseSection('Left');
    IniFile.EraseSection('Resultat');


    IniFile.WriteInteger('Top', 'X', TopTask.X);
    IniFile.WriteInteger('Top', 'Y', TopTask.Y);

    i := 0;
    while i < TopTask.X do
       begin //while
       j := 0;
       while j < TopTask.Y do
          begin //while
          if (TopTask.TaskField[i][j].Cell.Caption <> '') then
             begin
             IniFile.WriteBool('Top',   IntToStr(i) + '-' + IntToStr(j) + ' Chek', TopTask.TaskField[i][j].Chekced);
             IniFile.WriteString('Top', IntToStr(i) + '-' + IntToStr(j) + ' Cap', TopTask.TaskField[i][j].Cell.Caption);
             end;
          Inc(j);
          end;  //while
       Inc(i);
    end;  //while

    IniFile.WriteInteger('Left', 'X', LeftTask.X);
    IniFile.WriteInteger('Left', 'Y', LeftTask.Y);

    i := 0;
    while i < LeftTask.X do
       begin //while
       j := 0;
       while j < LeftTask.Y do
          begin //while
          if (LeftTask.TaskField[i][j].Cell.Caption <> '') then
             begin
             IniFile.WriteBool('Left',   IntToStr(i) + '-' + IntToStr(j) + ' Chek', LeftTask.TaskField[i][j].Chekced);
             IniFile.WriteString('Left', IntToStr(i) + '-' + IntToStr(j) + ' Cap',  LeftTask.TaskField[i][j].Cell.Caption);
             end;
          Inc(j);
          end;  //while
       Inc(i);
    end;  //while


    i := 0;
    while i < Resultat.X do
       begin //while
       j := 0;
       while j < Resultat.Y do
          begin //while
          if Resultat.ResultField[i][j].Chekced > 0 then
            begin //if
            IniFile.WriteInteger('Resultat', IntToStr(i) + '-' + IntToStr(j) + ' Chek', Resultat.ResultField[i][j].Chekced);
            end;  //if
          Inc(j);
          end;  //while
       Inc(i);
    end;  //while

  IniFile.Free;
    end;  //if

  s := ExtractFileName(SaveDialog1.FileName);
  Delete(s, Length(s) - 3, 4);
  Caption := 'Японский кроссворд: ' + s;
  Modifed := False;
  end;

procedure TBasic_Frm.Open_MMClick(Sender: TObject);
 var
 IniFile : TIniFile;
 j, i : Integer;
 s : String;
  begin
  if OpenDialog1.Execute then
    begin //if
    SaveDialog1.FileName := OpenDialog1.FileName;

    IniFile := TIniFile.Create(OpenDialog1.FileName);

//    TopTask.X := IniFile.ReadInteger('Top', 'X', 0);
  //  TopTask.Y := IniFile.ReadInteger('Top', 'Y', 0);

    Create_Frm.TopX_Edit.Text := IntToStr(IniFile.ReadInteger('Top', 'X', 0));
    Create_Frm.TopY_Edit.Text := IntToStr(IniFile.ReadInteger('Top', 'Y', 0));

  //  LeftTask.X := IniFile.ReadInteger('Left', 'X', 0);
 //   LeftTask.Y := IniFile.ReadInteger('Left', 'Y', 0);

    Create_Frm.LeftX_Edit.Text := IntToStr(IniFile.ReadInteger('Left', 'X', 0));
    Create_Frm.LeftY_Edit.Text := IntToStr(IniFile.ReadInteger('Left', 'Y', 0));

    CreateField;

    i := 0;
    while i < TopTask.X do
       begin //while
       j := 0;
       while j < TopTask.Y do
          begin //while
          TopTask.TaskField[i][j].Chekced := IniFile.ReadBool('Top',   IntToStr(i) + '-' + IntToStr(j) + ' Chek', False);
          if  TopTask.TaskField[i][j].Chekced then
            begin //if
            TopTask.TaskField[i][j].Cell.Color := clRed;
            end;  //if

          TopTask.TaskField[i][j].Cell.Caption := IniFile.ReadString('Top', IntToStr(i) + '-' + IntToStr(j) + ' Cap', '');
          TopTask.TaskField[i][j].Value := IniFile.ReadInteger('Top', IntToStr(i) + '-' + IntToStr(j) + ' Cap', 0);
          Inc(j);
          end;  //while
       Inc(i);
    end;  //while

    LeftTask.X := IniFile.ReadInteger('Left', 'X', 0);
    LeftTask.Y := IniFile.ReadInteger('Left', 'Y', 0);

    i := 0;
    while i < LeftTask.X do
       begin //while
       j := 0;
       while j < LeftTask.Y do
          begin //while
          LeftTask.TaskField[i][j].Chekced := IniFile.ReadBool('Left',   IntToStr(i) + '-' + IntToStr(j) + ' Chek', False);
          if  LeftTask.TaskField[i][j].Chekced then
            begin //if
            LeftTask.TaskField[i][j].Cell.Color := clRed;
            end;  //if
          LeftTask.TaskField[i][j].Cell.Caption := IniFile.ReadString('Left', IntToStr(i) + '-' + IntToStr(j) + ' Cap',  '');
          LeftTask.TaskField[i][j].Value := IniFile.ReadInteger('Left', IntToStr(i) + '-' + IntToStr(j) + ' Cap',  0);
          Inc(j);
          end;  //while
       Inc(i);
    end;  //while


    Resultat.X := TopTask.X;
    Resultat.Y := LeftTask.Y;

    i := 0;
    while i < Resultat.X do
       begin //while
       j := 0;
       while j < Resultat.Y do
          begin //while
          Resultat.ResultField[i][j].Chekced := IniFile.ReadInteger('Resultat', IntToStr(i) + '-' + IntToStr(j) + ' Chek', 0);

          case Resultat.ResultField[i][j].Chekced of
               0 : begin
                   Resultat.ResultField[i][j].Cell.Caption := '?';
                   Resultat.ResultField[i][j].Cell.Color := clBtnFace;
                   end;
               1 : begin
                   Resultat.ResultField[i][j].Cell.Color := cl3DDkShadow;
                   Resultat.ResultField[i][j].Cell.Caption := '';
                   end;
               2 : begin
                   Resultat.ResultField[i][j].Cell.Caption := #149;
                   Resultat.ResultField[i][j].Cell.Color := clBtnFace;
                   end;
          end;  //case


          Inc(j);
          end;  //while
       Inc(i);
    end;  //while

  IniFile.Free;
    end;  //if
  s := ExtractFileName(OpenDialog1.FileName);
  Delete(s, Length(s) - 3, 4);
  Caption := 'Японский кроссворд: ' + s;
  end;

procedure TBasic_Frm.Button4Click(Sender: TObject);
begin
 ShowMessage(IntToStr(7 div 2));
end;

procedure TBasic_Frm.SaveAs_MMClick(Sender: TObject);
  begin
  SaveDialog1.FileName := '';
  Save_MMClick(Save_MM);
  end;

procedure TBasic_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
 var
 i : Integer;
  begin
  if Modifed then
    begin //if    ShowMessage(IntToStr(i));
    i := MessageBox(Application.Handle,
                    pChar('Кроссворд был изменен. Сохранить'),
                   'Вопрос',
                    36) ;
    if i = 6 then
      begin
      Save_MMClick(Save_MM);
      end;
    end;  //if
  end;

procedure TBasic_Frm.TopPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  begin
  CurrCol := TPanel(Sender).Tag div TopTask.Y;
  TopCopy_Img.Left := BasicPanel_Pnl.Left + TPanel(Sender).Left;
  LeftPoint_Img.Hide;
  TopPoint_Img.Hide;
  end;

procedure TBasic_Frm.LeftPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  begin
  CurrRow := TPanel(Sender).Tag mod LeftTask.Y;
  LeftCopy_Img.Top := BasicPanel_Pnl.Top + TPanel(Sender).Top;
  LeftPoint_Img.Hide;
  TopPoint_Img.Hide;
  end;

procedure TBasic_Frm.TopCopy_ImgClick(Sender: TObject);
 var
 j : Integer;
 s : String;
  begin
  if (CurrCol + 1) <= TopTask.X then
    begin //if
    s := '';
    j := 0;
    while j < TopTask.Y  do
      begin //while
      s := s + TopTask.TaskField[CurrCol + 1][j].Cell.Caption;
      Inc(J);
      end;  //while

    if s = '' then
      begin //if
      j := 0;
      while j < TopTask.Y  do
        begin //while
        TopTask.TaskField[CurrCol + 1][j].Cell.Caption := TopTask.TaskField[CurrCol][j].Cell.Caption;
        TopTask.TaskField[CurrCol + 1][j].Value := TopTask.TaskField[CurrCol][j].Value;
        Inc(J);
        end;  //while
      end;  //if
    end;  //if
  end;

procedure TBasic_Frm.LeftCopy_ImgClick(Sender: TObject);
 var
 i : Integer;
 s : String;
  begin
  if (CurrRow + 1) <= LeftTask.Y then
    begin //if
    s := '';
    i := 0;
    while i < LeftTask.X  do
      begin //while
      s := s + LeftTask.TaskField[i][CurrRow + 1].Cell.Caption;
      Inc(i);
      end;  //while

    if s = '' then
      begin //if
      i := 0;
      while i < LeftTask.X  do
        begin //while
        LeftTask.TaskField[i][CurrRow + 1].Cell.Caption := LeftTask.TaskField[i][CurrRow].Cell.Caption;
        LeftTask.TaskField[i][CurrRow + 1].Value := LeftTask.TaskField[i][CurrRow].Value;
        Inc(i);
        end;  //while
      end;  //if
    end;  //if
  end;

procedure TBasic_Frm.ResPanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  begin
  //
  CurrRow := TPanel(Sender).Tag mod Resultat.Y;
  CurrCol := TPanel(Sender).Tag div Resultat.Y;



  TopPoint_Img.Parent := TopTask.TaskField[CurrCol][TopTask.Y - 1].Cell;
  TopPoint_Img.Top := 0;
  TopPoint_Img.Left := 0;

  LeftPoint_Img.Parent := LeftTask.TaskField[LeftTask.X - 1][CurrRow].Cell;
  LeftPoint_Img.Top := 0;
  LeftPoint_Img.Left := 0;

  LeftPoint_Img.Show;
  TopPoint_Img.Show;

  end;

procedure TBasic_Frm.TopPoint_ImgClick(Sender: TObject);
 var
 j : Integer;
  begin
  j := 0;
  while j < Resultat.Y do
    begin //while
    if Resultat.ResultField[CurrCol][j].Chekced = 0 then
      begin //if
      Resultat.ResultField[CurrCol][j].Chekced := 2;
      Resultat.ResultField[CurrCol][j].Cell.Caption := #149;
      Resultat.ResultField[CurrCol][j].Cell.Color := clBtnFace;
      end;  //if
    Inc(j);
    end;  //while
  Modifed := True;
  end;

procedure TBasic_Frm.LeftPoint_ImgClick(Sender: TObject);
 var
 i : Integer;
  begin
  i := 0;
  while i < Resultat.X do
    begin //while
    if Resultat.ResultField[i][CurrRow].Chekced = 0 then
      begin //if
      Resultat.ResultField[i][CurrRow].Chekced := 2;
      Resultat.ResultField[i][CurrRow].Cell.Caption := #149;
      Resultat.ResultField[i][CurrRow].Cell.Color := clBtnFace;
      end;  //if
    Inc(i);
    end;  //while
  Modifed := True;
  end;

procedure TBasic_Frm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LeftPoint_Img.Hide;
  TopPoint_Img.Hide;
end;

procedure TBasic_Frm.Prover_MMClick(Sender: TObject);
 var
 i, j, SummTop, SummLeft : Integer;
  begin

//----------------------Проверка контрольной суммы заданий----------------------
  SummTop := 0;
  SummLeft := 0;
  i := 0;
  while i < TopTask.X do
    begin //while
    j := 0;
    while j < TopTask.Y do
      begin //while
      if  (TopTask.TaskField[i][j].Cell.Caption <> '') then
        begin //if
        SummTop := SummTop + TopTask.TaskField[i][j].Value;
        end;  //if
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  i := 0;
  while i < LeftTask.X do
    begin //while
    j := 0;
    while j < LeftTask.Y do
      begin //while
      if  (LeftTask.TaskField[i][j].Cell.Caption <> '') then
        begin //if
        SummLeft := SummLeft + LeftTask.TaskField[i][j].Value;
        end;  //if
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while
  if SummTop <> SummLeft then
    begin //if
    MessageBox(Application.Handle, pChar('Сумма слева и сверху не совпадают: ' + IntToStr(SummLeft) + ' и ' + IntToStr(SummTop) ), 'Ошибка', 16);
    Exit;
    end;  //if
//----------------------Проверка контрольной суммы заданий----------------------

//---------------- Проверка вертикальных столбцов заданий ----------------------
  i := 0;
  while i < TopTask.X do
    begin //while
    j := 0;
    SummTop := 0;
    while j < TopTask.Y do
      begin //while
      if  (TopTask.TaskField[i][j].Value > 0) then
        begin //if
        SummTop := SummTop + TopTask.TaskField[i][j].Value + 1;
        end;  //if
      Inc(j);
      end;  //while
    SummTop := SummTop - 1;
    if SummTop > Resultat.Y  then
      begin //if
      MessageBox(Application.Handle, pChar('Сумма задания столбца ' + IntToStr(i) + ' неверна'), 'Ошибка', 16);
      Exit;
      end;  //if

    Inc(i);
    end;  //while
//---------------- Проверка вертикальных столбцов заданий ----------------------

//---------------- Проверка горизонтальных столбцов заданий ----------------------
  j := 0;
  while j < LeftTask.Y do
    begin //while
    i := 0;
    SummLeft := 0;
    while i < LeftTask.X do
      begin //while
      if  (LeftTask.TaskField[i][j].Value > 0) then
        begin //if
        SummLeft := SummLeft + LeftTask.TaskField[i][j].Value + 1;
        end;  //if
      Inc(i);
      end;  //while
    SummLeft := SummLeft - 1;

    if SummLeft > Resultat.X  then
      begin //if
      MessageBox(Application.Handle, pChar('Сумма задания строки ' + IntToStr(j) + ' неверна'), 'Ошибка', 16);
      Exit;
      end;  //if

    Inc(j);
    end;  //while
//---------------- Проверка горизонтальных столбцов заданий ----------------------

  MessageBox(Application.Handle, pChar('Норма'), 'Сообщение', 0);
  end;

procedure TBasic_Frm.Button1Click(Sender: TObject);
var
i : Integer;
begin
i := 0;
while true do
  begin //while
MessageBox(Application.Handle, pchar(IntToStr(i)), 'qq', i);

  Inc(i);
  end;  //while

end;

procedure TBasic_Frm.RasmeshPaneley;
 var
 StartLeftTask_X,
 StartLeftTask_Y,
 StartTopTask_X,
 StartTopTask_Y,
 i, j : Integer;
  begin
  BasicPanel_Pnl.Hide;
  
  Cross_Pnl.Height := 5 + (KV + 1) * (TopTask.Y + LeftTask.Y) + 2*round(int((TopTask.Y + LeftTask.Y)/5));
  Cross_Pnl.Width  := 5 + (KV + 1) * (TopTask.X + LeftTask.X) + 2*round(int((TopTask.X + LeftTask.X)/5));

  BasicPanel_Pnl.Width := Cross_Pnl.Width;
  BasicPanel_Pnl.Height := Cross_Pnl.Height;

  Basic_Frm.ClientWidth  := BasicPanel_Pnl.Width  + 28;
  Basic_Frm.ClientHeight := BasicPanel_Pnl.Height + 28;

  Panel8.Height := 3 + (KV + 1) * (TopTask.Y) + 2*round(int(TopTask.Y/5));
  Panel8.Width  := 1 + (KV + 1) * (LeftTask.X) + 2*round(int(LeftTask.X/5));

  StartLeftTask_X := 0;
  StartLeftTask_Y := Panel8.Height;
  StartTopTask_X  := Panel8.Width;
  StartTopTask_Y  := 0;

  i := 0;
  while i < TopTask.X do
    begin //while
    j := 0;
    while j < TopTask.Y do
      begin //while
      with TopTask.TaskField[i][j].Cell do
        begin //with
        Left := StartTopTask_X + 2 + i * (KV + 1) + 2*round(int(i/5));
        Top  := StartTopTask_Y + 3 + j * (KV + 1);
        Height := KV;
        Width := KV;
        end;  //with
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while



  i := 0;
  while i < LeftTask.X do
    begin //while
    j := 0;
    while j < LeftTask.Y do
      begin //while
      with LeftTask.TaskField[i][j].Cell do
        begin //with
        Left := StartLeftTask_X + 3 + i * (KV + 1);
        Top  := StartLeftTask_Y + 0 + j * (KV + 1) + 2*round(int(j/5));
        Height := KV;
        Width := KV;
        end;  //with
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  i := 0;
  while i < TopTask.X do
    begin //while
    j := 0;
    while j < LeftTask.Y do
      begin //while
      with Resultat.ResultField[i][j].Cell do
        begin //with
        Left := StartTopTask_X  + 2 + i * (KV + 1) + 2*round(int(i/5));
        Top  := StartLeftTask_Y + 0 + j * (KV + 1) + 2*round(int(j/5));
        Height := KV;
        Width := KV;
        end;  //with
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  Panel8.Width  := Panel8.Width - 1;
  Panel8.Height := Panel8.Height- 1;
  BasicPanel_Pnl.Show;

  end;

procedure TBasic_Frm.Exit_MMClick(Sender: TObject);
  begin
  Close;
  end;

procedure TBasic_Frm.Create_MMClick(Sender: TObject);
  begin
  Create_Frm.ShowModal;
  end;

procedure TBasic_Frm.Clear_MMClick(Sender: TObject);
 var
 i, j : Integer;
  begin

  i := 0;
  while i < TopTask.X do
    begin //while
    j := 0;
    while j < TopTask.Y do
      begin //while
      TopTask.TaskField[i][j].Chekced := False;
      TopTask.TaskField[i][j].Cell.Color := clWhite;
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  i := 0;
  while i < LeftTask.X do
    begin //while
    j := 0;
    while j < LeftTask.Y do
      begin //while
      LeftTask.TaskField[i][j].Chekced := False;
      LeftTask.TaskField[i][j].Cell.Color := clWhite;
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while

  i := 0;
  while i < Resultat.X do
    begin //while
    j := 0;
    while j < Resultat.Y do
      begin //while
      Resultat.ResultField[i][j].Chekced := 0;
      Resultat.ResultField[i][j].Cell.Color := clBtnFace;
      Resultat.ResultField[i][j].Cell.Caption := '?';
      Inc(j);
      end;  //while
    Inc(i);
    end;  //while
  Modifed := True;  
  end;

procedure TBasic_Frm.Razgad_MMClick(Sender: TObject);
  begin
  //
  RazgadFirst;

  end;

function TBasic_Frm.RazgadFirst: Boolean;
 var
 CurrentRow, CurrentTaskNum, TekTask, CurrentCellNum, Ri : Integer;
 Row : array of integer;
 NeTo : Boolean;
  begin
  Result := False;
  //------------ Горизонталь ---------------------------------------------------
  SetLength(Row, Resultat.X);
  CurrentRow := 0;
  while CurrentRow < LeftTask.Y do
    begin //while
    Ri := 0;

    // очистка строки
    while Ri < Resultat.X do
      begin //while
      Row[Ri] := -1;
      Inc(Ri);
      end;  //while

    // пустая строка -----------------------------------------------------------
    if (NullRow(CurrentRow)) then
      begin //if
      Inc(CurrentRow);
      Continue; // Переходим на следующую строку
      end;  //if
    // пустая строка -----------------------------------------------------------

    // проход по строке задания-----------------------------------------------------

    // прямой проход -----------------------------------------------------------
    CurrentCellNum := 0;
    CurrentTaskNum := 0;
    // Ищем первый непустой
    while (CurrentTaskNum < LeftTask.X) do
      begin //while
      if LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value = 0 then
        begin //if
        Inc(CurrentTaskNum);
        Continue;
        end;  //if


      if LeftTask.TaskField[CurrentTaskNum][CurrentRow].Chekced then
        // Задание разгадано ===================================================
        begin //if
        // Ищем первую клетку разгаданного
        while (CurrentCellNum < Resultat.X) do
          begin //while
          if Resultat.ResultField[CurrentCellNum][CurrentRow].X = CurrentTaskNum then
            begin //if
            Break;
            end;  //if
          Inc(CurrentCellNum);
          end;  //while

        // Ищем первую клетку после разгаданного
        while (CurrentCellNum < Resultat.X) do
          begin //while
          if Resultat.ResultField[CurrentCellNum][CurrentRow].X <> CurrentTaskNum then
            begin //if
            Break;
            end;  //if
          Inc(CurrentCellNum);
          end;  //while
        Inc(CurrentCellNum);
        Inc(CurrentTaskNum);
        Continue;
        end   //if
        // Задание разгадано ===================================================
      else
        // Задание не разгадано ================================================
        begin //else
        NeTo := False;
        TekTask := LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value;
        // Раскладываем заначение
        while TekTask > 0 do
          begin //while
          // Текущее значение реальной ячейки
          case Resultat.ResultField[CurrentCellNum][CurrentRow].Chekced of
               0 : begin  // Не разгадано
                   if NeTo then // если предыдущая ячейка принадлежала не той
                     begin //if
                     NeTo := False;
                     Inc(CurrentCellNum);
                     TekTask := LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value;
                     Continue;    // переходим на следующую ячейку
                     end   //if
                   else
                     begin //else
                     Row[CurrentCellNum] := CurrentTaskNum;
                     Inc(CurrentCellNum);
                     end;  //else
                   end;
               1 : begin  // Разгадано
                   // если точка с этого задания, то
                   if Resultat.ResultField[CurrentCellNum][CurrentRow].X = CurrentTaskNum then
                     begin //if
                     Row[CurrentCellNum] := CurrentTaskNum;
                     end   //if
                   else
                     begin //else
                     NeTo := True;
                     Inc(CurrentCellNum);
                     TekTask := LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value;
                     Continue;    // переходим на следующую ячейку
                     end;  //else
                   end;
               2 : begin  // Пусто
                   NeTo := False;
                   Inc(CurrentCellNum);
                   TekTask := LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value;
                   Continue;    // переходим на следующую ячейку
                   end;
               end;  //case

          Dec(TekTask);
          end;  //while
        Inc(CurrentCellNum);
        end;  //else
        // Задание не разгадано ================================================

      Inc(CurrentTaskNum);
      end;  //while
    // прямой проход -----------------------------------------------------------

    // обратный проход -----------------------------------------------------------
    CurrentCellNum := Resultat.X - 1;
    CurrentTaskNum := LeftTask.X - 1;
    // Ищем первый непустой с конца
    while (CurrentTaskNum >= 0) do
      begin //while
      if LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value = 0 then
        begin //if
        Dec(CurrentTaskNum);
        Continue;
        end;  //if

      if LeftTask.TaskField[CurrentTaskNum][CurrentRow].Chekced then
        // Задание разгадано ===================================================
        begin //if
        // Ищем первую клетку разгаданного
        while (CurrentCellNum >= 0) do
          begin //while
          if Resultat.ResultField[CurrentCellNum][CurrentRow].X = CurrentTaskNum then
            begin //if
            Break;
            end;  //if
          Dec(CurrentCellNum);
          end;  //while

        // Ищем первую клетку после разгаданного
        while (CurrentCellNum < Resultat.X) do
          begin //while
          if Resultat.ResultField[CurrentCellNum][CurrentRow].X <> CurrentTaskNum then
            begin //if
            Break;
            end;  //if
          Dec(CurrentCellNum);
          end;  //while
        Dec(CurrentCellNum);
        Dec(CurrentTaskNum);
        Continue;
        end   //if
        // Задание разгадано ===================================================
      else
        // Задание не разгадано ================================================
        begin //else
//        NeTo := False;
        TekTask := LeftTask.TaskField[CurrentTaskNum][CurrentRow].Value;
        // Раскладываем заначение
        while TekTask > 0 do
          begin //while
          // Текущее значение прямого прохода
          if Row[CurrentCellNum] = CurrentTaskNum then
            begin //if
            Row[CurrentCellNum] := Row[CurrentCellNum] + 1000;
            Resultat.ResultField[CurrentCellNum][CurrentRow].X := CurrentTaskNum;
            Resultat.ResultField[CurrentCellNum][CurrentRow].Chekced := 1;
            Resultat.ResultField[CurrentCellNum][CurrentRow].Cell.Caption := '';
            Resultat.ResultField[CurrentCellNum][CurrentRow].Cell.Color := cl3DDkShadow;
            end   //if
          else
            begin //else

            end;  //else
          Dec(CurrentCellNum);
          Dec(TekTask);
          end;  //while
        Dec(CurrentCellNum);
        end;  //else
        // Задание не разгадано ================================================

      Dec(CurrentTaskNum);
      end;  //while
    Inc(CurrentRow);
    end;  //while
    // проход по строке задания-----------------------------------------------------
  //------------ Горизонталь ---------------------------------------------------
  end;

// Проверка и отработка пустой строки
function TBasic_Frm.NullRow(RowNum: Integer): Boolean;
 var
 i, Ti : Integer;
  begin
    Result := False;
    i := 0;
    Ti := 0;
    while i < LeftTask.X do
      begin //while
      Inc(Ti, LeftTask.TaskField[i][RowNum].Value);
      Inc(i);
      end;  //while


    if (Ti = 0) then
      begin //if
      i := 0;
      while i < Resultat.X do
        begin //while
        case Resultat.ResultField[i][RowNum].Chekced of
             0 : begin // нетронуто
                 Resultat.ResultField[i][RowNum].Chekced := 2;
                 Resultat.ResultField[i][RowNum].Cell.Caption := #149;
                 Resultat.ResultField[i][RowNum].Cell.Color := clBtnFace;
                 Modifed := True;
                 Result := True;
                 end;
             1 : begin // забито
                 ShowMessage('Error: ' + IntToStr(i) + '-' + IntToStr(RowNum));
                 end;
             2 : begin // пробел
                 end;
             end;  //case
        Inc(i);
        end;  //while
      end;  //if
  end;

end.

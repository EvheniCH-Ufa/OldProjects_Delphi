unit TableUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TTable_Frm = class(TForm)
    StringGrid1: TStringGrid;
    OkBttn: TButton;
    Label1: TLabel;
    CancelBttn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure OkBttnClick(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
  private
    { Private declarations }
    procedure EditingStrGR();


  public
    { Public declarations }
  end;

var
  Table_Frm: TTable_Frm;
  TableZamen : array[0..7,0..15] of Byte;
implementation

uses Math;

{$R *.dfm}

procedure TTable_Frm.EditingStrGR;
var
i,j : Byte;
begin
for i := 0 to 7 do
    for j := 0 to 15 do
        if TableZamen[i,j]< 10
           then StringGrid1.Cells[j+1,i+1] := IntToStr(TableZamen[i,j])
        else case TableZamen[i,j] of
               10: StringGrid1.Cells[j+1,i+1] := 'A';
               11: StringGrid1.Cells[j+1,i+1] := 'B';
               12: StringGrid1.Cells[j+1,i+1] := 'C';
               13: StringGrid1.Cells[j+1,i+1] := 'D';
               14: StringGrid1.Cells[j+1,i+1] := 'E';
               15: StringGrid1.Cells[j+1,i+1] := 'F';
             end;

end;

procedure TTable_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
var
f : Cardinal;
i : Byte;
begin
f :=0;
Randomize;
i := Random(1000) mod 6;
case i of
  0: F := AW_BLEND                    or AW_HIDE;
  1: F := AW_CENTER                   or AW_HIDE;
  2: F := AW_HOR_POSITIVE or AW_SLIDE or AW_HIDE;
  3: F := AW_HOR_NEGATIVE or AW_SLIDE or AW_HIDE;
  4: F := AW_VER_POSITIVE or AW_SLIDE or AW_HIDE;
  5: F := AW_VER_NEGATIVE or AW_SLIDE or AW_HIDE;
end;
AnimateWindow(Handle, 100, f);

end;

procedure TTable_Frm.FormCreate(Sender: TObject);
begin
StringGrid1.Hint := '       Вводятся цифры от 0 до 9,' + #13 + #10 +
                    '     латинские символы от A до F.'+ #13 + #10 +
                    'Не долее одного символа в ячейке.' ;
EditingStrGR;
end;

procedure TTable_Frm.OkBttnClick(Sender: TObject);
var
i,j : Byte;
Sim : Char;
TableZamenTMP : array[0..7,0..15] of Byte;
begin
for i := 0 to 7 do
    for j := 0 to 15 do
    begin
       try
       Sim := StringGrid1.Cells[j+1,i+1][1];
       except
       MessageDlg('                Ошибка,'+#13+#10+
          '       ячейка ['+IntToStr(i)+','+IntToStr(j)+'] пуста,'+ #13+#10+
                               'введите значение в ячейку!',
                                    mtError,[mbOK],0);
       Abort;
       Exit;
       end;

    case Sim of
     '0' : TableZamenTMP[i,j]:=0;
     '1' : TableZamenTMP[i,j]:=1;
     '2' : TableZamenTMP[i,j]:=2;
     '3' : TableZamenTMP[i,j]:=3;
     '4' : TableZamenTMP[i,j]:=4;
     '5' : TableZamenTMP[i,j]:=5;
     '6' : TableZamenTMP[i,j]:=6;
     '7' : TableZamenTMP[i,j]:=7;
     '8' : TableZamenTMP[i,j]:=8;
     '9' : TableZamenTMP[i,j]:=9;
     'A' : TableZamenTMP[i,j]:=10;
     'B' : TableZamenTMP[i,j]:=11;
     'C' : TableZamenTMP[i,j]:=12;
     'D' : TableZamenTMP[i,j]:=13;
     'E' : TableZamenTMP[i,j]:=14;
     'F' : TableZamenTMP[i,j]:=15;
     'a' : TableZamenTMP[i,j]:=10;
     'b' : TableZamenTMP[i,j]:=11;
     'c' : TableZamenTMP[i,j]:=12;
     'd' : TableZamenTMP[i,j]:=13;
     'e' : TableZamenTMP[i,j]:=14;
     'f' : TableZamenTMP[i,j]:=15;
     end;

    end;
for i := 0 to 7 do
    for j := 0 to 15 do
        TableZamen[i,j] := TableZamenTMP[i,j];
Close;
end;

procedure TTable_Frm.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
if Length(Value)>1
   then StringGrid1.Cells[ACol,ARow]:= copy(Value,1,1);
end;

end.

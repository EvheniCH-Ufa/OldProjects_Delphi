unit BasicUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  Str_8 = String[8];
  Str_4 = String[4];
  TBasic_Frm = class(TForm)
    MainMenu1: TMainMenu;
    FileMM: TMenuItem;
    OpenMM: TMenuItem;
    ExitMM: TMenuItem;
    N6: TMenuItem;
    CodingMM: TMenuItem;
    EncodingMM: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BeforeCodingMem: TMemo;
    AfterCodingMem: TMemo;
    AfterRecodingMem: TMemo;
    Label7: TLabel;
    ChBoxStatusStr: TCheckBox;
    ChBoxNullControl: TCheckBox;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpenFileMMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitMMClick(Sender: TObject);
    procedure OpenWindowMMClick(Sender: TObject);
    procedure CodingMMClick(Sender: TObject);
    procedure EncodingMMClick(Sender: TObject);
    procedure OpenMMClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFile();
    procedure Dopolnenie64bit();
    procedure PreobrazKey();

    function  Kodirowka64(Blok : Str_8) : Str_8;
    function  Kodirowka() : String;

    function  Str4ToCardinal(Str : Str_4): Cardinal;
    function  CardinalToStr4(Car : Cardinal): Str_4;

    function  Summ_mod_2_32(A,B : Cardinal) : Cardinal;
    function  Zamena(Char4 : Cardinal): Cardinal;
    function  Rol(Str : Cardinal): Cardinal;
    function  XOR_(Srol,L : Cardinal): Cardinal;





  public
    { Public declarations }
  end;

var
  Key256bit : String[32];
  Key128Char : String[128];
  Basic_Frm: TBasic_Frm;
  FlagZakodirowan  : Boolean;
  BeforeCodingStr  : String;
  AfterCodingStr   : String;
  AfterRecodingStr : String;
  dlinaTextFaila   : Integer;
  KolBloks_8_Char  : Integer;
  TableZamen       : Array[0..7,0..15] of Byte = (( 3, 5, 7, 9, 0, 8, 6, 4, 2, 1,15,10,12,14,13,11),
                                                  ( 1, 3, 5, 7, 9,11,13,15,14,12,10, 8, 6, 4, 2, 0),
                                                  (15,13,11, 9, 7, 5, 3, 1, 0, 2, 4, 6, 8,10,12,14),
                                                  ( 0, 2, 4, 6, 8,10,12,14,15,13,11, 9, 7, 5, 3, 1),
                                                  (14,12,10, 8, 6, 4, 2, 0, 1, 3, 5, 7, 9,11,13,15),
                                                  ( 0,15, 1,14, 2,13, 3,12, 4,11, 5,10, 6, 9, 7, 8),
                                                  ( 4,11, 5,10, 6, 9, 7, 8, 0,15, 1,14, 2,13, 3,12),
                                                  (11,14,13,12,10,15, 1, 2, 4, 6, 8, 0, 9, 7, 5, 3));

implementation

uses KeyUnit, TableUnit;

{$R *.dfm}

procedure TBasic_Frm.Dopolnenie64bit();
var
Krat : Byte;
i : Byte;
s : String[7];
begin
s := '';
dlinaTextFaila := Length(BeforeCodingStr);
Krat := dlinaTextFaila mod 8;
if Krat <> 0
   then begin
        for i := 0 to 8-Krat-2 do
            s := s + '.';
        BeforeCodingStr := BeforeCodingStr + s + IntToStr(8-Krat-1);
        end;
dlinaTextFaila := Length(BeforeCodingStr);
KolBloks_8_Char := dlinaTextFaila div 8;
end;

procedure TBasic_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TBasic_Frm.LoadFile;
var
Pathc : String;
FailName : String;
begin
GetDir(0,Pathc);
OpenDialog1.InitialDir := Pathc;
if OpenDialog1.Execute
   then FailName := OpenDialog1.FileName
   else Exit;

BeforeCodingMem.Lines.LoadFromFile(FailName);
BeforeCodingStr := BeforeCodingMem.Text;
end;

procedure TBasic_Frm.OpenFileMMClick(Sender: TObject);
begin
LoadFile;
Dopolnenie64bit;
end;

function TBasic_Frm.Kodirowka64(Blok: Str_8): Str_8;
var
sL,sR  : String[4];
sKey4 : String[4];
Smod : Cardinal;
Szam : Cardinal;
R,L  : Cardinal;
Key4 : Cardinal;
Srol : Cardinal;
Sxor : Cardinal;
I : Byte;

begin
sL := Copy(Blok,1,4);
sR := Copy(Blok,5,4);
R  := Str4ToCardinal(sR);
L  := Str4ToCardinal(sL);

if FlagZakodirowan
   then for i := 0 to 31 do
            begin
            sKey4 := Copy(Key128Char,(i)*4+1,4);
            Key4  := Str4ToCardinal(sKey4);
            Smod := Summ_mod_2_32(L, Key4);
            Szam := Zamena(Smod);
            Srol := Rol(Szam);
            Sxor := XOR_(Srol, R);
            R    := L;
            L    := Sxor;
            end
   else for i := 0 to 31 do
            begin
            sKey4 := Copy(Key128Char,(31-i)*4+1,4);
            Key4  := Str4ToCardinal(sKey4);

            Smod := Summ_mod_2_32(R, Key4);
            Szam := Zamena(Smod);
            Srol := Rol(Szam);
            Sxor := XOR_(Srol, L);
            L    := R;
            R    := Sxor;

            end;

sR := CardinalToStr4(R);
sL := CardinalToStr4(L);

Result := sL + sR;
end;

function TBasic_Frm.Summ_mod_2_32(A, B: Cardinal): Cardinal;
begin
Result := A + B;
end;

function TBasic_Frm.Zamena(Char4: Cardinal): Cardinal;
var
tmp : Str_4;
i, AH,AL,sCod : Byte;
sChar4 : Str_4;
begin
tmp := '';
sChar4 := CardinalToStr4(Char4);

for i := 0 to 3 do
   begin
   sCod := ord(sChar4[3-i+1]);
   AH   := sCod div 16;
   AL   := sCod mod 16;

   AH   := TableZamen[i*2+1 ,AH];
   AL   := TableZamen[i*2,AL];

   sCod := AH * 16 + AL;

   tmp  := Chr(sCod) + tmp;
   end;

Result := Str4ToCardinal(tmp);
end;

function TBasic_Frm.Rol(Str: Cardinal): Cardinal;
begin
Result := 0;
   asm
   push EAX;

   mov  EAX, STR;
   rol  EAX, 11;
   mov  Result, EAX;

   pop  EAX;
   end

end;

function TBasic_Frm.XOR_(Srol, L: Cardinal): Cardinal;
begin
  Result := Srol xor L;
end;

procedure TBasic_Frm.FormCreate(Sender: TObject);
begin
FlagZakodirowan := True;
Key256bit := 'as28zw37q8397342ui238e2twqm2ewp1';
PreobrazKey;
end;

function TBasic_Frm.Str4ToCardinal(Str: Str_4): Cardinal;
var
i, dl : Byte;
begin
Result := 0;
dl := length(Str);
for i := 0 to (dl-1) do
    Result := Result*256 + ord(Str[3-i+1]);
end;

function TBasic_Frm.CardinalToStr4(Car: Cardinal): Str_4;
begin
Result := '';
// 1 символ
Result := Chr(Car div 16777216);
Car    :=    (Car mod 16777216);

// 2 символ
Result := Chr(Car div 65536) + Result;
Car    := (Car mod 65536);

// 3 символ
Result := Chr(Car div 256) + Result;
Car    := (Car mod 256);

// 4 символ
Result := Chr(Car)+Result;
end;

procedure TBasic_Frm.ExitMMClick(Sender: TObject);
begin
Close;
end;

procedure TBasic_Frm.OpenWindowMMClick(Sender: TObject);
begin
BeforeCodingStr := BeforeCodingMem.Text;
Dopolnenie64bit;
end;

function TBasic_Frm.Kodirowka(): String;
var
i : Cardinal;
s : Str_8;
begin
Result := '';
for i := 0 to KolBloks_8_Char-1 do
    begin
    s := Copy(BeforeCodingStr,i*8+1,8);
    Result := Result + Kodirowka64(s)
    end;
end;

procedure TBasic_Frm.CodingMMClick(Sender: TObject);
var
i, Dl,aDl : Cardinal;
aChar0Pos : array of Cardinal;
StrWosst : String;
begin
aDl := 0;
StrWosst := '';

BeforeCodingStr :=BeforeCodingMem.Text;
if BeforeCodingStr = ''
   then begin
        MessageDlg('Нечего шифровать!!!',mtError,[mbOK],0);
        Exit;
        end;
Dopolnenie64bit;
FlagZakodirowan :=True;
AfterCodingStr := Kodirowka;

if ChBoxNullControl.Checked then
    begin
    Dl := Length(AfterCodingStr);
    for i := 0 to Dl-1 do
        if AfterCodingStr[i+1]=#0
           then begin
                Delete(AfterCodingStr,i+1,1);
                Insert(#1,AfterCodingStr,I+1);
                Inc(aDl);
                SetLength(aChar0Pos, aDl);
                aChar0Pos[aDl-1] := i;
                end;
    if Length(aChar0Pos) <> 0
    then begin
         for i := 0 to Length(aChar0Pos)-1 do
             StrWosst := StrWosst + IntToStr(aChar0Pos[i]) + ',';
         AfterCodingStr := AfterCodingStr + #13 + #10 + StrWosst;
         end;
    end;
AfterCodingMem.Text := AfterCodingStr;
end;

procedure TBasic_Frm.EncodingMMClick(Sender: TObject);
var
dl, DelEnd : Cardinal;
Del : Byte;

Poz : Cardinal;
Str, NumbStr : String;
k : Integer;
flag : Boolean;
aChar0Pos : array of Cardinal;
begin
if AfterCodingMem.Text = ''
   then begin
        MessageDlg('Нечего расшифровывать!!!',mtError,[mbOK],0);
        Exit;
        end;
flag := False;
k := AfterCodingMem.Lines.Count-1;
Str := AfterCodingMem.Lines.Strings[K];
dl := Length(Str);
if Str[dl]=',' then
   try
      StrToInt(Str[dl-1]);
      flag := true;
      Str := #13 + #10 + Str;
      except
      end;
dl := Length(Str);
if flag
   then begin
        NumbStr := '';
        for K := 2 to dl-1 do
            if Str[k+1] <> ','
               then NumbStr := NumbStr + Str[k+1]
               else begin
                    SetLength(aChar0Pos, Length(aChar0Pos)+1);
                    aChar0Pos[Length(aChar0Pos)-1] := StrToInt(NumbStr);
                    NumbStr := '';
                    end;
        BeforeCodingStr := '';
        BeforeCodingStr := AfterCodingMem.Text;
        Poz := pos(Str,BeforeCodingStr);
        if (Poz + Length(Str)-1)= length(BeforeCodingStr)
           then Delete(BeforeCodingStr,Poz,Length(Str));
        {if AfterCodingMem.Lines.Count > 0
           then BeforeCodingStr := AfterCodingMem.Lines.Strings[0];
        for k := 1 to AfterCodingMem.Lines.Count-2 do
            begin
            BeforeCodingStr := BeforeCodingStr + #13 + #10 +
                               AfterCodingMem.Lines.Strings[k];
            end; }

        for k := 0 to Length(aChar0Pos)-1 do
            begin
            try
               Delete(BeforeCodingStr,aChar0Pos[k]+1,1);
               Insert(#0,BeforeCodingStr,aChar0Pos[k]+1);
               except
               end;
            end;
        end
   else BeforeCodingStr := AfterCodingMem.Text;
if BeforeCodingStr = ''
   then begin
        MessageDlg('Нечего расшифровывать!!!',mtError,[mbOK],0);
        Exit;
        end;
FlagZakodirowan :=False;
AfterRecodingStr := Kodirowka;
dl := length(AfterRecodingStr);
if (AfterRecodingStr[dl-1]='.') and (ChBoxStatusStr.Checked)
   then try
        Del := StrToInt(AfterRecodingStr[dl]);
        DelEnd := dl - Del-1;
        AfterRecodingStr := Copy(AfterRecodingStr,1,DelEnd);
        except
        end;
AfterRecodingMem.Text := AfterRecodingStr;
end;

procedure TBasic_Frm.OpenMMClick(Sender: TObject);
begin
LoadFile;
Dopolnenie64bit;
AfterCodingMem.Text := '';
AfterRecodingMem.Text := '';
end;
procedure TBasic_Frm.PreobrazKey;
var
i : Byte;
begin
Key128Char := '';
Key128Char := Key256bit + Key256bit + Key256bit;
for i := 0 to 7 do
    Key128Char := Key128Char + Copy(Key256bit,(7-i)*4+1,4);
 Basic_Frm.Label7.Caption := Copy(Key128Char,1,32);
end;

procedure TBasic_Frm.N1Click(Sender: TObject);
var
s : String;
i,dl,poz : Integer;
begin
s := OpenDialog1.FileName;
dl := Length(s);
for i := 1 to dl do
    begin
    if s[dl-i+1]='.'
       then begin
            poz := dl-i+1;
            Break;
            end;
    end;
insert(' ПОСЛЕ КОДИРОВКИ',s,poz);
AfterCodingMem.Lines.SaveToFile(s);
end;

procedure TBasic_Frm.N2Click(Sender: TObject);
var
Pathc : String;
FailName : String;
begin
GetDir(0,Pathc);
SaveDialog1.InitialDir := Pathc;
if SaveDialog1.Execute
   then FailName := SaveDialog1.FileName
   else Exit;
AfterCodingMem.Lines.SaveToFile(FailName+'.txt');
end;

end.

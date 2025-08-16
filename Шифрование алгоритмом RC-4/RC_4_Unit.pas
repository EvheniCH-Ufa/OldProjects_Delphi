unit RC_4_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Menus;

type
  TForm1 = class(TForm)
    CodingBttn: TButton;
    MemBeforeCoding: TMemo;
    MemAfterRecoding: TMemo;
    MemAfterCoding: TMemo;
    RecodingBttn: TButton;
    Label4: TLabel;
    KeyMem: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure CodingBttnClick(Sender: TObject);
    procedure RecodingBttnClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Perestanowka(i,j : Byte);
    function  Codirowka(Codire : Boolean) : String;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Sblok : array [0..255] of Byte;
  aKey  : array [0..255] of Byte;
  BeforeCoding : String;
  AfterCodBeforeRecod : String;
  AfterRecoding : String;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
i,j : Byte;
key : String;

Patch : String;
begin
GetDir(0,Patch);
OpenDialog1.InitialDir := Patch;
SaveDialog1.InitialDir := Patch;

for i := 0 to 255 do
    Sblok[i]:= i;

key := '–абота с данными с использованием многозвенной архитектуры (технологи€';
key := key + ' MIDAS) поддерживаетс€ в €зыке программировани€ Delphi, начина€ с третьей версии. ¬ Delphi4 был добавлен р€д компонентов, которые поддерживали различные протоколы обмена данными с удален';
KeyMem.Text := key;
for i := 0 to 255 do
    aKey[i] := ord(key[i+1]);

j := 0;
for i := 0 to 255 do
    begin
    j := (j + sblok[i] + akey[i])mod 256;
    Perestanowka(i,j);
    end;
end;

procedure TForm1.Perestanowka(i, j: Byte);
var
tmp : Byte;
begin
tmp := Sblok[i];
Sblok[i] := sblok[j];
Sblok[j] := tmp;
end;

procedure TForm1.CodingBttnClick(Sender: TObject);
var
dl,i  : Cardinal;
strPoz : String;
begin
if MemBeforeCoding.Text = ''
   then Exit;
  BeforeCoding := MemBeforeCoding.Text;
  AfterCodBeforeRecod := Codirowka(True);

  strPoz := '';
  dl := Length(AfterCodBeforeRecod);
  for i := 0 to dl-1 do
      begin
      if AfterCodBeforeRecod[i+1] = #0
         then begin
              Delete(AfterCodBeforeRecod,i+1,1);
              Insert(#1,AfterCodBeforeRecod,i+1);
              strPoz := strPoz + IntToStr(I+1) + ',';
              end;
      end;
if strPoz <> ''
   then AfterCodBeforeRecod := AfterCodBeforeRecod + #13 + #10 + strPoz+'ControlString';





  MemAfterCoding.Text := AfterCodBeforeRecod;
end;

function  TForm1.Codirowka(Codire : Boolean) : String;
var
Dlina,i : Integer;
s : String;
strByte, keyByte, resByte : Byte;
begin
Result := '';

if Codire
   then s := BeforeCoding
   else s := AfterCodBeforeRecod;

Dlina := Length(s);

if Dlina = 0
   then Exit;

for i := 0 to Dlina-1 do
    begin
    strByte := ord(s[i+1]);
    keyByte := aKey[i mod 255];
    resByte := keyByte XOR strByte;
    Result := Result + Chr(resByte);
    end;
end;

procedure TForm1.RecodingBttnClick(Sender: TObject);
var
Dl,i : Cardinal;
s : String;
Num : String;
begin
if MemAfterCoding.Text = ''
   then Exit;

AfterCodBeforeRecod := MemAfterCoding.Text;
Dl := Length(AfterCodBeforeRecod);
if Copy(AfterCodBeforeRecod,Dl-12,13)='ControlString'
   then begin
        i := Dl-14;
        while I >=1 do
              begin
              if (AfterCodBeforeRecod[i]=#10)and(AfterCodBeforeRecod[i-1]=#13)
                 then Break;
              dec(i);
              end;
        s := Copy(AfterCodBeforeRecod,i+1,Dl-i-13);
        AfterCodBeforeRecod := Copy(AfterCodBeforeRecod,1,i-2);
        end;
Dl := Length(s);
if Dl > 0
   then begin
        Num := '';
        for i := 0 to Dl-1 do
            begin
            if s[i+1] <> ','
               then Num := Num + s[i+1]
               else begin
                    Delete(AfterCodBeforeRecod,StrToInt(Num),1);
                    Insert(#0, AfterCodBeforeRecod, StrToInt(Num));
                    Num :='';
                    end;
            end;
        end;
  AfterRecoding := Codirowka(False);
  MemAfterRecoding.Text := AfterRecoding;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if OpenDialog1.Execute
   then MemBeforeCoding.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if SaveDialog1.Execute
   then MemAfterCoding.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Close;
end;

end.

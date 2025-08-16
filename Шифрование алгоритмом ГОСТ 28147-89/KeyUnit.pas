unit KeyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TKey_Frm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    OKBttn: TButton;
    CancelBttn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKBttnClick(Sender: TObject);
    procedure CancelBttnClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Key_Frm: TKey_Frm;
implementation

uses BasicUnit;

{$R *.dfm}

procedure TKey_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
var
f : Cardinal;
i : Byte;
begin
OKBttnClick(Self);
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

procedure TKey_Frm.OKBttnClick(Sender: TObject);
var
K : String[32];
begin
OKBttn.ModalResult := mrNone;
k := Edit1.Text;
if Length(K)<> 32
   then begin
        MessageDlg('Ошибка,'+#13+#10+'неверная длина КЛЮЧА!',mtError,[mbOK],0);
        Abort;
        end
   else begin
        OKBttn.ModalResult := mrOk;
        Close;
        Key256bit := K;

        end;
end;

procedure TKey_Frm.CancelBttnClick(Sender: TObject);
begin
Edit1.Text := Key256bit;
end;


end.

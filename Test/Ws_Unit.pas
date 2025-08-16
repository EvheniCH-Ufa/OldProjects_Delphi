unit Ws_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TWs_Frm = class(TForm)
    Panel1: TPanel;
    Pass_Ed: TEdit;
    PasOk_Btn: TButton;
    PasCancel_Btn: TButton;
    Label1: TLabel;
    procedure Pass_EdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ws_Frm: TWs_Frm;

implementation

{$R *.dfm}

procedure TWs_Frm.Pass_EdKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13
  then begin
       Close;
       ModalResult := 1;
       end;
 if Key = #27
  then begin
       Close;
       ModalResult := 2;
       end;
end;

procedure TWs_Frm.FormShow(Sender: TObject);
begin
Pass_Ed.SetFocus;
end;

end.

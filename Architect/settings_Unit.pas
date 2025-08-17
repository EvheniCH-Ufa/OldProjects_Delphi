unit Settings_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Spin;

type
  TSettings_Frm = class(TForm)
    Panel3: TPanel;
    Ok_Btn: TButton;
    Cancel_Btn: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    PrBackgr_ClrBx: TColorBox;
    PrGotov_ClrBx: TColorBox;
    Label3: TLabel;
    PrNegotov_ClrBx: TColorBox;
    Aply_Btn: TButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TaskBackgr_ClrBx: TColorBox;
    TaskGotov_ClrBx: TColorBox;
    TaskNegotov_ClrBx: TColorBox;
    Label7: TLabel;
    PrNeVSrok_ClrBx: TColorBox;
    Label8: TLabel;
    TaskNeVSrok_ClrBx: TColorBox;
    procedure Aply_BtnClick(Sender: TObject);
    procedure Ok_BtnClick(Sender: TObject);
    procedure Cancel_BtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function Aply(): Boolean;
  end;

var
  Settings_Frm: TSettings_Frm;

implementation

uses Basic_Unit, Types_Unit;

{$R *.dfm}

function TSettings_Frm.Aply: Boolean;
  begin //function
  WriteColors;
  Basic_Frm.Projects_DBGrd.Color := PrBackgr_ClrBx.Selected;
  Basic_Frm.Tasks_DBGrid.Color   := TaskBackgr_ClrBx.Selected;
  Basic_Frm.Projects_DBGrd.Invalidate;
  Basic_Frm.Tasks_DBGrid.Invalidate;
  Result := True;
  end; //function

procedure TSettings_Frm.Aply_BtnClick(Sender: TObject);
  begin

  Aply;
  end;

procedure TSettings_Frm.Ok_BtnClick(Sender: TObject);
  begin
  if (Aply) then
    Close;
  end;

procedure TSettings_Frm.Cancel_BtnClick(Sender: TObject);
  begin
  Hide;
  end;

procedure TSettings_Frm.FormCreate(Sender: TObject);
  begin
  ReadColors;
  Aply;
  Color := clWhite;
  end;

end.

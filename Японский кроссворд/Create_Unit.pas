unit Create_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TCreate_Frm = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    TopX_Edit: TEdit;
    TopY_Edit: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    LeftX_Edit: TEdit;
    LeftY_Edit: TEdit;
    Label5: TLabel;
    SizeCell_Ed: TEdit;
    UpDown1: TUpDown;
    TopX_UpDn: TUpDown;
    TopY_UpDn: TUpDown;
    LeftX_UpDn: TUpDown;
    LeftY_UpDn: TUpDown;
    Create_Btn: TButton;
    Cancel_Btn: TButton;
    Ok_Btn: TButton;
    procedure Create_BtnClick(Sender: TObject);
    procedure Ok_BtnClick(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Create_Frm: TCreate_Frm;

implementation

uses Basic_Unit;

{$R *.dfm}

procedure TCreate_Frm.Create_BtnClick(Sender: TObject);
  begin
  Basic_Frm.CreateField;
  end;

procedure TCreate_Frm.Ok_BtnClick(Sender: TObject);
  begin
  Close;
  Basic_Frm.CreateField;
  end;

procedure TCreate_Frm.UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
  begin
  KV := Create_Frm.UpDown1.Position;
  Basic_Frm.RasmeshPaneley;
  end;

end.

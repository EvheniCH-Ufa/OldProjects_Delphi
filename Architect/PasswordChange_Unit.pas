unit PasswordChange_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPassword_Frm = class(TForm)
    NewPassDouble_Edit: TEdit;
    NewPass_Edit: TEdit;
    CurrentPass_Edit: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Ok_Bttn: TButton;
    Cancel_Bttn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Ok_BttnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Password_Frm: TPassword_Frm;

implementation

uses Basic_Unit, Data_Unit;

{$R *.dfm}

procedure TPassword_Frm.FormCreate(Sender: TObject);
  begin
  Color := clWhite;
  end;

procedure TPassword_Frm.Ok_BttnClick(Sender: TObject);
 var
 NewPass : String[255];
  begin
  if CurrentPass_Edit.Text <> CurrentUser.Password then
    begin //if
    MessageBox(Application.Handle, pChar('Введен неверный пароль!'), 'Ошибка', 16);
    end   //if
  else
    begin //else
    NewPass := NewPass_Edit.Text;
    if NewPass <> NewPassDouble_Edit.Text then
      begin //if
      MessageBox(Application.Handle, pChar('Новый пароль и его подтверждение не совпадают!'), 'Ошибка', 16);
      end   //if
    else
      begin //else
      DM.Users_Table.Filter := 'Id_Workman = ' + IntToStr(CurrentUser.Id);
      DM.Users_Table.Filtered := true;
      DM.Users_Table.Edit;
      DM.Users_Table['Password'] := NewPass;
      DM.Users_Table.Post;
      CurrentUser.Password := NewPass;
      DM.Users_Table.Filtered := false;
      Close;
      end;  //else

    end;  //else

  end;

procedure TPassword_Frm.FormShow(Sender: TObject);
  begin
  CurrentPass_Edit.Text := '';
  NewPassDouble_Edit.Text := '';
  NewPass_Edit.Text := '';
  end;

end.

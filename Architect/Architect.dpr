program Architect;

uses
  Forms, SysUtils, Windows,
  Identification_Unit in 'Identification_Unit.pas' {Identification_Frm},
  Data_Unit in 'Data_Unit.pas' {DM: TDataModule},
  Types_Unit in 'Types_Unit.pas',
  Basic_Unit in 'Basic_Unit.pas' {Basic_Frm},
  NewProject_Unit in 'NewProject_Unit.pas' {Project_Frm},
  Admin_Unit in 'Admin_Unit.pas' {Admin_Frm},
  NewTask_Unit in 'NewTask_Unit.pas' {Task_Frm},
  Copy_Unit in 'Copy_Unit.pas' {Copy_Form},
  Settings_Unit in 'settings_Unit.pas' {Settings_Frm},
  PasswordChange_Unit in 'PasswordChange_Unit.pas' {Password_Frm};

{$R *.res}
var
  Res : Integer;

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TBasic_Frm, Basic_Frm);
  Application.CreateForm(TProject_Frm, Project_Frm);
  Application.CreateForm(TIdentification_Frm, Identification_Frm);
  Application.CreateForm(TAdmin_Frm, Admin_Frm);
  Application.CreateForm(TTask_Frm, Task_Frm);
  Application.CreateForm(TCopy_Form, Copy_Form);
  Application.CreateForm(TSettings_Frm, Settings_Frm);
  Application.CreateForm(TPassword_Frm, Password_Frm);
  Res := Identification_Frm.ShowModal;
  if (Res <> 1) then
    Exit;
  if Now > 39599 then
//  if Now > 39590 then
     begin
 //    MessageBox(Application.Handle, pChar('Абсолютно неизвестная ошибка'), 'Error', 16);
   //  Exit;
     end;
  Identification_Frm.Position := poMainFormCenter;
  Application.Run;
end.

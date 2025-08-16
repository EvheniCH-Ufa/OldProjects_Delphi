program Testing;

uses
  Forms,
  Basic_Unit in 'Basic_Unit.pas' {Basic_Frm},
  DM_Unit in 'DM_Unit.pas' {DM: TDataModule},
  Ws_Unit in 'Ws_Unit.pas' {Ws_Frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Загадки';
  Application.CreateForm(TBasic_Frm, Basic_Frm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TWs_Frm, Ws_Frm);
  Application.Run;
end.

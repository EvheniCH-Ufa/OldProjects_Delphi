program JapaneseCrossword;

uses
  Forms,
  Basic_Unit in 'Basic_Unit.pas' {Basic_Frm},
  Functions_Unit in 'Functions_Unit.pas',
  Create_Unit in 'Create_Unit.pas' {Create_Frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'японский кроссворд';
  Application.CreateForm(TBasic_Frm, Basic_Frm);
  Application.CreateForm(TCreate_Frm, Create_Frm);
  Application.Run;
end.

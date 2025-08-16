program Project1;

uses
  Forms,
  BasicUnit in 'BasicUnit.pas' {Basic_Frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Øèôð - ÃÎÑÒ';
  Application.CreateForm(TBasic_Frm, Basic_Frm);
  Application.Run;
end.

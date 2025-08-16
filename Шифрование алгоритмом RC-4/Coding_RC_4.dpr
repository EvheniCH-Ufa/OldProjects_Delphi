program Coding_RC_4;

uses
  Forms,
  RC_4_Unit in 'RC_4_Unit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Алгоритм RC-4';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

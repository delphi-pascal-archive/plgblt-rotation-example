program PlgBltExample;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  UParallelogramme in 'UParallelogramme.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rotation avec PlgBlt';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

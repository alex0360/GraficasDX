program Graficas;

uses
  Vcl.Forms,
  UGraficas in 'UGraficas.pas' {FGraficas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFGraficas, FGraficas);
  Application.Run;
end.

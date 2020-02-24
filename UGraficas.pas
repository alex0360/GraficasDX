unit UGraficas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls;

type
  TFGraficas = class(TForm)
    SG_Data: TStringGrid;
    PGraficas: TPanel;
    SP_Actualizar: TSpeedButton;
    PC_Graficas: TPageControl;
    TS_Barras: TTabSheet;
    CGraficas: TChart;
    TS_Lineas: TTabSheet;
    C_Linias: TChart;
    SLinea: TLineSeries;
    SBarra: TBarSeries;
    SB_Borrar: TSpeedButton;
    SB_Agregar: TSpeedButton;
    PEditarTitulo: TPanel;
    LTitulo: TLabel;
    ETitulo: TEdit;
    procedure SP_ActualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_BorrarClick(Sender: TObject);
    procedure SB_AgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure configurarStringGrid;
    function generarColor: TColor;
  end;

var
  FGraficas: TFGraficas;

implementation

{$R *.dfm}

procedure TFGraficas.configurarStringGrid;
begin
     SG_Data.Cells[0,0] := 'Nombre';
     SG_Data.Cells[1,0] := 'Valor';
end;

procedure TFGraficas.FormCreate(Sender: TObject);
begin
    configurarStringGrid;
end;

function TFGraficas.generarColor: TColor;
begin
      Result := RGB(Random(255),Random(255),Random(255));
end;

procedure TFGraficas.SB_AgregarClick(Sender: TObject);
begin
      SG_Data.RowCount := SG_Data.RowCount + 1;
end;

procedure TFGraficas.SB_BorrarClick(Sender: TObject);
begin
    if SG_Data.RowCount > 2 then
    begin
      SG_Data.RowCount := SG_Data.RowCount - 1;
    end;
end;

procedure TFGraficas.SP_ActualizarClick(Sender: TObject);
var
  dato : Real;
  info : string;
  i: Integer;
begin
      SBarra.Clear;
      SLinea.Clear;

      for i := 1 to SG_Data.RowCount -1 do
      begin
        if SG_Data.Cells[1,i] <> EmptyStr then
        begin
            dato := StrToFloat(SG_Data.Cells[1,i]);
            info:= SG_Data.Cells[0,i] + ' ' + FloatToStr(dato);

            SBarra.Add(dato, info, generarColor);
            SLinea.Add(dato, info, generarColor);
        end;
      end;
      CGraficas.SubTitle.Text[0] := ETitulo.Text;
      C_Linias.SubTitle.Text[0]  := ETitulo.Text;
end;
 {Creditos:
  Boton Eliminar: Iconos diseñados por: roundicons para www.flaticon.es
  Boton Agregar: Iconos diseñados por: phatplus para www.flaticon.es
 }
end.



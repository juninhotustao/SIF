unit UConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, UDmModelClientes;

type
  TFConsultaClientes = class(TFConsulta)
    procedure BtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaClientes: TFConsultaClientes;

implementation

uses
  UFCadastroClientes, UCtrlClientes;
{$R *.dfm}

procedure TFConsultaClientes.BtnNovoClick(Sender: TObject);
begin
  FController.Open;
  FController.Insert;
  CreateForm(TFCadastroClientes);
  Grid.SetFocus;
end;

procedure TFConsultaClientes.FormCreate(Sender: TObject);
begin
  FController := TCtrlClientes.Create;
end;

end.

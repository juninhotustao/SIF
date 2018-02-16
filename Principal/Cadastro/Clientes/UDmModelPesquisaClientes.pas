unit UDmModelPesquisaClientes;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelPesquisaClientes = class(TDmModel)
    DTSPES_ID: TIntegerField;
    DTSPES_LIGACAO: TStringField;
    DTSPES_LIGACAO_COLUNA: TStringField;
    DTSPES_EXIBIR_PESQUISA: TStringField;
    CDSPES_ID: TIntegerField;
    CDSPES_LIGACAO: TStringField;
    CDSPES_LIGACAO_COLUNA: TStringField;
    CDSPES_EXIBIR_PESQUISA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelPesquisaClientes: TDmModelPesquisaClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmModelPesquisaClientes.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDS.Open;
end;

end.

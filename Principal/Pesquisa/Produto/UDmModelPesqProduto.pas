unit UDmModelPesqProduto;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelPesqProduto = class(TDmModel)
    DTSPRO_ID: TIntegerField;
    DTSPRO_REFERENCIA: TStringField;
    DTSPRO_DESCRICAO: TStringField;
    DTSPRO_ESTOQUE: TFMTBCDField;
    CDSPRO_ID: TIntegerField;
    CDSPRO_REFERENCIA: TStringField;
    CDSPRO_DESCRICAO: TStringField;
    CDSPRO_ESTOQUE: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelPesqProduto: TDmModelPesqProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDmCon;

{$R *.dfm}

end.

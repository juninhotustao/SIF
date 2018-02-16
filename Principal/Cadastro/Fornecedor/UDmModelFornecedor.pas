unit UDmModelFornecedor;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelFornecedor = class(TDmModel)
    DTSFOR_ID: TIntegerField;
    DTSFOR_TIPO_PES: TStringField;
    DTSFOR_CPF: TStringField;
    DTSFOR_CNPJ: TStringField;
    DTSFOR_INSCRICAO: TStringField;
    DTSFOR_NOME: TStringField;
    DTSFOR_TELEFONE: TStringField;
    DTSFOR_TELEFONE2: TStringField;
    DTSFOR_ENDERECO: TStringField;
    DTSFOR_END_NUMERO: TStringField;
    DTSFOR_END_COMPLEMENTO: TStringField;
    DTSFOR_BAIRRO: TStringField;
    DTSFOR_ESTADO: TStringField;
    DTSFOR_CIDADE: TStringField;
    DTSFOR_CEP: TStringField;
    CDSFOR_ID: TIntegerField;
    CDSFOR_TIPO_PES: TStringField;
    CDSFOR_CPF: TStringField;
    CDSFOR_CNPJ: TStringField;
    CDSFOR_INSCRICAO: TStringField;
    CDSFOR_NOME: TStringField;
    CDSFOR_TELEFONE: TStringField;
    CDSFOR_TELEFONE2: TStringField;
    CDSFOR_ENDERECO: TStringField;
    CDSFOR_END_NUMERO: TStringField;
    CDSFOR_END_COMPLEMENTO: TStringField;
    CDSFOR_BAIRRO: TStringField;
    CDSFOR_ESTADO: TStringField;
    CDSFOR_CIDADE: TStringField;
    CDSFOR_CEP: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelFornecedor: TDmModelFornecedor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

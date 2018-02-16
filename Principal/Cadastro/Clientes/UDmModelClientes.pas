unit UDmModelClientes;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, UDmCon;

type
  TDmModelClientes = class(TDmModel)
    DTSCLI_ID: TIntegerField;
    DTSCLI_TIPO_PES: TStringField;
    DTSCLI_CPF: TStringField;
    DTSCLI_RG: TStringField;
    DTSCLI_CNPJ: TStringField;
    DTSCLI_NOME: TStringField;
    DTSCLI_TELEFONE: TStringField;
    DTSCLI_TELEFONE2: TStringField;
    DTSCLI_ENDERECO: TStringField;
    DTSCLI_END_NUMERO: TStringField;
    DTSCLI_END_COMPLEMENTO: TStringField;
    DTSCLI_BAIRRO: TStringField;
    DTSCLI_ESTADO: TStringField;
    DTSCLI_CIDADE: TStringField;
    DTSCLI_CEP: TStringField;
    DTSCLI_ESTADO_CIVIL: TStringField;
    DTSCLI_SEXO: TStringField;
    DTSCLI_NATURALIDADE: TStringField;
    DTSCLI_NATURALIDADE_UF: TStringField;
    DTSCLI_NACIONALIDADE: TStringField;
    CDSCLI_ID: TIntegerField;
    CDSCLI_TIPO_PES: TStringField;
    CDSCLI_CPF: TStringField;
    CDSCLI_RG: TStringField;
    CDSCLI_CNPJ: TStringField;
    CDSCLI_NOME: TStringField;
    CDSCLI_TELEFONE: TStringField;
    CDSCLI_TELEFONE2: TStringField;
    CDSCLI_ENDERECO: TStringField;
    CDSCLI_END_NUMERO: TStringField;
    CDSCLI_END_COMPLEMENTO: TStringField;
    CDSCLI_BAIRRO: TStringField;
    CDSCLI_ESTADO: TStringField;
    CDSCLI_CIDADE: TStringField;
    CDSCLI_CEP: TStringField;
    CDSCLI_ESTADO_CIVIL: TStringField;
    CDSCLI_SEXO: TStringField;
    CDSCLI_NATURALIDADE: TStringField;
    CDSCLI_NATURALIDADE_UF: TStringField;
    CDSCLI_NACIONALIDADE: TStringField;
    DTSCLI_INSCRICAO: TStringField;
    CDSCLI_INSCRICAO: TStringField;
    DTSCLI_DATA_CADASTRO: TSQLTimeStampField;
    DTSCLI_EMISSAO_RG: TSQLTimeStampField;
    DTSCLI_DATA_NASC: TSQLTimeStampField;
    CDSCLI_DATA_CADASTRO: TSQLTimeStampField;
    CDSCLI_EMISSAO_RG: TSQLTimeStampField;
    CDSCLI_DATA_NASC: TSQLTimeStampField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelClientes: TDmModelClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmModelClientes.DataModuleCreate(Sender: TObject);
//var
//  i: integer;
begin
//  for i := 0 to ComponentCount -1 do
//    if (Components[i] is TDataSet) then
//      TDataSet(Components[i]).Open;
    //
end;

procedure TDmModelClientes.DataModuleDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
    if (Components[i] is TDataSet) then
      TDataSet(Components[i]).Close;
    //
end;

end.

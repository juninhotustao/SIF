unit UDmModelPesqCliente;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelPesqCliente = class(TDmModel)
    DTSCLI_ID: TIntegerField;
    DTSCLI_NOME: TStringField;
    DTSCLI_CIDADE: TStringField;
    CDSCLI_ID: TIntegerField;
    CDSCLI_NOME: TStringField;
    CDSCLI_CIDADE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelPesqCliente: TDmModelPesqCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

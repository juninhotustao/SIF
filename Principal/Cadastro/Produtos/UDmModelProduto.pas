unit UDmModelProduto;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Vcl.Dialogs, Data.SqlExpr, System.UITypes;

type
  TDmModelProduto = class(TDmModel)
    DTSPRO_ID: TIntegerField;
    DTSPRO_REFERENCIA: TStringField;
    DTSPRO_DESCRICAO: TStringField;
    DTSPRO_ESTOQUE: TFMTBCDField;
    DTSPRO_PRECO_CUSTO: TFMTBCDField;
    DTSPRO_PRECO_CUSTO_REAL: TFMTBCDField;
    DTSPRO_PRECO_MEDIO_COMPRA: TFMTBCDField;
    DTSPRO_PRECO_VENDA: TFMTBCDField;
    CDSPRO_ID: TIntegerField;
    CDSPRO_REFERENCIA: TStringField;
    CDSPRO_DESCRICAO: TStringField;
    CDSPRO_ESTOQUE: TFMTBCDField;
    CDSPRO_PRECO_CUSTO: TFMTBCDField;
    CDSPRO_PRECO_CUSTO_REAL: TFMTBCDField;
    CDSPRO_PRECO_MEDIO_COMPRA: TFMTBCDField;
    CDSPRO_PRECO_VENDA: TFMTBCDField;
    DTSPRO_EAN: TStringField;
    CDSPRO_EAN: TStringField;
    DTSPRO_DATA_CADASTRO: TSQLTimeStampField;
    CDSPRO_DATA_CADASTRO: TSQLTimeStampField;
    DTSPRO_UN_ID: TIntegerField;
    CDSPRO_UN_ID: TIntegerField;
    CDSUnidade: TClientDataSet;
    DSPUnidade: TDataSetProvider;
    DTSUnidade: TSQLDataSet;
    DSUnidade: TDataSource;
    procedure DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure CDSAfterPost(DataSet: TDataSet);
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure CDSAfterInsert(DataSet: TDataSet);
    procedure DSPGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  DmModelProduto: TDmModelProduto;

implementation

uses
  UDmCon;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmModelProduto.CDSAfterDelete(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TDmModelProduto.CDSAfterInsert(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 0 to CDS.FieldCount - 1 do
    if CDS.Fields[i] is TIntegerField then
      Continue
    else if CDS.Fields[i] is TNumericField then
      CDS.Fields[i].AsFloat := 0;
end;

procedure TDmModelProduto.CDSAfterPost(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TDmModelProduto.DataModuleCreate(Sender: TObject);
begin
  inherited;

  CDSUnidade.Open;
end;

procedure TDmModelProduto.DataModuleDestroy(Sender: TObject);
begin
  inherited;

  CDSUnidade.Close;
end;

procedure TDmModelProduto.DSPAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  ASql: string;
  i: integer;
begin
  if UpdateKind <> ukInsert then Exit;

  ASql := Format('SELECT IDENT_CURRENT(''%s'')', ['PRODUTOS']);

  for i := 0 to DeltaDS.Fields.Count - 1 do
    if (pfInKey in DeltaDS.Fields[i].ProviderFlags) and DeltaDS.Fields[i].IsNull then
    begin
      DeltaDS.Fields[i].NewValue := DmCon.OpenSQL(ASql, []);
      Break;
    end;
end;

procedure TDmModelProduto.DSPGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: string);
begin
  inherited;

  TableName := 'PRODUTOS';
end;

end.

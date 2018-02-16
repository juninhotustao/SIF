unit UDmModelDav;

interface

uses
  System.SysUtils, System.Classes, UDmModelVenda, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelDav = class(TDmModelVenda)
    DTSItemITV_ID: TIntegerField;
    DTSItemVEN_ID: TIntegerField;
    DTSItemVEN_DATA: TSQLTimeStampField;
    DTSItemPRO_ID: TIntegerField;
    DTSItemITV_REFER: TStringField;
    DTSItemITV_QTDE: TFMTBCDField;
    DTSItemITV_DESCONTO: TFMTBCDField;
    DTSItemITV_PRECOVENDA: TFMTBCDField;
    DTSItemITV_VALORTOTAL: TFMTBCDField;
    DTSItemITV_DATA: TSQLTimeStampField;
    DTSItemITV_UN: TStringField;
    DTSItemITV_DESCRICAO: TStringField;
    DTSVEN_ID: TIntegerField;
    DTSVEN_DATA: TSQLTimeStampField;
    DTSCLI_ID: TIntegerField;
    DTSCLI_NOME: TStringField;
    DTSVEN_TOTAL: TFMTBCDField;
    DTSVEN_DESCONTO: TFMTBCDField;
    DTSVEN_SITUACAO: TStringField;
    DTSVEN_OBSERVACAO: TStringField;
    CDSCLI_NOME: TStringField;
    procedure DSPGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure CDSAfterPost(DataSet: TDataSet);
    procedure CDSItemBeforePost(DataSet: TDataSet);
    procedure CDSItemAfterPost(DataSet: TDataSet);
    procedure DSPItemAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelDav: TDmModelDav;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDmCon;

{$R *.dfm}

procedure TDmModelDav.CDSAfterPost(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TDmModelDav.CDSItemAfterPost(DataSet: TDataSet);
begin
  CDSItem.ApplyUpdates(0);
end;

procedure TDmModelDav.CDSItemBeforePost(DataSet: TDataSet);
begin
  CDSItemVEN_ID.AsInteger    := CDSVEN_ID.AsInteger;
  CDSItemVEN_DATA.AsDateTime := CDSVEN_DATA.AsDateTime;
  CDSItemITV_DATA.AsDateTime := Date + Time;
end;

procedure TDmModelDav.DSPGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: string);
begin
  inherited;

  TableName := 'VENDA';
end;

procedure TDmModelDav.DSPItemAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  ASql: string;
  i: integer;
begin
  if UpdateKind <> ukInsert then Exit;

  ASql := Format('SELECT IDENT_CURRENT(''%s'')', ['ITEM_VENDA']);

  for i := 0 to DeltaDS.Fields.Count - 1 do
    if (pfInKey in DeltaDS.Fields[i].ProviderFlags) and DeltaDS.Fields[i].IsNull then
    begin
      DeltaDS.Fields[i].NewValue := dmCon.OpenSQL(ASql, []);
      Break;
    end;
end;

end.

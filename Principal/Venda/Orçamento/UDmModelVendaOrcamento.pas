unit UDmModelVendaOrcamento;

interface

uses
  System.SysUtils, System.Classes, UDmModelVenda, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, UDmModel;

type
  TDmModelVendaOrcamento = class(TDmModelVenda)
    DTSItem: TSQLDataSet;
    DSPItem: TDataSetProvider;
    CDSItem: TClientDataSet;
    DTSVEN_ID: TIntegerField;
    DTSVEN_DATA: TSQLTimeStampField;
    DTSCLI_ID: TIntegerField;
    DTSVEN_TOTAL: TFMTBCDField;
    DTSVEN_DESCONTO: TFMTBCDField;
    DTSVEN_SITUACAO: TStringField;
    DTSVEN_OBSERVACAO: TStringField;
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
    CDSVEN_ID: TIntegerField;
    CDSVEN_DATA: TSQLTimeStampField;
    CDSCLI_ID: TIntegerField;
    CDSVEN_TOTAL: TFMTBCDField;
    CDSVEN_DESCONTO: TFMTBCDField;
    CDSVEN_SITUACAO: TStringField;
    CDSVEN_OBSERVACAO: TStringField;
    CDSItemITV_ID: TIntegerField;
    CDSItemVEN_ID: TIntegerField;
    CDSItemVEN_DATA: TSQLTimeStampField;
    CDSItemPRO_ID: TIntegerField;
    CDSItemITV_REFER: TStringField;
    CDSItemITV_QTDE: TFMTBCDField;
    CDSItemITV_DESCONTO: TFMTBCDField;
    CDSItemITV_PRECOVENDA: TFMTBCDField;
    CDSItemITV_VALORTOTAL: TFMTBCDField;
    CDSItemITV_DATA: TSQLTimeStampField;
    CDSItemITV_UN: TStringField;
    CDSItemITV_DESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelVendaOrcamento: TDmModelVendaOrcamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

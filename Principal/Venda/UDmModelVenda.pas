unit UDmModelVenda;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelVenda = class(TDmModel)
    DTSItem: TSQLDataSet;
    DSPItem: TDataSetProvider;
    CDSItem: TClientDataSet;
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
  DmModelVenda: TDmModelVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

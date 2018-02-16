unit UControllerOrcamento;

interface

uses
  UController, DB, Forms, SysUtils, DBClient;

type
  TFilterProduto = record
    Referencia: string;
    Descricao: string;
    Unidade: string;
    VlrUnit: Double;
  end;

  TControllerVendaOrcamento = class(TController)
  public
    procedure Post; override;
    procedure Cancel; override;
    procedure Open; override;
    procedure Insert; override;
    procedure Edit; override;
    procedure Delete; override;
    procedure Close; override;
    function IsEmpty: boolean; override;
    function Active: boolean; override;
    function State: TDataSetState; override;
    function Filter(const AParams: array of const): TFilterProduto;

    constructor create;
    destructor destroy; override;
  protected
    procedure SearchByParams(const AParams: array of Variant); overload;
  end;

implementation

uses
  UDmModelVendaOrcamento, UDmCon, VarRecs, UFVendaOrcamento;

{ TControllerProdutoInventario }

function TControllerVendaOrcamento.Active: boolean;
begin
  Result := DmModelVendaOrcamento.CDS.Active;
end;

procedure TControllerVendaOrcamento.Cancel;
begin
  DmModelVendaOrcamento.CDS.Cancel;
end;

procedure TControllerVendaOrcamento.Close;
begin
  DmModelVendaOrcamento.CDS.Close;
end;

constructor TControllerVendaOrcamento.create;
begin
  if not Assigned(DmModelVendaOrcamento) then
    DmModelVendaOrcamento := TDmModelVendaOrcamento.Create(nil);

end;

procedure TControllerVendaOrcamento.Delete;
begin
  try
    DmModelVendaOrcamento.CDS.Delete;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

destructor TControllerVendaOrcamento.destroy;
begin
  FreeAndNil(DmModelVendaOrcamento);
end;

procedure TControllerVendaOrcamento.Edit;
begin
  try
    DmModelVendaOrcamento.CDS.Edit;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerVendaOrcamento.Filter(const AParams: array of const): TFilterProduto;
const
  SQLPRODUTO =
    ' SELECT '+
    '	  PRO_ID,	PRO_DATA_CADASTRO, PRO_REFERENCIA, '+
    '	  PRO_EAN, PRO_DESCRICAO, PRO_ESTOQUE, PRO_PRECO_CUSTO, '+
    '	  PRO_PRECO_CUSTO_REAL, PRO_PRECO_MEDIO_COMPRA, '+
    '	  PRO_PRECO_VENDA '+
    ' FROM '+
    '	  PRODUTOS '+
    'WHERE '+
    '  ISNULL(PRO_EAN,'''') LIKE :EAN OR PRO_REFERENCIA LIKE :REF';
var
  Parametro: array of Variant;
  i: Integer;
  ObjFilterProduto: TFilterProduto;
begin
  { 1º Parametro (inteiro) : 0 - EAN OU REFERENCIA }

  SetLength(Parametro, 1);

  Parametro[0] := string(AParams[0].VAnsiString);

  with TClientDataSet.Create(nil) do
  try
    Data := dmCon.GetData(SQLPRODUTO, [Parametro[0], Parametro[0]]);

    ObjFilterProduto.Referencia := FieldByName('PRO_REFERENCIA').AsString;
    ObjFilterProduto.Descricao  := FieldByName('PRO_DESCRICAO').AsString;
//  ObjFilterProduto.Unidade    := FieldByName('').AsString;
    ObjFilterProduto.VlrUnit    := FieldByName('PRO_PRECO_VENDA').AsFloat;

    if IsEmpty then
    begin
      Exception.Create('Não foi encontrado produto na pesquisa.');
      ObjFilterProduto.Referencia := '...';
      ObjFilterProduto.Descricao  := '...';
//  ObjFilterProduto.Unidade    := '...';
      ObjFilterProduto.VlrUnit    := 0;
    end;

  finally
    Free;
  end;

  Result := ObjFilterProduto;
end;

procedure TControllerVendaOrcamento.Insert;
begin
  try
    DmModelVendaOrcamento.CDS.Insert;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerVendaOrcamento.IsEmpty: boolean;
begin
  Result := DmModelVendaOrcamento.CDS.IsEmpty;
end;

procedure TControllerVendaOrcamento.Open;
begin
  DmModelVendaOrcamento.CDS.Open;
end;

procedure TControllerVendaOrcamento.Post;
begin
  if not (DmModelVendaOrcamento.CDS.State in [dsEdit, dsInsert]) then
    exit;

  try
    DmModelVendaOrcamento.CDS.Post;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

procedure TControllerVendaOrcamento.SearchByParams(const AParams: array of Variant);
var
  i: Integer;
begin
    if Active then
      Close;

    DmModelVendaOrcamento.CDS.FetchParams;

    for i := 0 to High(AParams) do
      DmModelVendaOrcamento.CDS.Params[i].Value := AParams[i];

    Open;
end;

function TControllerVendaOrcamento.State: TDataSetState;
begin
  Result := DmModelVendaOrcamento.CDS.State;
end;

end.

unit UControllerVenda;

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

  TControllerVenda = class(TController)
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

    function PesquisaCliente(ACliID: string): Variant;
    constructor create;
    destructor destroy; override;
  protected
    procedure SearchByParams(const AParams: array of Variant); overload;
  end;

implementation

uses
  UDmModelVenda, UDmCon, VarRecs;

{ TControllerProdutoInventario }

function TControllerVenda.Active: boolean;
begin
  Result := DmModelVenda.CDS.Active;
end;

procedure TControllerVenda.Cancel;
begin
  DmModelVenda.CDS.Cancel;
end;

procedure TControllerVenda.Close;
begin
  DmModelVenda.CDS.Close;
end;

constructor TControllerVenda.create;
begin
  if not Assigned(DmModelVenda) then
    DmModelVenda := TDmModelVenda.Create(nil);

end;

procedure TControllerVenda.Delete;
begin
  try
    DmModelVenda.CDS.Delete;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

destructor TControllerVenda.destroy;
begin
  FreeAndNil(DmModelVenda);
end;

procedure TControllerVenda.Edit;
begin
  try
    DmModelVenda.CDS.Edit;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerVenda.Filter(const AParams: array of const): TFilterProduto;
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
    ObjFilterProduto.Unidade    := 'CX';
    ObjFilterProduto.VlrUnit    := FieldByName('PRO_PRECO_VENDA').AsFloat;

    if IsEmpty then
    begin
      Exception.Create('Não foi encontrado produto na pesquisa.');
      ObjFilterProduto.Referencia := '';
      ObjFilterProduto.Descricao  := '...';
      ObjFilterProduto.Unidade    := '...';
      ObjFilterProduto.VlrUnit    := 0;
    end;

  finally
    Free;
  end;

  Result := ObjFilterProduto;
end;

procedure TControllerVenda.Insert;
begin
  try
    DmModelVenda.CDS.Insert;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerVenda.IsEmpty: boolean;
begin
  Result := DmModelVenda.CDS.IsEmpty;
end;

procedure TControllerVenda.Open;
begin
  DmModelVenda.CDS.Open;
end;

function TControllerVenda.PesquisaCliente(ACliID: string): Variant;
const
  SQL =
    ' SELECT CLI_NOME FROM CLIENTES WHERE CLI_ID = :CLI_ID ';
begin
  with TClientDataSet.Create(nil) do
  try
    Data := dmCon.GetData(SQL, [ACliID]);

    Result := FieldByName('CLI_NOME').Value;
  finally
    Free;
  end;

end;

procedure TControllerVenda.Post;
begin
  if not (DmModelVenda.CDS.State in [dsEdit, dsInsert]) then
    exit;

  try
    DmModelVenda.CDS.Post;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

procedure TControllerVenda.SearchByParams(const AParams: array of Variant);
var
  i: Integer;
begin
    if Active then
      Close;

    DmModelVenda.CDS.FetchParams;

    for i := 0 to High(AParams) do
      DmModelVenda.CDS.Params[i].Value := AParams[i];

    Open;
end;

function TControllerVenda.State: TDataSetState;
begin
  Result := DmModelVenda.CDS.State;
end;

end.

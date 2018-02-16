unit UControllerProduto;

interface

uses
  UController, DB, Forms, SysUtils, DBClient;

type
  TControllerProduto = class(TController)
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
    function Filter(const AParams: array of const): boolean; override;

    { Funções Exclusivas}
    function LocalizaProduto(const AParams: array of const): boolean;
    function ExisteProdutoLancado(ProId: integer; InvData: TDateTime): Boolean;
    function HabilitaReferencia: Boolean;
    function ReferenciaInvalida: Boolean;
    function ReferenciaAutomatica: string;

    constructor create;
    destructor destroy; override;
  protected
    procedure SearchByParams(const AParams: array of Variant); overload;
  end;

implementation

uses
  UDmModelProduto, UDmCon, VarRecs, UFCadastroProduto;

{ TControllerProdutoInventario }

function TControllerProduto.Active: boolean;
begin
  Result := DmModelProduto.CDS.Active;
end;

procedure TControllerProduto.Cancel;
begin
  DmModelProduto.CDS.Cancel;
end;

procedure TControllerProduto.Close;
begin
  DmModelProduto.CDS.Close;
end;

constructor TControllerProduto.create;
begin
  if not Assigned(DmModelProduto) then
    DmModelProduto := TDmModelProduto.Create(nil);

end;

procedure TControllerProduto.Delete;
begin
  try
    DmModelProduto.CDS.Delete;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

destructor TControllerProduto.destroy;
begin
  FreeAndNil(DmModelProduto);
end;

procedure TControllerProduto.Edit;
begin
  try
    DmModelProduto.CDS.Edit;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerProduto.ExisteProdutoLancado(ProId: integer;
  InvData: TDateTime): Boolean;
const
  SQL =
    ' SELECT' +
    '   COUNT(*)' +
    ' FROM' +
    '	  INVENTARIO' +
    ' WHERE' +
    '   PRO_ID = :PRO_ID AND INV_DATA = :INV_DATA';
begin
  if (dmCon.OpenSQL(SQL,[ProId, InvData]) > 0) then
    Result := True
  else
    Result := False;
end;

function TControllerProduto.Filter(const AParams: array of const): boolean;
const
  SQLPRODUTO =
    ' SELECT '+
    '	  PRO_ID,	PRO_DATA_CADASTRO, PRO_REFERENCIA, '+
    '	  PRO_EAN, PRO_DESCRICAO, PRO_ESTOQUE, PRO_PRECO_CUSTO, '+
    '	  PRO_PRECO_CUSTO_REAL, PRO_PRECO_MEDIO_COMPRA, '+
    '	  PRO_PRECO_VENDA, PRO_UN_ID '+
    ' FROM '+
    '	  PRODUTOS '+
    'WHERE '+
    '  ISNULL(PRO_EAN,'''') LIKE :EAN AND' +
    '  PRO_DESCRICAO LIKE :PRO_DESCRICAO AND PRO_REFERENCIA LIKE :REF';

var
  Params: array of Variant;
  i: Integer;
begin
  Result := True;

  {1º Parametro (inteiro) : 0 - EAN
                            1 - DESCRICAO
                            2 - REFERENCIA
   2º Parametro (String) : Texto da pesquisa}

  SetLength(Params, 3);

  for i := 0 to High(Params) do
    Params[i] := '%';

  case Integer(AParams[0].VAnsiString) of
    0: Params[0] := string(AParams[1].VAnsiString) + '%';
    1: Params[1] := string(AParams[1].VAnsiString) + '%';
    2: Params[2] := string(AParams[1].VAnsiString) + '%';
  end;

  DmModelProduto.DTS.CommandText := SQLPRODUTO;

  SearchByParams(Params);

  if DmModelProduto.CDS.IsEmpty then
    Result := False;
end;

function TControllerProduto.HabilitaReferencia: Boolean;
begin
  Result := True;

  if DmModelProduto.CDS.State = dsEdit then
    Result := False;
end;

procedure TControllerProduto.Insert;
begin
  try
    DmModelProduto.CDS.Insert;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerProduto.IsEmpty: boolean;
begin
  Result := DmModelProduto.CDS.IsEmpty;
end;

function TControllerProduto.LocalizaProduto(
  const AParams: array of const): boolean;
//var
//  FProduto : TProdutoService;
begin
//  Result := True;
//
//  FProduto := TProdutoService.Create;
//  try
//   if FProduto.Buscar(string(AParams[0].VAnsiString)) then
//   begin
//      DmModelProdutoInventario.CDS.FieldByName('PRO_ID').AsInteger      := FProduto.Dados.PRO_ID;
//      DmModelProdutoInventario.CDS.FieldByName('DESCRICAO').AsString    := FProduto.Dados.PRO_DESCRICAO;
//      DmModelProdutoInventario.CDS.FieldByName('CST_ID').Value          := FProduto.Dados.CST_ID;
//      DmModelProdutoInventario.CDS.FieldByName('NAF_CODFISCAL').Value   := FProduto.Dados.NAF_CODFISCAL;
//      DmModelProdutoInventario.CDS.FieldByName('NCM_COD').Value         := FProduto.Dados.PRO_CODIGONBM;
//
//      DmModelProdutoInventario.CDS.FieldByName('INV_QTDE').AsFloat           := FProduto.Dados.PRO_ESTOQUE;
//      DmModelProdutoInventario.CDS.FieldByName('INV_VLR_CUSTO').AsFloat      := FProduto.Dados.PRO_VLRCUSTO;
//      DmModelProdutoInventario.CDS.FieldByName('INV_VLR_CUSTOREAL').AsFloat  := FProduto.Dados.PRO_CUSTONOTA;
//      DmModelProdutoInventario.CDS.FieldByName('INV_VLR_MEDIO').AsFloat      := FProduto.Dados.PRO_VLRMEDIO;
//      DmModelProdutoInventario.CDS.FieldByName('INV_VLR_VENDA').AsFloat      := FProduto.Dados.PRO_VLRVENDA;
//    end
//    else
//    begin
//      DmModelProdutoInventario.CDS.FieldByName('PRO_ID').Clear;
//      DmModelProdutoInventario.CDS.FieldByName('DESCRICAO').AsString := '';
//      Result := False;
//    end;
//  finally
//    FProduto.Free;
//  end;
  //
end;

procedure TControllerProduto.Open;
begin
  DmModelProduto.CDS.Open;
end;

procedure TControllerProduto.Post;
begin
  if not (DmModelProduto.CDS.State in [dsEdit, dsInsert]) then
    exit;

  try
    DmModelProduto.CDS.Post;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

function TControllerProduto.ReferenciaAutomatica: string;
const
  SQL_NEW_REFERENCIA =
    ' SELECT '+
    '   ISNULL(MAX(CONVERT(INT, PRO_REFERENCIA)),0) +1 NEW_REFERENCIA '+
    ' FROM '+
    '   PRODUTOS ';
begin
  if State = dsInsert then
    DmModelProduto.CDSPRO_REFERENCIA.AsString := dmCon.OpenSQL(SQL_NEW_REFERENCIA, []);
end;

function TControllerProduto.ReferenciaInvalida: Boolean;
const
  SQL_REF_PRODUTO =
	  ' SELECT '+
	  '	  COUNT(*) AS QTDE '+
	  ' FROM '+
	  '	  PRODUTOS '+
	  ' WHERE '+
	  '	  PRO_ID <> :PRO_ID AND PRO_REFERENCIA = :REFERENCIA ';
begin
  Result := False;

  //Validação se a Referência ja existe.
  if (dmCon.OpenSQL(SQL_REF_PRODUTO, [DmModelProduto.CDSPRO_ID.AsInteger, DmModelProduto.CDSPRO_REFERENCIA.AsString]) > 0 )
      and (DmModelProduto.CDSPRO_REFERENCIA.AsString <> '') then
  begin
    DmModelProduto.CDSPRO_REFERENCIA.FocusControl;
    Result := True;
  end;
end;

procedure TControllerProduto.SearchByParams(const AParams: array of Variant);
var
  i: Integer;
begin
    if Active then
      Close;

    DmModelProduto.CDS.FetchParams;

    for i := 0 to High(AParams) do
      DmModelProduto.CDS.Params[i].Value := AParams[i];

    Open;
end;

function TControllerProduto.State: TDataSetState;
begin
  Result := DmModelProduto.CDS.State;
end;

end.

unit UCtrlFornecedor;

interface

uses
  UController, DB, Forms, SysUtils, DBClient;

type
  TCtrlFornecedor = class(TController)
  private
  //
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

    function LocalizaFornecedor(const AParams: array of const): boolean;

    constructor Create;
  end;

implementation

uses
  UDmModelFornecedor, UDmCon, VarRecs, UFCadastroFornecedor;

{ TCtrlClientes }

function TCtrlFornecedor.Active: boolean;
begin
  Result := DmModelFornecedor.CDS.Active;
end;

procedure TCtrlFornecedor.Cancel;
begin
  DmModelFornecedor.CDS.Cancel;
end;

procedure TCtrlFornecedor.Close;
begin
  DmModelFornecedor.CDS.Close;
end;

constructor TCtrlFornecedor.Create;
begin
  if not Assigned(DmModelFornecedor) then
    DmModelFornecedor := TDmModelFornecedor.Create(nil);
end;

procedure TCtrlFornecedor.Delete;
begin
  try
    DmModelFornecedor.CDS.Delete;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

procedure TCtrlFornecedor.Edit;
begin
  try
    DmModelFornecedor.CDS.Edit;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

procedure TCtrlFornecedor.Insert;
begin
  DmModelFornecedor.CDS.Insert;

  DmModelFornecedor.CDSFOR_TIPO_PES.AsString := 'F';
end;

function TCtrlFornecedor.IsEmpty: boolean;
begin
  Result := DmModelFornecedor.CDS.IsEmpty;
end;

function TCtrlFornecedor.LocalizaFornecedor(const AParams: array of const): boolean;
var
  i: Integer;
  TipoPesq: Integer;
  TextoPesq: string;
begin
  Result := True;

  {
    1º - Tipo de Pesquisa.
      0 - Nome
      1 - Código
      2 - Cidade
    2º - Texto da Pesquisa.
  }

  for i := 0 to High(AParams) do
  begin
    case i of
      0:  TipoPesq  := integer(AParams[i].VInteger);
      1:  TextoPesq := string(AParams[i].VString);
    end;
  end;

  DmModelFornecedor.CDS.Params[0].Value := '%';
  DmModelFornecedor.CDS.Params[1].Value := '%';

  case TipoPesq of
    0:  DmModelFornecedor.CDS.Params[0].Value := TextoPesq+'%';
    1:  DmModelFornecedor.CDS.Params[1].Value := TextoPesq+'%';
  end;

  Close;
  Open;

  if DmModelFornecedor.CDS.IsEmpty then
    Result := False;
end;

procedure TCtrlFornecedor.Open;
begin
  DmModelFornecedor.CDS.Open;
end;

procedure TCtrlFornecedor.Post;
begin
  if not (DmModelFornecedor.CDS.State in [dsEdit, dsInsert]) then
    exit;

  try
    DmModelFornecedor.CDS.Post;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;

end;

function TCtrlFornecedor.State: TDataSetState;
begin
  Result := DmModelFornecedor.CDS.State;
end;

end.


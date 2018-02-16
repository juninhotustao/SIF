unit UCtrlClientes;

interface

uses
  UController, DB, Forms, SysUtils, DBClient;

type
  TCtrlClientes = class(TController)
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

    function LocalizaCliente(const AParams: array of const): boolean;

    constructor Create;
  end;

implementation

uses
  UDmModelClientes, UDmCon, VarRecs, UFCadastroClientes;

{ TCtrlClientes }

function TCtrlClientes.Active: boolean;
begin
  Result := DmModelClientes.CDS.Active;
end;

procedure TCtrlClientes.Cancel;
begin
  DmModelClientes.CDS.Cancel;
end;

procedure TCtrlClientes.Close;
begin
  DmModelClientes.CDS.Close;
end;

constructor TCtrlClientes.Create;
begin
  if not Assigned(DmModelClientes) then
    DmModelClientes := TDmModelClientes.Create(nil);
end;

procedure TCtrlClientes.Delete;
begin
  try
    DmModelClientes.CDS.Delete;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

procedure TCtrlClientes.Edit;
begin
  try
    DmModelClientes.CDS.Edit;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;
end;

procedure TCtrlClientes.Insert;
begin
  DmModelClientes.CDS.Insert;

  DmModelClientes.CDSCLI_TIPO_PES.AsString := 'F';
  DmModelClientes.CDSCLI_SEXO.AsString     := 'F';
end;

function TCtrlClientes.IsEmpty: boolean;
begin
  Result := DmModelClientes.CDS.IsEmpty;
end;

function TCtrlClientes.LocalizaCliente(const AParams: array of const): boolean;
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

  DmModelClientes.CDS.Params[0].Value := '%';
  DmModelClientes.CDS.Params[1].Value := '%';

  case TipoPesq of
    0:  DmModelClientes.CDS.Params[0].Value := TextoPesq+'%';
    1:  DmModelClientes.CDS.Params[1].Value := TextoPesq+'%';
  end;

  Close;
  Open;

  if DmModelClientes.CDS.IsEmpty then
    Result := False;
end;

procedure TCtrlClientes.Open;
begin
  DmModelClientes.CDS.Open;
end;

procedure TCtrlClientes.Post;
begin
  if not (DmModelClientes.CDS.State in [dsEdit, dsInsert]) then
    exit;

  try
    DmModelClientes.CDS.Post;
  except
      on E: Exception do
        if E.Message <> 'Operation aborted' then
          raise Exception.Create(E.Message);
  end;

end;

function TCtrlClientes.State: TDataSetState;
begin
  Result := DmModelClientes.CDS.State;
end;

end.


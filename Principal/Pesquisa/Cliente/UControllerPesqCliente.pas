unit UControllerPesqCliente;

interface

uses
   UController, DB, Forms, SysUtils, DBClient;

type
   TControllerPesqCliente = class(TController)
  public
    procedure Post; override;
    procedure Cancel; override;
    procedure Insert; override;
    procedure Edit; override;
    procedure Delete; override;
    procedure Open; override;
    procedure Close; override;
    function IsEmpty: boolean; override;
    function Active: boolean; override;
    function State: TDataSetState; override;
    function Filter(const AParams: array of const): boolean; override;
    function Locate(const AParams: array of const): boolean; override;

    constructor create;
    destructor destroy; override;
  protected
    procedure SearchByParams(const AParams: array of Variant); overload;
  end;

implementation

uses
  UDmModelPesqCliente, UDmCon, VarRecs;

{ TControllerPesqProduto }

function TControllerPesqCliente.Active: boolean;
begin
 Result := DmModelPesqCliente.CDS.Active;
end;

procedure TControllerPesqCliente.Cancel;
begin
  DmModelPesqCliente.CDS.Cancel;
end;

procedure TControllerPesqCliente.Close;
begin
  DmModelPesqCliente.CDS.Close;
end;

constructor TControllerPesqCliente.create;
begin
  if not Assigned(DmModelPesqCliente) then
    DmModelPesqCliente := TDmModelPesqCliente.Create(nil);
end;

procedure TControllerPesqCliente.Delete;
begin
  inherited;
end;

destructor TControllerPesqCliente.destroy;
begin
  FreeAndNil(DmModelPesqCliente);
end;

procedure TControllerPesqCliente.Edit;
begin
  inherited;
end;

function TControllerPesqCliente.Filter(const AParams: array of const): boolean;
const
  SQL =
    ' SELECT '+
    '   CLI_ID, CLI_NOME, CLI_CIDADE '+
    ' FROM '+
    '   CLIENTES ';
var
  search: string;
begin
  Result := True;
  search := string(AParams[1].VAnsiString);

  case toInteger(AParams[0]) of
    0: begin  //Nome
          DmModelPesqCliente.DTS.CommandText:= SQL+' where (cli_nome like :cli_nome) order by cli_nome ';
          //
          SearchByParams([search + '%'])
       end;
    1: begin //Código
          DmModelPesqCliente.DTS.CommandText:= SQL+' where (convert(varchar(10), cli_id) like :cli_id) order by cli_nome ';
          //
          SearchByParams([search + '%']);
       end;
  end;


  if DmModelPesqCliente.CDS.IsEmpty then
    Result := False;
end;

procedure TControllerPesqCliente.Insert;
begin
  inherited;

end;

function TControllerPesqCliente.IsEmpty: boolean;
begin
   Result := DmModelPesqCliente.CDS.IsEmpty;
end;

function TControllerPesqCliente.Locate(const AParams: array of const): boolean;
begin
 //
end;

procedure TControllerPesqCliente.Open;
begin
  DmModelPesqCliente.CDS.Open;
end;


procedure TControllerPesqCliente.Post;
begin
  inherited;
end;

procedure TControllerPesqCliente.SearchByParams(
  const AParams: array of Variant);
var
  i: Integer;
begin
  with DmModelPesqCliente do
    begin
    if CDS.Active then CDS.Close;

    CDS.FetchParams;

    for i := 0 to High(AParams) do
      CDS.Params[i].Value := AParams[i];

    CDS.Open;
  end;//
end;

function TControllerPesqCliente.State: TDataSetState;
begin
  Result := DmModelPesqCliente.CDS.State;
end;

end.

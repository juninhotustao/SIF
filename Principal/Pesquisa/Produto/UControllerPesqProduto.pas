unit UControllerPesqProduto;

interface

uses
   UController, DB, Forms, SysUtils, DBClient;

type
   TControllerPesqProduto = class(TController)
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
  UDmModelPesqProduto, UDmCon, VarRecs;

{ TControllerPesqProduto }

function TControllerPesqProduto.Active: boolean;
begin
 Result := DmModelPesqProduto.CDS.Active;
end;

procedure TControllerPesqProduto.Cancel;
begin
  DmModelPesqProduto.CDS.Cancel;
end;

procedure TControllerPesqProduto.Close;
begin
  DmModelPesqProduto.CDS.Close;
end;

constructor TControllerPesqProduto.create;
begin
  if not Assigned(DmModelPesqProduto) then
    DmModelPesqProduto := TDmModelPesqProduto.Create(nil);
end;

procedure TControllerPesqProduto.Delete;
begin
  inherited;
end;

destructor TControllerPesqProduto.destroy;
begin
  FreeAndNil(DmModelPesqProduto);
end;

procedure TControllerPesqProduto.Edit;
begin
  inherited;
end;

function TControllerPesqProduto.Filter(const AParams: array of const): boolean;
const
  SQL =
    ' SELECT '+
    '   PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO,  PRO_ESTOQUE '+
    ' FROM '+
    '   PRODUTOS ';
var
  search: string;
begin
  Result := True;
  search := string(AParams[1].VAnsiString);

  case toInteger(AParams[0]) of
    0: begin  //Descrição
          DmModelPesqProduto.DTS.CommandText:= SQL+' where (pro_descricao like :pro_descricao) order by PRO_DESCRICAO ';
          //
          SearchByParams([search + '%'])
       end;
    1: begin //Referencia
          DmModelPesqProduto.DTS.CommandText:= SQL+' where (pro_referencia like :referencia) order by PRO_REFERENCIA ';
          //
          SearchByParams([search + '%']);
       end;
  end;


  if DmModelPesqProduto.CDS.IsEmpty then
    Result := False;
end;

procedure TControllerPesqProduto.Insert;
begin
  inherited;

end;

function TControllerPesqProduto.IsEmpty: boolean;
begin
   Result := DmModelPesqProduto.CDS.IsEmpty;
end;

function TControllerPesqProduto.Locate(const AParams: array of const): boolean;
begin
 //
end;

procedure TControllerPesqProduto.Open;
begin
  DmModelPesqProduto.CDS.Open;
end;


procedure TControllerPesqProduto.Post;
begin
  inherited;
end;

procedure TControllerPesqProduto.SearchByParams(
  const AParams: array of Variant);
var
  i: Integer;
begin
  with DmModelPesqProduto do
    begin
    if CDS.Active then CDS.Close;

    CDS.FetchParams;

    for i := 0 to High(AParams) do
      CDS.Params[i].Value := AParams[i];

    CDS.Open;
  end;//
end;

function TControllerPesqProduto.State: TDataSetState;
begin
  Result := DmModelPesqProduto.CDS.State;
end;

end.

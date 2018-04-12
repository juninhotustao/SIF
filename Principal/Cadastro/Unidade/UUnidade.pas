unit UUnidade;

interface

uses UEntity;

type
  TUnidade = class(TEntity)
  private
    FUN_ID: integer;
    FUN_CODIGO: string;
    FUN_DESCRICAO: string;
  public
    property UN_ID : integer read FUN_ID write FUN_ID;
    property UN_CODIGO : string read FUN_CODIGO write FUN_CODIGO;
    property UN_DESCRICAO : string read FUN_DESCRICAO write FUN_DESCRICAO;
  end;

  TUnidadeService = class(TEntityService<TUnidade>)
  public
    function Buscar(ACod: string): Boolean; override;
  end;


implementation

uses
  UDmCon, DBClient, DB, SysUtils;

{ TUnidade}

function TUnidadeService.Buscar(ACod: string): Boolean;
const
  SQL =
    ' SELECT '+
    '	  UN_ID, UN_CODIGO, UN_DESCRICAO '+
    ' FROM '+
    '	  UNIDADE '+
    ' WHERE '+
    '	  UN_ID = :UN_ID ';
begin
  Result := False;

  if not Assigned(FDados) then
    FDados := TUnidade.Create;
  //

  with TClientDataSet.Create(nil) do
  try
    Data := dmCon.GetData(SQL, [StrToInt(ACod)]);

    if not IsEmpty then
    begin
      FDados.FUN_ID        := FieldByName('UN_ID').AsInteger;
      FDados.FUN_CODIGO    := FieldByName('UN_CODIGO').AsString;
      FDados.FUN_DESCRICAO := FieldByName('UN_DESCRICAO').AsString;

      Result := True;
    end;
  finally
    Free;
  end;
end;

end.


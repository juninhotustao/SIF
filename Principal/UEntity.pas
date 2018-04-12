unit UEntity;

interface

uses Classes;

type
  TEntity = class(TPersistent)
  protected
    procedure AssignTo(Dest: TPersistent); override;
  end;

  TEntityService<T> = class abstract
  protected
    FDados: T;
  public
    property Dados: T read FDados write FDados;
    function Buscar(ACod: string): boolean; virtual; abstract;
    destructor Destroy; override;
  end;

implementation

uses SysUtils, Rtti;

{ TEntity }

procedure TEntity.AssignTo(Dest: TPersistent);
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  PropRtti: TRttiProperty;
begin
  Contexto := TRttiContext.Create;

  try
    TipoRtti := Contexto.GetType( Self.ClassType );

    try
      for PropRtti in TipoRtti.GetProperties do
        PropRtti.SetValue(Dest, PropRtti.GetValue(Self));
      //
    finally
      TipoRtti.Free;
    end;
  finally
    Contexto.Free;
  end;
end;

{ TEntityService<T> }

destructor TEntityService<T>.Destroy;
begin
  FreeAndNil(FDados);
  inherited;
end;

end.

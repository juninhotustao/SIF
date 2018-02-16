unit USingletonLogin;

interface

{$WARNINGS OFF}
{$HINTS OFF}

uses Forms, DB, SysUtils, DBClient, Winapi.Windows, Vcl.Controls, Vcl.Dialogs;

type
  TUsuarioObj = record
    Usuario: string;
    Senha  : string;
  end;

  TSingletonLogin = class
  private
    class function NewInstance: TObject; override;
  public
    function GetAutenticacao(ALogin, ASenha: string): TUsuarioObj;
    class function Instance: TSingletonLogin;
  end;

implementation

uses
  UDMCon;

var
  _instance: TSingletonLogin = nil;

{ TComportamentos }

function TSingletonLogin.GetAutenticacao(ALogin, ASenha: string): TUsuarioObj;
const
  SQL =
    ' SELECT '+
    '   USU_LOGIN, USU_SENHA '+
    ' FROM '+
    '   USUARIOS '+
    ' WHERE '+
    '   USU_LOGIN = :USU_LOGIN AND USU_SENHA = :USU_SENHA';
var
  AObj: TUsuarioObj;
begin
  with TClientDataSet.Create(nil) do
  try
    Data := dmCon.GetData(SQL, [ALogin, ASenha]);

    if IsEmpty then
    begin
      MessageDlg('Usuário não foi encontrado, verifique SENHA e LOGIN !', mtInformation, [mbOK], 0);
      Abort;
    end;

    AObj.Usuario := FieldByName('USU_LOGIN').AsString;
    AObj.Senha   := FieldByName('USU_SENHA').AsString;

    Result := AObj;
  finally
    Free;
  end;
end;

class function TSingletonLogin.Instance: TSingletonLogin;
begin
  Result := NewInstance as TSingletonLogin;
end;

class function TSingletonLogin.NewInstance: TObject;
//const
//  SQL = 'SELECT PAR_MOV_PDA_COMPORTAMENTO FROM PARAMS';
//var
//  TypeComportamento: string;
begin
  if not Assigned(_instance) then
  begin
    _instance := inherited as TSingletonLogin;

//    TypeComportamento := DMRet.OpenSQL(SQL, []);
//
//    case StrToInt(TypeComportamento) of
//      0: _instance.FComportamento := TFramePadrao.Create(nil);
//    end;
  end;

  Result := _instance;
end;

{$WARNINGS ON}
{$HINTS ON}

end.

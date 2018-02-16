unit UDmModelLogin;

interface

uses
  System.SysUtils, System.Classes, UDmModel, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDmModelLogin = class(TDmModel)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmModelLogin: TDmModelLogin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

unit UDmCon;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, DBXDevartSQLServer,
  Vcl.Forms, DBXPool, Variants, Provider, DBClient, ActiveX, Data.FMTBcd,
  Vcl.ImgList, Vcl.Controls, Data.DBXFirebird;
type
  TdmCon = class(TDataModule)
    Con: TSQLConnection;
    procedure ConBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function GetData(ASQL: string; Parameters: array of Variant): OleVariant;
    function OpenSQL(ASQL: string; Parameters: array of Variant): Variant;
    procedure ExecuteSQL(ASQL: string; Parameters: array of Variant);
  end;

var
  dmCon: TdmCon;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCon.ConBeforeConnect(Sender: TObject);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + 'dbxconnections.ini';
  Con.Connected := False;
  Con.LoadParamsFromIniFile(Path);
  Con.Params.Values['User_Name'] := 'sa';
  Con.Params.Values['Password']  := 'aram98';
end;

procedure TdmCon.DataModuleDestroy(Sender: TObject);
begin
  Con.CloseDataSets;
  Con.Close;
end;

procedure TdmCon.ExecuteSQL(ASQL: string; Parameters: array of Variant);
var
  QRY: TSQLQuery;
  i: integer;
begin
  QRY := TSQLQuery.Create(Self);

  try
    QRY.SQLConnection := Con;
    QRY.GetMetadata   := False;
    QRY.SQL.Text      := ASQL;

    for i := 0 to High(Parameters) do
      if VarIsNull(Parameters[i]) or VarIsClear(Parameters[i]) then
      begin
        QRY.Params[i].AsString := '';
        QRY.Params[i].Clear;
      end else
        QRY.Params[i].Value := Parameters[i];
      //

    try
      QRY.ExecSQL();
    except
      on E: Exception do
        raise Exception.Create(E.Message + #13#10 + ASQL);
    end;
  finally
    QRY.Free;
  end;
end;

function TdmCon.GetData(ASQL: string; Parameters: array of Variant): OleVariant;
var
  QRY: TSQLQuery;
  DSP: TDataSetProvider;
  CDS: TClientDataSet;
  i: integer;
begin
  QRY := TSQLQuery.Create(Self);
  DSP := TDataSetProvider.Create(Self);
  CDS := TClientDataSet.Create(Self);

  try
    QRY.SQLConnection := Con;
    QRY.GetMetadata   := False;
    DSP.Options       := [poAllowCommandText, poRetainServerOrder];
    DSP.Name          := '_DSP';
    DSP.DataSet       := QRY;
    CDS.ProviderName  := '_DSP';
    CDS.CommandText   := ASQL;

    for i := 0 to High(Parameters) do
      if VarIsNull(Parameters[i]) or VarIsClear(Parameters[i]) then
      begin
        CDS.Params[i].AsString := '';
        CDS.Params[i].Clear;
      end else
        CDS.Params[i].Value := Parameters[i];
      //

    try
      CDS.Open;
      Result := CDS.Data;
      CDS.Close;
    except
      on E: Exception do raise Exception.Create(E.Message + #13#10 + ASQL);
    end;
  finally
    DSP.Name := '';
    CDS.Free;
    DSP.Free;
    QRY.Free;
  end;
end;

function TdmCon.OpenSQL(ASQL: string; Parameters: array of Variant): Variant;
var
  QRY: TSQLQuery;
  i: integer;
begin
  Result := Null;

  QRY := TSQLQuery.Create(nil);

  try
    QRY.SQLConnection := Con;
    QRY.GetMetadata   := False;
    QRY.SQL.Text      := ASQL;

    for i := 0 to High(Parameters) do
      if VarIsNull(Parameters[i]) or VarIsClear(Parameters[i]) then
      begin
        QRY.Params[i].AsString := '';
        QRY.Params[i].Clear;
      end else
        QRY.Params[i].Value := Parameters[i];
      //

    try
      QRY.Open;
      if not QRY.IsEmpty then Result := QRY.Fields[0].Value;
      QRY.Close;
    except
      on E: Exception do
        raise Exception.Create(E.Message + #13#10 + ASQL);
    end;
  finally
    QRY.Free;
  end;
end;

end.

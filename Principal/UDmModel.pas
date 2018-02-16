unit UDmModel;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, System.Variants, System.StrUtils,
  Vcl.dialogs;

type
  TDmModel = class(TDataModule)
    DTS: TSQLDataSet;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    procedure CDSAfterPost(DataSet: TDataSet);
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure CDSReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    TabelaNome : string;
    class function IfThen(AValue: Boolean; const ATrue: variant;
      const AFalse: variant): variant;
  public
    { Public declarations }
  end;

var
  DmModel: TDmModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDmCon;

{$R *.dfm}

procedure TDmModel.CDSAfterDelete(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TDmModel.CDSAfterPost(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TDmModel.CDSReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
var
  Tipo: Variant;
begin
  Action := raCancel;

  if AnsiContainsStr(E.Message, 'DELETE') or
     AnsiStartsStr('Children still exist in', E.Message) then
    Tipo := 'excluí-lo.'
  else if AnsiContainsStr(E.Message, 'UPDATE') then
    Tipo := 'alterá-lo.';

  if not VarIsEmpty(Tipo) then
    raise Exception.CreateFmt('Este registro tem movimentações e não será possível %s', [Tipo]);

  raise Exception.Create(E.Message);
end;

procedure TDmModel.DataModuleCreate(Sender: TObject);
var
  PStart, PEnd: integer;
  STable, ASql: string;
begin
  ASql := StringReplace(DTS.CommandText, #13, ' ', [rfReplaceAll]);
  ASql := StringReplace(ASql, #10, '', [rfReplaceAll]);
  ASql := StringReplace(ASql, #9, '', [rfReplaceAll]);
  ASql := UpperCase(ASql);

  PStart := Pos('FROM', ASql) + 4;
  STable := Trim(Copy(ASql, PStart, Length(ASql)));

  PEnd := Pos(' ', STable);
  PEnd := IfThen(PEnd = 0, Length(STable), PEnd);

  TabelaNome := Trim(Copy(STable, 1, PEnd));
end;

procedure TDmModel.DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  ASql: string;
  i: integer;
begin
  if UpdateKind <> ukInsert then Exit;

  ASql := Format('SELECT IDENT_CURRENT(''%s'')', [TabelaNome]);

  for i := 0 to DeltaDS.Fields.Count - 1 do
    if (pfInKey in DeltaDS.Fields[i].ProviderFlags) and DeltaDS.Fields[i].IsNull then
    begin
      DeltaDS.Fields[i].NewValue := dmCon.OpenSQL(ASql, []);
      Break;
    end;
end;

class function TDmModel.IfThen(AValue: Boolean; const ATrue,
  AFalse: variant): variant;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
  //
end;

end.

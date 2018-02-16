unit UFConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.CategoryButtons, Vcl.ExtCtrls, Vcl.StdCtrls, UController, Data.DB, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.DBCtrls, UFCadastro, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TCadBase = class of TFCadastro;

  TFConsulta = class(TForm)
    pnlGrid: TPanel;
    Grid: TDBGrid;
    pnlConsulta: TPanel;
    pnlRodape: TPanel;
    BtnNovo: TButton;
    btnSair: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    DS: TDataSource;
    DTS: TSQLDataSet;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure CDSAfterInsert(DataSet: TDataSet);
    procedure CDSAfterPost(DataSet: TDataSet);
    procedure CDSPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CDSReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure FormShow(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure GridTitleClick(Column: TColumn);
  protected
    TabelaNome: string;
    FrmClass: TCadBase;
    function GenerateKey(const AField, ATable: string): integer;
    procedure SearchByParams(const AParams: array of Variant); overload;
    procedure SearchByParams(const ASQL: string; const AParams: array of Variant); overload;
  public
    procedure CreateForm(AFrmClass: TCadBase);
  end;

var
  FConsulta: TFConsulta;

implementation

uses StrUtils, Math, UDmImagens, UDmModel, UDmCon;

{$R *.dfm}

procedure TFConsulta.btnAlterarClick(Sender: TObject);
begin
  if CDS.IsEmpty then
  begin
    MessageDlg('Não há registro para alterar!', mtInformation, [mbOK], 0);
    Abort;
  end;

  try
    CDS.Edit;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  if not Assigned(FrmClass) then
    raise Exception.Create('O formulário de cadastro não foi configurado');
  //

  with FrmClass.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFConsulta.btnExcluirClick(Sender: TObject);
begin
  if CDS.IsEmpty then
  begin
    MessageBox(handle, 'Não há registro para excluir!', PChar(Application.Title),
      MB_ICONINFORMATION + MB_OK);
    Abort;
  end;

  if Application.MessageBox(
      'Deseja realmente excluir este registro?',
      'ATENÇÃO!', MB_ICONQUESTION + MB_YESNO) = IDYES then
  try
    CDS.Delete;
  except
    on E: Exception do
      if E.Message <> 'Operation aborted' then
        raise Exception.Create(E.Message);
  end;
end;

procedure TFConsulta.BtnNovoClick(Sender: TObject);
begin
  if not Assigned(FrmClass) then
    raise Exception.Create('O formulário de cadastro não foi configurado');

  with FrmClass.Create(nil) do
  try
    try
      CDS.Insert;

    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

    ShowModal;
  finally
    Free;
  end;
end;

procedure TFConsulta.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsulta.CDSAfterDelete(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TFConsulta.CDSAfterInsert(DataSet: TDataSet);
var
  i: integer;
begin
  for i := 0 to CDS.FieldCount - 1 do
    if CDS.Fields[i] is TIntegerField then
      Continue
    else if CDS.Fields[i] is TNumericField then
      CDS.Fields[i].AsFloat := 0;
end;

procedure TFConsulta.CDSAfterPost(DataSet: TDataSet);
begin
  CDS.ApplyUpdates(0);
end;

procedure TFConsulta.CDSPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  if E.Message = 'Key violation.' then
  begin
    MessageDlg('Registro duplicado! O Campo chave já existe!', mtError, [mbOK], 0);
    Action := daAbort;
  end;
end;

procedure TFConsulta.CDSReconcileError(DataSet: TCustomClientDataSet;
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
  //

  if not VarIsEmpty(Tipo) then
  begin
    MessageDlg('Este registro tem movimentações e não será possível ' + Tipo,
      mtError, [mbOK], 0);
    Exit;
  end;

  MessageDlg(E.Message, mtError, [mbOK], 0);
end;

procedure TFConsulta.CreateForm(AFrmClass: TCadBase);
begin
  if not Assigned(AFrmClass) then
    raise Exception.Create('A classe de cadastro ainda não foi informada!');

  with AFrmClass.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFConsulta.DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
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

procedure TFConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDataSet then
      (Components[i] as TDataSet).Close;
    //
  Action := caFree;
end;

procedure TFConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Perform(WM_NEXTDLGCTL,0,0);
    VK_ESCAPE: Close;
  end;
end;

procedure TFConsulta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TFConsulta.FormShow(Sender: TObject);
var
  PStart, PEnd: integer;
  STable, ASql: string;
begin
  try
    CDS.Open;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      raise;
    end;
  end;

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

function TFConsulta.GenerateKey(const AField, ATable: string): integer;
const
  SQL =
    'SELECT isnull(MAX(convert(bigint, %0:s)),0) FROM %1:s ' +
    'WHERE isnumeric(%0:s) = 1 and charindex(''.'', %0:s) = 0 and charindex('','', %0:s) = 0';
begin
  Result := dmCon.OpenSQL(Format(SQL, [AField, ATable]), []) + 1;
end;

procedure TFConsulta.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    Grid.Canvas.Brush.Color := clActiveCaption;
    Grid.Canvas.Font.Color  := clWhite;
  end else
  begin
    if Odd(CDS.RecNo) then
    begin
      Grid.Canvas.Brush.Color := $00F0F0F0; //$00F4FFFF;
      Grid.Canvas.Font.Color  := clWindowText;
    end else
    begin
      Grid.Canvas.Brush.Color := clWhite;
      Grid.Canvas.Font.Color  := clWindowText;
    end;
  end;

  Grid.DefaultDrawDataCell(Rect, Grid.Columns[DataCol].Field, State);
end;

procedure TFConsulta.GridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btnAlterarClick(Sender);
end;

procedure TFConsulta.GridTitleClick(Column: TColumn);
begin
  if Column.Field.FieldKind in [fkCalculated, fkLookup, fkInternalCalc, fkAggregate] then Exit;

  if not CDS.IsEmpty then
    CDS.IndexFieldNames := Column.FieldName;
end;

procedure TFConsulta.SearchByParams(const AParams: array of Variant);
var
  i: Integer;
begin
  if CDS.Active then CDS.Close;

  CDS.FetchParams;

  for i := 0 to High(AParams) do
    CDS.Params[i].Value := AParams[i];

  try
    CDS.Open;
    if CDS.IsEmpty then
    begin
      Application.MessageBox('Nenhum registro encontrado!', 'AVISO!',
        MB_ICONINFORMATION);
      Exit;
    end;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;

  Grid.SetFocus;
end;

procedure TFConsulta.SearchByParams(const ASQL: string;
  const AParams: array of Variant);
begin
  if CDS.Active then CDS.Close;

  DTS.CommandText := ASQL;

  SearchByParams(AParams);
end;

end.

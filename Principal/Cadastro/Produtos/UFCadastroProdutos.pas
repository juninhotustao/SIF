unit UFCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFCadastro, Vcl.ComCtrls,
  vcl.Wwdbdatetimepicker, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Vcl.ExtCtrls;

type
  TFCadastroProdutos = class(TFCadastro)
    gpCabecalho: TGroupBox;
    Label3: TLabel;
    lblReferencia: TLabel;
    lblData: TLabel;
    lblEstoque: TLabel;
    lblEan: TLabel;
    edtEstoque: TDBEdit;
    edtDescricao: TDBEdit;
    edtReferencia: TDBEdit;
    edtEan: TDBEdit;
    data_lancto: TwwDBDateTimePicker;
    pg_: TPageControl;
    tabPrecos: TTabSheet;
    lblCusto: TLabel;
    lblCustoReal: TLabel;
    lblVenda: TLabel;
    lblMedio: TLabel;
    lblUnidade: TLabel;
    lblGrupo: TLabel;
    edtCusto: TDBEdit;
    edtCustoReal: TDBEdit;
    edtVenda: TDBEdit;
    edtMedio: TDBEdit;
    edtUn: TDBEdit;
    edtUnDescricao: TDBEdit;
    edGrupoId: TDBEdit;
    edtGrupoDescricao: TDBEdit;
    GroupBox1: TGroupBox;
    lblGaveta: TLabel;
    edtGaveta: TDBEdit;
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtUnExit(Sender: TObject);
  private
    //
  public
    procedure SetUnidade;
  end;

var
  FCadastroProdutos: TFCadastroProdutos;

implementation

uses
  UFConsultaProdutos, UDmCon, UUnidade;

{$R *.dfm}

{ TFCadastroProdutos }

procedure TFCadastroProdutos.edtReferenciaExit(Sender: TObject);
const
  SQL =
    ' SELECT '+
    '   COUNT(*) AS _QTDE '+
    ' FROM '+
    '   PRODUTOS WHERE PRO_REFERENCIA = :REFERENCIA AND PRO_ID <> :PRO_ID';
begin
  if dmCon.OpenSQL(SQL,[
      DS.DataSet.FieldByName('PRO_REFERENCIA').AsString,  DS.DataSet.FieldByName('PRO_ID').AsInteger
    ]) > 0 then
  begin
    MessageBox(Handle, 'Já existe produto com a referência digitada.', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);
    edtReferencia.SetFocus;
  end;
end;

procedure TFCadastroProdutos.edtUnExit(Sender: TObject);
begin
  if (edtUn.Field.IsNull) or (trim(edtUn.Text) = '') then
    edtUn.Field.Value := edtUn.Field.OldValue;

  if edtUn.Field.Value <> edtUn.Field.OldValue then
    SetUnidade;
end;

procedure TFCadastroProdutos.FormShow(Sender: TObject);
begin
  SetUnidade;
end;

procedure TFCadastroProdutos.SetUnidade;
var
  FUnidade: TUnidadeService;
begin
  if VarIsNull(Ds.DataSet.FieldByName('PRO_UN_ID').AsVariant) then
    Exit;

  FUnidade := TUnidadeService.Create;

  try
    if FUnidade.Buscar(Ds.DataSet.FieldByName('PRO_UN_ID').AsString) then
      Ds.DataSet.FieldByName('DescricaoUnidade').AsString := FUnidade.Dados.UN_DESCRICAO
    else
    begin
      Ds.DataSet.FieldByName('DescricaoUnidade').AsString := '';
      Ds.DataSet.FieldByName('PRO_UN_ID').Clear;
    end;
  finally
    FUnidade.Free;
  end;
end;

end.

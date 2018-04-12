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
    lblDepartamento: TLabel;
    edtCusto: TDBEdit;
    edtCustoReal: TDBEdit;
    edtVenda: TDBEdit;
    edtMedio: TDBEdit;
    edtUn: TDBEdit;
    edtUnDescricao: TDBEdit;
    edtDepId: TDBEdit;
    edtDepDescricao: TDBEdit;
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    MessageBox(Handle, 'J� existe produto com a refer�ncia digitada.', 'ATEN��O!', MB_OK+MB_ICONQUESTION);
    edtReferencia.SetFocus;
  end;
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
      Ds.DataSet.FieldByName('DescricaoUnidade').AsString := FUnidade.Dados.UN_DESCRICAO;
  finally
    FUnidade.Free;
  end;
end;

end.
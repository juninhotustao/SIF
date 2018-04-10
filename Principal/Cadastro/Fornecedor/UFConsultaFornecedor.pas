unit UFConsultaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TFConsultaFornecedor = class(TFConsulta)
    lblTipoPesquisa: TLabel;
    Cmb_TipoPesquisa: TComboBox;
    lbl_TextoPesquisa: TLabel;
    Edt_Conteudo: TEdit;
    DTSFOR_ID: TIntegerField;
    DTSFOR_TIPO_PES: TStringField;
    DTSFOR_CPF: TStringField;
    DTSFOR_CNPJ: TStringField;
    DTSFOR_INSCRICAO: TStringField;
    DTSFOR_NOME: TStringField;
    DTSFOR_TELEFONE: TStringField;
    DTSFOR_TELEFONE2: TStringField;
    DTSFOR_ENDERECO: TStringField;
    DTSFOR_END_NUMERO: TStringField;
    DTSFOR_END_COMPLEMENTO: TStringField;
    DTSFOR_BAIRRO: TStringField;
    DTSFOR_ESTADO: TStringField;
    DTSFOR_CIDADE: TStringField;
    DTSFOR_CEP: TStringField;
    CDSFOR_ID: TIntegerField;
    CDSFOR_TIPO_PES: TStringField;
    CDSFOR_CPF: TStringField;
    CDSFOR_CNPJ: TStringField;
    CDSFOR_INSCRICAO: TStringField;
    CDSFOR_NOME: TStringField;
    CDSFOR_TELEFONE: TStringField;
    CDSFOR_TELEFONE2: TStringField;
    CDSFOR_ENDERECO: TStringField;
    CDSFOR_END_NUMERO: TStringField;
    CDSFOR_END_COMPLEMENTO: TStringField;
    CDSFOR_BAIRRO: TStringField;
    CDSFOR_ESTADO: TStringField;
    CDSFOR_CIDADE: TStringField;
    CDSFOR_CEP: TStringField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaFornecedor: TFConsultaFornecedor;

implementation

{$R *.dfm}

uses  UFCadastroFornecedor;

procedure TFConsultaFornecedor.btnPesquisarClick(Sender: TObject);
const
  SQL_CONSULTA =
    ' SELECT '+
	  '   FOR_ID, FOR_TIPO_PES, FOR_CPF, FOR_CNPJ, FOR_INSCRICAO, FOR_NOME, '+
    '   FOR_TELEFONE, FOR_TELEFONE2, FOR_ENDERECO, FOR_END_NUMERO, FOR_BAIRRO, '+
    '   FOR_END_COMPLEMENTO, FOR_ESTADO, FOR_CIDADE, FOR_CEP '+
    ' FROM '+
    '   FORNECEDORES '+
    ' WHERE '+
    ' %s';
var
  Ssql: string;
begin
  CDS.Close;

  case Cmb_TipoPesquisa.ItemIndex of
    0: Ssql := Format(SQL_CONSULTA, ['FOR_NOME LIKE :FOR_NOME']);
    1: Ssql := Format(SQL_CONSULTA, ['CONVERT(VARCHAR(10), FOR_ID) LIKE :FOR_ID']);
    2: Ssql := Format(SQL_CONSULTA, ['ISNULL(FOR_CIDADE, '''') LIKE :FOR_CIDADE']);
  end;

  CDS.CommandText := Ssql;
  CDS.Params[0].Value := Edt_Conteudo.Text+'%';
  CDS.Open;

  if CDS.IsEmpty then
    MessageBox(Handle, 'Não foi encontrado registro na Pesquisa!', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);
end;

procedure TFConsultaFornecedor.FormCreate(Sender: TObject);
begin
  inherited;

  FrmClass := TFCadastroFornecedor;
end;

end.

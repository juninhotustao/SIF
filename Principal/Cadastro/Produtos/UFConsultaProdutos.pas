unit UFConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.FMTBcd, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFConsultaProdutos = class(TFConsulta)
    lblTipoPesquisa: TLabel;
    Cmb_TipoPesquisa: TComboBox;
    lblPesquisar: TLabel;
    edtPesquisa: TEdit;
    DTSPRO_ID: TIntegerField;
    DTSPRO_DATA_CADASTRO: TSQLTimeStampField;
    DTSPRO_REFERENCIA: TStringField;
    DTSPRO_EAN: TStringField;
    DTSPRO_DESCRICAO: TStringField;
    DTSPRO_ESTOQUE: TFMTBCDField;
    DTSPRO_PRECO_CUSTO: TFMTBCDField;
    DTSPRO_PRECO_CUSTO_REAL: TFMTBCDField;
    DTSPRO_PRECO_MEDIO_COMPRA: TFMTBCDField;
    DTSPRO_PRECO_VENDA: TFMTBCDField;
    DTSPRO_UN_ID: TIntegerField;
    CDSPRO_ID: TIntegerField;
    CDSPRO_DATA_CADASTRO: TSQLTimeStampField;
    CDSPRO_REFERENCIA: TStringField;
    CDSPRO_EAN: TStringField;
    CDSPRO_DESCRICAO: TStringField;
    CDSPRO_ESTOQUE: TFMTBCDField;
    CDSPRO_PRECO_CUSTO: TFMTBCDField;
    CDSPRO_PRECO_CUSTO_REAL: TFMTBCDField;
    CDSPRO_PRECO_MEDIO_COMPRA: TFMTBCDField;
    CDSPRO_PRECO_VENDA: TFMTBCDField;
    CDSPRO_UN_ID: TIntegerField;
    CDSDescricaoUnidade: TStringField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaProdutos: TFConsultaProdutos;

implementation

uses
  UFCadastroProdutos;

{$R *.dfm}

procedure TFConsultaProdutos.btnPesquisarClick(Sender: TObject);
const
  SQL_CONSULTA =
    ' SELECT '+
    '	  PRO_ID,	PRO_DATA_CADASTRO, PRO_REFERENCIA, '+
    '	  PRO_EAN, PRO_DESCRICAO, PRO_ESTOQUE, PRO_PRECO_CUSTO, '+
    '	  PRO_PRECO_CUSTO_REAL, PRO_PRECO_MEDIO_COMPRA, '+
    '	  PRO_PRECO_VENDA, PRO_UN_ID '+
    ' FROM '+
    '	  PRODUTOS '+
    ' WHERE '+
    '   %s  ';
var
  Ssql: string;
begin
  CDS.Close;

  case Cmb_TipoPesquisa.ItemIndex of
    0: Ssql := Format(SQL_CONSULTA, ['ISNULL(PRO_EAN,'''') LIKE :EAN']);
    1: Ssql := Format(SQL_CONSULTA, ['PRO_DESCRICAO LIKE :PRO_DESCRICAO']);
    2: Ssql := Format(SQL_CONSULTA, ['PRO_REFERENCIA LIKE :REF']);
  end;

  CDS.CommandText := Ssql;
  CDS.Params[0].Value := edtPesquisa.Text+'%';
  CDS.Open;

  if CDS.IsEmpty then
    MessageBox(Handle, 'Não foi encontrado registro na Pesquisa!', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);
end;

procedure TFConsultaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(FConsultaProdutos);
end;

procedure TFConsultaProdutos.FormCreate(Sender: TObject);
begin
  inherited;

  TabelaNome := 'PRODUTOS';
  FrmClass   := TFCadastroProdutos;
end;

end.

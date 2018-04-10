unit UFConsultaUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TFConsultaUnidade = class(TFConsulta)
    DTSUN_ID: TIntegerField;
    DTSUN_CODIGO: TStringField;
    DTSUN_DESCRICAO: TStringField;
    CDSUN_ID: TIntegerField;
    CDSUN_CODIGO: TStringField;
    CDSUN_DESCRICAO: TStringField;
    lblPesquisar: TLabel;
    lblTipoPesquisa: TLabel;
    edtPesquisa: TEdit;
    Cmb_TipoPesquisa: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaUnidade: TFConsultaUnidade;

implementation

{$R *.dfm}

uses
  UFCadastroUnidade;

procedure TFConsultaUnidade.btnPesquisarClick(Sender: TObject);
var
  SPesquisa: array of string;
begin
  CDS.Close;

  SetLength(SPesquisa, 2);

  case Cmb_TipoPesquisa.ItemIndex of
    0:
    begin
      SPesquisa[0] := edtPesquisa.Text+'%';
      SPesquisa[1] := '%';
    end;
    1:
    begin
      SPesquisa[0] := '%';
      SPesquisa[1] := edtPesquisa.Text+'%';
    end;
  end;

  CDS.Params[0].Value := SPesquisa[0];
  CDS.Params[1].Value := SPesquisa[1];

  CDS.Open;

  if CDS.IsEmpty then
    MessageBox(Handle, 'Não foi encontrado Unidade na Pesquisa!', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);
end;

procedure TFConsultaUnidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FConsultaUnidade := nil;
end;

procedure TFConsultaUnidade.FormCreate(Sender: TObject);
begin
  inherited;

  FrmClass := TFCadastroUnidade;
end;

end.

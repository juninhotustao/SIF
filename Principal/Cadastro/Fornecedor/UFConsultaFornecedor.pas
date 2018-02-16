unit UFConsultaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFConsultaFornecedor = class(TFConsulta)
    gpPesquisar: TGroupBox;
    lblTipoPesquisa: TLabel;
    lbl_TextoPesquisa: TLabel;
    Edt_Conteudo: TEdit;
    Cmb_TipoPesquisa: TComboBox;
    btnPesquisar: TButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
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

uses UDmModelFornecedor, UCtrlFornecedor, UFCadastroFornecedor;

procedure TFConsultaFornecedor.btnAlterarClick(Sender: TObject);
begin
  if FController.IsEmpty then
  begin
    MessageBox(Handle, 'Pesquise um Fornecedor antes de alterar !', 'ATENÇÃO', MB_OK);
    exit;
  end;

  CreateForm(TFCadastroFornecedor);
  FController.Open;
  FController.Edit;
end;

procedure TFConsultaFornecedor.btnExcluirClick(Sender: TObject);
begin
  if FController.IsEmpty then
  begin
    MessageBox(Handle, 'Pesquise um Fornecedor antes de excluir !', 'ATENÇÃO', MB_OK);
    exit;
  end;

  if MessageDlg('Deseja realmente excluir este registro?', mtInformation, mbYesNo, 0,mbNo) = IDYES then
    FController.Delete;
end;

procedure TFConsultaFornecedor.BtnNovoClick(Sender: TObject);
begin
  FController.Open;
  FController.Insert;
  CreateForm(TFCadastroFornecedor);
  Grid.SetFocus;
end;

procedure TFConsultaFornecedor.btnPesquisarClick(Sender: TObject);
begin
  with FController as TCtrlFornecedor do
    if not LocalizaFornecedor([Cmb_TipoPesquisa.ItemIndex, Edt_Conteudo.Text]) then
    begin
      MessageDlg('Não foi encontrado Fornecedor na pesquisa.', mtWarning, [mbOK], 0);
      Abort;
    end
    else
      Grid.SetFocus;
end;

procedure TFConsultaFornecedor.FormCreate(Sender: TObject);
begin
  FController := TCtrlFornecedor.Create;
  FController.Open;
end;

end.

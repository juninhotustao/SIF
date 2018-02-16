unit UFConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, UDmModelClientes, Vcl.DBCtrls;

type
  TFConsultaClientes = class(TFConsulta)
    gpPesquisar: TGroupBox;
    Edt_Conteudo: TEdit;
    lblTipoPesquisa: TLabel;
    lbl_TextoPesquisa: TLabel;
    DsPesquisa: TDataSource;
    Cmb_TipoPesquisa: TComboBox;
    btnPesquisar: TButton;
    procedure BtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaClientes: TFConsultaClientes;

implementation

uses
  UFCadastroClientes, UCtrlClientes;
{$R *.dfm}

procedure TFConsultaClientes.btnAlterarClick(Sender: TObject);
begin
  if FController.IsEmpty then
  begin
    MessageBox(Handle, 'Pesquise um cliente antes de alterar !', 'ATENÇÃO', MB_OK);
    exit;
  end;

  CreateForm(TFCadastroClientes);
  FController.Open;
  FController.Edit;
end;

procedure TFConsultaClientes.btnExcluirClick(Sender: TObject);
begin
  if FController.IsEmpty then
  begin
    MessageBox(Handle, 'Pesquise um cliente antes de excluir !', 'ATENÇÃO', MB_OK);
    exit;
  end;

  if MessageDlg('Deseja realmente excluir este registro?', mtInformation, mbYesNo, 0,mbNo) = IDYES then
    FController.Delete;
end;

procedure TFConsultaClientes.BtnNovoClick(Sender: TObject);
begin
  FController.Open;
  FController.Insert;
  CreateForm(TFCadastroClientes);
  Grid.SetFocus;
end;

procedure TFConsultaClientes.btnPesquisarClick(Sender: TObject);
begin
  with FController as TCtrlClientes do
    if not LocalizaCliente([Cmb_TipoPesquisa.ItemIndex, Edt_Conteudo.Text]) then
    begin
      MessageDlg('Não foi encontrado cliente na pesquisa.', mtWarning, [mbOK], 0);
      Abort;
    end
    else
      Grid.SetFocus;

end;

procedure TFConsultaClientes.FormCreate(Sender: TObject);
begin
  FController := TCtrlClientes.Create;

end;

end.

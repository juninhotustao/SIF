unit UFConsultaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UFConsulta, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, System.UITypes, vcl.Wwdbdatetimepicker;

type
  TFConsultaProduto = class(TFConsulta)
    groupPesquisa: TGroupBox;
    btnPesquisar: TButton;
    edtPesquisa: TEdit;
    lblPesquisar: TLabel;
    lblTipoPesquisa: TLabel;
    Cmb_TipoPesquisa: TComboBox;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaProduto: TFConsultaProduto;

implementation

uses
  UDmModelProduto, UControllerProduto, UFCadastroProduto;


{$R *.dfm}

procedure TFConsultaProduto.btnAlterarClick(Sender: TObject);
begin
  if FController.IsEmpty then
  begin
    MessageDlg('Não há registro para alterar!', mtInformation, [mbOK], 0);
    Abort;
  end;

  FController.Edit;
  CreateForm(TFCadastroProduto);
  Grid.SetFocus;
end;

procedure TFConsultaProduto.btnExcluirClick(Sender: TObject);
begin
  if FController.IsEmpty then
  begin
    MessageDlg('Não há registro para excluir!', mtInformation, [mbOK], 0);
    Abort;
  end;

  if MessageDlg('Deseja realmente excluir este registro?', mtInformation, mbYesNo, 0,mbNo) = IDYES then
  try
     FController.Delete;
     Grid.SetFocus;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFConsultaProduto.BtnNovoClick(Sender: TObject);
begin
  FController.Insert;
  CreateForm(TFCadastroProduto);
  Grid.SetFocus;
end;

procedure TFConsultaProduto.btnPesquisarClick(Sender: TObject);
begin
  if not FController.Filter([Cmb_TipoPesquisa.ItemIndex, edtPesquisa.Text]) then
  begin
    MessageDlg('Não foi encontrado produto na pesquisa.', mtWarning, [mbOK], 0);
    Abort;
  end
  else
    Grid.SetFocus;
end;

procedure TFConsultaProduto.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
     btnPesquisarClick(Self);
end;

procedure TFConsultaProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerProduto.Create;
  FController.Open;
end;

procedure TFConsultaProduto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

end.

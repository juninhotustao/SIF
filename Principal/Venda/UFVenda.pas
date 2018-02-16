unit UFVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UFrameProduto, Data.DB,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, vcl.Wwdbdatetimepicker,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFVenda = class(TForm)
    pnlGrid: TPanel;
    lblDescricaoTotalVenda: TLabel;
    lblTotalVenda: TLabel;
    Grid: TDBGrid;
    pnlConsulta: TPanel;
    pnlRodape: TPanel;
    BtnNovo: TButton;
    btnSair: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    gpCliente: TGroupBox;
    lblCliente: TLabel;
    lblNomeCliente: TLabel;
    lblData: TLabel;
    lblNumVenda: TLabel;
    dtDataVenda: TwwDBDateTimePicker;
    dbNumVenda: TDBEdit;
    dbIdCliente: TDBEdit;
    dbObservacao: TDBMemo;
    btnPesqCliente: TBitBtn;
    DsItem: TDataSource;
    DS: TDataSource;
    PopMenu: TPopupMenu;
    btnNovoItem: TButton;
    btnAlterarItem: TButton;
    btnExcluirItem: TButton;
    btnCancelarItem: TButton;
    frameProdutoDavBase: TframeProduto;
    btnSalvarItem: TButton;
    procedure BtnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure btnAlterarItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure dbObservacaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frameProdutoDavBasedbReferenciaExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SalvarItem;
  end;

var
  FVenda: TFVenda;

implementation

{$R *.dfm}

uses UDmModelVenda;

procedure TFVenda.btnAlterarClick(Sender: TObject);
begin
  Ds.DataSet.Edit;

  gpCliente.Enabled := True;
  dbIdCliente.Field.FocusControl;
end;

procedure TFVenda.btnAlterarItemClick(Sender: TObject);
begin
  DsItem.DataSet.Edit;

  frameProdutoDavBase.Enabled := True;
end;

procedure TFVenda.btnCancelarItemClick(Sender: TObject);
begin
  DsItem.DataSet.Cancel;

  frameProdutoDavBase.Enabled := False;
end;

procedure TFVenda.btnExcluirClick(Sender: TObject);
begin
  if ds.DataSet.IsEmpty then
  begin
    MessageDlg('Não há registro para excluir!', mtInformation, [mbOK], 0);
    Abort;
  end;

  if MessageDlg('Deseja realmente excluir este registro?', mtInformation, mbYesNo, 0,mbNo) = IDYES then
  try
    DS.DataSet.Delete;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFVenda.btnExcluirItemClick(Sender: TObject);
begin
  DsItem.DataSet.Delete;
end;

procedure TFVenda.BtnNovoClick(Sender: TObject);
begin
  DS.DataSet.Close;
  DS.DataSet.Open;
  DS.DataSet.Insert;

  gpCliente.Enabled := True;

  dtDataVenda.Field.AsDateTime := Date + Time;
  dbIdCliente.Field.FocusControl;
end;

procedure TFVenda.btnNovoItemClick(Sender: TObject);
begin
  if DS.DataSet.IsEmpty then
  begin
    Application.MessageBox('Cadastre primeiro o cabeçalho!', PChar
      (Application.Title), MB_ICONINFORMATION);
    Abort;
  end;

//  TControllerDav(FController).OpenItem(DS.DataSet.FieldByName('VEN_ID').AsInteger);
  DsItem.DataSet.Open;
  DsItem.DataSet.Insert;

  frameProdutoDavBase.Enabled := True;
  frameProdutoDavBase.dbReferencia.Text        := '';
  frameProdutoDavBase.dbDescricaoProduto.Text  := '';
  frameProdutoDavBase.dbReferencia.SetFocus;
end;

procedure TFVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFVenda.btnSalvarClick(Sender: TObject);
begin
  DS.DataSet.Post;

//  dbNumVenda.Text := IntToStr(NumeroVenId);

  gpCliente.Enabled := False;
  Grid.SetFocus;
end;

procedure TFVenda.dbObservacaoExit(Sender: TObject);
begin
  btnSalvarClick(Sender);
end;

procedure TFVenda.FormCreate(Sender: TObject);
begin
  DmModelVenda := TDmModelVenda.Create(Self);
end;

procedure TFVenda.frameProdutoDavBasedbReferenciaExit(Sender: TObject);
begin
  frameProdutoDavBase.dbReferenciaExit(Sender);

end;

procedure TFVenda.SalvarItem;
begin
  DsItem.DataSet.Post;

  frameProdutoDavBase.dbReferencia.Clear;
  frameProdutoDavBase.dbDescricaoProduto.Clear;
  frameProdutoDavBase.dbUnidade.Clear;
  frameProdutoDavBase.dbQuantidade.Clear;
  frameProdutoDavBase.dbVlrVenda.Clear;
  frameProdutoDavBase.dbDesconto.Clear;
  frameProdutoDavBase.dbTotalItem.Clear;

  frameProdutoDavBase.Enabled := False;
  Grid.SetFocus;
end;

end.

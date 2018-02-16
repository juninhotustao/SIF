unit UFVendaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  vcl.Wwdbdatetimepicker, UFrameProduto, Vcl.Menus;

type
  TFVendaBase = class(TFConsulta)
    gpCliente: TGroupBox;
    lblCliente: TLabel;
    lblNomeCliente: TLabel;
    DsItem: TDataSource;
    lblData: TLabel;
    dtDataVenda: TwwDBDateTimePicker;
    lblNumVenda: TLabel;
    dbNumVenda: TDBEdit;
    btnSalvar: TButton;
    PopMenu: TPopupMenu;
    dbIdCliente: TDBEdit;
    dbObservacao: TDBMemo;
    lblDescricaoTotalVenda: TLabel;
    lblTotalVenda: TLabel;
    btnPesqCliente: TBitBtn;
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnNovoClick(Sender: TObject);
    procedure dbIdClienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaBase: TFVendaBase;

implementation

uses
  UControllerVenda;
{$R *.dfm}

procedure TFVendaBase.BtnNovoClick(Sender: TObject);
begin
  inherited;

  dtDataVenda.SetFocus;
end;

procedure TFVendaBase.dbIdClienteExit(Sender: TObject);
var
  NomeCliente: Variant;
begin
  if dbIdCliente.Text = '' then
  begin
   lblNomeCliente.Caption := '';
   Exit;
  end;

  NomeCliente := TControllerVenda(FController).PesquisaCliente(dbIdCliente.Text);

  if VarIsNull(NomeCliente) then
  begin
    Application.MessageBox('Não foi encontrado Cliente na pesquisa!', PChar
      (Application.Title), MB_ICONINFORMATION);
    dbIdCliente.SetFocus;
    lblNomeCliente.Caption := '';
    Exit;
  end;

  lblNomeCliente.Caption := NomeCliente;
end;

procedure TFVendaBase.edtReferenciaExit(Sender: TObject);
//var
//  ObjFilter: TFilterProduto;
begin
//  with Fcontroller as TControllerVenda do
//    ObjFilter := Filter([edtReferencia.Text]);
//
//  edtReferencia.Text     := ObjFilter.Referencia;
//  lblDescProduto.Caption := ObjFilter.Descricao;
//  lblUnidade.Caption     := ObjFilter.Unidade;
end;

procedure TFVendaBase.FormCreate(Sender: TObject);
begin
  FController := TControllerVenda.Create;
end;

procedure TFVendaBase.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TFVendaBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Perform(WM_NEXTDLGCTL,0,0);
    VK_ESCAPE: Close;
  end;
end;

end.

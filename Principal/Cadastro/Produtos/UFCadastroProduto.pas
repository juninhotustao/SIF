unit UFCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, vcl.Wwdbdatetimepicker, Vcl.Mask,
  System.UITypes, Vcl.ComCtrls;

type
  TFCadastroProduto = class(TFCadastro)
    Label3: TLabel;
    lblReferencia: TLabel;
    lblData: TLabel;
    lblEstoque: TLabel;
    edtEstoque: TDBEdit;
    edtDescricao: TDBEdit;
    edtReferencia: TDBEdit;
    edtEan: TDBEdit;
    lblEan: TLabel;
    data_lancto: TwwDBDateTimePicker;
    pg_: TPageControl;
    tabGeral: TTabSheet;
    lblCusto: TLabel;
    edtCusto: TDBEdit;
    lblCustoReal: TLabel;
    edtCustoReal: TDBEdit;
    edtVenda: TDBEdit;
    lblVenda: TLabel;
    edtMedio: TDBEdit;
    lblMedio: TLabel;
    lblUnidade: TLabel;
    lkpUnidade: TDBLookupComboBox;
    lkpDepartamento: TDBLookupComboBox;
    lblDepartamento: TLabel;
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function ValidaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FCadastroProduto: TFCadastroProduto;

implementation

{$R *.dfm}

uses UControllerProduto, UDmModelProduto;

procedure TFCadastroProduto.btnConfirmaClick(Sender: TObject);
var
  msg: String;
begin
  if not(FController.State in [dsEdit, dsInsert]) then
    Exit;

  if not ValidaCampos then
    Exit;

  case FController.State of
    dsEdit: msg := 'Confirma a alteração deste Registro?';
    dsInsert: msg := 'Confirma essa novo Registro?';
  end;

  if MessageDlg(pchar(msg), mtInformation, mbYesNo, 0,mbYes) = IDYES then
  try
    FController.Post;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  Close;
end;

procedure TFCadastroProduto.edtReferenciaExit(Sender: TObject);
begin
  if ActiveControl = btnCancela then Exit;

  if trim(edtReferencia.Text) = '' then Exit;

  with FController as TControllerProduto do
    if ReferenciaInvalida then
    begin
      MessageDlg('Já existe está referência no sistema!',mtWarning,[mbOK], 0);
      exit;
    end;

end;

procedure TFCadastroProduto.FormShow(Sender: TObject);
begin
  DS.DataSet.FieldByName('PRO_DATA_CADASTRO').AsDateTime := Date;

  with FController as TControllerProduto do
  begin
    edtReferencia.Enabled := HabilitaReferencia;
    ReferenciaAutomatica;
  end;
end;

function TFCadastroProduto.ValidaCampos: Boolean;
begin
//  Result := True;
//
//  if (DS.DataSet.FieldByName('INV_DATA').IsNull) then
//  begin
//    MessageDlg('Não foi informado o campo Data!',mtWarning,[mbOK], 0);
//    Data.SetFocus;
//    Result := False;
//  end;
//
//  if (Trim(DS.DataSet.FieldByName('INV_ID_PROD').AsString)  = '') then
//  begin
//    MessageDlg('Não foi informado o campo referência!',mtWarning,[mbOK], 0);
//    edtReferencia.SetFocus;
//    Result := False;
//  end;
//
//  if (DS.DataSet.FieldByName('INV_QTDE').IsNull) then
//  begin
//    MessageDlg('Não foi informado o campo Estoque!',mtWarning,[mbOK], 0);
//    edtEstoque.SetFocus;
//    Result := False;
//  end;
//
//  if (DS.DataSet.FieldByName('INV_VLR_CUSTO').IsNull) then
//  begin
//    MessageDlg('Não foi informado o campo Custo!',mtWarning,[mbOK], 0);
//    edtCusto.SetFocus;
//    Result := False;
//  end;
//
//  if (DS.DataSet.FieldByName('INV_VLR_CUSTOREAL').IsNull) then
//  begin
//    MessageDlg('Não foi informado o campo Custo Real!',mtWarning,[mbOK], 0);
//    edtCustoReal.SetFocus;
//    Result := False;
//  end;
//
//  if (DS.DataSet.FieldByName('INV_VLR_MEDIO').IsNull) then
//  begin
//    MessageDlg('Não foi informado o campo Preço Médio!',mtWarning,[mbOK], 0);
//    edtMedio.SetFocus;
//    Result := False;
//  end;
//
//  if (DS.DataSet.FieldByName('INV_VLR_VENDA').IsNull) then
//  begin
//    MessageDlg('Não foi informado o campo valor Venda!',mtWarning,[mbOK], 0);
//    edtVenda.SetFocus;
//    Result := False;
//  end;
end;

end.


unit UFCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, RzCmboBx, RzDBCmbo, Vcl.DBCtrls, vcl.Wwdbdatetimepicker,
  Vcl.Mask, Vcl.Buttons;

type
  TFCadastroClientes = class(TFCadastro)
    gpDados: TGroupBox;
    lblCodigo: TLabel;
    lblIE: TLabel;
    lb_cgc: TLabel;
    lb_cpf: TLabel;
    lb_dtnasc: TLabel;
    lblRG: TLabel;
    lblDataEmissao: TLabel;
    lblUF: TLabel;
    lblNacionalidade: TLabel;
    lblEstadoCivil: TLabel;
    edt_codigo: TDBEdit;
    edt_inscricao: TDBEdit;
    edt_cpf: TDBEdit;
    edt_cgc: TDBEdit;
    dt_nascimento: TwwDBDateTimePicker;
    rgSexo: TDBRadioGroup;
    edtRG: TDBEdit;
    rg_tipo: TDBRadioGroup;
    cbUFNat: TDBComboBox;
    edtNacionalidade: TDBEdit;
    cbEstadoCivil: TRzDBComboBox;
    edtDataRG: TwwDBDateTimePicker;
    gpEndereco: TGroupBox;
    Label100: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    edt_endereco: TDBEdit;
    edt_complemento: TDBEdit;
    edt_numero: TDBEdit;
    comb_estado: TDBComboBox;
    edt_cep: TDBEdit;
    edt_cidade: TDBEdit;
    edt_bairro: TDBEdit;
    lblNome: TLabel;
    lblNaturalidade: TLabel;
    edt_nome: TDBEdit;
    edtNaturalidade: TDBEdit;
    edt_telefone: TDBEdit;
    edt_telefone2: TDBEdit;
    lblTelefone2: TLabel;
    lblTelefone1: TLabel;
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure rg_tipoClick(Sender: TObject);
    procedure edt_cpfExit(Sender: TObject);
    procedure edt_cgcExit(Sender: TObject);
    procedure edt_telefoneExit(Sender: TObject);
    procedure edt_telefone2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Validacao;
  end;

var
  FCadastroClientes: TFCadastroClientes;

implementation

uses
  UDmModelClientes, UCtrlClientes, UFunc;
{$R *.dfm}

procedure TFCadastroClientes.btnCancelaClick(Sender: TObject);
begin
  FController.Close;

  Close;
end;

procedure TFCadastroClientes.btnConfirmaClick(Sender: TObject);
begin
  Validacao;

  try
    FController.Post;
  except
    raise Exception.Create('Erro ao gravar o Cliente.');
  end;

  Close;
end;

procedure TFCadastroClientes.edt_cgcExit(Sender: TObject);
begin
  if trim(edt_cgc.Text) = '' then
    Exit;

  if not TFunc.CGC_Valido(edt_cgc.Text) then
  begin
    MessageBox(Handle, 'CNPJ Inválido! ', 'Atenção!', MB_OK);
    edt_cpf.SetFocus;
    Abort;
  end;
end;

procedure TFCadastroClientes.edt_cpfExit(Sender: TObject);
begin
  if trim(edt_cpf.Text) = '' then
    Exit;

  if not TFunc.CPF_Valido(edt_cpf.Text) then
  begin
    MessageBox(Handle, 'CPF Inválido! ', 'Atenção!', MB_OK);
    edt_cpf.SetFocus;
    Abort;
  end;
end;

procedure TFCadastroClientes.edt_telefone2Exit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Field.EditMask := TFunc.GetPhoneMask(TDBEdit(Sender).Field.AsString);
end;

procedure TFCadastroClientes.edt_telefoneExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Field.EditMask := TFunc.GetPhoneMask(TDBEdit(Sender).Field.AsString);
end;

procedure TFCadastroClientes.rg_tipoClick(Sender: TObject);
begin
  lb_cgc.Enabled        := rg_tipo.ItemIndex = 1;
  lblIE.Enabled         := rg_tipo.ItemIndex = 1;
  edt_cgc.Enabled       := rg_tipo.ItemIndex = 1;
  edt_inscricao.Enabled := rg_tipo.ItemIndex = 1;

  lb_cpf.Enabled := rg_tipo.ItemIndex = 0;
  edt_cpf.Enabled := rg_tipo.ItemIndex = 0;

end;

procedure TFCadastroClientes.Validacao;
begin
  if (ds.DataSet.FieldByName('CLI_NOME').AsString = '') or
    ds.DataSet.FieldByName('CLI_NOME').IsNull then
  begin
    MessageBox(Handle, 'O Campo nome não pode ficar vazio!', 'Atenção!', MB_OK);
    edt_nome.SetFocus;
    Abort;
  end;

end;

end.

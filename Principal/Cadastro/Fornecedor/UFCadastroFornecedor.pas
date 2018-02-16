unit UFCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFCadastroFornecedor = class(TFCadastro)
    gpDados: TGroupBox;
    lblCodigo: TLabel;
    lblIE: TLabel;
    lblNome: TLabel;
    lb_cgc: TLabel;
    lb_cpf: TLabel;
    lblTelefone1: TLabel;
    lblTelefone2: TLabel;
    edt_codigo: TDBEdit;
    edt_inscricao: TDBEdit;
    edt_cpf: TDBEdit;
    edt_cgc: TDBEdit;
    edt_nome: TDBEdit;
    rg_tipo: TDBRadioGroup;
    edt_telefone: TDBEdit;
    edt_telefone2: TDBEdit;
    gpEndereco: TGroupBox;
    Label100: TLabel;
    Label102: TLabel;
    Label103: TLabel;
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
    Label104: TLabel;
    procedure edt_telefoneExit(Sender: TObject);
    procedure edt_telefone2Exit(Sender: TObject);
    procedure rg_tipoClick(Sender: TObject);
    procedure edt_cpfExit(Sender: TObject);
    procedure edt_cgcExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure HabilitaPessoaJurifica;
  end;

var
  FCadastroFornecedor: TFCadastroFornecedor;

implementation

{$R *.dfm}

uses UDmModelFornecedor, UFunc, UCtrlFornecedor;

procedure TFCadastroFornecedor.edt_cgcExit(Sender: TObject);
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

procedure TFCadastroFornecedor.edt_cpfExit(Sender: TObject);
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

procedure TFCadastroFornecedor.edt_telefone2Exit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Field.EditMask := TFunc.GetPhoneMask(TDBEdit(Sender).Field.AsString);
end;

procedure TFCadastroFornecedor.edt_telefoneExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Field.EditMask := TFunc.GetPhoneMask(TDBEdit(Sender).Field.AsString);
end;

procedure TFCadastroFornecedor.HabilitaPessoaJurifica;
begin
  case rg_tipo.ItemIndex of
    0:begin
      edt_cpf.Enabled := True;
      lb_cpf.Enabled  := True;
      edt_cgc.Enabled := False;
      lb_cgc.Enabled  := False;
    end;
    1:begin
      edt_cpf.Enabled := False;
      lb_cpf.Enabled  := False;
      edt_cgc.Enabled := True;
      lb_cgc.Enabled  := True;
    end;
  end;

end;

procedure TFCadastroFornecedor.rg_tipoClick(Sender: TObject);
begin
  HabilitaPessoaJurifica;
end;

end.

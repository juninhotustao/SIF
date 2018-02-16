unit UFCadastroUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFCadastroUnidade = class(TFCadastro)
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    procedure btnConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroUnidade: TFCadastroUnidade;

implementation

{$R *.dfm}

uses UFConsultaUnidade;

procedure TFCadastroUnidade.btnConfirmaClick(Sender: TObject);
var
  msg: String;
begin
  if not(DS.State in [dsEdit, dsInsert]) then
    Exit;

  if trim(dbCodigo.Text) = '' then
  begin
    MessageBox(Handle, 'O campo código não pode ficar vazio!', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);
    dbCodigo.SetFocus;
    exit;
  end;

  if trim(dbDescricao.Text) = '' then
  begin
    MessageBox(Handle, 'O campo descrição não pode ficar vazio!', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);
    dbDescricao.SetFocus;
    exit;
  end;

  case DS.State of
    dsEdit: msg := 'Confirma a alteração deste Registro?';
    dsInsert: msg := 'Confirma essa novo Registro?';
  end;

  if MessageDlg(pchar(msg), mtInformation, mbYesNo, 0,mbYes) = IDYES then
  try
    DS.Dataset.Post;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  Close;
end;

end.

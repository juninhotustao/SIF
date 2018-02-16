unit UFrameCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, DBClient;

type
  TFrameCliente = class(TFrame)
    gpCliente: TGroupBox;
    lblCodCliente: TLabel;
    btnPesqCliente: TBitBtn;
    dbCodCliente: TEdit;
    dbNomeCliente: TEdit;
    procedure btnPesqClienteClick(Sender: TObject);
    procedure dbCodClienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses U_PesqCliente, UDmCon;

procedure TFrameCliente.btnPesqClienteClick(Sender: TObject);
var
  ACod: integer;
begin
  ACod := Tfrm_PesqCliente.GetCodResult;

  if not(ACod = 0) then
    dbCodCliente.Text := IntToStr(ACod);

  dbCodCliente.SetFocus;
end;

procedure TFrameCliente.dbCodClienteExit(Sender: TObject);
const
  SQLCLIENTE =
    ' SELECT '+
    '	  CLI_ID,	CLI_NOME '+
    ' FROM '+
    '	  CLIENTES '+
    'WHERE '+
    '  CLI_ID = :CLI_ID';
begin
  if Trim(dbCodCliente.Text) = '' then
  begin
    dbNomeCliente.Text      := '';
    Exit;
  end;

  with TClientDataSet.Create(nil) do
  try
    Data := dmCon.GetData(SQLCLIENTE, [dbCodCliente.Text]);

    if IsEmpty then
    begin
      MessageBox(Handle, 'Não foi encontrado cliente na pesquisa.', 'ATENÇÃO!', MB_OK);
      dbCodCliente.Text       := '';
      dbNomeCliente.Text      := '';
      Abort;
    end;

    dbCodCliente.Text       := FieldByName('CLI_ID').AsString;
    dbNomeCliente.Text      := FieldByName('CLI_NOME').AsString;
  finally
    Free;
  end;
end;

end.

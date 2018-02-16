unit U_PesqCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_PesqBase, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  Tfrm_PesqCliente = class(Tfrm_PesqBase)
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Cod : Integer;
  public
    class function GetCodResult: Integer;
  end;

var
  frm_PesqCliente: Tfrm_PesqCliente;

implementation

{$R *.dfm}

uses UDmModelPesqCliente, UControllerPesqCliente;

procedure Tfrm_PesqCliente.btnPesquisarClick(Sender: TObject);
begin
  if not FController.Filter([cmbTipoBusca.ItemIndex, Trim(edt_pesq.Text)]) then
  begin
    ShowMessage('Não foi encontrado registro na pesquisa!');
    Exit;
  end
  else
    Grid.SetFocus;
end;

procedure Tfrm_PesqCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    Cod   := DmModelPesqCliente.CDSCLI_ID.Value;
  //
  inherited;
end;

procedure Tfrm_PesqCliente.FormCreate(Sender: TObject);
begin
  FController := TControllerPesqCliente.Create;
  FController.Open;
end;

procedure Tfrm_PesqCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
     Close;
     Exit;
  end;
end;

class function Tfrm_PesqCliente.GetCodResult: Integer;
begin
  with Tfrm_PesqCliente.Create(nil) do
  try
    ShowModal;
    Result := Cod;
  finally
    Free;
  end;
end;

end.

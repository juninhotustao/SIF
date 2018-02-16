unit U_PesqProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_PesqBase, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Menus, FMTBcd, DBClient, SqlExpr;

type
  Tfrm_PesqProduto = class(Tfrm_PesqBase)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Cod : Integer;
    Ref : String;
  public
    class function GetCodResult: Integer;
    class function GetRefResult: String;
  end;

var
  frm_PesqProduto: Tfrm_PesqProduto;

implementation

uses UDmModelPesqProduto, UControllerPesqProduto;

{$R *.dfm}

procedure Tfrm_PesqProduto.btnPesquisarClick(Sender: TObject);
begin
  if not FController.Filter([cmbTipoBusca.ItemIndex, Trim(edt_pesq.Text)]) then
  begin
    ShowMessage('Não foi encontrado registro na pesquisa!');
    Exit;
  end
  else
    Grid.SetFocus;
end;

procedure Tfrm_PesqProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    Cod   := DmModelPesqProduto.CDSPRO_ID.Value;
    Ref   := DmModelPesqProduto.CDSPRO_REFERENCIA.AsString;
  end;
  //
  inherited;
end;

procedure Tfrm_PesqProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerPesqProduto.Create;
  FController.Open;
end;

procedure Tfrm_PesqProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
     Close;
     Exit;
  end;
end;

class function Tfrm_PesqProduto.GetCodResult: Integer;
begin
  with Tfrm_PesqProduto.Create(nil) do
  try
    ShowModal;
    Result := Cod;
  finally
    Free;
  end;
end;

class function Tfrm_PesqProduto.GetRefResult: String;
begin
  with Tfrm_PesqProduto.Create(nil) do
  try
    ShowModal;
    Result := Ref;
  finally
    Free;
  end;
end;

end.

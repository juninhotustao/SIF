unit UFCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, UController,
  Vcl.StdCtrls, Data.DB, Vcl.DBCtrls;

type
  TFCadastro = class(TForm)
    pnlRodape: TPanel;
    btnConfirma: TButton;
    pnlPrincipal: TPanel;
    DS: TDataSource;
    btnCancela: TButton;
    procedure btnCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmaClick(Sender: TObject);
  private
    //
  protected
    procedure CriaForm(AFrmClass: TFormClass; AModal: boolean = False);
  published
    procedure NoAccentKeyPress(Sender: TObject; var Key: Char);
    procedure NumberFieldNotIsNullExit(Sender: TObject);
    procedure OnlyIntegerKeyPress(Sender: TObject; var Key: Char);
    procedure OnlyNumberKeyPress(Sender: TObject; var Key: Char);
  public
    //
  end;

var
  FCadastro: TFCadastro;

implementation

uses
  UDmImagens;
{$R *.dfm}

procedure TFCadastro.btnCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadastro.btnConfirmaClick(Sender: TObject);
var
  msg: string;
begin
  case DS.DataSet.State of
    dsEdit: msg := 'Confirma a alteração deste Registro?';
    dsInsert: msg := 'Confirma essa novo Registro?';
  end;

  if Messagebox(handle,pchar(msg),'ATENÇÃO',MB_ICONQUESTION+MB_YESNO) = IDYES then
  try
    DS.DataSet.Post;
  except
    on E: Exception do
      if E.Message <> 'Operation aborted' then
        raise Exception.Create(E.Message);
      //
  end;

  ModalResult := mrOk;
end;

procedure TFCadastro.CriaForm(AFrmClass: TFormClass; AModal: boolean);
begin
  with AFrmClass.Create(nil) do
  try
    if not AModal then
    begin
      Show;
      Exit;
    end;

    try
      Visible := False;
      ShowModal;
    finally
      Free;
    end;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DS.State in [dsInsert, dsEdit] then
    DS.DataSet.Cancel;
  //
end;

procedure TFCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Perform(WM_NEXTDLGCTL,0,0);
    VK_ESCAPE: Close;
  end;
end;

procedure TFCadastro.NoAccentKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'á': Key := 'a';
    'é': Key := 'e';
    'í': Key := 'i';
    'ó': Key := 'o';
    'ú': Key := 'u';
    'à': Key := 'a';
    'è': Key := 'e';
    'ì': Key := 'i';
    'ò': Key := 'o';
    'ù': Key := 'u';
    'â': Key := 'a';
    'ê': Key := 'e';
    'î': Key := 'i';
    'ô': Key := 'o';
    'û': Key := 'u';
    'ä': Key := 'a';
    'ë': Key := 'e';
    'ï': Key := 'i';
    'ö': Key := 'o';
    'ü': Key := 'u';
    'ã': Key := 'a';
    'õ': Key := 'o';
    'ñ': Key := 'n';
    'ç': Key := 'c';
    'Á': Key := 'A';
    'É': Key := 'E';
    'Í': Key := 'I';
    'Ó': Key := 'O';
    'Ú': Key := 'U';
    'À': Key := 'A';
    'È': Key := 'E';
    'Ì': Key := 'I';
    'Ò': Key := 'O';
    'Ù': Key := 'U';
    'Â': Key := 'A';
    'Ê': Key := 'E';
    'Î': Key := 'I';
    'Ô': Key := 'O';
    'Û': Key := 'U';
    'Ä': Key := 'A';
    'Ë': Key := 'E';
    'Ï': Key := 'I';
    'Ö': Key := 'O';
    'Ü': Key := 'U';
    'Ã': Key := 'A';
    'Õ': Key := 'O';
    'Ñ': Key := 'N';
    'Ç': Key := 'C';
  end;

  if not CharInSet(Key,['0'..'9', 'A'..'Z', 'a'..'z', '.', '/', '-', ',', '\', Chr(8), Chr(32)]) then
    Key := #0;
end;

procedure TFCadastro.NumberFieldNotIsNullExit(Sender: TObject);
begin
  if not (Sender is TDBEdit) then Exit;

  if TDBEdit(Sender).Field.IsNull then
    TDBEdit(Sender).Field.AsFloat := 0;
end;

procedure TFCadastro.OnlyIntegerKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['0'..'9', Chr(8)]) then Key := #0;
end;

procedure TFCadastro.OnlyNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['0'..'9', Chr(8), ',']) then Key := #0;
end;

end.

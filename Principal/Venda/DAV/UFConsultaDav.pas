unit UFConsultaDav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, vcl.Wwdbdatetimepicker, UFrameCliente,
  Vcl.ComCtrls;

type
  TFConsultaDav = class(TFConsulta)
    groupPesquisa: TGroupBox;
    btnPesquisar: TButton;
    FrameDavCliente: TFrameCliente;
    chkClientes: TCheckBox;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    chkNumero: TCheckBox;
    dtInicial: TwwDBDateTimePicker;
    dtFinal: TwwDBDateTimePicker;
    procedure FrameDavClientebtnPesqClienteClick(Sender: TObject);
    procedure chkClientesClick(Sender: TObject);
    procedure chkNumeroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    //
  end;

var
  FConsultaDav: TFConsultaDav;

implementation

{$R *.dfm}

uses UControllerDav, UDmModelDav, UFDav;

procedure TFConsultaDav.BtnNovoClick(Sender: TObject);
begin
  with TFDav.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
  Grid.SetFocus;
end;

procedure TFConsultaDav.btnPesquisarClick(Sender: TObject);
  const
    SQL =
      ' SELECT '+
      '	VEN_ID, VEN_DATA, C.CLI_ID, VEN_TOTAL, VEN_DESCONTO, '+
	    ' VEN_SITUACAO, VEN_OBSERVACAO '+
      ' FROM '+
      '	  VENDA V '+
      ' LEFT JOIN '+
      '   CLIENTES C ON V.CLI_ID = C.CLI_ID '+
      ' WHERE '+
      '  CONVERT(VARCHAR(10), C.CLI_ID) LIKE :CLI_ID AND ' +
      '  CONVERT(VARCHAR(10), VEN_ID) LIKE :VEN_ID AND ' +
      '  VEN_DATA BETWEEN :DT_INICIAL AND :DT_FINAL ';
begin
  { 0 - CLIENTE 1 - NUMERO DA VENDA  2 - DATA INICIAL  3 - DATA FINAL }

  DmModelDav.CDS.Close;

  DmModelDav.CDS.Params[0].Value := '%';
  DmModelDav.CDS.Params[1].Value := '%';
  DmModelDav.CDS.Params[2].Value := dtInicial.DateTime;
  DmModelDav.CDS.Params[3].Value := dtFinal.DateTime;

  if not chkClientes.Checked then
    DmModelDav.CDS.Params[0].Value := FrameDavCliente.dbCodCliente.Text;

  if not chkNumero.Checked then
    DmModelDav.CDS.Params[1].Value := edtNumero.Text;

  DmModelDav.CDS.Open;

  if DmModelDav.CDS.IsEmpty then
  begin
    MessageDlg('Não foi encontrado DAV na pesquisa.', mtWarning, [mbOK], 0);
    Exit;
  end
  else
    Grid.SetFocus;
end;

procedure TFConsultaDav.chkClientesClick(Sender: TObject);
begin
  FrameDavCliente.Enabled := chkClientes.Checked = False;

end;

procedure TFConsultaDav.chkNumeroClick(Sender: TObject);
begin
  lblNumero.Enabled := chkNumero.Checked = False;
  edtNumero.Enabled := chkNumero.Checked = False;
end;

procedure TFConsultaDav.FormCreate(Sender: TObject);
begin
  dtInicial.DateTime := Date;
  dtFinal.DateTime   := Date;


  FController := TControllerDav.Create;
end;

procedure TFConsultaDav.FrameDavClientebtnPesqClienteClick(Sender: TObject);
begin
  inherited;
  FrameDavCliente.btnPesqClienteClick(Sender);

end;

end.

unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.RibbonObsidianStyleActnCtrls;

type
  TFPrincipal = class(TForm)
    Ribbon1: TRibbon;
    pgCadastro: TRibbonPage;
    gprFornecedores: TRibbonGroup;
    gprProdutos: TRibbonGroup;
    gprRelatorio: TRibbonGroup;
    gprClientes: TRibbonGroup;
    ActionManager1: TActionManager;
    actSair: TAction;
    actClientes: TAction;
    rbMovimentacoes: TRibbonPage;
    rbVendas: TRibbonGroup;
    rbControledeMesa: TRibbonGroup;
    actFornecedores: TAction;
    ActProdutos: TAction;
    actRelatorios: TAction;
    actVendas: TAction;
    actControledeMesa: TAction;
    rbsistema: TRibbonPage;
    rgTrocarUsuario: TRibbonGroup;
    rgSair: TRibbonGroup;
    actTrocarUsuario: TAction;
    grpUnidade: TRibbonGroup;
    actUnidade: TAction;
    procedure actClientesExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actFornecedoresExecute(Sender: TObject);
    procedure ActProdutosExecute(Sender: TObject);
    procedure actRelatoriosExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actControledeMesaExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
    procedure actTrocarUsuarioExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  UDmImagens, UFunc, UFConsultaUnidade, UFConsultaFornecedor;

{$R *.dfm}

procedure TFPrincipal.actClientesExecute(Sender: TObject);
begin
  //
end;

procedure TFPrincipal.actControledeMesaExecute(Sender: TObject);
begin
  //
end;

procedure TFPrincipal.actFornecedoresExecute(Sender: TObject);
begin
  TFunc.CriaForm(TFConsultaFornecedor);
end;

procedure TFPrincipal.ActProdutosExecute(Sender: TObject);
begin
  //
end;

procedure TFPrincipal.actRelatoriosExecute(Sender: TObject);
begin
  //
end;

procedure TFPrincipal.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal.actTrocarUsuarioExecute(Sender: TObject);
begin
  //
end;

procedure TFPrincipal.actUnidadeExecute(Sender: TObject);
begin
  TFunc.CriaForm(TFConsultaUnidade);
end;

procedure TFPrincipal.actVendasExecute(Sender: TObject);
begin
  //
end;

end.

unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.RibbonObsidianStyleActnCtrls,
  Vcl.RibbonSilverStyleActnCtrls;

type
  TFPrincipal = class(TForm)
    Ribbon1: TRibbon;
    pgCadastro: TRibbonPage;
    gprFornecedores: TRibbonGroup;
    gprProdutos: TRibbonGroup;
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
    actTrocarUsuario: TAction;
    grpUnidade: TRibbonGroup;
    actUnidade: TAction;
    actGrupos: TAction;
    grpGrupos: TRibbonGroup;
    rbRelatorios: TRibbonPage;
    rgRelatorios: TRibbonGroup;
    rbSistema: TRibbonPage;
    rgSair: TRibbonGroup;
    rgTrocarUsuario: TRibbonGroup;
    procedure actClientesExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actFornecedoresExecute(Sender: TObject);
    procedure ActProdutosExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actControledeMesaExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
    procedure actTrocarUsuarioExecute(Sender: TObject);
    procedure actGruposExecute(Sender: TObject);
    procedure actRelatoriosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  UDmImagens, UFunc, UFConsultaUnidade, UFConsultaFornecedor, UFConsultaProdutos,
  UFConsultaGrupos;

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

procedure TFPrincipal.actGruposExecute(Sender: TObject);
begin
  TFunc.CriaForm(TFConsultaGrupos);
end;

procedure TFPrincipal.ActProdutosExecute(Sender: TObject);
begin
  TFunc.CriaForm(TFConsultaProdutos);
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

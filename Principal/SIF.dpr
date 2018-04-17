program SIF;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {FPrincipal},
  UDmCon in 'UDmCon.pas' {dmCon: TDataModule},
  UDmImagens in 'UDmImagens.pas' {DmImagens: TDataModule},
  UFCadastro in 'UFCadastro.pas' {FCadastro},
  UFConsulta in 'UFConsulta.pas' {FConsulta},
  UFunc in 'UFunc.pas',
  VarRecs in 'VarRecs.pas',
  UFConsultaUnidade in 'Cadastro\Unidade\UFConsultaUnidade.pas' {FConsultaUnidade},
  UFCadastroUnidade in 'Cadastro\Unidade\UFCadastroUnidade.pas' {FCadastroUnidade},
  UFCadastroFornecedor in 'Cadastro\Fornecedor\UFCadastroFornecedor.pas' {FCadastroFornecedor},
  UFConsultaFornecedor in 'Cadastro\Fornecedor\UFConsultaFornecedor.pas' {FConsultaFornecedor},
  Vcl.Themes,
  Vcl.Styles,
  UFCadastroProdutos in 'Cadastro\Produtos\UFCadastroProdutos.pas' {FCadastroProdutos},
  UFConsultaProdutos in 'Cadastro\Produtos\UFConsultaProdutos.pas' {FConsultaProdutos},
  UUnidade in 'Cadastro\Unidade\UUnidade.pas',
  UEntity in 'UEntity.pas',
  UFCadastroGrupos in 'Cadastro\Grupos\UFCadastroGrupos.pas' {FCadastroGrupos},
  UFConsultaGrupos in 'Cadastro\Grupos\UFConsultaGrupos.pas' {FConsultaGrupos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDmImagens, DmImagens);
  Application.Run;
end.

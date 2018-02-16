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
  UFConsultaFornecedor in 'Cadastro\Fornecedor\UFConsultaFornecedor.pas' {FConsultaFornecedor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDmImagens, DmImagens);
  Application.Run;
end.

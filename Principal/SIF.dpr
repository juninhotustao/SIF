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
  UFCadastroUnidade in 'Cadastro\Unidade\UFCadastroUnidade.pas' {FCadastroUnidade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TDmImagens, DmImagens);
  Application.CreateForm(TFCadastro, FCadastro);
  Application.CreateForm(TFConsulta, FConsulta);
  Application.CreateForm(TFConsultaUnidade, FConsultaUnidade);
  Application.CreateForm(TFCadastroUnidade, FCadastroUnidade);
  Application.Run;
end.

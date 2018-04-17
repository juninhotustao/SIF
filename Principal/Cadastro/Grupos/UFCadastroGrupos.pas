unit UFCadastroGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFCadastroGrupos = class(TFCadastro)
    gpGeral: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    dbCodigo: TDBEdit;
    dbDescricao: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroGrupos: TFCadastroGrupos;

implementation

uses
  UFConsultaGrupos;

{$R *.dfm}

end.

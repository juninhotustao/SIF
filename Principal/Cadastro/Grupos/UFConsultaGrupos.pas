unit UFConsultaGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFConsulta, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFConsultaGrupos = class(TFConsulta)
    lblPesquisar: TLabel;
    lblTipoPesquisa: TLabel;
    edtPesquisa: TEdit;
    Cmb_TipoPesquisa: TComboBox;
    DTSGRP_ID: TIntegerField;
    DTSGRP_DESCRICAO: TStringField;
    CDSGRP_ID: TIntegerField;
    CDSGRP_DESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaGrupos: TFConsultaGrupos;

implementation

uses
  UFCadastroGrupos, UDmCon;

{$R *.dfm}

procedure TFConsultaGrupos.btnPesquisarClick(Sender: TObject);
var
  SPesquisa: array of string;
begin
  CDS.Close;

  SetLength(SPesquisa, 2);

  case Cmb_TipoPesquisa.ItemIndex of
    0:
    begin
      SPesquisa[0] := edtPesquisa.Text+'%';
      SPesquisa[1] := '%';
    end;
    1:
    begin
      SPesquisa[0] := '%';
      SPesquisa[1] := edtPesquisa.Text+'%';
    end;
  end;

  CDS.Params[0].Value := SPesquisa[0];
  CDS.Params[1].Value := SPesquisa[1];

  CDS.Open;

  if CDS.IsEmpty then
    MessageBox(Handle, 'Não foi encontrado Grupo na Pesquisa!', 'ATENÇÃO!', MB_OK+MB_ICONQUESTION);

end;

procedure TFConsultaGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FConsultaGrupos := nil;
end;

procedure TFConsultaGrupos.FormCreate(Sender: TObject);
begin
  inherited;

  FrmClass   := TFCadastroGrupos;
  TabelaNome := 'GRUPOS';
end;

end.

unit UFVendaOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFVendaOrcamento = class(TForm)
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaOrcamento: TFVendaOrcamento;

implementation

{$R *.dfm}

procedure TFVendaOrcamento.edtReferenciaExit(Sender: TObject);
//var
//  ObjFilter: TFilterProduto;
begin
//  ObjFilter := Fcon FilterProduto .Filter([edtReferencia.Text]);
//
//  DmModelVendaOrcamento.CDSItem.Insert;
//
//  lblDescProduto.Caption := ObjFilter.Descricao;
////  lblUnidade.Caption := ObjFilter.Unidade;
//  DsItem.DataSet.FieldByName('ITV_QTDE').AsString := FormatFloat('0.00', ObjFilter.VlrUnit);
end;

procedure TFVendaOrcamento.FormCreate(Sender: TObject);
begin
  //

end;

procedure TFVendaOrcamento.FormShow(Sender: TObject);
begin
    //
end;

end.

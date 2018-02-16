unit UFDav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFVenda, Vcl.Menus, Data.DB,
  UFrameProduto, Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  vcl.Wwdbdatetimepicker, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, dbClient,
  UControllerDav;

type
  TFDav = class(TFVenda)
    procedure frameProdutoDavBasedbReferenciaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FController: TControllerDav;
  public
    { Public declarations }
  end;

var
  FDav: TFDav;

implementation

{$R *.dfm}

uses UDmModelDav;

procedure TFDav.FormCreate(Sender: TObject);
begin
  FController := TControllerDav.create;
end;

procedure TFDav.frameProdutoDavBasedbReferenciaExit(Sender: TObject);
begin
  inherited;

  DmModelDav.CDSItemPRO_ID.AsInteger       := frameProdutoDavBase.ProId;
end;

end.

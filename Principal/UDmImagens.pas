unit UDmImagens;

interface

uses
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls;

type
  TDmImagens = class(TDataModule)
    Img: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmImagens: TDmImagens;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

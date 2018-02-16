unit UController;

interface

uses Data.DB;

type
  TController = class abstract
  public
    procedure Post; virtual; abstract;
    procedure Cancel; virtual; abstract;
    procedure Insert; virtual; abstract;
    procedure Edit; virtual; abstract;
    procedure Delete; virtual; abstract;
    procedure Open; virtual; abstract;
    procedure Close; virtual; abstract;
    function IsEmpty: boolean; virtual; abstract;
    function Active: boolean; virtual; abstract;
    function State: TDataSetState; virtual; abstract;
    function Filter(const AParams: array of const): boolean; virtual; abstract;
    function Locate(const AParams: array of const): boolean; virtual; abstract;
    function IsFieldsValid(ADataSet: TDataSet): string;
  end;

implementation

uses SysUtils;

{ TController }

function TController.IsFieldsValid(ADataSet: TDataSet): string;
var
  i: Integer;
begin
  Result := '';

  for i := 0 to (ADataset.FieldCount - 1) do
  begin
    if ADataset.Fields[i].Required then
    begin
      if ADataset.Fields[i].IsNull or (trim(ADataset.Fields[i].Value) = '') then
      begin
        ADataset.Fields[i].FocusControl;
        Exit('O campo "' + ADataset.Fields[i].DisplayLabel +
              '" não pode ficar vazio.');
      end
      else if (ADataset.Fields[i].DataType = ftFMTBcd) and
        (ADataset.Fields[i].Value <= 0) and (ADataset.Fields[i].Required) then
      begin
        ADataset.Fields[i].FocusControl;
        Exit('O campo "' + ADataset.Fields[i].DisplayLabel +
              '" não pode ficar zerado ou negativo.');
      end;
    end
    else if (ADataset.Fields[i].DataType = ftFMTBcd) and
      (ADataset.Fields[i].Value < 0) then
    begin
      ADataset.Fields[i].FocusControl;
      Exit(Format('O campo "%s" não pode ficar negativo.', [ADataset.Fields[i].DisplayLabel]));
    end;
  end;
end;

end.

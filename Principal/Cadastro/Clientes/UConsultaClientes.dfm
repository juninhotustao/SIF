inherited FConsultaClientes: TFConsultaClientes
  Caption = 'Consulta de Clientes'
  OnCreate = FormCreate
  ExplicitWidth = 545
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited Grid: TDBGrid
      DataSource = DS
    end
    inherited pnlRodape: TPanel
      inherited BtnNovo: TButton
        OnClick = BtnNovoClick
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelClientes.CDS
  end
end

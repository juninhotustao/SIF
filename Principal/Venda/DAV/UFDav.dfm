inherited FDav: TFDav
  Caption = 'FDav'
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited Grid: TDBGrid
      DataSource = DsItem
    end
    inherited gpCliente: TGroupBox
      inherited dtDataVenda: TwwDBDateTimePicker
        DataField = 'VEN_DATA'
      end
      inherited dbNumVenda: TDBEdit
        DataField = 'VEN_ID'
      end
      inherited dbObservacao: TDBMemo
        DataField = 'VEN_OBSERVACAO'
      end
    end
    inherited frameProdutoDavBase: TframeProduto
      inherited gpProduto: TGroupBox
        inherited dbDesconto: TDBEdit
          DataField = 'ITV_DESCONTO'
          DataSource = DsItem
        end
        inherited dbQuantidade: TDBEdit
          DataField = 'ITV_QTDE'
          DataSource = DsItem
        end
        inherited dbTotalItem: TDBEdit
          DataField = 'ITV_VALORTOTAL'
          DataSource = DsItem
        end
        inherited dbVlrVenda: TDBEdit
          DataField = 'ITV_PRECOVENDA'
          DataSource = DsItem
        end
        inherited dbReferencia: TDBEdit
          DataField = 'ITV_REFER'
          DataSource = DsItem
          OnExit = frameProdutoDavBasedbReferenciaExit
        end
        inherited dbDescricaoProduto: TDBEdit
          DataField = 'ITV_DESCRICAO'
          DataSource = DsItem
        end
        inherited dbUnidade: TDBEdit
          DataField = 'ITV_UN'
          DataSource = DsItem
        end
      end
    end
  end
  inherited DsItem: TDataSource
    DataSet = DmModelDav.CDSItem
  end
  inherited DS: TDataSource
    DataSet = DmModelDav.CDS
  end
end

inherited FVendaOrcamento: TFVendaOrcamento
  Caption = 'FVendaOrcamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipalVenda: TPanel
    inherited gpProduto: TGroupBox
      inherited edtReferencia: TEdit
        OnExit = edtReferenciaExit
      end
    end
  end
end

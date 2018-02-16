inherited DmModelPesquisaClientes: TDmModelPesquisaClientes
  inherited DTS: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'SELECT'#13#10#9'PES_ID, PES_LIGACAO, PES_LIGACAO_COLUNA, PES_EXIBIR_PES' +
      'QUISA'#13#10'FROM '#13#10#9'PESQUISA'#13#10'WHERE'#13#10#9'PES_LIGACAO = '#39'CLIENTES'#39
    object DTSPES_ID: TIntegerField
      FieldName = 'PES_ID'
    end
    object DTSPES_LIGACAO: TStringField
      FieldName = 'PES_LIGACAO'
      Size = 50
    end
    object DTSPES_LIGACAO_COLUNA: TStringField
      FieldName = 'PES_LIGACAO_COLUNA'
      Size = 50
    end
    object DTSPES_EXIBIR_PESQUISA: TStringField
      FieldName = 'PES_EXIBIR_PESQUISA'
      Size = 30
    end
  end
  inherited CDS: TClientDataSet
    object CDSPES_ID: TIntegerField
      FieldName = 'PES_ID'
    end
    object CDSPES_LIGACAO: TStringField
      FieldName = 'PES_LIGACAO'
      Size = 50
    end
    object CDSPES_LIGACAO_COLUNA: TStringField
      FieldName = 'PES_LIGACAO_COLUNA'
      Size = 50
    end
    object CDSPES_EXIBIR_PESQUISA: TStringField
      FieldName = 'PES_EXIBIR_PESQUISA'
      Size = 30
    end
  end
end

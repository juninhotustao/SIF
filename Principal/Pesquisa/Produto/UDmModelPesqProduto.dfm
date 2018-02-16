inherited DmModelPesqProduto: TDmModelPesqProduto
  OldCreateOrder = True
  inherited DTS: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'SELECT '#13#10'        PRO_ID, PRO_REFERENCIA, PRO_DESCRICAO,  PRO_EST' +
      'OQUE '#13#10' FROM '#13#10'        PRODUTOS '#13#10' WHERE '#13#10'        PRO_ID = :ID'
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object DTSPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object DTSPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object DTSPRO_ESTOQUE: TFMTBCDField
      FieldName = 'PRO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
  end
  inherited CDS: TClientDataSet
    object CDSPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object CDSPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object CDSPRO_ESTOQUE: TFMTBCDField
      FieldName = 'PRO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.000'
      Precision = 15
      Size = 3
    end
  end
end

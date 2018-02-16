inherited DmModelPesqCliente: TDmModelPesqCliente
  OldCreateOrder = True
  inherited DTS: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'SELECT '#13#10#9'CLI_ID, CLI_NOME, CLI_CPF, CLI_CNPJ, CLI_CIDADE'#9#13#10'FROM' +
      #13#10#9'CLIENTES'
    object DTSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
    end
    object DTSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 50
    end
    object DTSCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 30
    end
  end
  inherited CDS: TClientDataSet
    object CDSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
    end
    object CDSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 50
    end
    object CDSCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 30
    end
  end
end

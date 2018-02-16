inherited DmModelFornecedor: TDmModelFornecedor
  OldCreateOrder = True
  inherited DTS: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'SELECT '#13#10#9'FOR_ID, FOR_TIPO_PES, FOR_CPF, FOR_CNPJ,'#9'FOR_INSCRICAO' +
      ', FOR_NOME, FOR_TELEFONE, FOR_TELEFONE2,'#13#10#9'FOR_ENDERECO, FOR_END' +
      '_NUMERO, FOR_END_COMPLEMENTO, FOR_BAIRRO, FOR_ESTADO, FOR_CIDADE' +
      ', FOR_CEP'#9#13#10'FROM '#13#10#9'FORNECEDORES'#13#10'WHERE'#13#10#9'FOR_NOME LIKE :FOR_NOM' +
      'E AND'#13#10#9'CONVERT(VARCHAR(20), FOR_ID) LIKE :FOR_ID'#13#10'ORDER BY'#13#10#9'FO' +
      'R_NOME'
    Params = <
      item
        DataType = ftString
        Name = 'FOR_NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FOR_ID'
        ParamType = ptInput
      end>
    object DTSFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSFOR_TIPO_PES: TStringField
      FieldName = 'FOR_TIPO_PES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object DTSFOR_CPF: TStringField
      FieldName = 'FOR_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_CNPJ: TStringField
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_INSCRICAO: TStringField
      FieldName = 'FOR_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSFOR_TELEFONE: TStringField
      FieldName = 'FOR_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_TELEFONE2: TStringField
      FieldName = 'FOR_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSFOR_END_NUMERO: TStringField
      FieldName = 'FOR_END_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object DTSFOR_END_COMPLEMENTO: TStringField
      FieldName = 'FOR_END_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSFOR_ESTADO: TStringField
      FieldName = 'FOR_ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object DTSFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  inherited CDS: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'FOR_NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FOR_ID'
        ParamType = ptInput
      end>
    object CDSFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSFOR_TIPO_PES: TStringField
      FieldName = 'FOR_TIPO_PES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CDSFOR_CPF: TStringField
      FieldName = 'FOR_CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '000.000.000-00;1;_'
      Size = 15
    end
    object CDSFOR_CNPJ: TStringField
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '00.000.000/0000-00;1;_'
      Size = 15
    end
    object CDSFOR_INSCRICAO: TStringField
      FieldName = 'FOR_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSFOR_TELEFONE: TStringField
      FieldName = 'FOR_TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)999999999;0; '
      Size = 15
    end
    object CDSFOR_TELEFONE2: TStringField
      FieldName = 'FOR_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)999999999;0; '
      Size = 15
    end
    object CDSFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSFOR_END_NUMERO: TStringField
      FieldName = 'FOR_END_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CDSFOR_END_COMPLEMENTO: TStringField
      FieldName = 'FOR_END_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSFOR_ESTADO: TStringField
      FieldName = 'FOR_ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object CDSFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
end

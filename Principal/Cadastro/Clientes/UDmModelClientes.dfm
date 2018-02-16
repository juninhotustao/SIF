inherited DmModelClientes: TDmModelClientes
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Width = 159
  inherited DTS: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'SELECT '#13#10#9'CLI_ID,'#9'CLI_DATA_CADASTRO, CLI_TIPO_PES, CLI_CPF, CLI_' +
      'RG, CLI_EMISSAO_RG, CLI_CNPJ, CLI_NOME, CLI_DATA_NASC, CLI_TELEF' +
      'ONE,'#13#10#9'CLI_TELEFONE2, CLI_ENDERECO, CLI_END_NUMERO, CLI_END_COMP' +
      'LEMENTO, CLI_BAIRRO, CLI_ESTADO, CLI_CIDADE,'#13#10#9'CLI_CEP, CLI_ESTA' +
      'DO_CIVIL, CLI_SEXO,  CLI_NATURALIDADE, CLI_NATURALIDADE_UF, CLI_' +
      'NACIONALIDADE, CLI_INSCRICAO'#9#13#10'FROM'#13#10#9'CLIENTES'#13#10'WHERE'#13#10#9'CLI_NOME' +
      ' LIKE :CLI_NOME AND'#13#10#9'CONVERT(VARCHAR(20), CLI_ID) LIKE :CLI_ID'#13 +
      #10'ORDER BY'#13#10#9'CLI_NOME'
    Params = <
      item
        DataType = ftString
        Name = 'CLI_NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLI_ID'
        ParamType = ptInput
      end>
    object DTSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSCLI_TIPO_PES: TStringField
      FieldName = 'CLI_TIPO_PES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object DTSCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_RG: TStringField
      FieldName = 'CLI_RG'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_TELEFONE2: TStringField
      FieldName = 'CLI_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSCLI_END_NUMERO: TStringField
      FieldName = 'CLI_END_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object DTSCLI_END_COMPLEMENTO: TStringField
      FieldName = 'CLI_END_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSCLI_ESTADO: TStringField
      FieldName = 'CLI_ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object DTSCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_ESTADO_CIVIL: TStringField
      FieldName = 'CLI_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object DTSCLI_SEXO: TStringField
      FieldName = 'CLI_SEXO'
      ProviderFlags = [pfInUpdate]
    end
    object DTSCLI_NATURALIDADE: TStringField
      FieldName = 'CLI_NATURALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object DTSCLI_NATURALIDADE_UF: TStringField
      FieldName = 'CLI_NATURALIDADE_UF'
      ProviderFlags = [pfInUpdate]
    end
    object DTSCLI_NACIONALIDADE: TStringField
      FieldName = 'CLI_NACIONALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object DTSCLI_INSCRICAO: TStringField
      FieldName = 'CLI_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSCLI_DATA_CADASTRO: TSQLTimeStampField
      FieldName = 'CLI_DATA_CADASTRO'
    end
    object DTSCLI_EMISSAO_RG: TSQLTimeStampField
      FieldName = 'CLI_EMISSAO_RG'
    end
    object DTSCLI_DATA_NASC: TSQLTimeStampField
      FieldName = 'CLI_DATA_NASC'
    end
  end
  inherited CDS: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'CLI_NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLI_ID'
        ParamType = ptInput
      end>
    Top = 127
    object CDSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSCLI_TIPO_PES: TStringField
      FieldName = 'CLI_TIPO_PES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CDSCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;0;_'
      Size = 15
    end
    object CDSCLI_RG: TStringField
      FieldName = 'CLI_RG'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999/9999-99;0;_'
      Size = 15
    end
    object CDSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)999999999;0;'
      Size = 15
    end
    object CDSCLI_TELEFONE2: TStringField
      FieldName = 'CLI_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)999999999;0;'
      Size = 15
    end
    object CDSCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSCLI_END_NUMERO: TStringField
      FieldName = 'CLI_END_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CDSCLI_END_COMPLEMENTO: TStringField
      FieldName = 'CLI_END_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSCLI_ESTADO: TStringField
      FieldName = 'CLI_ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object CDSCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSCLI_ESTADO_CIVIL: TStringField
      FieldName = 'CLI_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCLI_SEXO: TStringField
      FieldName = 'CLI_SEXO'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCLI_NATURALIDADE: TStringField
      FieldName = 'CLI_NATURALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCLI_NATURALIDADE_UF: TStringField
      FieldName = 'CLI_NATURALIDADE_UF'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCLI_NACIONALIDADE: TStringField
      FieldName = 'CLI_NACIONALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCLI_INSCRICAO: TStringField
      FieldName = 'CLI_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSCLI_DATA_CADASTRO: TSQLTimeStampField
      FieldName = 'CLI_DATA_CADASTRO'
    end
    object CDSCLI_EMISSAO_RG: TSQLTimeStampField
      FieldName = 'CLI_EMISSAO_RG'
    end
    object CDSCLI_DATA_NASC: TSQLTimeStampField
      FieldName = 'CLI_DATA_NASC'
    end
  end
end

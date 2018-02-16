inherited DmModelDav: TDmModelDav
  inherited DTS: TSQLDataSet
    CommandText = 
      'SELECT'#13#10'      '#9'VEN_ID, VEN_DATA, C.CLI_ID, C.CLI_NOME, VEN_TOTAL' +
      ', VEN_DESCONTO,'#13#10#9'    VEN_SITUACAO, VEN_OBSERVACAO'#13#10'       FROM'#13 +
      #10'      '#9'  VENDA V'#13#10'       LEFT JOIN'#13#10'         CLIENTES C ON V.CL' +
      'I_ID = C.CLI_ID'#13#10'       WHERE'#13#10'        CONVERT(VARCHAR(10), C.CL' +
      'I_ID) LIKE :CLI_ID AND'#13#10'        CONVERT(VARCHAR(10), VEN_ID) LIK' +
      'E :VEN_ID AND'#13#10'        VEN_DATA BETWEEN :DT_INICIAL AND :DT_FINA' +
      'L'
    Params = <
      item
        DataType = ftString
        Name = 'CLI_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FINAL'
        ParamType = ptInput
      end>
    object DTSVEN_ID: TIntegerField
      FieldName = 'VEN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object DTSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
      ProviderFlags = []
    end
    object DTSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSVEN_TOTAL: TFMTBCDField
      FieldName = 'VEN_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object DTSVEN_DESCONTO: TFMTBCDField
      FieldName = 'VEN_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object DTSVEN_SITUACAO: TStringField
      FieldName = 'VEN_SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object DTSVEN_OBSERVACAO: TStringField
      FieldName = 'VEN_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  inherited DSP: TDataSetProvider
    OnGetTableName = DSPGetTableName
    Top = 80
  end
  inherited CDS: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'CLI_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VEN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FINAL'
        ParamType = ptInput
      end>
    inherited CDSVEN_ID: TIntegerField
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    inherited CDSVEN_DATA: TSQLTimeStampField
      ProviderFlags = [pfInUpdate]
    end
    inherited CDSCLI_ID: TIntegerField
      ProviderFlags = []
    end
    inherited CDSVEN_TOTAL: TFMTBCDField
      ProviderFlags = [pfInUpdate]
    end
    inherited CDSVEN_DESCONTO: TFMTBCDField
      ProviderFlags = [pfInUpdate]
    end
    inherited CDSVEN_SITUACAO: TStringField
      ProviderFlags = [pfInUpdate]
    end
    inherited CDSVEN_OBSERVACAO: TStringField
      ProviderFlags = [pfInUpdate]
    end
    object CDSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  inherited DTSItem: TSQLDataSet
    CommandText = 
      'SELECT '#13#10#9'ITV_ID, VEN_ID,'#9'VEN_DATA, PRO_ID, ITV_REFER,'#13#10#9'ITV_QTD' +
      'E, ITV_DESCONTO,'#9'ITV_PRECOVENDA,'#13#10#9'ITV_VALORTOTAL,'#9'ITV_DATA, ITV' +
      '_UN, ITV_DESCRICAO'#13#10'FROM'#13#10#9'ITEM_VENDA'#13#10'WHERE'#13#10'                VE' +
      'N_ID = :VEN_ID'
    Params = <
      item
        DataType = ftInteger
        Name = 'VEN_ID'
        ParamType = ptInput
      end>
    object DTSItemITV_ID: TIntegerField
      FieldName = 'ITV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSItemVEN_ID: TIntegerField
      FieldName = 'VEN_ID'
    end
    object DTSItemVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
    object DTSItemPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
    end
    object DTSItemITV_REFER: TStringField
      FieldName = 'ITV_REFER'
    end
    object DTSItemITV_QTDE: TFMTBCDField
      FieldName = 'ITV_QTDE'
      Precision = 15
      Size = 3
    end
    object DTSItemITV_DESCONTO: TFMTBCDField
      FieldName = 'ITV_DESCONTO'
      Precision = 15
      Size = 2
    end
    object DTSItemITV_PRECOVENDA: TFMTBCDField
      FieldName = 'ITV_PRECOVENDA'
      Precision = 15
      Size = 3
    end
    object DTSItemITV_VALORTOTAL: TFMTBCDField
      FieldName = 'ITV_VALORTOTAL'
      Precision = 15
      Size = 2
    end
    object DTSItemITV_DATA: TSQLTimeStampField
      FieldName = 'ITV_DATA'
    end
    object DTSItemITV_UN: TStringField
      FieldName = 'ITV_UN'
      Size = 10
    end
    object DTSItemITV_DESCRICAO: TStringField
      FieldName = 'ITV_DESCRICAO'
      Size = 100
    end
  end
  inherited DSPItem: TDataSetProvider
    AfterUpdateRecord = DSPItemAfterUpdateRecord
  end
  inherited CDSItem: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'VEN_ID'
        ParamType = ptInput
      end>
    BeforePost = CDSItemBeforePost
    AfterPost = CDSItemAfterPost
    inherited CDSItemITV_ID: TIntegerField
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    inherited CDSItemITV_QTDE: TFMTBCDField
      DisplayFormat = '#,##0.000'
    end
    inherited CDSItemITV_DESCONTO: TFMTBCDField
      DisplayFormat = '#,##0.00'
    end
    inherited CDSItemITV_PRECOVENDA: TFMTBCDField
      DisplayFormat = '#,##0.00'
    end
    inherited CDSItemITV_VALORTOTAL: TFMTBCDField
      DisplayFormat = '#,##0.00'
    end
    inherited CDSItemITV_UN: TStringField
      Alignment = taCenter
    end
  end
end

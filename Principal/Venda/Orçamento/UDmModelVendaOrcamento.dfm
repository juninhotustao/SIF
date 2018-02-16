inherited DmModelVendaOrcamento: TDmModelVendaOrcamento
  OldCreateOrder = True
  Height = 345
  Width = 465
  inherited DTS: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'SELECT '#13#10#9'VEN_ID, VEN_DATA, CLI_ID, VEN_TOTAL, VEN_DESCONTO,'#13#10#9'V' +
      'EN_SITUACAO, VEN_OBSERVACAO'#13#10'FROM '#13#10#9'VENDA'
    object DTSVEN_ID: TIntegerField
      FieldName = 'VEN_ID'
    end
    object DTSVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
    object DTSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
    end
    object DTSVEN_TOTAL: TFMTBCDField
      FieldName = 'VEN_TOTAL'
      Precision = 15
      Size = 2
    end
    object DTSVEN_DESCONTO: TFMTBCDField
      FieldName = 'VEN_DESCONTO'
      Precision = 15
      Size = 2
    end
    object DTSVEN_SITUACAO: TStringField
      FieldName = 'VEN_SITUACAO'
      Size = 1
    end
    object DTSVEN_OBSERVACAO: TStringField
      FieldName = 'VEN_OBSERVACAO'
      Size = 1000
    end
  end
  inherited CDS: TClientDataSet
    object CDSVEN_ID: TIntegerField
      FieldName = 'VEN_ID'
    end
    object CDSVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
    object CDSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
    end
    object CDSVEN_TOTAL: TFMTBCDField
      FieldName = 'VEN_TOTAL'
      Precision = 15
      Size = 2
    end
    object CDSVEN_DESCONTO: TFMTBCDField
      FieldName = 'VEN_DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDSVEN_SITUACAO: TStringField
      FieldName = 'VEN_SITUACAO'
      Size = 1
    end
    object CDSVEN_OBSERVACAO: TStringField
      FieldName = 'VEN_OBSERVACAO'
      Size = 1000
    end
  end
  object DTSItem: TSQLDataSet
    SchemaName = 'sa'
    GetMetadata = False
    CommandText = 
      'SELECT '#13#10#9'ITV_ID, VEN_ID,'#9'VEN_DATA, PRO_ID, ITV_REFER,'#13#10#9'ITV_QTD' +
      'E, ITV_DESCONTO,'#9'ITV_PRECOVENDA,'#13#10#9'ITV_VALORTOTAL,'#9'ITV_DATA, ITV' +
      '_UN, ITV_DESCRICAO'#13#10'FROM'#13#10#9'ITEM_VENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmCon.Con
    Left = 144
    Top = 24
    object DTSItemITV_ID: TIntegerField
      FieldName = 'ITV_ID'
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
  object DSPItem: TDataSetProvider
    DataSet = DTSItem
    Options = [poFetchDetailsOnDemand, poAutoRefresh, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = DSPAfterUpdateRecord
    Left = 144
    Top = 72
  end
  object CDSItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItem'
    AfterPost = CDSAfterPost
    AfterDelete = CDSAfterDelete
    OnReconcileError = CDSReconcileError
    Left = 144
    Top = 128
    object CDSItemITV_ID: TIntegerField
      FieldName = 'ITV_ID'
    end
    object CDSItemVEN_ID: TIntegerField
      FieldName = 'VEN_ID'
    end
    object CDSItemVEN_DATA: TSQLTimeStampField
      FieldName = 'VEN_DATA'
    end
    object CDSItemPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
    end
    object CDSItemITV_REFER: TStringField
      FieldName = 'ITV_REFER'
    end
    object CDSItemITV_QTDE: TFMTBCDField
      FieldName = 'ITV_QTDE'
      Precision = 15
      Size = 3
    end
    object CDSItemITV_DESCONTO: TFMTBCDField
      FieldName = 'ITV_DESCONTO'
      Precision = 15
      Size = 2
    end
    object CDSItemITV_PRECOVENDA: TFMTBCDField
      FieldName = 'ITV_PRECOVENDA'
      Precision = 15
      Size = 3
    end
    object CDSItemITV_VALORTOTAL: TFMTBCDField
      FieldName = 'ITV_VALORTOTAL'
      Precision = 15
      Size = 2
    end
    object CDSItemITV_DATA: TSQLTimeStampField
      FieldName = 'ITV_DATA'
    end
    object CDSItemITV_UN: TStringField
      FieldName = 'ITV_UN'
      Size = 10
    end
    object CDSItemITV_DESCRICAO: TStringField
      FieldName = 'ITV_DESCRICAO'
      Size = 100
    end
  end
end

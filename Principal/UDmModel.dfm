object DmModel: TDmModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 205
  Width = 142
  object DTS: TSQLDataSet
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmCon.Con
    Left = 64
    Top = 24
  end
  object DSP: TDataSetProvider
    DataSet = DTS
    Options = [poFetchDetailsOnDemand, poAutoRefresh, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = DSPAfterUpdateRecord
    Left = 64
    Top = 72
  end
  object CDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    AfterPost = CDSAfterPost
    AfterDelete = CDSAfterDelete
    OnReconcileError = CDSReconcileError
    Left = 64
    Top = 128
  end
end

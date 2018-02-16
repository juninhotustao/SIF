object FConsulta: TFConsulta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 311
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 311
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Grid: TDBGrid
      Left = 0
      Top = 97
      Width = 539
      Height = 159
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GridDrawColumnCell
      OnKeyPress = GridKeyPress
      OnTitleClick = GridTitleClick
    end
    object pnlConsulta: TPanel
      Left = 0
      Top = 0
      Width = 539
      Height = 97
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 1
    end
    object pnlRodape: TPanel
      Left = 0
      Top = 256
      Width = 539
      Height = 55
      Align = alBottom
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        539
        55)
      object BtnNovo: TButton
        Left = 3
        Top = 7
        Width = 72
        Height = 40
        Anchors = [akLeft, akBottom]
        Caption = '&Novo'
        HotImageIndex = 48
        ImageIndex = 48
        TabOrder = 0
        OnClick = BtnNovoClick
      end
      object btnSair: TButton
        Left = 241
        Top = 7
        Width = 77
        Height = 40
        Anchors = [akLeft, akBottom]
        Caption = '&Sair'
        HotImageIndex = 29
        ImageIndex = 29
        TabOrder = 1
        OnClick = btnSairClick
      end
      object btnAlterar: TButton
        Left = 79
        Top = 7
        Width = 78
        Height = 40
        Anchors = [akLeft, akBottom]
        Caption = '&Alterar'
        HotImageIndex = 51
        ImageIndex = 51
        TabOrder = 2
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 161
        Top = 7
        Width = 78
        Height = 40
        Anchors = [akLeft, akBottom]
        Caption = '&Excluir'
        HotImageIndex = 59
        ImageIndex = 59
        TabOrder = 3
        OnClick = btnExcluirClick
      end
    end
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = CDS
    Left = 384
    Top = 200
  end
  object DTS: TSQLDataSet
    SchemaName = 'sa'
    GetMetadata = False
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmCon.Con
    Left = 384
    Top = 44
  end
  object DSP: TDataSetProvider
    DataSet = DTS
    Options = [poFetchDetailsOnDemand, poAutoRefresh, poPropogateChanges, poRetainServerOrder, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = DSPAfterUpdateRecord
    Left = 384
    Top = 95
  end
  object CDS: TClientDataSet
    Aggregates = <>
    IndexName = 'DEFAULT_ORDER'
    PacketRecords = 50
    Params = <>
    ProviderName = 'DSP'
    AfterInsert = CDSAfterInsert
    AfterPost = CDSAfterPost
    AfterDelete = CDSAfterDelete
    OnPostError = CDSPostError
    OnReconcileError = CDSReconcileError
    Left = 384
    Top = 148
  end
end

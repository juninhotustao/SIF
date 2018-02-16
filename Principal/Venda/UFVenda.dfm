object FVenda: TFVenda
  Left = 0
  Top = 0
  Caption = 'Venda Base'
  ClientHeight = 555
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 555
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblDescricaoTotalVenda: TLabel
      Left = 414
      Top = 370
      Width = 116
      Height = 18
      AutoSize = False
      Caption = 'Total da Venda: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalVenda: TLabel
      Left = 536
      Top = 371
      Width = 133
      Height = 17
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Grid: TDBGrid
      Left = 0
      Top = 395
      Width = 682
      Height = 160
      Align = alBottom
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnlConsulta: TPanel
      Left = 0
      Top = 47
      Width = 682
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnlRodape: TPanel
      Left = 0
      Top = 0
      Width = 682
      Height = 47
      Align = alTop
      TabOrder = 2
      DesignSize = (
        682
        47)
      object BtnNovo: TButton
        Left = 6
        Top = 5
        Width = 45
        Height = 34
        Anchors = [akLeft, akBottom]
        Caption = '&Novo'
        DisabledImageIndex = 4
        HotImageIndex = 75
        ImageAlignment = iaTop
        ImageIndex = 75
        Images = DmImagens.Img
        TabOrder = 0
        OnClick = BtnNovoClick
      end
      object btnSair: TButton
        Left = 257
        Top = 5
        Width = 45
        Height = 34
        Anchors = [akLeft, akBottom]
        Caption = '&Sair'
        HotImageIndex = 17
        ImageAlignment = iaTop
        ImageIndex = 17
        Images = DmImagens.Img
        TabOrder = 1
        OnClick = btnSairClick
      end
      object btnAlterar: TButton
        Left = 68
        Top = 5
        Width = 45
        Height = 34
        Anchors = [akLeft, akBottom]
        Caption = '&Alterar'
        HotImageIndex = 92
        ImageAlignment = iaTop
        ImageIndex = 92
        Images = DmImagens.Img
        TabOrder = 2
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 130
        Top = 5
        Width = 45
        Height = 34
        Anchors = [akLeft, akBottom]
        Caption = '&Excluir'
        HotImageIndex = 84
        ImageAlignment = iaTop
        ImageIndex = 84
        Images = DmImagens.Img
        TabOrder = 3
        OnClick = btnExcluirClick
      end
      object btnSalvar: TButton
        Left = 193
        Top = 5
        Width = 45
        Height = 34
        Anchors = [akLeft, akBottom]
        Caption = '&Salvar'
        HotImageIndex = 72
        ImageAlignment = iaTop
        ImageIndex = 72
        Images = DmImagens.Img
        TabOrder = 4
        OnClick = btnSalvarClick
      end
    end
    object gpCliente: TGroupBox
      Left = 9
      Top = 53
      Width = 659
      Height = 125
      TabOrder = 3
      object lblCliente: TLabel
        Left = 8
        Top = 11
        Width = 56
        Height = 18
        AutoSize = False
        Caption = 'Cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeCliente: TLabel
        Left = 154
        Top = 11
        Width = 492
        Height = 18
        AutoSize = False
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblData: TLabel
        Left = 8
        Top = 40
        Width = 102
        Height = 18
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNumVenda: TLabel
        Left = 184
        Top = 40
        Width = 97
        Height = 18
        AutoSize = False
        Caption = 'N'#186' Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dtDataVenda: TwwDBDateTimePicker
        Left = 8
        Top = 58
        Width = 158
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Tahoma'
        CalendarAttributes.Font.Style = []
        DataSource = DS
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
      end
      object dbNumVenda: TDBEdit
        Left = 184
        Top = 58
        Width = 97
        Height = 21
        DataSource = DS
        TabOrder = 2
      end
      object dbIdCliente: TDBEdit
        Left = 56
        Top = 10
        Width = 62
        Height = 21
        DataField = 'CLI_ID'
        DataSource = DS
        TabOrder = 0
      end
      object dbObservacao: TDBMemo
        Left = 399
        Top = 40
        Width = 248
        Height = 73
        DataSource = DS
        TabOrder = 3
        OnExit = dbObservacaoExit
      end
      object btnPesqCliente: TBitBtn
        Left = 124
        Top = 10
        Width = 24
        Height = 21
        Caption = '...'
        TabOrder = 4
      end
    end
    object btnNovoItem: TButton
      Left = 9
      Top = 217
      Width = 24
      Height = 25
      ImageAlignment = iaCenter
      ImageIndex = 75
      Images = DmImagens.Img
      TabOrder = 5
      OnClick = btnNovoItemClick
    end
    object btnAlterarItem: TButton
      Left = 39
      Top = 217
      Width = 24
      Height = 25
      ImageAlignment = iaCenter
      ImageIndex = 91
      Images = DmImagens.Img
      TabOrder = 6
      OnClick = btnAlterarItemClick
    end
    object btnExcluirItem: TButton
      Left = 68
      Top = 217
      Width = 24
      Height = 25
      ImageAlignment = iaCenter
      ImageIndex = 83
      Images = DmImagens.Img
      TabOrder = 7
      OnClick = btnExcluirItemClick
    end
    object btnCancelarItem: TButton
      Left = 127
      Top = 217
      Width = 24
      Height = 25
      ImageAlignment = iaCenter
      ImageIndex = 17
      Images = DmImagens.Img
      TabOrder = 8
      OnClick = btnCancelarItemClick
    end
    inline frameProdutoDavBase: TframeProduto
      Left = 6
      Top = 244
      Width = 665
      Height = 119
      TabOrder = 4
      ExplicitLeft = 6
      ExplicitTop = 244
      inherited gpProduto: TGroupBox
        inherited dbDesconto: TDBEdit
          DataSource = DsItem
        end
        inherited dbQuantidade: TDBEdit
          DataSource = DsItem
        end
        inherited dbTotalItem: TDBEdit
          DataSource = DsItem
        end
        inherited dbVlrVenda: TDBEdit
          DataSource = DsItem
        end
        inherited dbReferencia: TDBEdit
          DataSource = DsItem
          OnExit = frameProdutoDavBasedbReferenciaExit
        end
        inherited dbDescricaoProduto: TDBEdit
          DataSource = DsItem
        end
        inherited dbUnidade: TDBEdit
          DataSource = DsItem
        end
      end
    end
    object btnSalvarItem: TButton
      Left = 98
      Top = 217
      Width = 24
      Height = 25
      ImageAlignment = iaCenter
      ImageIndex = 72
      Images = DmImagens.Img
      TabOrder = 9
    end
  end
  object DsItem: TDataSource
    DataSet = DmModelVenda.CDSItem
    Left = 344
    Top = 432
  end
  object DS: TDataSource
    DataSet = DmModelVenda.CDS
    Left = 408
    Top = 432
  end
  object PopMenu: TPopupMenu
    Left = 216
    Top = 424
  end
end

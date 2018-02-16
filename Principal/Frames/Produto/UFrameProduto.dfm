object frameProduto: TframeProduto
  Left = 0
  Top = 0
  Width = 665
  Height = 119
  TabOrder = 0
  object gpProduto: TGroupBox
    Left = 3
    Top = 3
    Width = 659
    Height = 113
    TabOrder = 0
    object lblRefProduto: TLabel
      Left = 8
      Top = 17
      Width = 102
      Height = 18
      AutoSize = False
      Caption = 'Refer'#234'ncia: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblQuantidade: TLabel
      Left = 8
      Top = 54
      Width = 102
      Height = 18
      AutoSize = False
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDescricaoValorUnit: TLabel
      Left = 218
      Top = 54
      Width = 102
      Height = 18
      AutoSize = False
      Caption = 'Valor Unit.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDesconto: TLabel
      Left = 324
      Top = 54
      Width = 102
      Height = 18
      AutoSize = False
      Caption = 'Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDescricaoValorTotal: TLabel
      Left = 473
      Top = 54
      Width = 116
      Height = 18
      AutoSize = False
      Caption = 'Valor Total Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDescUnidade: TLabel
      Left = 141
      Top = 54
      Width = 52
      Height = 18
      AutoSize = False
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnPesqProduto: TBitBtn
      Left = 204
      Top = 14
      Width = 24
      Height = 21
      Caption = '...'
      TabOrder = 6
      OnClick = btnPesqProdutoClick
    end
    object dbDesconto: TDBEdit
      Left = 324
      Top = 76
      Width = 112
      Height = 21
      TabOrder = 4
      OnExit = dbDescontoExit
    end
    object dbQuantidade: TDBEdit
      Left = 8
      Top = 76
      Width = 112
      Height = 21
      TabOrder = 2
      OnExit = dbQuantidadeExit
    end
    object dbTotalItem: TDBEdit
      Left = 473
      Top = 76
      Width = 112
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object dbVlrVenda: TDBEdit
      Left = 218
      Top = 76
      Width = 89
      Height = 21
      TabOrder = 3
      OnExit = dbVlrVendaExit
    end
    object dbReferencia: TDBEdit
      Left = 83
      Top = 14
      Width = 112
      Height = 21
      TabOrder = 0
      OnExit = dbReferenciaExit
    end
    object dbDescricaoProduto: TDBEdit
      Left = 240
      Top = 14
      Width = 400
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object dbUnidade: TDBEdit
      Left = 141
      Top = 76
      Width = 57
      Height = 21
      Enabled = False
      TabOrder = 7
    end
  end
end

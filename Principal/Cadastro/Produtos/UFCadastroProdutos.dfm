inherited FCadastroProdutos: TFCadastroProdutos
  Caption = 'Cadastro de Produto'
  ClientHeight = 366
  ClientWidth = 707
  OnShow = FormShow
  ExplicitWidth = 713
  ExplicitHeight = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 328
    Width = 707
    Height = 38
    ExplicitTop = 314
    ExplicitWidth = 707
    ExplicitHeight = 38
    inherited btnConfirma: TButton
      Left = 243
      Top = 2
      ExplicitLeft = 243
      ExplicitTop = 2
    end
    inherited btnCancela: TButton
      Left = 363
      Top = 2
      ExplicitLeft = 363
      ExplicitTop = 2
    end
  end
  inherited pnlPrincipal: TPanel
    Width = 707
    Height = 328
    ExplicitWidth = 707
    ExplicitHeight = 314
    object gpCabecalho: TGroupBox
      Left = 1
      Top = 1
      Width = 705
      Height = 141
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 56
        Top = 105
        Width = 61
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object lblReferencia: TLabel
        Left = 51
        Top = 66
        Width = 66
        Height = 13
        Caption = 'Refer'#234'ncia:'
      end
      object lblData: TLabel
        Left = 29
        Top = 27
        Width = 88
        Height = 13
        Caption = 'Data Cadastro:'
      end
      object lblEstoque: TLabel
        Left = 284
        Top = 27
        Width = 54
        Height = 13
        Caption = 'Estoque: '
      end
      object lblEan: TLabel
        Left = 310
        Top = 66
        Width = 28
        Height = 13
        Caption = 'EAN:'
      end
      object edtEstoque: TDBEdit
        Left = 342
        Top = 24
        Width = 92
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'PRO_ESTOQUE'
        DataSource = DS
        Enabled = False
        TabOrder = 1
      end
      object edtDescricao: TDBEdit
        Left = 121
        Top = 102
        Width = 371
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'PRO_DESCRICAO'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edtReferencia: TDBEdit
        Left = 121
        Top = 63
        Width = 147
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'PRO_REFERENCIA'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnExit = edtReferenciaExit
      end
      object edtEan: TDBEdit
        Left = 342
        Top = 63
        Width = 147
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'PRO_EAN'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object data_lancto: TwwDBDateTimePicker
        Left = 121
        Top = 24
        Width = 107
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Tahoma'
        CalendarAttributes.Font.Style = []
        DataField = 'PRO_DATA_CADASTRO'
        DataSource = DS
        Date = 42863.000000000000000000
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
        DisplayFormat = 'dd/mm/yyyy'
      end
      object GroupBox1: TGroupBox
        Left = 551
        Top = 3
        Width = 146
        Height = 132
        Caption = 'Imagem'
        TabOrder = 5
      end
    end
    object pg_: TPageControl
      Left = 1
      Top = 142
      Width = 705
      Height = 185
      ActivePage = tabPrecos
      Align = alTop
      TabOrder = 1
      object tabPrecos: TTabSheet
        Caption = 'Dados do Produto'
        ExplicitHeight = 143
        object lblCusto: TLabel
          Left = 22
          Top = 22
          Width = 69
          Height = 13
          Caption = 'Pre'#231'o Custo'
        end
        object lblCustoReal: TLabel
          Left = 153
          Top = 22
          Width = 98
          Height = 13
          Caption = 'Pre'#231'o Custo Real'
        end
        object lblVenda: TLabel
          Left = 288
          Top = 22
          Width = 72
          Height = 13
          Caption = 'Pre'#231'o Venda'
        end
        object lblMedio: TLabel
          Left = 409
          Top = 22
          Width = 69
          Height = 13
          Caption = 'Pre'#231'o M'#233'dio'
        end
        object lblUnidade: TLabel
          Left = 533
          Top = 22
          Width = 46
          Height = 13
          Caption = 'Unidade'
        end
        object lblGrupo: TLabel
          Left = 22
          Top = 93
          Width = 35
          Height = 13
          Caption = 'Grupo'
        end
        object edtCusto: TDBEdit
          Left = 22
          Top = 39
          Width = 82
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'PRO_PRECO_CUSTO'
          DataSource = DS
          TabOrder = 0
        end
        object edtCustoReal: TDBEdit
          Left = 153
          Top = 39
          Width = 82
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'PRO_PRECO_CUSTO_REAL'
          DataSource = DS
          TabOrder = 1
        end
        object edtVenda: TDBEdit
          Left = 288
          Top = 39
          Width = 82
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'PRO_PRECO_VENDA'
          DataSource = DS
          TabOrder = 2
        end
        object edtMedio: TDBEdit
          Left = 409
          Top = 39
          Width = 82
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'PRO_PRECO_MEDIO_COMPRA'
          DataSource = DS
          TabOrder = 3
        end
        object edtUn: TDBEdit
          Left = 533
          Top = 39
          Width = 36
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataField = 'PRO_UN_ID'
          DataSource = DS
          TabOrder = 4
          OnExit = edtUnExit
        end
        object edtUnDescricao: TDBEdit
          Left = 573
          Top = 39
          Width = 115
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = cl3DLight
          DataField = 'DescricaoUnidade'
          DataSource = DS
          Enabled = False
          TabOrder = 5
        end
        object edtDepId: TDBEdit
          Left = 22
          Top = 112
          Width = 36
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DataSource = DS
          TabOrder = 6
        end
        object edtDepDescricao: TDBEdit
          Left = 62
          Top = 112
          Width = 226
          Height = 19
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = cl3DLight
          DataSource = DS
          TabOrder = 7
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = FConsultaProdutos.CDS
    Left = 464
    Top = 12
  end
end

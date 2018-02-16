inherited FCadastroProduto: TFCadastroProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 391
  ClientWidth = 466
  OnShow = FormShow
  ExplicitWidth = 472
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 342
    Width = 466
    Height = 49
    Align = alBottom
    ExplicitTop = 342
    ExplicitWidth = 466
    ExplicitHeight = 49
    DesignSize = (
      466
      49)
    inherited btnConfirma: TButton
      Left = 160
      Top = 4
      ExplicitLeft = 160
      ExplicitTop = 4
    end
    inherited btnCancela: TButton
      Left = 244
      Top = 4
      ExplicitLeft = 244
      ExplicitTop = 4
    end
  end
  inherited pnlPrincipal: TPanel
    Top = 0
    Width = 466
    Height = 342
    ExplicitTop = 0
    ExplicitWidth = 466
    ExplicitHeight = 342
    object Label3: TLabel
      Left = 16
      Top = 105
      Width = 65
      Height = 13
      Caption = 'Descri'#231#227'o: '
    end
    object lblReferencia: TLabel
      Left = 13
      Top = 66
      Width = 66
      Height = 13
      Caption = 'Refer'#234'ncia:'
    end
    object lblData: TLabel
      Left = 42
      Top = 27
      Width = 32
      Height = 13
      Caption = 'Data:'
    end
    object lblEstoque: TLabel
      Left = 246
      Top = 27
      Width = 54
      Height = 13
      Caption = 'Estoque: '
    end
    object lblEan: TLabel
      Left = 272
      Top = 66
      Width = 28
      Height = 13
      Caption = 'EAN:'
    end
    object edtEstoque: TDBEdit
      Left = 304
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
      TabOrder = 4
    end
    object edtDescricao: TDBEdit
      Left = 80
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
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtReferencia: TDBEdit
      Left = 80
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
      TabOrder = 1
      OnExit = edtReferenciaExit
    end
    object edtEan: TDBEdit
      Left = 304
      Top = 63
      Width = 147
      Height = 19
      BevelInner = bvNone
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'PRO_EAN'
      DataSource = DS
      TabOrder = 2
      OnExit = edtReferenciaExit
    end
    object data_lancto: TwwDBDateTimePicker
      Left = 80
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
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
      DisplayFormat = 'dd/mm/yyyy'
    end
    object pg_: TPageControl
      Left = 13
      Top = 137
      Width = 438
      Height = 193
      ActivePage = tabGeral
      TabOrder = 5
      object tabGeral: TTabSheet
        Caption = 'Geral'
        object lblCusto: TLabel
          Left = 23
          Top = 22
          Width = 42
          Height = 13
          Caption = 'Custo: '
        end
        object lblCustoReal: TLabel
          Left = 123
          Top = 22
          Width = 71
          Height = 13
          Caption = 'Custo Real: '
        end
        object lblVenda: TLabel
          Left = 224
          Top = 22
          Width = 61
          Height = 13
          Caption = 'Pr. Venda:'
        end
        object lblMedio: TLabel
          Left = 338
          Top = 22
          Width = 58
          Height = 13
          Caption = 'Pr. M'#233'dio:'
        end
        object lblUnidade: TLabel
          Left = 16
          Top = 97
          Width = 55
          Height = 13
          Caption = 'Unidade: '
        end
        object lblDepartamento: TLabel
          Left = 185
          Top = 97
          Width = 91
          Height = 13
          Caption = 'Departamento: '
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
          Left = 123
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
          Left = 224
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
          Left = 329
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
        object lkpUnidade: TDBLookupComboBox
          Left = 16
          Top = 116
          Width = 145
          Height = 21
          DataField = 'PRO_UN_ID'
          DataSource = DS
          KeyField = 'UN_ID'
          ListField = 'UN_CODIGO;UN_DESCRICAO'
          ListSource = DmModelProduto.DSUnidade
          TabOrder = 4
        end
        object lkpDepartamento: TDBLookupComboBox
          Left = 185
          Top = 116
          Width = 239
          Height = 21
          DataField = 'PRO_UN_ID'
          DataSource = DS
          TabOrder = 5
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelProduto.CDS
    Left = 144
    Top = 224
  end
end

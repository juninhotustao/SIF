inherited FCadastroFornecedor: TFCadastroFornecedor
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 365
  ClientWidth = 629
  ExplicitWidth = 635
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 332
    Width = 629
    ExplicitTop = 297
    ExplicitWidth = 530
    inherited btnConfirma: TButton
      Left = 205
      ExplicitLeft = 205
    end
    inherited btnCancela: TButton
      Left = 323
      ExplicitLeft = 323
    end
  end
  inherited pnlPrincipal: TPanel
    Width = 629
    Height = 332
    ExplicitWidth = 530
    ExplicitHeight = 297
    object gpEndereco: TGroupBox
      Left = 1
      Top = 157
      Width = 627
      Height = 172
      Align = alTop
      Caption = 'Endere'#231'o'
      TabOrder = 1
      ExplicitTop = 141
      ExplicitWidth = 626
      object Label100: TLabel
        Left = 482
        Top = 23
        Width = 20
        Height = 13
        Caption = 'Nr'#186':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label102: TLabel
        Left = 262
        Top = 108
        Width = 43
        Height = 13
        Caption = 'Estado:'
      end
      object Label103: TLabel
        Left = 482
        Top = 66
        Width = 28
        Height = 13
        Caption = 'CEP:'
      end
      object Label106: TLabel
        Left = 35
        Top = 66
        Width = 85
        Height = 13
        Caption = 'Complemento:'
      end
      object Label107: TLabel
        Left = 35
        Top = 23
        Width = 51
        Height = 13
        Caption = 'Rua/Av.:'
      end
      object Label108: TLabel
        Left = 230
        Top = 66
        Width = 40
        Height = 13
        Caption = 'Bairro:'
      end
      object Label104: TLabel
        Left = 35
        Top = 108
        Width = 45
        Height = 13
        Caption = 'Cidade:'
      end
      object edt_endereco: TDBEdit
        Left = 35
        Top = 37
        Width = 422
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_ENDERECO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edt_complemento: TDBEdit
        Left = 35
        Top = 81
        Width = 171
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_END_COMPLEMENTO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edt_numero: TDBEdit
        Left = 482
        Top = 37
        Width = 112
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_END_NUMERO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object comb_estado: TDBComboBox
        Left = 262
        Top = 123
        Width = 51
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_ESTADO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          'AC'
          'AM'
          'AP'
          'AL'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RN'
          'RO'
          'RR'
          'RS'
          'RJ'
          'SC'
          'SE'
          'SP'
          'TO'
          'EX')
        ParentFont = False
        TabOrder = 6
      end
      object edt_cep: TDBEdit
        Left = 482
        Top = 81
        Width = 112
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_CEP'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edt_cidade: TDBEdit
        Left = 35
        Top = 123
        Width = 206
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_CIDADE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edt_bairro: TDBEdit
        Left = 230
        Top = 81
        Width = 227
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_BAIRRO'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object gpDados: TGroupBox
      Left = 1
      Top = 1
      Width = 627
      Height = 156
      Align = alTop
      Caption = 'Informa'#231#245'es'
      Color = cl3DLight
      ParentColor = False
      TabOrder = 0
      ExplicitWidth = 626
      object lblCodigo: TLabel
        Left = 35
        Top = 22
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblIE: TLabel
        Left = 482
        Top = 66
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Insc. Estadual:'
        Enabled = False
      end
      object lblNome: TLabel
        Left = 35
        Top = 68
        Width = 38
        Height = 13
        Caption = 'Nome:'
      end
      object lb_cgc: TLabel
        Left = 481
        Top = 23
        Width = 34
        Height = 13
        Caption = 'CNPJ:'
        Enabled = False
      end
      object lb_cpf: TLabel
        Left = 374
        Top = 23
        Width = 27
        Height = 13
        Caption = 'CPF:'
      end
      object lblTelefone1: TLabel
        Left = 35
        Top = 105
        Width = 75
        Height = 13
        Caption = 'Telefone (1):'
      end
      object lblTelefone2: TLabel
        Left = 165
        Top = 105
        Width = 75
        Height = 13
        Caption = 'Telefone (2):'
      end
      object edt_codigo: TDBEdit
        Left = 35
        Top = 36
        Width = 97
        Height = 22
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_ID'
        DataSource = DS
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edt_inscricao: TDBEdit
        Left = 482
        Top = 82
        Width = 112
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_INSCRICAO'
        DataSource = DS
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 5
      end
      object edt_cpf: TDBEdit
        Left = 374
        Top = 36
        Width = 95
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_CPF'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edt_cgc: TDBEdit
        Left = 482
        Top = 36
        Width = 112
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_CNPJ'
        DataSource = DS
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edt_nome: TDBEdit
        Left = 35
        Top = 82
        Width = 383
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_NOME'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object rg_tipo: TDBRadioGroup
        Left = 172
        Top = 25
        Width = 165
        Height = 33
        Caption = 'Tipo Pessoa'
        Columns = 2
        DataField = 'FOR_TIPO_PES'
        DataSource = DS
        Items.Strings = (
          'F'#237'sica'
          'Jur'#237'dica')
        TabOrder = 1
        Values.Strings = (
          'F'
          'J')
        OnClick = rg_tipoClick
      end
      object edt_telefone: TDBEdit
        Left = 35
        Top = 119
        Width = 104
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_TELEFONE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnExit = edt_telefoneExit
      end
      object edt_telefone2: TDBEdit
        Left = 165
        Top = 119
        Width = 104
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'FOR_TELEFONE2'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnExit = edt_telefone2Exit
      end
    end
  end
  inherited DS: TDataSource
    AutoEdit = False
    DataSet = FConsultaFornecedor.CDS
    Left = 560
    Top = 267
  end
end

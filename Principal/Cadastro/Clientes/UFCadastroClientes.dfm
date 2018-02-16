inherited FCadastroClientes: TFCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 397
  ClientWidth = 550
  ExplicitWidth = 556
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 343
    Width = 550
    Height = 54
    ExplicitTop = 343
    ExplicitWidth = 550
    ExplicitHeight = 54
    inherited btnConfirma: TButton
      Left = 177
      Top = 12
      ExplicitLeft = 177
      ExplicitTop = 12
    end
    inherited btnCancela: TButton
      Left = 286
      Top = 12
      ExplicitLeft = 286
      ExplicitTop = 12
    end
  end
  inherited pnlPrincipal: TPanel
    Width = 550
    Height = 343
    ExplicitWidth = 550
    ExplicitHeight = 342
    object gpDados: TGroupBox
      Left = 1
      Top = 1
      Width = 548
      Height = 207
      Align = alTop
      Color = cl3DLight
      ParentColor = False
      TabOrder = 0
      object lblCodigo: TLabel
        Left = 7
        Top = 1
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
        Left = 427
        Top = 55
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Insc. Estadual:'
        Enabled = False
      end
      object lb_cgc: TLabel
        Left = 299
        Top = 55
        Width = 34
        Height = 13
        Caption = 'CNPJ:'
        Enabled = False
      end
      object lb_cpf: TLabel
        Left = 186
        Top = 55
        Width = 27
        Height = 13
        Caption = 'CPF:'
      end
      object lb_dtnasc: TLabel
        Left = 270
        Top = 106
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Nasc.:'
      end
      object lblRG: TLabel
        Left = 7
        Top = 160
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'RG:'
      end
      object lblDataEmissao: TLabel
        Left = 135
        Top = 160
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Emiss'#227'o RG'
      end
      object lblUF: TLabel
        Left = 369
        Top = 106
        Width = 19
        Height = 13
        Caption = 'UF:'
      end
      object lblNacionalidade: TLabel
        Left = 427
        Top = 106
        Width = 84
        Height = 13
        Caption = 'Nacionalidade:'
      end
      object lblEstadoCivil: TLabel
        Left = 7
        Top = 106
        Width = 72
        Height = 13
        Caption = 'Estado Civil:'
      end
      object lblNome: TLabel
        Left = 88
        Top = 6
        Width = 38
        Height = 13
        Caption = 'Nome:'
      end
      object lblNaturalidade: TLabel
        Left = 427
        Top = 6
        Width = 77
        Height = 13
        Caption = 'Naturalidade:'
      end
      object lblTelefone2: TLabel
        Left = 378
        Top = 160
        Width = 75
        Height = 13
        Caption = 'Telefone (2):'
      end
      object lblTelefone1: TLabel
        Left = 259
        Top = 160
        Width = 75
        Height = 13
        Caption = 'Telefone (1):'
      end
      object edt_codigo: TDBEdit
        Left = 5
        Top = 20
        Width = 77
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_ID'
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
        Left = 427
        Top = 68
        Width = 116
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_INSCRICAO'
        DataSource = DS
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 6
      end
      object edt_cpf: TDBEdit
        Left = 186
        Top = 68
        Width = 95
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_CPF'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edt_cgc: TDBEdit
        Left = 299
        Top = 68
        Width = 113
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_CNPJ'
        DataSource = DS
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object dt_nascimento: TwwDBDateTimePicker
        Left = 270
        Top = 120
        Width = 94
        Height = 21
        BevelKind = bkFlat
        BevelOuter = bvNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 16056319
        DataField = 'CLI_DATA_NASC'
        DataSource = DS
        Date = 23456.000000000000000000
        Epoch = 1950
        ShowButton = True
        TabOrder = 9
        DisplayFormat = 'dd/mm/yyyy'
      end
      object rgSexo: TDBRadioGroup
        Left = 103
        Top = 105
        Width = 161
        Height = 36
        Caption = 'Sexo'
        Columns = 2
        DataField = 'CLI_SEXO'
        DataSource = DS
        Items.Strings = (
          'Feminino'
          'Masculino')
        TabOrder = 8
        Values.Strings = (
          'F'
          'M')
      end
      object edtRG: TDBEdit
        Left = 7
        Top = 174
        Width = 116
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_RG'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 12
      end
      object rg_tipo: TDBRadioGroup
        Left = 7
        Top = 55
        Width = 165
        Height = 33
        Caption = 'Tipo Pessoa'
        Columns = 2
        DataField = 'CLI_TIPO_PES'
        DataSource = DS
        Items.Strings = (
          'F'#237'sica'
          'Jur'#237'dica')
        TabOrder = 3
        Values.Strings = (
          'F'
          'J')
        OnClick = rg_tipoClick
      end
      object cbUFNat: TDBComboBox
        Left = 369
        Top = 120
        Width = 52
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_NATURALIDADE_UF'
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
        TabOrder = 10
      end
      object edtNacionalidade: TDBEdit
        Left = 427
        Top = 124
        Width = 116
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_NACIONALIDADE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object cbEstadoCivil: TRzDBComboBox
        Left = 7
        Top = 120
        Width = 94
        Height = 21
        DataField = 'CLI_ESTADO_CIVIL'
        DataSource = DS
        Style = csDropDownList
        TabOrder = 7
        Items.Strings = (
          'Solteiro(a)'
          'Casado(a)'
          'Vi'#250'vo(a)'
          'Divorciado(a)')
        Values.Strings = (
          'Solteiro(a)'
          'Casado(a)'
          'Vi'#250'vo(a)'
          'Divorciado(a)')
      end
      object edtDataRG: TwwDBDateTimePicker
        Left = 135
        Top = 174
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 16056319
        DataField = 'CLI_EMISSAO_RG'
        DataSource = DS
        Date = 42103.000000000000000000
        Epoch = 1950
        ShowButton = True
        TabOrder = 13
        DisplayFormat = 'dd/mm/yyyy'
      end
      object edt_nome: TDBEdit
        Left = 88
        Top = 20
        Width = 330
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_NOME'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtNaturalidade: TDBEdit
        Left = 427
        Top = 20
        Width = 116
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_NATURALIDADE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edt_telefone: TDBEdit
        Left = 259
        Top = 174
        Width = 104
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_TELEFONE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnExit = edt_telefoneExit
      end
      object edt_telefone2: TDBEdit
        Left = 378
        Top = 174
        Width = 104
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_TELEFONE2'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnExit = edt_telefone2Exit
      end
    end
    object gpEndereco: TGroupBox
      Left = 1
      Top = 208
      Width = 548
      Height = 124
      Align = alTop
      Caption = 'Endere'#231'o'
      TabOrder = 1
      object Label100: TLabel
        Left = 462
        Top = 20
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
        Left = 399
        Top = 88
        Width = 43
        Height = 13
        Caption = 'Estado:'
      end
      object Label103: TLabel
        Left = 304
        Top = 88
        Width = 28
        Height = 13
        Caption = 'CEP:'
      end
      object Label104: TLabel
        Left = 44
        Top = 88
        Width = 45
        Height = 13
        Caption = 'Cidade:'
      end
      object Label106: TLabel
        Left = 4
        Top = 54
        Width = 85
        Height = 13
        Caption = 'Complemento:'
      end
      object Label107: TLabel
        Left = 38
        Top = 20
        Width = 51
        Height = 13
        Caption = 'Rua/Av.:'
      end
      object Label108: TLabel
        Left = 271
        Top = 54
        Width = 40
        Height = 13
        Caption = 'Bairro:'
      end
      object edt_endereco: TDBEdit
        Left = 93
        Top = 18
        Width = 366
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_ENDERECO'
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
        Left = 93
        Top = 52
        Width = 171
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_END_COMPLEMENTO'
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
        Left = 486
        Top = 18
        Width = 53
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_END_NUMERO'
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
        Left = 445
        Top = 83
        Width = 51
        Height = 21
        Style = csDropDownList
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_ESTADO'
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
        Left = 333
        Top = 87
        Width = 57
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_CEP'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edt_cidade: TDBEdit
        Left = 93
        Top = 87
        Width = 206
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_CIDADE'
        DataSource = DS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edt_bairro: TDBEdit
        Left = 316
        Top = 52
        Width = 223
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16056319
        DataField = 'CLI_BAIRRO'
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
  end
  inherited DS: TDataSource
    DataSet = DmModelClientes.CDS
    Left = 509
    Top = 159
  end
end

inherited FConsultaProdutos: TFConsultaProdutos
  Caption = 'Consulta de Produtos'
  ClientHeight = 457
  ClientWidth = 728
  OnCreate = FormCreate
  ExplicitWidth = 734
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 728
    Height = 457
    ExplicitWidth = 728
    ExplicitHeight = 457
    inherited Grid: TDBGrid
      Top = 151
      Width = 728
      Height = 251
      DataSource = DS
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 389
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_ESTOQUE'
          Title.Caption = 'Estoque'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_PRECO_CUSTO'
          Title.Caption = 'Custo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_PRECO_VENDA'
          Title.Caption = 'Pr. Venda'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 728
      Height = 151
      ExplicitWidth = 728
      ExplicitHeight = 151
      inherited btnPesquisar: TButton
        Left = 620
        Top = 47
        OnClick = btnPesquisarClick
        ExplicitLeft = 620
        ExplicitTop = 47
      end
      inherited gpPesquisar2: TGroupBox
        Width = 590
        Height = 123
        ExplicitWidth = 590
        ExplicitHeight = 123
        object lblTipoPesquisa: TLabel
          Left = 12
          Top = 57
          Width = 90
          Height = 13
          Caption = 'Tipo de Pesquisa : '
        end
        object lblPesquisar: TLabel
          Left = 249
          Top = 57
          Width = 53
          Height = 13
          Caption = 'Pesquisar: '
        end
        object Cmb_TipoPesquisa: TComboBox
          Left = 102
          Top = 54
          Width = 134
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 0
          Text = 'Descri'#231#227'o'
          Items.Strings = (
            'EAN'
            'Descri'#231#227'o'
            'Refer'#234'ncia')
        end
        object edtPesquisa: TEdit
          Left = 308
          Top = 54
          Width = 253
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
      end
    end
    inherited pnlRodape: TPanel
      Top = 402
      Width = 728
      ExplicitTop = 402
      ExplicitWidth = 728
    end
  end
  inherited DTS: TSQLDataSet
    CommandText = 
      'SELECT '#13#10#9'PRO_ID, PRO_DATA_CADASTRO, PRO_REFERENCIA, PRO_EAN, '#13#10 +
      #9'PRO_DESCRICAO, PRO_ESTOQUE, PRO_PRECO_CUSTO, '#13#10#9'PRO_PRECO_CUSTO' +
      '_REAL, PRO_PRECO_MEDIO_COMPRA, '#13#10#9'PRO_PRECO_VENDA, PRO_UN_ID, PR' +
      'O_GAVETA'#13#10'FROM '#13#10#9'PRODUTOS'
    object DTSPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSPRO_DATA_CADASTRO: TSQLTimeStampField
      FieldName = 'PRO_DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object DTSPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object DTSPRO_EAN: TStringField
      FieldName = 'PRO_EAN'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object DTSPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object DTSPRO_ESTOQUE: TFMTBCDField
      FieldName = 'PRO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object DTSPRO_PRECO_CUSTO: TFMTBCDField
      FieldName = 'PRO_PRECO_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object DTSPRO_PRECO_CUSTO_REAL: TFMTBCDField
      FieldName = 'PRO_PRECO_CUSTO_REAL'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object DTSPRO_PRECO_MEDIO_COMPRA: TFMTBCDField
      FieldName = 'PRO_PRECO_MEDIO_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object DTSPRO_PRECO_VENDA: TFMTBCDField
      FieldName = 'PRO_PRECO_VENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object DTSPRO_UN_ID: TIntegerField
      FieldName = 'PRO_UN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object DTSPRO_GAVETA: TStringField
      FieldName = 'PRO_GAVETA'
      Size = 30
    end
  end
  inherited CDS: TClientDataSet
    object CDSPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSPRO_DATA_CADASTRO: TSQLTimeStampField
      FieldName = 'PRO_DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object CDSPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object CDSPRO_EAN: TStringField
      FieldName = 'PRO_EAN'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object CDSPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object CDSPRO_ESTOQUE: TFMTBCDField
      FieldName = 'PRO_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,###0.000'
      Precision = 9
      Size = 3
    end
    object CDSPRO_PRECO_CUSTO: TFMTBCDField
      FieldName = 'PRO_PRECO_CUSTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 3
    end
    object CDSPRO_PRECO_CUSTO_REAL: TFMTBCDField
      FieldName = 'PRO_PRECO_CUSTO_REAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 3
    end
    object CDSPRO_PRECO_MEDIO_COMPRA: TFMTBCDField
      FieldName = 'PRO_PRECO_MEDIO_COMPRA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 3
    end
    object CDSPRO_PRECO_VENDA: TFMTBCDField
      FieldName = 'PRO_PRECO_VENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 3
    end
    object CDSPRO_UN_ID: TIntegerField
      FieldName = 'PRO_UN_ID'
      ProviderFlags = [pfInUpdate]
    end
    object CDSDescricaoUnidade: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DescricaoUnidade'
      ProviderFlags = []
      Size = 50
    end
    object CDSPRO_GAVETA: TStringField
      FieldName = 'PRO_GAVETA'
      Size = 30
    end
  end
end

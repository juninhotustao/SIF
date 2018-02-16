inherited FConsultaFornecedor: TFConsultaFornecedor
  Caption = 'Consulta de Fornecedores'
  ClientHeight = 367
  ClientWidth = 685
  OnCreate = FormCreate
  ExplicitWidth = 691
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 685
    Height = 367
    ExplicitWidth = 670
    inherited Grid: TDBGrid
      Width = 685
      Height = 215
      DataSource = DS
      Columns = <
        item
          Expanded = False
          FieldName = 'FOR_ID'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOR_NOME'
          Title.Caption = 'Nome'
          Width = 311
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOR_TELEFONE'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FOR_CIDADE'
          Title.Caption = 'Cidade'
          Width = 151
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 685
      ExplicitWidth = 670
      inherited btnPesquisar: TButton
        Left = 578
        Top = 21
        OnClick = btnPesquisarClick
        ExplicitLeft = 578
        ExplicitTop = 21
      end
      inherited gpPesquisar2: TGroupBox
        Left = 11
        Top = 7
        Width = 558
        ExplicitLeft = 11
        ExplicitTop = 7
        ExplicitWidth = 558
        object lblTipoPesquisa: TLabel
          Left = 7
          Top = 31
          Width = 90
          Height = 13
          Caption = 'Tipo de Pesquisa : '
        end
        object lbl_TextoPesquisa: TLabel
          Left = 237
          Top = 31
          Width = 75
          Height = 13
          Caption = 'Pesquisar por : '
        end
        object Cmb_TipoPesquisa: TComboBox
          Left = 98
          Top = 28
          Width = 134
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'Nome'
          Items.Strings = (
            'Nome'
            'C'#243'digo'
            'Cidade')
        end
        object Edt_Conteudo: TEdit
          Left = 312
          Top = 28
          Width = 235
          Height = 21
          TabOrder = 1
        end
      end
    end
    inherited pnlRodape: TPanel
      Top = 312
      Width = 685
      ExplicitWidth = 670
    end
  end
  inherited DS: TDataSource
    Left = 624
    Top = 264
  end
  inherited DTS: TSQLDataSet
    CommandText = 'SELECT * FROM FORNECEDORES'
    Left = 624
    Top = 108
    object DTSFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSFOR_TIPO_PES: TStringField
      FieldName = 'FOR_TIPO_PES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object DTSFOR_CPF: TStringField
      FieldName = 'FOR_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_CNPJ: TStringField
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_INSCRICAO: TStringField
      FieldName = 'FOR_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSFOR_TELEFONE: TStringField
      FieldName = 'FOR_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_TELEFONE2: TStringField
      FieldName = 'FOR_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object DTSFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object DTSFOR_END_NUMERO: TStringField
      FieldName = 'FOR_END_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object DTSFOR_END_COMPLEMENTO: TStringField
      FieldName = 'FOR_END_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSFOR_ESTADO: TStringField
      FieldName = 'FOR_ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object DTSFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object DTSFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  inherited DSP: TDataSetProvider
    Left = 624
    Top = 159
  end
  inherited CDS: TClientDataSet
    Left = 624
    Top = 212
    object CDSFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSFOR_TIPO_PES: TStringField
      FieldName = 'FOR_TIPO_PES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object CDSFOR_CPF: TStringField
      FieldName = 'FOR_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSFOR_CNPJ: TStringField
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSFOR_INSCRICAO: TStringField
      FieldName = 'FOR_INSCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSFOR_TELEFONE: TStringField
      FieldName = 'FOR_TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSFOR_TELEFONE2: TStringField
      FieldName = 'FOR_TELEFONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object CDSFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSFOR_END_NUMERO: TStringField
      FieldName = 'FOR_END_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object CDSFOR_END_COMPLEMENTO: TStringField
      FieldName = 'FOR_END_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSFOR_ESTADO: TStringField
      FieldName = 'FOR_ESTADO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object CDSFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CDSFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
end

inherited FConsultaFornecedor: TFConsultaFornecedor
  Caption = 'Consulta de Fornecedores'
  ClientWidth = 670
  OnCreate = FormCreate
  ExplicitWidth = 676
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 670
    ExplicitWidth = 670
    inherited Grid: TDBGrid
      Width = 670
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
      Width = 670
      ExplicitWidth = 670
      object gpPesquisar: TGroupBox
        Left = 4
        Top = 12
        Width = 659
        Height = 64
        Caption = 'Pesquisar'
        TabOrder = 0
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
        object Edt_Conteudo: TEdit
          Left = 312
          Top = 28
          Width = 258
          Height = 21
          TabOrder = 1
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
        object btnPesquisar: TButton
          Left = 575
          Top = 17
          Width = 79
          Height = 42
          Caption = '&Pesquisar'
          TabOrder = 2
          OnClick = btnPesquisarClick
        end
      end
    end
    inherited pnlRodape: TPanel
      Width = 670
      ExplicitWidth = 670
      inherited BtnNovo: TButton
        OnClick = BtnNovoClick
      end
      inherited btnAlterar: TButton
        OnClick = btnAlterarClick
      end
      inherited btnExcluir: TButton
        OnClick = btnExcluirClick
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelFornecedor.CDS
  end
end

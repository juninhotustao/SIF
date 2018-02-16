inherited FConsultaProduto: TFConsultaProduto
  Caption = 'Consulta de Produto'
  ClientHeight = 457
  ClientWidth = 728
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
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
      Width = 728
      Height = 313
      DataSource = DS
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 389
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_ESTOQUE'
          Title.Caption = 'Estoque'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_PRECO_CUSTO'
          Title.Caption = 'Custo'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_PRECO_VENDA'
          Title.Caption = 'Pr. Venda'
          Width = 71
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 728
      ExplicitWidth = 728
      object groupPesquisa: TGroupBox
        Left = 0
        Top = 0
        Width = 728
        Height = 97
        Align = alClient
        TabOrder = 0
        object lblPesquisar: TLabel
          Left = 246
          Top = 43
          Width = 53
          Height = 13
          Caption = 'Pesquisar: '
        end
        object lblTipoPesquisa: TLabel
          Left = 7
          Top = 22
          Width = 90
          Height = 13
          Caption = 'Tipo de Pesquisa : '
        end
        object btnPesquisar: TButton
          Left = 622
          Top = 22
          Width = 100
          Height = 48
          Caption = '&Pesquisar'
          HotImageIndex = 11
          ImageIndex = 11
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
        object edtPesquisa: TEdit
          Left = 301
          Top = 40
          Width = 301
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyPress = edtPesquisaKeyPress
        end
        object Cmb_TipoPesquisa: TComboBox
          Left = 8
          Top = 40
          Width = 230
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 2
          Text = 'Descri'#231#227'o'
          Items.Strings = (
            'EAN'
            'Descri'#231#227'o'
            'Refer'#234'ncia')
        end
      end
    end
    inherited pnlRodape: TPanel
      Top = 410
      Width = 728
      ExplicitTop = 410
      ExplicitWidth = 728
      inherited BtnNovo: TButton
        Left = 1
        OnClick = BtnNovoClick
        ExplicitLeft = 1
      end
      inherited btnSair: TButton
        Left = 236
        ExplicitLeft = 236
      end
      inherited btnAlterar: TButton
        Left = 76
        OnClick = btnAlterarClick
        ExplicitLeft = 76
      end
      inherited btnExcluir: TButton
        Left = 156
        OnClick = btnExcluirClick
        ExplicitLeft = 156
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelProduto.CDS
  end
end

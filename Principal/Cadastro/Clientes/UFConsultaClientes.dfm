inherited FConsultaClientes: TFConsultaClientes
  Caption = 'Consulta de Clientes'
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
      Top = 83
      Width = 670
      Height = 181
      DataSource = DS
      Columns = <
        item
          Expanded = False
          FieldName = 'CLI_ID'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NOME'
          Title.Caption = 'Nome'
          Width = 311
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_TELEFONE'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_CIDADE'
          Title.Caption = 'Cidade'
          Width = 144
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 670
      Height = 83
      ExplicitWidth = 670
      ExplicitHeight = 83
      object gpPesquisar: TGroupBox
        Left = 7
        Top = 4
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
          Left = 254
          Top = 31
          Width = 75
          Height = 13
          Caption = 'Pesquisar por : '
        end
        object Edt_Conteudo: TEdit
          Left = 332
          Top = 28
          Width = 240
          Height = 21
          TabOrder = 1
        end
        object Cmb_TipoPesquisa: TComboBox
          Left = 98
          Top = 28
          Width = 147
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
          Top = 18
          Width = 78
          Height = 41
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
        Left = 4
        Top = 6
        OnClick = BtnNovoClick
        ExplicitLeft = 4
        ExplicitTop = 6
      end
      inherited btnSair: TButton
        Left = 244
        Top = 6
        ExplicitLeft = 244
        ExplicitTop = 6
      end
      inherited btnAlterar: TButton
        Left = 81
        Top = 6
        OnClick = btnAlterarClick
        ExplicitLeft = 81
        ExplicitTop = 6
      end
      inherited btnExcluir: TButton
        Left = 163
        Top = 6
        OnClick = btnExcluirClick
        ExplicitLeft = 163
        ExplicitTop = 6
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelClientes.CDS
  end
  object DsPesquisa: TDataSource
    Left = 40
    Top = 136
  end
end

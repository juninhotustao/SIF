inherited FConsultaUnidade: TFConsultaUnidade
  Caption = 'Consulta Unidades'
  ClientHeight = 376
  ClientWidth = 605
  OnCreate = FormCreate
  ExplicitWidth = 611
  ExplicitHeight = 404
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 605
    Height = 376
    ExplicitWidth = 605
    ExplicitHeight = 376
    inherited Grid: TDBGrid
      Width = 605
      Height = 224
      Color = clBtnFace
      DataSource = DS
      ParentCtl3D = False
      Columns = <
        item
          Expanded = False
          FieldName = 'UN_ID'
          Title.Caption = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'UN_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UN_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 380
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 605
      ExplicitWidth = 605
      object groupPesquisa: TGroupBox [0]
        Left = 0
        Top = 0
        Width = 605
        Height = 97
        Align = alClient
        TabOrder = 0
      end
      inherited btnPesquisar: TButton
        Left = 492
        TabOrder = 1
        OnClick = btnPesquisarClick
        ExplicitLeft = 492
      end
      inherited gpPesquisar2: TGroupBox
        Left = 10
        Top = 8
        Width = 476
        TabOrder = 2
        ExplicitLeft = 10
        ExplicitTop = 8
        ExplicitWidth = 476
        object lblPesquisar: TLabel
          Left = 156
          Top = 40
          Width = 53
          Height = 13
          Caption = 'Pesquisar: '
        end
        object lblTipoPesquisa: TLabel
          Left = 9
          Top = 19
          Width = 90
          Height = 13
          Caption = 'Tipo de Pesquisa : '
        end
        object edtPesquisa: TEdit
          Left = 211
          Top = 37
          Width = 252
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object Cmb_TipoPesquisa: TComboBox
          Left = 9
          Top = 37
          Width = 142
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'C'#243'digo'
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
        end
      end
    end
    inherited pnlRodape: TPanel
      Top = 321
      Width = 605
      ExplicitTop = 321
      ExplicitWidth = 605
    end
  end
  inherited DTS: TSQLDataSet
    CommandText = 
      'SELECT '#13#10#9'UN_ID, UN_CODIGO, UN_DESCRICAO '#13#10'FROM '#13#10#9'UNIDADE '#13#10'WHE' +
      'RE '#13#10#9'UN_CODIGO LIKE :UN_CODIGO AND UN_DESCRICAO LIKE :UN_DESCRI' +
      'CAO'
    Params = <
      item
        DataType = ftString
        Name = 'UN_CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UN_DESCRICAO'
        ParamType = ptInput
      end>
    object DTSUN_ID: TIntegerField
      FieldName = 'UN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSUN_CODIGO: TStringField
      FieldName = 'UN_CODIGO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object DTSUN_DESCRICAO: TStringField
      FieldName = 'UN_DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited CDS: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'UN_CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UN_DESCRICAO'
        ParamType = ptInput
      end>
    object CDSUN_ID: TIntegerField
      FieldName = 'UN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSUN_CODIGO: TStringField
      FieldName = 'UN_CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object CDSUN_DESCRICAO: TStringField
      FieldName = 'UN_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end

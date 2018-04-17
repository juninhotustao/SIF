inherited FConsultaGrupos: TFConsultaGrupos
  Caption = 'Consulta de Grupos'
  ClientWidth = 616
  OnCreate = FormCreate
  ExplicitWidth = 622
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 616
    inherited Grid: TDBGrid
      Top = 118
      Width = 616
      Height = 250
      DataSource = DS
      Columns = <
        item
          Expanded = False
          FieldName = 'GRP_ID'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRP_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 364
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 616
      Height = 118
      ExplicitWidth = 561
      ExplicitHeight = 118
      inherited btnPesquisar: TButton
        Left = 504
        Top = 25
        OnClick = btnPesquisarClick
        ExplicitLeft = 504
        ExplicitTop = 25
      end
      inherited gpPesquisar2: TGroupBox
        Width = 477
        Height = 79
        ExplicitWidth = 477
        ExplicitHeight = 79
        object lblPesquisar: TLabel
          Left = 157
          Top = 43
          Width = 53
          Height = 13
          Caption = 'Pesquisar: '
        end
        object lblTipoPesquisa: TLabel
          Left = 10
          Top = 22
          Width = 90
          Height = 13
          Caption = 'Tipo de Pesquisa : '
        end
        object edtPesquisa: TEdit
          Left = 211
          Top = 40
          Width = 252
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object Cmb_TipoPesquisa: TComboBox
          Left = 10
          Top = 40
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
      Width = 616
    end
  end
  inherited DTS: TSQLDataSet
    CommandText = 
      'SELECT '#13#10#9'GRP_ID, GRP_DESCRICAO '#13#10'FROM '#13#10#9'GRUPO'#13#10'WHERE '#13#10#9'CONVER' +
      'T(VARCHAR(10),  GRP_ID) LIKE :GRP_ID AND GRP_DESCRICAO LIKE :GRP' +
      '_DESCRICAO'
    Params = <
      item
        DataType = ftString
        Name = 'GRP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRP_DESCRICAO'
        ParamType = ptInput
      end>
    object DTSGRP_ID: TIntegerField
      FieldName = 'GRP_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object DTSGRP_DESCRICAO: TStringField
      FieldName = 'GRP_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  inherited CDS: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'GRP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GRP_DESCRICAO'
        ParamType = ptInput
      end>
    object CDSGRP_ID: TIntegerField
      FieldName = 'GRP_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSGRP_DESCRICAO: TStringField
      FieldName = 'GRP_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
end

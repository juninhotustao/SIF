inherited FConsultaUnidade: TFConsultaUnidade
  Caption = 'Consulta Unidades'
  ClientHeight = 453
  ClientWidth = 624
  OnCreate = FormCreate
  ExplicitWidth = 630
  ExplicitHeight = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 624
    Height = 453
    ExplicitWidth = 624
    ExplicitHeight = 453
    inherited Grid: TDBGrid
      Top = 137
      Width = 624
      Height = 261
      Color = clBtnFace
      DataSource = DS
      ParentCtl3D = False
      Columns = <
        item
          Expanded = False
          FieldName = 'UN_CODIGO'
          Title.Caption = 'C'#243'digo'
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
          FieldName = 'UN_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 380
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 624
      Height = 137
      ExplicitWidth = 624
      ExplicitHeight = 137
      inherited btnPesquisar: TButton
        Left = 511
        Top = 37
        OnClick = btnPesquisarClick
        ExplicitLeft = 511
        ExplicitTop = 37
      end
      inherited gpPesquisar2: TGroupBox
        Left = 17
        Top = 13
        Width = 484
        Height = 92
        ExplicitLeft = 17
        ExplicitTop = 13
        ExplicitWidth = 484
        ExplicitHeight = 92
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
          Left = 212
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
      Top = 398
      Width = 624
      ExplicitTop = 398
      ExplicitWidth = 624
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

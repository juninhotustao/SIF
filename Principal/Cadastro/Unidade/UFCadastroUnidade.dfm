inherited FCadastroUnidade: TFCadastroUnidade
  Caption = 'Cadastro Unidade'
  ClientHeight = 181
  ExplicitHeight = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 148
    ExplicitTop = 148
  end
  inherited pnlPrincipal: TPanel
    Height = 148
    ExplicitHeight = 148
    object gpGeral: TGroupBox
      Left = 1
      Top = 1
      Width = 403
      Height = 146
      Align = alClient
      Caption = 'Dados Unidade'
      TabOrder = 0
      ExplicitLeft = 80
      ExplicitTop = 37
      ExplicitWidth = 185
      ExplicitHeight = 105
      object lblCodigo: TLabel
        Left = 23
        Top = 39
        Width = 45
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object lblDescricao: TLabel
        Left = 7
        Top = 79
        Width = 61
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object dbCodigo: TDBEdit
        Left = 74
        Top = 36
        Width = 87
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'UN_CODIGO'
        DataSource = DS
        TabOrder = 0
      end
      object dbDescricao: TDBEdit
        Left = 74
        Top = 76
        Width = 317
        Height = 19
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'UN_DESCRICAO'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited DS: TDataSource
    AutoEdit = False
    DataSet = FConsultaUnidade.CDS
    Left = 344
    Top = 112
  end
end

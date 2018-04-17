inherited FCadastroGrupos: TFCadastroGrupos
  Caption = 'Cadastro de Grupos'
  ClientHeight = 176
  ExplicitWidth = 411
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 143
  end
  inherited pnlPrincipal: TPanel
    Height = 143
    object gpGeral: TGroupBox
      Left = 1
      Top = 1
      Width = 403
      Height = 141
      Align = alClient
      Caption = 'Dados'
      TabOrder = 0
      ExplicitHeight = 146
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
        DataField = 'GRP_ID'
        DataSource = DS
        Enabled = False
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
        DataField = 'GRP_DESCRICAO'
        DataSource = DS
        TabOrder = 1
      end
    end
  end
  inherited DS: TDataSource
    DataSet = FConsultaGrupos.CDS
  end
end

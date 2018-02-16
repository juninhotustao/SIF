inherited FVendaBase: TFVendaBase
  Caption = 'FVendaBase'
  ClientHeight = 486
  ClientWidth = 676
  PopupMenu = PopMenu
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 682
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 676
    Height = 486
    ExplicitWidth = 676
    ExplicitHeight = 486
    object lblDescricaoTotalVenda: TLabel [0]
      Left = 472
      Top = 296
      Width = 116
      Height = 18
      AutoSize = False
      Caption = 'Total da Venda: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalVenda: TLabel [1]
      Left = 594
      Top = 296
      Width = 180
      Height = 18
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Grid: TDBGrid
      Top = 326
      Width = 676
      Height = 160
      Align = alBottom
    end
    inherited pnlConsulta: TPanel
      Top = 47
      Width = 676
      Height = 10
      ExplicitTop = 47
      ExplicitWidth = 676
      ExplicitHeight = 10
    end
    inherited pnlRodape: TPanel
      Top = 0
      Width = 676
      Align = alTop
      ExplicitTop = 0
      ExplicitWidth = 676
      DesignSize = (
        676
        47)
      inherited BtnNovo: TButton
        Left = 6
        Top = 5
        Width = 45
        Height = 34
        OnClick = BtnNovoClick
        ExplicitLeft = 6
        ExplicitTop = 5
        ExplicitWidth = 45
        ExplicitHeight = 34
      end
      inherited btnSair: TButton
        Left = 257
        Top = 5
        Width = 45
        Height = 34
        ExplicitLeft = 257
        ExplicitTop = 5
        ExplicitWidth = 45
        ExplicitHeight = 34
      end
      inherited btnAlterar: TButton
        Left = 68
        Top = 5
        Width = 45
        Height = 34
        ExplicitLeft = 68
        ExplicitTop = 5
        ExplicitWidth = 45
        ExplicitHeight = 34
      end
      inherited btnExcluir: TButton
        Left = 130
        Top = 5
        Width = 45
        Height = 34
        ExplicitLeft = 130
        ExplicitTop = 5
        ExplicitWidth = 45
        ExplicitHeight = 34
      end
      object btnSalvar: TButton
        Left = 193
        Top = 5
        Width = 45
        Height = 34
        Anchors = [akLeft, akBottom]
        Caption = '&Salvar'
        HotImageIndex = 72
        ImageAlignment = iaTop
        ImageIndex = 72
        Images = DmImagens.Img
        TabOrder = 4
      end
    end
    object gpCliente: TGroupBox
      Left = 6
      Top = 53
      Width = 659
      Height = 156
      TabOrder = 3
      object lblCliente: TLabel
        Left = 8
        Top = 11
        Width = 56
        Height = 18
        AutoSize = False
        Caption = 'Cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeCliente: TLabel
        Left = 154
        Top = 11
        Width = 492
        Height = 18
        AutoSize = False
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblData: TLabel
        Left = 8
        Top = 40
        Width = 102
        Height = 18
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNumVenda: TLabel
        Left = 178
        Top = 40
        Width = 97
        Height = 18
        AutoSize = False
        Caption = 'N'#186' Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dtDataVenda: TwwDBDateTimePicker
        Left = 8
        Top = 58
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'Tahoma'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
      end
      object dbNumVenda: TDBEdit
        Left = 178
        Top = 58
        Width = 97
        Height = 21
        TabOrder = 1
      end
      object dbIdCliente: TDBEdit
        Left = 56
        Top = 10
        Width = 62
        Height = 21
        DataField = 'CLI_ID'
        DataSource = DS
        Enabled = False
        TabOrder = 2
        OnExit = dbIdClienteExit
      end
      object dbObservacao: TDBMemo
        Left = 399
        Top = 40
        Width = 248
        Height = 73
        TabOrder = 3
      end
      object btnPesqCliente: TBitBtn
        Left = 124
        Top = 10
        Width = 24
        Height = 21
        Caption = '...'
        TabOrder = 4
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelDav.CDS
    Left = 440
    Top = 344
  end
  object DsItem: TDataSource
    Left = 376
    Top = 344
  end
  object PopMenu: TPopupMenu
    Left = 256
    Top = 248
  end
end

object frm_PesqBase: Tfrm_PesqBase
  Left = 624
  Top = 162
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frm_PesqBase'
  ClientHeight = 406
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 406
    Align = alClient
    BevelOuter = bvNone
    Color = cl3DLight
    TabOrder = 0
    ExplicitWidth = 687
    ExplicitHeight = 415
    object Grid: TDBGrid
      Left = 0
      Top = 0
      Width = 593
      Height = 350
      Align = alClient
      Color = 16056319
      DataSource = DS
      FixedColor = cl3DLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = GridDrawColumnCell
      OnDblClick = GridDblClick
      OnKeyPress = GridKeyPress
    end
    object pnlBusca: TPanel
      Left = 0
      Top = 350
      Width = 593
      Height = 56
      Align = alBottom
      Color = cl3DLight
      TabOrder = 1
      ExplicitWidth = 687
      DesignSize = (
        593
        56)
      object lblDescricaoBusca: TLabel
        Left = 117
        Top = 6
        Width = 36
        Height = 14
        Alignment = taRightJustify
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTipoBusca: TLabel
        Left = 3
        Top = 6
        Width = 81
        Height = 14
        Alignment = taRightJustify
        Caption = 'Tipo de Busca:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edt_pesq: TEdit
        Left = 117
        Top = 26
        Width = 376
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edt_pesqKeyDown
        OnKeyPress = edt_pesqKeyPress
      end
      object cmbTipoBusca: TComboBox
        Left = 3
        Top = 26
        Width = 104
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object btnPesquisar: TButton
        Left = 499
        Top = 16
        Width = 84
        Height = 31
        Anchors = [akLeft, akBottom]
        Caption = '&Pesquisar'
        ImageIndex = 42
        Images = DmImagens.Img
        TabOrder = 2
        OnClick = btnPesquisarClick
      end
    end
  end
  object DS: TDataSource
    Left = 354
    Top = 154
  end
end

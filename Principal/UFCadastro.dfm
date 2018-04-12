object FCadastro: TFCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FCadastro'
  ClientHeight = 306
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 273
    Width = 405
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Color = clScrollBar
    ParentBackground = False
    TabOrder = 1
    object btnConfirma: TButton
      Left = 100
      Top = 1
      Width = 101
      Height = 31
      Hint = 'Gravar Registro'
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      HotImageIndex = 41
      ImageIndex = 41
      Images = DmImagens.Img
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnConfirmaClick
    end
    object btnCancela: TButton
      Left = 218
      Top = 1
      Width = 101
      Height = 31
      Hint = 'Cancelar Altera'#231#245'es'
      Caption = 'Cancelar'
      HotImageIndex = 32
      ImageIndex = 32
      Images = DmImagens.Img
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelaClick
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 273
    Align = alClient
    Color = cl3DLight
    ParentBackground = False
    TabOrder = 0
  end
  object DS: TDataSource
    Left = 328
    Top = 16
  end
end

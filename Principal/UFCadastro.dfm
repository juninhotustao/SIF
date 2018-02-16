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
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 0
    object btnConfirma: TButton
      Left = 1
      Top = 1
      Width = 76
      Height = 31
      Hint = 'Gravar Registro'
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      HotImageIndex = 38
      ImageAlignment = iaCenter
      ImageIndex = 38
      Images = DmImagens.Img
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnConfirmaClick
    end
    object btnCancela: TButton
      Left = 77
      Top = 1
      Width = 76
      Height = 31
      Hint = 'Cancelar Altera'#231#245'es'
      Align = alLeft
      HotImageIndex = 33
      ImageAlignment = iaCenter
      ImageIndex = 33
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
    TabOrder = 0
    ExplicitTop = 33
  end
  object DS: TDataSource
    Left = 328
    Top = 16
  end
end

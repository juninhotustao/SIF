object FrameCliente: TFrameCliente
  Left = 0
  Top = 0
  Width = 557
  Height = 63
  TabOrder = 0
  object gpCliente: TGroupBox
    Left = 6
    Top = 2
    Width = 547
    Height = 54
    TabOrder = 0
    object lblCodCliente: TLabel
      Left = 15
      Top = 15
      Width = 52
      Height = 18
      AutoSize = False
      Caption = 'C'#243'digo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnPesqCliente: TBitBtn
      Left = 147
      Top = 14
      Width = 24
      Height = 21
      Caption = '...'
      TabOrder = 0
      OnClick = btnPesqClienteClick
    end
    object dbCodCliente: TEdit
      Left = 70
      Top = 14
      Width = 71
      Height = 21
      TabOrder = 1
      OnExit = dbCodClienteExit
    end
    object dbNomeCliente: TEdit
      Left = 178
      Top = 14
      Width = 351
      Height = 21
      TabOrder = 2
      OnExit = dbCodClienteExit
    end
  end
end

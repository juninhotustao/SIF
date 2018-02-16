inherited FConsultaDav: TFConsultaDav
  Caption = 'Consulta DAV'
  ClientHeight = 433
  ClientWidth = 671
  OnCreate = FormCreate
  ExplicitWidth = 677
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 671
    Height = 433
    ExplicitWidth = 671
    ExplicitHeight = 433
    inherited Grid: TDBGrid
      Top = 155
      Width = 671
      Height = 231
      DataSource = DS
      Columns = <
        item
          Expanded = False
          FieldName = 'VEN_ID'
          Title.Caption = 'N'#186' Venda'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEN_DATA'
          Title.Caption = 'Data'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEN_TOTAL'
          Title.Caption = 'Total'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NOME'
          Title.Caption = 'Cliente'
          Width = 341
          Visible = True
        end>
    end
    inherited pnlConsulta: TPanel
      Width = 671
      Height = 155
      ExplicitWidth = 671
      ExplicitHeight = 155
      object groupPesquisa: TGroupBox
        Left = 8
        Top = 8
        Width = 649
        Height = 133
        TabOrder = 0
        object lblNumero: TLabel
          Left = 9
          Top = 80
          Width = 44
          Height = 13
          Caption = 'N'#250'mero: '
          Enabled = False
        end
        object lblDataInicial: TLabel
          Left = 184
          Top = 78
          Width = 57
          Height = 13
          Caption = 'Data Inicial:'
        end
        object lblDataFinal: TLabel
          Left = 340
          Top = 78
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        object btnPesquisar: TButton
          Left = 534
          Top = 70
          Width = 100
          Height = 48
          Caption = '&Pesquisar'
          HotImageIndex = 11
          ImageIndex = 11
          TabOrder = 0
          OnClick = btnPesquisarClick
        end
        inline FrameDavCliente: TFrameCliente
          Left = -27
          Top = 9
          Width = 508
          Height = 62
          Enabled = False
          TabOrder = 1
          ExplicitLeft = -27
          ExplicitTop = 9
          ExplicitWidth = 508
          ExplicitHeight = 62
          inherited gpCliente: TGroupBox
            Left = 36
            Top = 1
            Width = 468
            ExplicitLeft = 36
            ExplicitTop = 1
            ExplicitWidth = 468
            inherited lblCodCliente: TLabel
              Left = 8
              Top = 19
              ExplicitLeft = 8
              ExplicitTop = 19
            end
            inherited btnPesqCliente: TBitBtn
              Left = 131
              Top = 18
              OnClick = FrameDavClientebtnPesqClienteClick
              ExplicitLeft = 131
              ExplicitTop = 18
            end
            inherited dbCodCliente: TEdit
              Left = 54
              Top = 17
              ExplicitLeft = 54
              ExplicitTop = 17
            end
            inherited dbNomeCliente: TEdit
              Left = 160
              Top = 17
              Width = 302
              Enabled = False
              ExplicitLeft = 160
              ExplicitTop = 17
              ExplicitWidth = 302
            end
          end
        end
        object chkClientes: TCheckBox
          Left = 483
          Top = 29
          Width = 51
          Height = 17
          Caption = 'Todos'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkClientesClick
        end
        object edtNumero: TEdit
          Left = 9
          Top = 97
          Width = 104
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
        end
        object chkNumero: TCheckBox
          Left = 119
          Top = 99
          Width = 50
          Height = 17
          Caption = 'Todos'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = chkNumeroClick
        end
        object dtInicial: TwwDBDateTimePicker
          Left = 184
          Top = 97
          Width = 133
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = 16056319
          Epoch = 1950
          ShowButton = True
          TabOrder = 5
          DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
        end
        object dtFinal: TwwDBDateTimePicker
          Left = 340
          Top = 97
          Width = 133
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = 16056319
          Epoch = 1950
          ShowButton = True
          TabOrder = 6
          DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
        end
      end
    end
    inherited pnlRodape: TPanel
      Top = 386
      Width = 671
      ExplicitTop = 386
      ExplicitWidth = 671
      inherited BtnNovo: TButton
        OnClick = BtnNovoClick
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelDav.CDS
    Left = 472
    Top = 256
  end
end

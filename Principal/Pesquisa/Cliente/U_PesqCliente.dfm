inherited frm_PesqCliente: Tfrm_PesqCliente
  Caption = 'Pesquisa de Clientes'
  ClientWidth = 564
  OnKeyDown = FormKeyDown
  ExplicitWidth = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    Width = 564
    ExplicitWidth = 681
    inherited Grid: TDBGrid
      Width = 564
      Columns = <
        item
          Expanded = False
          FieldName = 'CLI_ID'
          Title.Caption = 'C'#243'digo'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NOME'
          Title.Caption = 'Nome'
          Width = 297
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_CIDADE'
          Title.Caption = 'Cidade'
          Width = 173
          Visible = True
        end>
    end
    inherited pnlBusca: TPanel
      Width = 564
      ExplicitWidth = 681
      inherited lblDescricaoBusca: TLabel
        Left = 133
        ExplicitLeft = 133
      end
      inherited lblTipoBusca: TLabel
        Left = 19
        ExplicitLeft = 19
      end
      inherited edt_pesq: TEdit
        Left = 134
        Width = 317
        ExplicitLeft = 134
        ExplicitWidth = 317
      end
      inherited cmbTipoBusca: TComboBox
        Left = 19
        ItemIndex = 0
        Text = 'Nome'
        Items.Strings = (
          'Nome'
          'C'#243'digo')
        ExplicitLeft = 19
      end
      inherited btnPesquisar: TButton
        Left = 464
        Top = 19
        ExplicitLeft = 464
        ExplicitTop = 19
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelPesqCliente.CDS
  end
end

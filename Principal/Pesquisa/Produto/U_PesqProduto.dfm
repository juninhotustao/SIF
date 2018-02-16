inherited frm_PesqProduto: Tfrm_PesqProduto
  Left = 484
  Top = 40
  Caption = 'Consulta de Produto'
  ClientHeight = 306
  ClientWidth = 579
  OnKeyDown = FormKeyDown
  ExplicitWidth = 585
  ExplicitHeight = 334
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    Width = 579
    Height = 306
    ExplicitWidth = 579
    ExplicitHeight = 306
    inherited Grid: TDBGrid
      Width = 579
      Height = 242
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 312
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_ESTOQUE'
          Title.Caption = 'Estoque'
          Width = 82
          Visible = True
        end>
    end
    inherited pnlBusca: TPanel
      Top = 242
      Width = 579
      Height = 64
      ExplicitTop = 242
      ExplicitWidth = 579
      ExplicitHeight = 64
      inherited lblDescricaoBusca: TLabel
        Left = 115
        Top = 8
        Width = 55
        Caption = 'Descricao:'
        ExplicitLeft = 115
        ExplicitTop = 8
        ExplicitWidth = 55
      end
      inherited lblTipoBusca: TLabel
        Left = 5
        Top = 8
        ExplicitLeft = 5
        ExplicitTop = 8
      end
      inherited edt_pesq: TEdit
        Left = 115
        Top = 28
        Width = 368
        ExplicitLeft = 115
        ExplicitTop = 28
        ExplicitWidth = 368
      end
      inherited cmbTipoBusca: TComboBox
        Left = 5
        Top = 28
        ItemIndex = 0
        Text = 'Descricao'
        Items.Strings = (
          'Descricao'
          'Refer'#234'ncia')
        ExplicitLeft = 5
        ExplicitTop = 28
      end
      inherited btnPesquisar: TButton
        Left = 490
        Top = 18
        Font.Name = 'Tahoma'
        ParentFont = False
        ExplicitLeft = 490
        ExplicitTop = 18
      end
    end
  end
  inherited DS: TDataSource
    DataSet = DmModelPesqProduto.CDS
    Left = 314
    Top = 146
  end
end

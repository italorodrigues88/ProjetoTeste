inherited frmCadDepartamento: TfrmCadDepartamento
  Caption = 'frmCadDepartamento'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcDados: TPageControl
    inherited tbCampos: TTabSheet
      OnEnter = tbCamposEnter
      inherited pnlCampos: TPanel
        Caption = ''
        object Funcao: TLabel
          Left = 74
          Top = 58
          Width = 31
          Height = 14
          Caption = 'Local:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 69
          Top = 21
          Width = 36
          Height = 14
          Alignment = taRightJustify
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtLocal: TEdit
          Left = 111
          Top = 56
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 111
          Top = 19
          Width = 313
          Height = 21
          TabOrder = 1
        end
      end
    end
    inherited tbGrid: TTabSheet
      inherited pnlBotoes: TPanel
        inherited btnFiltro: TSpeedButton
          OnClick = btnFiltroClick
        end
        inherited lblDescricao: TLabel
          Width = 89
          Caption = 'Departamento'
          ExplicitWidth = 89
        end
        inherited btnApagar: TSpeedButton
          OnClick = btnApagarClick
        end
        inherited edtFiltro: TEdit
          Left = 117
          ExplicitLeft = 117
        end
      end
      inherited pnlGrid: TPanel
        inherited dbGrid: TDBGrid
          DataSource = DM.dsDepartamento
          OnEnter = dbGridEnter
          Columns = <
            item
              Expanded = False
              FieldName = 'id_departamento'
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_departamento'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'local'
              Title.Alignment = taCenter
              Title.Caption = 'Local'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
end

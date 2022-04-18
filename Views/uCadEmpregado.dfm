inherited frmCadEmpregado: TfrmCadEmpregado
  Caption = 'Cadastro de Empregados'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcDados: TPageControl
    ActivePage = tbGrid
    inherited tbCampos: TTabSheet
      OnEnter = tbCamposEnter
      inherited pnlCampos: TPanel
        Caption = ''
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
        object Label2: TLabel
          Left = 445
          Top = 21
          Width = 81
          Height = 14
          Caption = 'Data admiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Funcao: TLabel
          Left = 62
          Top = 94
          Width = 43
          Height = 14
          Caption = 'Fun'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 22
          Top = 58
          Width = 83
          Height = 14
          Caption = 'Departamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 488
          Top = 58
          Width = 38
          Height = 14
          Caption = 'Sal'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 473
          Top = 94
          Width = 53
          Height = 14
          Caption = 'Comiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtNome: TEdit
          Left = 111
          Top = 19
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object edtDataAdmi: TDateTimePicker
          Left = 540
          Top = 19
          Width = 125
          Height = 21
          Date = 44668.000000000000000000
          Time = 0.595365983797819400
          TabOrder = 1
        end
        object edtFuncao: TEdit
          Left = 111
          Top = 92
          Width = 313
          Height = 21
          TabOrder = 3
        end
        object edtSalario: TEdit
          Left = 540
          Top = 56
          Width = 125
          Height = 21
          TabOrder = 4
        end
        object edtComissao: TEdit
          Left = 540
          Top = 92
          Width = 125
          Height = 21
          TabOrder = 5
        end
        object cbDepartamento: TDBLookupComboBox
          Left = 111
          Top = 56
          Width = 313
          Height = 21
          DataField = 'id_departamento'
          DataSource = DM.dsEmpregados
          Enabled = False
          KeyField = 'id_departamento'
          ListField = 'nm_departamento'
          ListSource = DM.dsCarregaCombo
          TabOrder = 2
        end
      end
    end
    inherited tbGrid: TTabSheet
      inherited pnlBotoes: TPanel
        inherited btnFiltro: TSpeedButton
          Left = 504
          Width = 85
          OnClick = btnFiltroClick
          ExplicitLeft = 590
          ExplicitWidth = 85
        end
        inherited lblDescricao: TLabel
          Width = 38
          Caption = 'Nome:'
          ExplicitWidth = 38
        end
        inherited btnAlterar: TSpeedButton
          Left = 589
          Width = 92
          ExplicitLeft = 677
          ExplicitWidth = 92
        end
        inherited btnApagar: TSpeedButton
          OnClick = btnApagarClick
          ExplicitLeft = 774
          ExplicitTop = 0
        end
      end
      inherited pnlGrid: TPanel
        inherited dbGrid: TDBGrid
          DataSource = DM.dsEmpregados
          OnEnter = dbGridEnter
          Columns = <
            item
              Expanded = False
              FieldName = 'id_empregado'
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_empregado'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_departamento'
              Title.Alignment = taCenter
              Title.Caption = 'Departamento'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_funcao'
              Title.Alignment = taCenter
              Title.Caption = 'Fun'#231#227'o'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_admissao'
              Title.Alignment = taCenter
              Title.Caption = 'Data Admiss'#227'o'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
end

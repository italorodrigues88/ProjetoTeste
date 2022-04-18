object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema de Avalia'#231#227'o'
  ClientHeight = 382
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrinc: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 363
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object sbPrinc: TStatusBar
    Left = 0
    Top = 363
    Width = 639
    Height = 19
    Panels = <
      item
        Text = 'Status do banco: '
        Width = 250
      end
      item
        Text = 'Desenvolvido por '#205'talo Rodrigues'
        Width = 50
      end>
  end
  object mmPrincipal: TMainMenu
    Left = 384
    Top = 142
    object Funcionario: TMenuItem
      Caption = 'Funcion'#225'rios'
      OnClick = FuncionarioClick
    end
    object Departamento: TMenuItem
      Caption = 'Departamento'
      OnClick = DepartamentoClick
    end
    object Relatorio: TMenuItem
      Caption = 'Relat'#243'rio'
      OnClick = RelatorioClick
    end
    object Sair: TMenuItem
      Caption = 'Sair'
      OnClick = SairClick
    end
  end
end

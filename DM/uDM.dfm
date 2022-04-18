object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 393
  Width = 689
  object PSTGRE: TFDConnection
    Params.Strings = (
      'Database=TesteMV'
      'User_Name=postgres'
      'Password=010509'
      'Server=localhost'
      'DriverID=PG')
    LoginPrompt = False
    AfterConnect = AlterConexao
    BeforeConnect = PSTGREBeforeConnect
    AfterDisconnect = AlterConexao
    Left = 48
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 80
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = '.\'
    Left = 48
    Top = 136
  end
  object dsEmpregados: TDataSource
    DataSet = quEmpregado
    Left = 240
    Top = 88
  end
  object quDepartamento: TFDQuery
    Connection = PSTGRE
    SQL.Strings = (
      'select id_departamento,'
      '       nm_departamento,'
      '       local'
      '  from "DEPARTAMENTOS"'
      ' order by id_departamento asc')
    Left = 160
    Top = 32
  end
  object dsDepartamento: TDataSource
    DataSet = quDepartamento
    Left = 160
    Top = 88
  end
  object quEmpregado: TFDQuery
    Connection = PSTGRE
    SQL.Strings = (
      'SELECT id_empregado, '
      '       d.nm_departamento, '
      '       nm_empregado, '
      '       nm_funcao, '
      '       data_admissao, '
      '       salario, '
      '       comissao'
      '  FROM "EMPREGADOS" E'
      
        ' INNER JOIN "DEPARTAMENTOS" D ON E.cod_departamento = D.id_depar' +
        'tamento'
      ' ORDER BY nm_empregado ASC')
    Left = 240
    Top = 32
  end
  object quCarregaCombo: TFDQuery
    Connection = PSTGRE
    SQL.Strings = (
      'select id_departamento,'
      '       nm_departamento,'
      '       local'
      '  from "DEPARTAMENTOS"'
      ' order by id_departamento asc')
    Left = 320
    Top = 32
  end
  object dsCarregaCombo: TDataSource
    DataSet = quCarregaCombo
    Left = 320
    Top = 88
  end
  object quAux: TFDQuery
    Connection = PSTGRE
    SQL.Strings = (
      'select id_departamento,'
      '       nm_departamento,'
      '       local'
      '  from "DEPARTAMENTOS"'
      ' order by id_departamento asc')
    Left = 392
    Top = 32
  end
end

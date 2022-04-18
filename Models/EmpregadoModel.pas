unit EmpregadoModel;

interface

type

  TEmpregadoModel = class
  private
    FFuncao          : string;
    FCodEmpFuncao    : integer;
    FIdEmpregado     : integer;
    FCodDepartamento : integer;
    FSalario         : Extended;
    FComissao        : Extended;
    FDataAdmissao    : TDate;
    FNome            : string;
  public
    property IdEmpregado      : integer    Read FIdEmpregado      Write FIdEmpregado;
    property CodDepartamento  : integer    Read FCodDepartamento  Write FCodDepartamento;
    property CodEmpFuncao     : integer    Read FCodEmpFuncao     Write FCodEmpFuncao;
    property Nome             : string     Read FNome             Write FNome;
    property Funcao           : string     Read FFuncao           Write FFuncao;
    property DataAdmissao     : TDate      Read FDataAdmissao     Write FDataAdmissao;
    property Salario          : Extended   Read FSalario          Write FSalario;
    property Comissao         : Extended   Read FComissao         Write FComissao;
  end;

implementation

end.

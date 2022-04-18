unit DepartamentoModel;

interface

type

  TDepartamentoModel = class
  private
    FLocal  : string;
    FIdDep  : integer;
    FNome   : string;
  public
    property IdDep  : integer     Read FIdDep     Write FIdDep;
    property Nome   : string      Read FNome      Write FNome;
    property Local  : string      Read FLocal     Write FLocal;
  end;

implementation

end.

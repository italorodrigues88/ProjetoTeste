unit EmpregadoController;

interface

uses
  EmpregadoModel, EmpregadoRepository, System.SysUtils;

type

  TEmpregadoController = class
  private
    FEmpregado   : TEmpregadoModel;
    FRepository  : TEmpregadoRepository;
  public
    property Empregado: TEmpregadoModel Read FEmpregado Write FEmpregado;

    procedure NovoEmpregado;
    procedure AlterarEmpregado;
    procedure ApagarEmpregado;
    procedure SelecionarEmpregado(Filtro: String = '');

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEmpregadoController }

procedure TEmpregadoController.AlterarEmpregado;
begin
  FRepository.Alterar;
end;

procedure TEmpregadoController.ApagarEmpregado;
begin
  FRepository.Apagar;
end;

procedure TEmpregadoController.SelecionarEmpregado(Filtro: String);
begin
  FRepository.Selecionar(Filtro);
end;

constructor TEmpregadoController.Create;
begin
  FEmpregado   := TEmpregadoModel.Create;
  FRepository  := TEmpregadoRepository.Create(FEmpregado);
end;

destructor TEmpregadoController.Destroy;
begin
  FreeAndNil(FEmpregado);
  FreeAndNil(FRepository);

  inherited;
end;

procedure TEmpregadoController.NovoEmpregado;
begin
  FRepository.Novo;
end;

end.

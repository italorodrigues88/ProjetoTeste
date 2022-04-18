unit DepartamentoController;

interface

uses
  DepartamentoModel, DepartamentoRepository, System.SysUtils;

type

  TDepartamentoController = class
  private
    FDepartamento : TDepartamentoModel;
    FRepository   : TDepartamentoRepository;
  public
    property Departamento: TDepartamentoModel Read FDepartamento Write FDepartamento;

    procedure NovoDepartamento;
    procedure AlterarDepartamento;
    procedure ApagarDepartamento;
    procedure SelecionarDepartamento(Filtro: String = '');

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TDepartamentoController }

procedure TDepartamentoController.AlterarDepartamento;
begin
  FRepository.Alterar;
end;

procedure TDepartamentoController.ApagarDepartamento;
begin
  FRepository.Apagar;
end;

constructor TDepartamentoController.Create;
begin
  FDepartamento := TDepartamentoModel.Create;
  FRepository   := TDepartamentoRepository.Create(FDepartamento);
end;

destructor TDepartamentoController.Destroy;
begin
  FreeAndNil(FDepartamento);
  FreeAndNil(FRepository);

  inherited;
end;

procedure TDepartamentoController.NovoDepartamento;
begin
  FRepository.Novo;
end;

procedure TDepartamentoController.SelecionarDepartamento(Filtro: String);
begin
  FRepository.Selecionar(Filtro);
end;

end.

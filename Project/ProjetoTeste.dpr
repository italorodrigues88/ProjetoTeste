program ProjetoTeste;

uses
  Vcl.Forms,
  uPrincipal in '..\Views\uPrincipal.pas' {frmPrincipal},
  uDM in '..\DM\uDM.pas' {DM: TDataModule},
  ConexaoModel in '..\Models\ConexaoModel.pas',
  uCadBase in '..\Views\uCadBase.pas' {frmCadBase},
  uCadEmpregado in '..\Views\uCadEmpregado.pas' {frmCadEmpregado},
  EmpregadoRepository in '..\Repositories\EmpregadoRepository.pas',
  EmpregadoModel in '..\Models\EmpregadoModel.pas',
  EmpregadoController in '..\Controllers\EmpregadoController.pas',
  uCadDepartamento in '..\Views\uCadDepartamento.pas' {frmCadDepartamento},
  DepartamentoRepository in '..\Repositories\DepartamentoRepository.pas',
  DepartamentoModel in '..\Models\DepartamentoModel.pas',
  DepartamentoController in '..\Controllers\DepartamentoController.pas',
  uRelatorioView in '..\Views\uRelatorioView.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

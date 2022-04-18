unit EmpregadoRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param, uDM, EmpregadoModel;

type

  TEmpregadoRepository = class
  private
    FQuery     : TFDQuery;
    FEmpregado : TEmpregadoModel;

    function NovoID: Integer;
  public
    property Query      : TFDQuery         Read FQuery      Write FQuery;
    property Empregado  : TEmpregadoModel  Read FEmpregado  Write FEmpregado;

    constructor Create(Model: TEmpregadoModel);
    destructor  Destroy; override;

    procedure Novo;
    procedure Alterar;
    procedure Apagar;
    procedure Selecionar(Filtro: string = '');
  end;

implementation


{ TEmpregadoRepository }

procedure TEmpregadoRepository.Alterar;
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Add('UPDATE "EMPREGADOS" SET cod_departamento = :cod_departamento, ');
    SQL.Add('                        cod_emp_funcao   = :cod_emp_funcao,   ');
    SQL.Add('                        nm_empregado     = :nm_empregado,     ');
    SQL.Add('                        nm_funcao        = :nm_funcao,        ');
    SQL.Add('                        data_admissao    = :data_admissao,    ');
    SQL.Add('                        salario          = :salario,          ');
    SQL.Add('                        comissao         = :comissao          ');
    SQL.Add(' WHERE id_empregado = :id_empregado                           ');

    ParamByName('cod_departamento').AsInteger  := FEmpregado.CodDepartamento;
    ParamByName('cod_emp_funcao').AsInteger    := FEmpregado.CodEmpFuncao;
    ParamByName('nm_empregado').AsString       := FEmpregado.Nome;
    ParamByName('nm_funcao').AsString          := FEmpregado.Funcao;
    ParamByName('data_admissao').AsDate        := FEmpregado.DataAdmissao;
    ParamByName('salario').AsFloat             := FEmpregado.Salario;
    ParamByName('comissao').AsFloat            := FEmpregado.Comissao;
    ParamByName('id_empregado').AsInteger      := FEmpregado.IdEmpregado;
    Prepare;
    ExecSQL;
  end;
end;

procedure TEmpregadoRepository.Apagar;
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Text := 'DELETE FROM "EMPREGADOS" WHERE id_empregado = :id';

    ParamByName('id').AsInteger  := FEmpregado.IdEmpregado;
    Prepare;
    ExecSQL;
  end;
end;

constructor TEmpregadoRepository.Create(Model: TEmpregadoModel);
begin
  FQuery := TFDQuery.Create(Nil);
  FQuery := dm.quEmpregado;

  FEmpregado := Model;
end;

destructor TEmpregadoRepository.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

procedure TEmpregadoRepository.Novo;
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Add(' INSERT INTO "EMPREGADOS"(id_empregado, cod_departamento, cod_emp_funcao, nm_empregado, nm_funcao, data_admissao, salario, comissao) ');
    SQL.Add('                   VALUES(:id_empregado, :cod_departamento, :cod_emp_funcao, :nm_empregado, :nm_funcao, :data_admissao, :salario, :comissao)');
    ParamByName('id_empregado').Value      := NovoID;
    ParamByName('cod_departamento').Value  := FEmpregado.CodDepartamento;
    ParamByName('cod_emp_funcao').Value    := FEmpregado.CodEmpFuncao;
    ParamByName('nm_empregado').Value      := FEmpregado.Nome;
    ParamByName('nm_funcao').Value         := FEmpregado.Funcao;
    ParamByName('data_admissao').AsDate    := FEmpregado.DataAdmissao;
    ParamByName('salario').Value           := FEmpregado.Salario;
    ParamByName('comissao').Value          := FEmpregado.Comissao;
    Prepare;
    ExecSQL;
  end;
end;

function TEmpregadoRepository.NovoID: Integer;
begin
  with DM.quAux do
  begin
    Close;

    SQL.Clear;
    SQL.Text := 'SELECT COALESCE(MAX(id_empregado),0) ID FROM "EMPREGADOS"';
    Open;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

procedure TEmpregadoRepository.Selecionar(Filtro: string);
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Add('SELECT id_empregado,      ');
    SQL.Add('       id_departamento,   ');
    SQL.Add('       d.nm_departamento, ');
    SQL.Add('       cod_emp_funcao,    ');
    SQL.Add('       nm_empregado,      ');
    SQL.Add('       nm_funcao,         ');
    SQL.Add('       data_admissao,     ');
    SQL.Add('       salario,           ');
    SQL.Add('       comissao           ');
    SQL.Add('  FROM "EMPREGADOS" E     ');
    SQL.Add(' INNER JOIN "DEPARTAMENTOS" D ON E.cod_departamento = D.id_departamento ');

    if Filtro <> EmptyStr then
    begin
      Filtro := '%' + Filtro + '%';
      SQL.Add(' WHERE nm_empregado LIKE ' + QuotedStr(Filtro));
    end;
    SQL.Add(' ORDER BY nm_empregado ASC ');

    Open;
  end;
end;

end.

unit DepartamentoRepository;

interface

uses
  DepartamentoModel, FireDAC.Comp.Client, FireDAC.Stan.Param,uDM;

type

  TDepartamentoRepository = class
  private
    FQuery         : TFDQuery;
    FDepartamento  : TDepartamentoModel;

    function NovoID: Integer;
  public
    property Query         : TFDQuery            Read FQuery        Write FQuery;
    property Departamento  : TDepartamentoModel Read FDepartamento Write FDepartamento;

    constructor Create(Model: TDepartamentoModel);
    destructor  Destroy; override;

    procedure Novo;
    procedure Alterar;
    procedure Apagar;
    procedure Selecionar(Filtro: string = '');
end;

implementation

uses
  System.SysUtils;


{ TDepartamentoRepository }

procedure TDepartamentoRepository.Alterar;
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Add('UPDATE "DEPARTAMENTOS" SET nm_departamento = :nm_departamento, ');
    SQL.Add('                           local           = :local            ');
    SQL.Add(' WHERE id_departamento = :id_departamento                      ');

    ParamByName('Nm_departamento').AsString  := FDepartamento.Nome;
    ParamByName('Local').AsString            := FDepartamento.Local;
    ParamByName('Id_departamento').AsInteger := FDepartamento.IdDep;
    Prepare;
    ExecSQL;
  end;
end;

procedure TDepartamentoRepository.Apagar;
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Text := 'DELETE FROM "DEPARTAMENTOS" WHERE id_departamento = :id';

    ParamByName('id').AsInteger  := FDepartamento.IdDep;
    Prepare;
    ExecSQL;
  end;
end;

constructor TDepartamentoRepository.Create(Model: TDepartamentoModel);
begin
  FQuery := TFDQuery.Create(Nil);
  FQuery := dm.quDepartamento;

  FDepartamento := Model;
end;

destructor TDepartamentoRepository.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

procedure TDepartamentoRepository.Novo;
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Add(' INSERT INTO "DEPARTAMENTOS"(id_departamento, nm_departamento, local) ');
    SQL.Add('                     VALUES (:id_departamento, :nm_departamento, :local)');
    ParamByName('id_departamento').value  := NovoID;
    ParamByName('nm_departamento').Value  := FDepartamento.Nome;
    ParamByName('local').Value            := FDepartamento.Local;
    Prepare;
    ExecSQL;
  end;
end;

function TDepartamentoRepository.NovoID: Integer;
begin
  with DM.quAux do
  begin
    Close;

    SQL.Clear;
    SQL.Text := 'SELECT COALESCE(MAX(id_departamento),0) ID FROM "DEPARTAMENTOS"';
    Open;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

procedure TDepartamentoRepository.Selecionar(Filtro: string);
begin
  with FQuery do
  begin
    Close;

    SQL.Clear;
    SQL.Add('SELECT id_departamento,   ');
    SQL.Add('       nm_departamento,   ');
    SQL.Add('       local              ');
    SQL.Add('  FROM "DEPARTAMENTOS"    ');

    if Filtro <> EmptyStr then
    begin
      Filtro := '%' + Filtro + '%';
      SQL.Add(' WHERE nm_departamento LIKE ' + QuotedStr(Filtro));
    end;
    SQL.Add(' ORDER BY nm_departamento ASC ');

    Open;
  end;
end;

end.

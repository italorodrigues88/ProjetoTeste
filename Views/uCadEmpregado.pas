unit uCadEmpregado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uCadBase, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, EmpregadoController;

type
  TfrmCadEmpregado = class(TfrmCadBase)
    edtNome: TEdit;
    Label1: TLabel;
    edtDataAdmi: TDateTimePicker;
    Label2: TLabel;
    Funcao: TLabel;
    edtFuncao: TEdit;
    Label3: TLabel;
    edtSalario: TEdit;
    Label4: TLabel;
    edtComissao: TEdit;
    Label5: TLabel;
    cbDepartamento: TDBLookupComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure tbCamposEnter(Sender: TObject);
  private
    { Private declarations }
    FEmpregadoCont : TEmpregadoController;
    procedure prLimpar;
    procedure prAtivarCampos(Ativo: Boolean);
    procedure prAtivarBotoes(Ativo: Boolean);
    procedure MappQue2Cont;
    procedure MappCont2Obj;
    function  fcRemovePonto(Valor: String): Currency;
  public
    { Public declarations }
  end;

var
  frmCadEmpregado: TfrmCadEmpregado;

implementation

uses
  uDM, System.UITypes;

{$R *.dfm}

{ TfrmCadEmpregado }

procedure TfrmCadEmpregado.btnAlterarClick(Sender: TObject);
begin
  inherited;
  MappQue2Cont;
  dm.quCarregaCombo.Open;
  prAtivarCampos(True);
end;

procedure TfrmCadEmpregado.btnApagarClick(Sender: TObject);
begin
  inherited;
  If MessageDlg('Confirma a exclusão do empregado?' + #13 +
                'Nome: ' + DM.quEmpregado.FieldByName('nm_empregado').AsString + #13 +
                'Função: ' + DM.quEmpregado.FieldByName('nm_funcao').AsString,
                mtConfirmation, [mbyes, mbno],0) = mrNo then
    Exit;

  FEmpregadoCont.Empregado.IdEmpregado := dm.quEmpregado.FieldByName('id_empregado').AsInteger;
  FEmpregadoCont.ApagarEmpregado;
  FEmpregadoCont.SelecionarEmpregado('');
end;

procedure TfrmCadEmpregado.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prLimpar;
  prAtivarCampos(False);
end;

procedure TfrmCadEmpregado.btnFiltroClick(Sender: TObject);
begin
  inherited;
  FEmpregadoCont.SelecionarEmpregado(edtFiltro.Text);
end;

procedure TfrmCadEmpregado.btnNovoClick(Sender: TObject);
begin
  inherited;
  prLimpar;
  prAtivarCampos(True);

  FEmpregadoCont.SelecionarEmpregado('');
  dm.quCarregaCombo.Open;
end;

procedure TfrmCadEmpregado.btnSalvarClick(Sender: TObject);
begin
  MappCont2Obj;

  if FAcao = taAlte then
    FEmpregadoCont.AlterarEmpregado
  else
    FEmpregadoCont.NovoEmpregado;

  prAtivarCampos(False);
  inherited;
end;

procedure TfrmCadEmpregado.dbGridEnter(Sender: TObject);
begin
  inherited;
  prAtivarBotoes(True);
end;

function TfrmCadEmpregado.fcRemovePonto(Valor: String): Currency;
begin
  try
    FormatSettings.DecimalSeparator := ',';
    Result := StrToFloat(StringReplace(valor,'.','',[rfReplaceAll]));
  except
    Result := 0;
  end;
end;

procedure TfrmCadEmpregado.FormCreate(Sender: TObject);
begin
  inherited;
  FEmpregadoCont := TEmpregadoController.Create;
end;

procedure TfrmCadEmpregado.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FEmpregadoCont);
  inherited;
end;

procedure TfrmCadEmpregado.FormShow(Sender: TObject);
begin
  inherited;
  prLimpar;
  prAtivarCampos(False);
end;

procedure TfrmCadEmpregado.MappCont2Obj;
begin
  with FEmpregadoCont.Empregado do
  begin
    IdEmpregado      := DM.quEmpregado.FieldByName('id_empregado').AsInteger;
    CodDepartamento  := cbDepartamento.KeyValue;
    Nome             := edtNome.Text;
    Funcao           := edtFuncao.Text;
    DataAdmissao     := edtDataAdmi.Date;
    Salario          := fcRemovePonto(edtSalario.Text);
    Comissao         := fcRemovePonto(edtComissao.Text);
  end;
end;

procedure TfrmCadEmpregado.MappQue2Cont;
begin
  with DM.quEmpregado do
  begin
    edtNome.Text     := FieldByName('nm_empregado').AsString;
    edtFuncao.Text   := FieldByName('nm_funcao').AsString;
    edtDataAdmi.Date := FieldByName('data_admissao').AsDateTime;
    edtSalario.Text  := FormatFloat('##,##0.00', FieldByName('salario').AsFloat);
    edtComissao.Text := FormatFloat('##,##0.00', FieldByName('comissao').AsFloat);
  end;
end;

procedure TfrmCadEmpregado.PesquisarClick(Sender: TObject);
begin
  FEmpregadoCont.SelecionarEmpregado(EmptyStr);
  inherited;
end;

procedure TfrmCadEmpregado.prAtivarBotoes(Ativo: Boolean);
begin
  btnAlterar.Enabled := Ativo;
  btnApagar.Enabled  := Ativo;
end;

procedure TfrmCadEmpregado.prAtivarCampos(Ativo: Boolean);
begin
  edtNome.Enabled := Ativo;
  edtDataAdmi.Enabled := Ativo;
  edtFuncao.Enabled := Ativo;
  edtSalario.Enabled := Ativo;
  edtComissao.Enabled := Ativo;
  cbDepartamento.Enabled := Ativo;
end;

procedure TfrmCadEmpregado.prLimpar;
begin
  edtNome.Clear;
  edtDataAdmi.Date := Now;
  edtFuncao.Clear;
  edtSalario.Clear;
  edtComissao.Clear;
end;

procedure TfrmCadEmpregado.tbCamposEnter(Sender: TObject);
begin
  inherited;
  prAtivarBotoes(False);
end;

end.

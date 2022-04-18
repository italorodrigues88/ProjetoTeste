unit uCadDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, DepartamentoController;

type
  TfrmCadDepartamento = class(TfrmCadBase)
    edtLocal: TEdit;
    Funcao: TLabel;
    edtNome: TEdit;
    Label1: TLabel;
    procedure PesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure tbCamposEnter(Sender: TObject);
    procedure FecharClick(Sender: TObject);
  private
    { Private declarations }
    FDepartamentoCont : TDepartamentoController;
    procedure prLimpar;
    procedure prAtivarCampos(Ativo: Boolean);
    procedure MappCont2Obj;
    procedure MappQue2Cont;
    procedure prAtivarBotoes(Ativo: Boolean);
  public
    { Public declarations }
  end;

var
  frmCadDepartamento: TfrmCadDepartamento;

implementation

uses
  uDM, System.UITypes;

{$R *.dfm}

procedure TfrmCadDepartamento.btnAlterarClick(Sender: TObject);
begin
  inherited;
  MappQue2Cont;
  prAtivarCampos(True);
end;

procedure TfrmCadDepartamento.btnApagarClick(Sender: TObject);
begin
  inherited;
  If MessageDlg('Confirma a exclusão do departamento?' + #13 +
                'Nome: ' + DM.quDepartamento.FieldByName('nm_departamento').AsString + #13 +
                'Local: ' + DM.quDepartamento.FieldByName('local').AsString,
                mtConfirmation, [mbyes, mbno],0) = mrNo then
    Exit;

  FDepartamentoCont.Departamento.IdDep := dm.quDepartamento.FieldByName('id_departamento').AsInteger;
  FDepartamentoCont.ApagarDepartamento;
  FDepartamentoCont.SelecionarDepartamento('');
end;

procedure TfrmCadDepartamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prLimpar;
  prAtivarCampos(False);
end;

procedure TfrmCadDepartamento.btnFiltroClick(Sender: TObject);
begin
  inherited;
  FDepartamentoCont.SelecionarDepartamento(edtFiltro.Text);
end;

procedure TfrmCadDepartamento.btnNovoClick(Sender: TObject);
begin
  inherited;
  prLimpar;
  prAtivarCampos(True);

  FDepartamentoCont.SelecionarDepartamento('');
end;

procedure TfrmCadDepartamento.btnSalvarClick(Sender: TObject);
begin
  MappCont2Obj;

  if FAcao = taAlte then
    FDepartamentoCont.AlterarDepartamento
  else
    FDepartamentoCont.NovoDepartamento;

  prAtivarCampos(False);
  inherited;
end;

procedure TfrmCadDepartamento.dbGridEnter(Sender: TObject);
begin
  inherited;
  prAtivarBotoes(True);
end;

procedure TfrmCadDepartamento.FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadDepartamento.FormCreate(Sender: TObject);
begin
  inherited;
  FDepartamentoCont := TDepartamentoController.Create;
end;

procedure TfrmCadDepartamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDepartamentoCont);
  inherited;
end;

procedure TfrmCadDepartamento.FormShow(Sender: TObject);
begin
  inherited;
  prLimpar;
  prAtivarCampos(False);
end;

procedure TfrmCadDepartamento.MappCont2Obj;
begin
  with FDepartamentoCont.Departamento do
  begin
    IdDep   := DM.quDepartamento.FieldByName('id_departamento').AsInteger;
    Nome    := edtNome.Text;
    Local   := edtLocal.Text;
  end;
end;

procedure TfrmCadDepartamento.MappQue2Cont;
begin
  with DM.quDepartamento do
  begin
    edtNome.Text   := FieldByName('nm_departamento').AsString;
    edtLocal.Text  := FieldByName('local').AsString;
  end;
end;

procedure TfrmCadDepartamento.PesquisarClick(Sender: TObject);
begin
  FDepartamentoCont.SelecionarDepartamento(EmptyStr);
  inherited;
end;

procedure TfrmCadDepartamento.prAtivarBotoes(Ativo: Boolean);
begin
  btnAlterar.Enabled := Ativo;
  btnApagar.Enabled  := Ativo;
end;

procedure TfrmCadDepartamento.prAtivarCampos(Ativo: Boolean);
begin
  edtNome.Enabled  := Ativo;
  edtLocal.Enabled := Ativo;
end;

procedure TfrmCadDepartamento.prLimpar;
begin
  edtNome.Clear;
  edtLocal.Clear;
end;

procedure TfrmCadDepartamento.tbCamposEnter(Sender: TObject);
begin
  inherited;
  prAtivarBotoes(False);
end;

end.

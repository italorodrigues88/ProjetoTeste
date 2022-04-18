unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    Funcionario: TMenuItem;
    Departamento: TMenuItem;
    Relatorio: TMenuItem;
    Sair: TMenuItem;
    pnlPrinc: TPanel;
    sbPrinc: TStatusBar;
    procedure SairClick(Sender: TObject);
    procedure FuncionarioClick(Sender: TObject);
    procedure DepartamentoClick(Sender: TObject);
    procedure RelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure prAtualizaConexao(Conectado: Boolean);
  end;

var
  frmPrincipal: TfrmPrincipal;
  FormAtivo: Boolean;

implementation

uses
  StrUtils, uCadBase, uCadEmpregado, uCadDepartamento, uRelatorioView;

{$R *.dfm}

procedure TfrmPrincipal.DepartamentoClick(Sender: TObject);
begin
  if not FormAtivo then
  begin
    Application.CreateForm(TfrmCadDepartamento, frmCadDepartamento);
    frmCadDepartamento.Parent := pnlPrinc;
    frmCadDepartamento.Align  := alClient;
    frmCadDepartamento.Show;
    FormAtivo := True;
  end;
end;

procedure TfrmPrincipal.FuncionarioClick(Sender: TObject);
begin
  if not FormAtivo then
  begin
    Application.CreateForm(TfrmCadEmpregado, frmCadEmpregado);
    frmCadEmpregado.Parent := pnlPrinc;
    frmCadEmpregado.Align  := alClient;
    frmCadEmpregado.Show;
    FormAtivo := True;
  end;
end;

procedure TfrmPrincipal.prAtualizaConexao(Conectado: Boolean);
begin
  sbprinc.Panels[0].Text := 'Status do Banco: ' + IfThen(Conectado, 'Conectado', 'Desconectado');
end;

procedure TfrmPrincipal.RelatorioClick(Sender: TObject);
begin
  try
    frmRelatorio := TfrmRelatorio.Create(nil);
    frmRelatorio.qrRelatorio.PreviewModal;
  finally
    FreeAndNil(frmRelatorio)
  end;
end;

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, ConexaoModel;

type
  TDM = class(TDataModule)
    PSTGRE: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    dsEmpregados: TDataSource;
    quDepartamento: TFDQuery;
    dsDepartamento: TDataSource;
    quEmpregado: TFDQuery;
    quCarregaCombo: TFDQuery;
    dsCarregaCombo: TDataSource;
    quAux: TFDQuery;
    procedure AlterConexao(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure PSTGREBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FConexao : TConexao;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  uPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.AlterConexao(Sender: TObject);
begin
  frmPrincipal.prAtualizaConexao(PSTGRE.Connected);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FConexao := TConexao.Create;
  try
    PSTGRE.Open;
  finally
  end;

end;

procedure TDM.PSTGREBeforeConnect(Sender: TObject);
begin
  if not FConexao.Carregar then
    raise Exception.Create('Erro ao carregar arquivo de configurações');

  with PSTGRE.Params do
  begin
    Values['Server'] := FConexao.Servidor;
    Values['Port']   := FConexao.Porta;
    Database         := FConexao.Banco;
    UserName         := FConexao.Usuario;
    Password         := FConexao.Senha;
  end;
end;

end.

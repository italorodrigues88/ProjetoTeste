unit uCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls,  Vcl.ComCtrls, Vcl.Mask;

type
  TAcao = (taNone, taNovo, taAlte);

  TfrmCadBase = class(TForm)
    pcDados: TPageControl;
    tbCampos: TTabSheet;
    pnlControle: TPanel;
    btnNovo: TSpeedButton;
    tbGrid: TTabSheet;
    pnlBotoes: TPanel;
    pnlGrid: TPanel;
    dbGrid: TDBGrid;
    edtFiltro: TEdit;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnFiltro: TSpeedButton;
    lblDescricao: TLabel;
    btnAlterar: TSpeedButton;
    btnApagar: TSpeedButton;
    pnlCampos: TPanel;
    btnFechar: TSpeedButton;
    btnVoltar: TSpeedButton;
    procedure FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure prPageAtiva(Index: Integer);
    procedure PesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure VoltarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure prControleBotoes;
  public
    FAcao: TAcao;
    { Public declarations }
  end;

var
  frmCadBase: TfrmCadBase;

implementation

uses
  uDM, uPrincipal;

{$R *.dfm}

{ TfrmCadBase }

procedure TfrmCadBase.PesquisarClick(Sender: TObject);
begin
  prPageAtiva(1);
end;

procedure TfrmCadBase.btnAlterarClick(Sender: TObject);
begin
  FAcao := taAlte;
  prControleBotoes;
  prPageAtiva(0);
end;

procedure TfrmCadBase.btnCancelarClick(Sender: TObject);
begin
  FAcao := taNone;
  prControleBotoes;
end;

procedure TfrmCadBase.btnNovoClick(Sender: TObject);
begin
  FAcao := taNovo;
  prControleBotoes;
end;

procedure TfrmCadBase.btnSalvarClick(Sender: TObject);
begin
  FAcao := taNone;
  prControleBotoes;
end;

procedure TfrmCadBase.VoltarClick(Sender: TObject);
begin
  prPageAtiva(0);
end;

procedure TfrmCadBase.FormDestroy(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadBase.FormShow(Sender: TObject);
begin
  tbCampos.TabVisible := False;
  tbGrid.TabVisible := False;
  prPageAtiva(0);
end;

procedure TfrmCadBase.prControleBotoes;
begin
  btnSalvar.Enabled    := (FAcao in [taNovo, taAlte]);
  btnCancelar.Enabled  := btnSalvar.Enabled;

  btnPesquisar.Enabled := (FAcao = taNone);
  btnNovo.Enabled      := btnPesquisar.Enabled;
end;

procedure TfrmCadBase.prPageAtiva(Index: Integer);
begin
  pcDados.ActivePageIndex := Index;
end;

procedure TfrmCadBase.FecharClick(Sender: TObject);
begin
  FormAtivo := False;
  Close;
end;

end.

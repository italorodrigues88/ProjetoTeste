unit ConexaoModel;

interface

uses
  System.IniFiles;

type

  TConexao = class
  private
    FArquivo   : TIniFile;
    FUsuario   : String;
    FServidor  : String;
    FSenha     : String;
    FPorta     : String;
    FBanco     : String;
  public
    property Servidor   : String     read FServidor;
    property Porta      : String     read FPorta;
    property Banco      : String     read FBanco;
    property Usuario    : String     read FUsuario;
    property Senha      : String     read FSenha;

    function Carregar: Boolean;
  end;

const
  DirConfig = '.\Config\Config.INI';

implementation

uses
  System.SysUtils;
{ TConexao }

function TConexao.Carregar: Boolean;
begin
  Result := False;
  if not FileExists(DirConfig) then
    Exit;

  FArquivo := TIniFile.Create(DirConfig);
  try
    FServidor:= FArquivo.ReadString ('DB' ,'Servidor' , '');
    FPorta   := FArquivo.ReadString ('DB' ,'Porta'    , '5432');
    FBanco   := FArquivo.ReadString ('DB' ,'Banco'    , '');
    FUsuario := FArquivo.ReadString ('DB' ,'Usuario'  , '');
    FSenha   := FArquivo.ReadString ('DB' ,'Senha'    , '');

    Result   := True
  finally
    FreeAndNil(FArquivo);
  end;

end;

end.

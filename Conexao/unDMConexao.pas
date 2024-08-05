unit unDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,Dialogs;

type
  TdmConexao = class(TDataModule)
    fbDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
// seta dll de conexao com banco
  fbDriverLink.VendorLib:='C:\Windows\System32\FBCLIENT.DLL';

  // seta parametros de conexao
  fdConnection.Params.DriverID:='fbDriverLink';
  fdConnection.Params.Add('Server=127.0.0.1');
  fdConnection.Params.Add('Porta=3050');
  fdConnection.Params.Database:='C:\Users\Admilson\Pictures\contasPagar-main\contasPagar-main\DB\PAGAMENTO.FDB';
  fdConnection.Params.UserName:='SYSDBA';
  fdConnection.Params.Password:='masterkey';
  fdConnection.Params.Add('CharacterSet=ISO8859_2');

  // tenta conectar
  try
    fdConnection.Connected := True;
  except on E: Exception do
    ShowMessage(e.Message);
  end;
end;

end.

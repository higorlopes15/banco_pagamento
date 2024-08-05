unit unContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    actBancos: TAction;
    actClientes: TAction;
    actUsuarios: TAction;
    actCEP: TAction;
    StatusBar1: TStatusBar;
    Baixa1: TMenuItem;
    Saldo1: TMenuItem;
    Panel1: TPanel;
    btnBanco: TSpeedButton;
    btnCliente: TSpeedButton;
    btnUsuario: TSpeedButton;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    actSaldo: TAction;
    actBaixa: TAction;
    CadastrodeBancos1: TMenuItem;
    N1: TMenuItem;
    CadastrodeClientes1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    Sair1: TMenuItem;
    actSair: TAction;
    actTitulos: TAction;
    actTitulos1: TMenuItem;
    procedure actBancosExecute(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actCEPExecute(Sender: TObject);
    procedure actSaldoExecute(Sender: TObject);
    procedure actBaixaExecute(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actTitulosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unUsuarioView, unLoginView, unDmUsuarios, unClienteView, unCEPView,
  unTituloView, unBancoView, unBaixaView, unSaldoView;

procedure TfrmPrincipal.actBaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmBaixa, frmBaixa);
  frmBaixa.ShowModal;
end;

procedure TfrmPrincipal.actBancosExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmBanco, frmBanco);
  frmBanco.ShowModal;
end;

procedure TfrmPrincipal.actCEPExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmCEP, frmCEP);
  frmCEP.ShowModal;
end;

procedure TfrmPrincipal.actClientesExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmClientes, frmClientes);
  frmClientes.ShowModal;
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente fechar o sistema?','Aten��o',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = id_yes then
      Close;
end;

procedure TfrmPrincipal.actSaldoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSaldo, frmSaldo);
  frmSaldo.ShowModal;
end;

procedure TfrmPrincipal.actTitulosExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTitulo, frmTitulo);
  frmTitulo.ShowModal;
end;

procedure TfrmPrincipal.actUsuariosExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  frmUsuarios.ShowModal;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmLogin.ShowModal;

  StatusBar1.Panels[1].Text:='Usu�rio: '+dmUsuario.LoginNome;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.

unit unBancoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadrao, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,unClasseBanco,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, unDmUsuarios, unDmBanco;

type
  TfrmBanco = class(TfrmPadrao)
    dsCadastro: TDataSource;
    edtCodigo: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    edtNumero: TEdit;
    agencia_conta: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    inativa_conta: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    oBanco : Tbanco;

    procedure mostraDados;
    procedure limpaCampos;
  public
    { Public declarations }
    qtdRegistros:integer;

  end;

var
  frmBanco: TfrmBanco;

implementation

{$R *.dfm}


procedure TfrmBanco.actAlterarExecute(Sender: TObject);
begin
  inherited;
  mostraDados;
  oBanco.Alterar;
end;

procedure TfrmBanco.actCancelarExecute(Sender: TObject);
begin
  inherited;
  oBanco.Cancelar;
end;

procedure TfrmBanco.actExcluirExecute(Sender: TObject);
var
mov: String;
idcli: String;
begin
  inherited;
  if MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin

         idcli := IntToStr(oBanco.codigo);

        mov := oBanco.TemMov(idcli);

      if mov = '' then
        oBanco.Excluir;
      if   mov <> '' then
      showMessage('Voc� possui movimenta��es com est� conta bancaria, e a mesma n�o pode ser excluida!');
    end;
end;

procedure TfrmBanco.actIncluirExecute(Sender: TObject);
begin
  inherited;
  limpaCampos;

  oBanco.Incluir;
end;

procedure TfrmBanco.actSalvarExecute(Sender: TObject);
begin
  inherited;

  oBanco.codigo := qtdRegistros+1;
  oBanco.numero := edtNumero.Text;
  oBanco.nome := edtNome.Text;
  oBanco.agencia := agencia_conta.Text;
  oBanco.inativa := inativa_conta.Text;
  oBanco.nome_user := dmUsuario.LoginNome;


  oBanco.Salvar;
end;

procedure TfrmBanco.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Assigned (oBanco) then
  begin
    if (dsCadastro.DataSet.State=dsBrowse) then
      mostraDados;
  end;
    qtdRegistros := dbgConsulta.DataSource.DataSet.RecordCount;
end;

procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  inherited;
  oBanco := Tbanco.Create;
  dsCadastro.DataSet:= oBanco.GetCds;
  inativa_conta.items.Add('SIM');
  inativa_conta.items.Add('NAO');
end;

procedure TfrmBanco.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=tsConsulta;
end;

procedure TfrmBanco.limpaCampos;
begin
  edtNome.Text := '';
end;

procedure TfrmBanco.mostraDados;
begin
  oBanco.GetDados;

  edtCodigo.Value := oBanco.codigo;
  edtNome.Text := oBanco.nome;
  edtNumero.Text := oBanco.numero;
end;

end.

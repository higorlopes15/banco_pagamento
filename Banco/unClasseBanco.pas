unit unClasseBanco;

interface

uses
System.SysUtils, System.Classes, Vcl.Dialogs, Datasnap.DBClient, Data.DB,System.Generics.Collections,unDmTitulo;

type Tbanco = class
  private
    bCodigo: integer;
    bIdBanco: string;
    bAgencia: String;
    bInativa: String;
    bVerifica: String;
    bUser: String;
    bNome: string;
    bNumero: string;
    FListaBancos : TObjectList<Tbanco>;

public
  constructor Create;
  destructor Destroy;

  procedure Incluir;
  procedure Alterar;
  procedure Excluir;
  procedure Cancelar;
  procedure Salvar;
  procedure GetDados;

  function GetCds: TClientDataSet;
  function getBancoId(nomeBanco: string): string;
  function TemMov(bVerifica: String): String;

  property codigo: integer read bCodigo write bCodigo;
  property agencia: string read bAgencia write bAgencia;
  property nome_user: string read bUser write bUser;
  property verifica_user: String read bVerifica write bVerifica;
  property inativa: string read bInativa write bInativa;
  property idbanco: string read bIdBanco write bIdBanco;
  property numero: string read bNumero write bNumero;
  property nome: string read bNome write bNome;

  property ListaBancos : TObjectList<Tbanco> read FListaBancos write FListaBancos;

  procedure addItem(bnome:string; bnumero:string);
end;

implementation

{ Tbanco }

uses unDmBanco;

procedure Tbanco.addItem(bnome, bnumero: string);
var
  i : integer;
begin
  FListaBancos.Add(Tbanco.Create);
  i := FListaBancos.count -1;

  FListaBancos[i].bNumero :=  dmBancos.cdsBancoCODIGOBANCO.Text;
  FListaBancos[i].bNome :=  dmBancos.cdsBancoNOMEBANCO.Text;
end;

procedure Tbanco.Alterar;
begin
  if Assigned(dmBancos) then
  dmBancos.Alterar;
end;

procedure Tbanco.Cancelar;
begin
  if Assigned(dmBancos) then
  dmBancos.Cancelar;
end;

constructor Tbanco.Create;
begin
  FListaBancos := TObjectList<Tbanco>.Create;
  try
    dmBancos := TdmBancos.Create(nil);
    dmBancos.cdsBanco.Open;
  except
    showMessage('Ocorreu um erro ao tentar criar o datamodule de Usu�rios');
  end;
end;

destructor Tbanco.Destroy;
begin
  dmBancos.cdsBanco.Close;
  FreeAndNil(dmBancos);
end;

procedure Tbanco.Excluir;
begin
  if Assigned(dmBancos) then
  dmBancos.Excluir;
end;

function Tbanco.getBancoId(nomeBanco: string): string;
begin
  Result:='';
  dmBancos.qryAux.sql.clear;
  dmBancos.qryAux.sql.add('select IDBANCO from bancos where nomebanco ='+QuotedStr(nomeBanco));
  dmBancos.qryAux.Open;
  Result:= dmBancos.qryAux.FieldByName('IDBANCO').AsString;
  dmBancos.qryAux.Close;
end;

function Tbanco.TemMov(bVerifica: String): String;
begin
  Result:='';
  dmTitulo.qryAux.sql.clear;
  dmTitulo.qryAux.sql.add('select BANCOID from titulos where bancoid ='+QuotedStr(bVerifica));
  dmTitulo.qryAux.Open;
  Result:= dmTitulo.qryAux.FieldByName('BANCOID').AsString;
  dmTitulo.qryAux.Close;
end;

function Tbanco.GetCds: TClientDataSet;
begin
  Result := nil;
  if Assigned(dmBancos) then
    Result := dmBancos.cdsBanco;
end;

procedure Tbanco.GetDados;
begin
  bCodigo := dmBancos.cdsBancoIDBANCO.Value;
  bNumero := dmBancos.cdsBancoCODIGOBANCO.Text;
  bNome := dmBancos.cdsBancoNOMEBANCO.Text;
  bAgencia := dmBancos.cdsBancoAGENCIA.Text;
  bInativa := dmBancos.cdsBancoINATIVA.Text;
  bUser := dmBancos.cdsBancoIDCLIENTE.Text;
end;

procedure Tbanco.Incluir;
begin
  if Assigned(dmBancos) then
  dmBancos.Incluir;
end;

procedure Tbanco.Salvar;
begin
  dmBancos.cdsBancoIDBANCO.Value := bCodigo;
  dmBancos.cdsBancoCODIGOBANCO.Text := bNumero;
  dmBancos.cdsBancoNOMEBANCO.Text := bNome;
  dmBancos.cdsBancoAGENCIA.Text := bAgencia;
  dmBancos.cdsBancoINATIVA.Text := bInativa;
  dmBancos.cdsBancoIDCLIENTE.Text := bUser;

  if Assigned(dmBancos) then
    dmBancos.Salvar;
end;

end.

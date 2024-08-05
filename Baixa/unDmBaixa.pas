unit unDmBaixa;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,Vcl.Dialogs;

type
  TdmBaixa = class(TDataModule)
    cdsBaixa: TClientDataSet;
    dspBaixa: TDataSetProvider;
    qryBaixa: TFDQuery;
    qryAux: TFDQuery;
    cdsBaixaIDBAIXA: TIntegerField;
    cdsBaixaTITULOID: TIntegerField;
    cdsBaixaUSUARIOID: TIntegerField;
    cdsBaixaDATABAIXA: TStringField;
    cdsBaixaBANCOID: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Incluir;
    procedure Alterar;
    procedure Excluir;
    procedure Salvar;
    procedure Cancelar;
  end;

var
  dmBaixa: TdmBaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

{ TdmBaixa }

procedure TdmBaixa.Alterar;
begin
  try
  cdsBaixa.Edit;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar alterar o registro: ' + E.Message);
  end;
end;

procedure TdmBaixa.Cancelar;
begin
  try
  cdsBaixa.Cancel;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar cancelar o registro: ' + E.Message);
  end;
end;

procedure TdmBaixa.Excluir;
begin
  try
    cdsBaixa.Delete;
    if (cdsBaixa.ChangeCount > 0) then
      cdsBaixa.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar excluir o registro: ' + E.Message);
  end;
end;

procedure TdmBaixa.Incluir;
begin
  try
    cdsBaixa.Append;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar incluir o registro: ' + E.Message);
  end;
end;

procedure TdmBaixa.Salvar;
begin
  try
    cdsBaixa.Post;
    if (cdsBaixa.ChangeCount > 0) then
       cdsBaixa.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar salvar o registro: ' + E.Message);
  end;
end;

end.

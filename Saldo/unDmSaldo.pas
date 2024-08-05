unit unDmSaldo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Data.DB, Datasnap.DBClient,Vcl.Dialogs;

type
  TdmSaldo = class(TDataModule)
    cdsSaldo: TClientDataSet;
    dspSaldo: TDataSetProvider;
    qrySaldo: TFDQuery;
    qryAux: TFDQuery;
    cdsSaldoIDSALDO: TIntegerField;
    cdsSaldoBANCOID: TIntegerField;
    cdsSaldoSALDOINICIAL: TSingleField;
    cdsSaldoSALDOFINAL: TSingleField;
    cdsSaldoENTRADA: TSingleField;
    cdsSaldoSAIDA: TSingleField;
    cdsSaldoDATASALDO: TStringField;
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
  dmSaldo: TdmSaldo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unDMConexao;

{$R *.dfm}

{ TdmSaldo }

procedure TdmSaldo.Alterar;
begin
  try
  cdsSaldo.Edit;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar alterar o registro: ' + E.Message);
  end;
end;

procedure TdmSaldo.Cancelar;
begin
  try
  cdsSaldo.Cancel;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar cancelar o registro: ' + E.Message);
  end;
end;

procedure TdmSaldo.Excluir;
begin
  try
    cdsSaldo.Delete;
    if (cdsSaldo.ChangeCount > 0) then
      cdsSaldo.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar excluir o registro: ' + E.Message);
  end;
end;

procedure TdmSaldo.Incluir;
begin
  try
    cdsSaldo.Append;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar incluir o registro: ' + E.Message);
  end;
end;

procedure TdmSaldo.Salvar;
begin
  try
    cdsSaldo.Post;
    if (cdsSaldo.ChangeCount > 0) then
       cdsSaldo.ApplyUpdates(-1);
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao tentar salvar o registro: ' + E.Message);
  end;
end;

end.

unit unConfirmacaoBaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,unClasseBaixa;

type
  TfrmConfirmacaoBaixa = class(TForm)
    lblBanco: TLabel;
    lblSaldo: TLabel;
    lblValorTit: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    oBaixa : TBaixa;
  public
    { Public declarations }
  end;

var
  frmConfirmacaoBaixa: TfrmConfirmacaoBaixa;

implementation

{$R *.dfm}

uses unDmBaixa, unBaixaView;

procedure TfrmConfirmacaoBaixa.SpeedButton1Click(Sender: TObject);
begin
  //oBaixa.codigo := frmBaixa.edtCodigo.Value;
  //oBaixa.Salvar;
end;

end.

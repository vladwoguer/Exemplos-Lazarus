// Calculadora Simples Vladwoguer Bezerra Dezembro de 2015
unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TfrmPrincipal }
  Operacoes = (ADICAO, SUBTRACAO, MULTIPLICACAO, DIVISAO, NONE);
  TfrmPrincipal = class(TForm)
    ButtonResultado: TButton;
    ButtonLimpar: TButton;
    ButtonSair: TButton;
    editPrimeiro: TEdit;
    editSegundo: TEdit;
    LabelSinal: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelResultado: TLabel;
    RadioButtonAdicao: TRadioButton;
    RadioButtonSubtracao: TRadioButton;
    RadioButtonMultiplicacao: TRadioButton;
    RadioButtonDivisao: TRadioButton;
    RadioGroupOperacao: TRadioGroup;

    procedure ButtonLimparClick(Sender: TObject);
    procedure ButtonResultadoClick(Sender: TObject);
    procedure ButtonSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButtonAdicaoChange(Sender: TObject);
    procedure RadioButtonDivisaoChange(Sender: TObject);
    procedure RadioButtonMultiplicacaoChange(Sender: TObject);
    procedure RadioButtonSubtracaoChange(Sender: TObject);

  private
    { private declarations }
    operacao : Operacoes;
  public
    { public declarations }
    procedure setOperacao(op : Operacoes);
    function getOperacao() : Operacoes;
    procedure atualizaSinal;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.atualizaSinal;

begin
  if(RadioButtonAdicao.Checked = True)then
  begin
     setOperacao(ADICAO);
  end
  else
  if(RadioButtonSubtracao.Checked = True)then
  begin
     setOperacao(SUBTRACAO);
  end
  else
  if(RadioButtonMultiplicacao.Checked = True)then
  begin
     setOperacao(MULTIPLICACAO);
  end
  else
  if(RadioButtonDivisao.Checked = True)then
  begin
     setOperacao(DIVISAO);
  end
  else
  begin
    setOperacao(NONE);
  end;


  case operacao of
  ADICAO:
         begin
              LabelSinal.Caption := '+';
         end;

  SUBTRACAO:
         begin
              LabelSinal.Caption := '-';
         end;

  MULTIPLICACAO:
        begin
             LabelSinal.Caption := '*';
        end;
   DIVISAO:
        begin
             LabelSinal.Caption := '/';
        end;
  end;
end;

procedure  TfrmPrincipal.setOperacao(op : Operacoes);
begin
  self.operacao := op;
end;

function TfrmPrincipal.getOperacao() : Operacoes;
begin
  getOperacao := self.operacao;
end;

procedure TfrmPrincipal.ButtonResultadoClick(Sender: TObject);
var
   a: real;
   b: real;
   resultado: real;
begin
     atualizaSinal;
     try
     a := StrToFloat(editPrimeiro.Text);
     b := StrToFloat(editSegundo.Text);
      case operacao of
     ADICAO:
     begin
          resultado := a + b;
          LabelResultado.Caption := FloatToStr(resultado);
     end;
     SUBTRACAO:
     begin
          resultado := a - b;
          LabelResultado.Caption := FloatToStr(resultado);
     end;
     MULTIPLICACAO:
     begin
          resultado := a * b;
          LabelResultado.Caption := FloatToStr(resultado);
     end;
     DIVISAO:
     begin
          resultado := a / b;
          LabelResultado.Caption := FloatToStr(resultado);
     end;
     else
     begin
          ShowMessage('Por favor selecione uma operação!');
          LabelResultado.Caption := '';

     end;

     end;

     except
       ShowMessage('Por favor forneça dados válidos!');
     end;



end;

procedure TfrmPrincipal.ButtonSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.ButtonLimparClick(Sender: TObject);
begin
  editPrimeiro.Clear;
  editSegundo.Clear;
  LabelSinal.Caption:='';
  LabelResultado.Caption:='';
  editPrimeiro.SetFocus;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
      operacao := NONE;
end;

procedure TfrmPrincipal.RadioButtonAdicaoChange(Sender: TObject);
begin
  atualizaSinal;
end;

procedure TfrmPrincipal.RadioButtonDivisaoChange(Sender: TObject);
begin
  atualizaSinal;
end;

procedure TfrmPrincipal.RadioButtonMultiplicacaoChange(Sender: TObject);
begin
  atualizaSinal;
end;

procedure TfrmPrincipal.RadioButtonSubtracaoChange(Sender: TObject);
begin
  atualizaSinal;
end;








end.


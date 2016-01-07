unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  Contato = class(TObject)
    private
        nomeContato, telefoneContato: string;
    public

      property nome : String
          read nomeContato;
      property telefone : String
          read telefoneContato;
      constructor Create(_nome: string; _telefone: string);
  end;

  { TForm1 }

  TForm1 = class(TForm)
    ButtonAdicionar: TButton;
    ButtonProximo: TButton;
    ButtonAnterior: TButton;
    EditNome: TEdit;
    EditNomeVisualizacao: TEdit;
    EditTelefone: TEdit;
    EditTelefoneVisualizacao: TEdit;
    LabelRegistro: TLabel;
    LabelContagem: TLabel;
    LabelNome1: TLabel;
    LabelRegistros: TLabel;
    LabelNome: TLabel;
    LabelTelefone: TLabel;
    LabelTelefone1: TLabel;
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure ButtonAnteriorClick(Sender: TObject);
    procedure ButtonProximoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    listaContatos: TList;
    indice, total: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

 { TForm1 }

 procedure TForm1.ButtonAdicionarClick(Sender: TObject);
 begin
   if((Trim(EditNome.Text) = '') or (Trim(EditTelefone.Text) = ''))then begin
      ShowMessage('Por favor preencha os campos faltando');
      Exit;
   end;

   listaContatos.Add(Contato.Create(EditNome.Text, EditTelefone.Text));
    total := total + 1;
    if(total=1)then begin
        EditNomeVisualizacao.Text:= Contato (listaContatos[indice]).nome;
        EditTelefoneVisualizacao.Text:= Contato (listaContatos[indice]).telefone;

    end
    else begin
        ButtonProximo.Enabled:= True;
    end;
    LabelRegistro.Caption:= IntToStr(indice+1) + '/' + IntToStr(total);
 end;

procedure TForm1.ButtonAnteriorClick(Sender: TObject);
begin
     if indice > 0 then begin
     indice := indice - 1;
     ButtonProximo.Enabled:= True;
     EditNomeVisualizacao.Text:= Contato (listaContatos[indice]).nome;
     EditTelefoneVisualizacao.Text:= Contato (listaContatos[indice]).telefone;
     end;
     if(indice  = 0)then begin
         ButtonAnterior.Enabled:= False;
     end;
  LabelRegistro.Caption:= IntToStr(indice+1) + '/' + IntToStr(total);
end;

procedure TForm1.ButtonProximoClick(Sender: TObject);
begin
  if indice <= total then begin
     indice := indice + 1;
     ButtonAnterior.Enabled:= True;
     EditNomeVisualizacao.Text:= Contato (listaContatos[indice]).nome;
     EditTelefoneVisualizacao.Text:= Contato (listaContatos[indice]).telefone;
  end;
  if((indice+1) = total)then begin
     ButtonProximo.Enabled:= False;
  end;
  LabelRegistro.Caption:= IntToStr(indice+1) + '/' + IntToStr(total);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  indice:= 0;
  total:= 0;
  listaContatos:= TList.Create;
end;

 constructor Contato.Create(_nome: string; _telefone: string);
 begin
   self.nomeContato := _nome;
   self.telefoneContato := _telefone;
 end;
end.


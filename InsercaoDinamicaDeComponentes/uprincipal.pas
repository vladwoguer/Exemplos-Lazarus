unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    ButtonCriar: TButton;
    procedure ButtonCriarClick(Sender: TObject);
  private
    { private declarations }
     ButtonDinamico: TButton;
  public
    { public declarations }
    procedure cliqueDinamico(Sender: TObject);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.cliqueDinamico(Sender: TObject);
begin
    ShowMessage(Concat('Eu sou o Botao',TButton (Sender).Name));
end;

procedure TFormPrincipal.ButtonCriarClick(Sender: TObject);
begin
  ButtonDinamico := TButton.Create(nil);
  ButtonDinamico.Parent:= FormPrincipal;
  ButtonDinamico.Name:= 'ButtonDinamico';
  ButtonDinamico.Caption:= 'Dinâmico';
  ButtonDinamico.OnClick:= @cliqueDinamico;


end;

end.


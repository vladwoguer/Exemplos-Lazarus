//Exemplo Vladwoguer Bezerra Dezembro 2015
unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StaticText1: TStaticText;



    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button2MouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
    moveu: boolean;
    cont: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }





procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.cont := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.cont := Form1.cont + 1;

  if (Form1.cont = 1) then
  begin
       ShowMessage('1 pessoa enganada.');
  end
  else
  begin
      ShowMessage(IntToStr(Form1.cont) + ' pessoas enganadas.');
  end;

end;

procedure TForm1.Button2MouseEnter(Sender: TObject);
begin
     Form1.moveu := not Form1.moveu;
      if(Form1.moveu = True) then
      begin
           Form1.Button2.Left:= Form1.Button2.Left - 280;
      end
      else
      begin
           Form1.Button2.Left:= Form1.Button2.Left + 280;
      end;
end;






end.


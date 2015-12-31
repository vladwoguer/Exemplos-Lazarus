unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, LCLType,
  ExtCtrls, StdCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    ShapeAtor: TShape;
    ShapeInimigo4: TShape;
    ShapeInimigo6: TShape;
    ShapeInimigo7: TShape;
    ShapePontos1: TShape;
    ShapePontos2: TShape;
    ShapeInimigo3: TShape;
    ShapeInimigo1: TShape;
    ShapeInimigo5: TShape;
    ShapeInimigo8: TShape;
    ShapeInimigo2: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    UpDown1: TUpDown;
    procedure ControlBar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);

  private
    { private declarations }
  public
    { public declarations }
    Cima,Direita: Boolean;
    velocidade : integer;
    pontos:integer;
    inimigo: array[1..8] of TShape;
    vida: integer;
    morreu: boolean;


  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
              case Key of
  VK_LEFT:
    begin
         Form1.Direita:=False;
    end;
  VK_RIGHT:
    begin
         Form1.Direita:=True;
    end;
  VK_UP:
    begin
         Form1.Cima:=True;
    end;
  VK_DOWN:
    begin
         Form1.Cima:=False;
    end;
  end;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      velocidade := 1;
      pontos := 0;
      inimigo[1] := ShapeInimigo1;
      inimigo[2] := ShapeInimigo2;
      inimigo[3] := ShapeInimigo3;
      inimigo[4] := ShapeInimigo4;
      inimigo[5] := ShapeInimigo5;
      inimigo[6] := ShapeInimigo6;
      inimigo[7] := ShapeInimigo7;
      inimigo[8] := ShapeInimigo8;
      vida := 100;
      morreu := False;
end;

procedure TForm1.ControlBar1Click(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Form1.Cima = True then
  begin
     if ShapeAtor.Top >= (Form1.velocidade+GroupBox1.Height) then
     begin
        ShapeAtor.Top := ShapeAtor.Top - Form1.velocidade;
     end ;

  end
  else

  begin
  if ShapeAtor.Top <= Form1.Height-(ShapeAtor.Height+Form1.velocidade) then
     begin
        ShapeAtor.Top := ShapeAtor.Top + Form1.velocidade ;
     end ;
  end;

   if Form1.Direita = True then
  begin
     if ShapeAtor.Left <= Form1.Width-(ShapeAtor.Width+Form1.velocidade) then
     begin
        ShapeAtor.Left := ShapeAtor.Left + Form1.velocidade ;
     end ;

  end
  else
  begin
      if ShapeAtor.Left >= Form1.velocidade then
     begin
        ShapeAtor.Left := ShapeAtor.Left - Form1.velocidade;
     end ;
  end;

     if vida <= 0 then
            begin
               if(morreu = False) then
               begin
                    morreu := true;
                    if MessageDlg('Você Morreu', mtConfirmation, [mbOk], 0) = mrOk then
                     begin
                         Application.Terminate;
                     end;

               end;
            end;


end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  i: integer;
begin
  for i:= 1 to 8 do
    begin
    if (inimigo[i].Left >= ShapeAtor.Left) and
     ((inimigo[i].Left +ShapePontos1.Width) <= (ShapeAtor.Left+ShapeAtor.Width)) and
     (inimigo[i].Top >= ShapeAtor.Top) and
     ((inimigo[i].Top+ShapePontos1.Height) <= (ShapeAtor.Top+ShapeAtor.Height)) then
     begin
           vida := vida - 1;
           ProgressBar1.Position := vida;

     end;

    end;
    if (ShapePontos2.Left >= ShapeAtor.Left) and
     ((ShapePontos2.Left +ShapePontos1.Width) <= (ShapeAtor.Left+ShapeAtor.Width)) and
     (ShapePontos2.Top >= ShapeAtor.Top) and
     ((ShapePontos2.Top+ShapePontos1.Height) <= (ShapeAtor.Top+ShapeAtor.Height)) then
     begin
        Form1.pontos := Form1.pontos + 1;
     end;

  if (ShapePontos1.Left >= ShapeAtor.Left) and
     ((ShapePontos1.Left +ShapePontos1.Width) <= (ShapeAtor.Left+ShapeAtor.Width)) and
     (ShapePontos1.Top >= ShapeAtor.Top) and
     ((ShapePontos1.Top+ShapePontos1.Height) <= (ShapeAtor.Top+ShapeAtor.Height)) then
     begin
        Form1.pontos := Form1.pontos + 1;
     end;

  if (ShapePontos2.Left >= ShapeAtor.Left) and
     ((ShapePontos2.Left +ShapePontos1.Width) <= (ShapeAtor.Left+ShapeAtor.Width)) and
     (ShapePontos2.Top >= ShapeAtor.Top) and
     ((ShapePontos2.Top+ShapePontos1.Height) <= (ShapeAtor.Top+ShapeAtor.Height)) then
     begin
        Form1.pontos := Form1.pontos + 1;
     end;

  Edit2.Text:=IntToStr(pontos);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin

end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  Form1.velocidade:=StrToInt(Edit1.Text);
end;



end.


unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    StaticText1: TStaticText;

    procedure Button1Click(Sender: TObject);
    procedure Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image2Click(Sender: TObject);
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



procedure TForm1.Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;


procedure TForm1.Button1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.cont := 0;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      Form1.moveu := not Form1.moveu;
      if(Form1.moveu = True) then
      begin
           Form1.Image1.Left:= Form1.Image1.Left - 280;
      end
      else
      begin
           Form1.Image1.Left:= Form1.Image1.Left + 280;
      end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
     Form1.cont :=  Form1.cont + 1;
     if(cont = 1) then
     begin
          ShowMessage(IntToStr(cont) + ' pessoa enganada.');
     end
     else
     begin
          ShowMessage(IntToStr(cont) + ' pessoas enganadas.');
     end;
end;

end.


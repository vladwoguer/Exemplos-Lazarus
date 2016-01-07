//Exemplo Vladwoguer Bezerra Dezembro 2015
unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ShellApi, lclintf;

type
    HelloWorld = class

      procedure mostrar;
      private
      public
    end;

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btnHelloWorld: TButton;
    lblAbout: TLabel;
    lblHelloWorld: TLabel;
    procedure btnHelloWorldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblAboutClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

end;

procedure TfrmPrincipal.lblAboutClick(Sender: TObject);
begin
   OpenURL('http:\\github.com\vladwoguer');
end;

procedure TfrmPrincipal.btnHelloWorldClick(Sender: TObject);
var
  hw : HelloWorld;
begin
     hw := HelloWorld.Create;
     hw.mostrar;
     hw.Destroy;
end;
procedure HelloWorld.mostrar;
   begin
     ShowMessage('Hello Lazarus!!!');
   end;
end.


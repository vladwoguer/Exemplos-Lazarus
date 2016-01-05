program Splash;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uPrincipal, uSplash
  { you can add units after this }
  ,crt;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  FormSplash := TFormSplash.Create(nil);
  FormSplash.Show;
  FormSplash.Update;
  Delay(3500);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  FormSplash.Hide;
  FormSplash.Free;
  Application.Run;
end.


program empresa;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uPrincipal, uCadastroEmpregado, uEdicaoEmpregado
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCriacaoEmpregado, FormCriacaoEmpregado);
  Application.CreateForm(TFormEdicaoEmpregado, FormEdicaoEmpregado);
  Application.Run;
end.


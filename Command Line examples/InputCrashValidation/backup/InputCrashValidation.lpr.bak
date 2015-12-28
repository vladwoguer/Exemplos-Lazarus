program InputCrashValidation;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  error : integer;
  numero : integer;
  UserInput : string;

begin

  repeat
        write('Entre com um número: ');
        readln(UserInput);
        val(UserInput, numero, error);
  until error=0;
  writeln('O numero ', numero, ' ao quadrado é ', numero * numero);
  writeln;
  writeln;
  writeln('Aperte <enter> para sair.');
  readln;
end.


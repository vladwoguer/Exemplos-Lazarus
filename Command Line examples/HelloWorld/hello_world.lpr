program hello_world;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

begin
  WriteLn('Hello World!');
  Writeln;
  Writeln;
  Writeln('Aperte <enter> pra sair.');
  ReadLn;
end.


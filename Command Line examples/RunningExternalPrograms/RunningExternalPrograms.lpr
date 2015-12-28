program RunningExternalPrograms;

{$mode objfpc}{$H+}

uses
  process,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  script : TProcess;
begin
  script := TProcess.Create(nil);
  script.CommandLine := 'calc.exe';
  script.execute;
  script.Free;
end.


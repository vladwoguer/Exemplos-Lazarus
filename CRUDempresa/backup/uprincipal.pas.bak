unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, FileUtil, Forms, Controls, Graphics,
  Dialogs, Grids, StdCtrls, uCadastroEmpregado, uEdicaoEmpregado;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    ButtonEditar: TButton;
    ButtonNovo: TButton;
    ButtonRefresh: TButton;
    ButtonExcluir: TButton;
    SQLite3Connection: TSQLite3Connection;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    StringGridEmpregados: TStringGrid;
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    procedure RefreshEmpregados;
    procedure ApagarEmpregado(id:string);
    procedure EditarEmpregado(id:string);
  public
    { public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.ApagarEmpregado(id:string);
begin
 if MessageDlg('Certeza que deseja apagar?', mtConfirmation, mbOKCancel,0) = mrOK then begin
    SQLTransaction.Active:=False;
    SQLQuery.SQL.Text:= 'DELETE FROM empregado WHERE id='+id;
    SQLTransaction.StartTransaction;
    SQLQuery.ExecSQL;
    SQLTransaction.Commit;
  end;
end;

procedure TFormPrincipal.EditarEmpregado(id:string);
begin
     uEdicaoEmpregado.FormEdicaoEmpregado.id_empregado:= StrToInt(id);
     uEdicaoEmpregado.FormEdicaoEmpregado.ShowModal;
end;

procedure TFormPrincipal.RefreshEmpregados;
begin
     SQLQuery.SQL.Text := 'SELECT e.id,e.nome,d.nome FROM empregado e, departamento d WHERE e.departamento = d.id';
     StringGridEmpregados.RowCount:=1; // Limpa o StringGrid
     SQLTransaction.Active:=False;
     SQLTransaction.StartTransaction;
     SQLQuery.Open;
     while not SQLQuery.EOF do
     begin
       StringGridEmpregados.RowCount:= StringGridEmpregados.RowCount + 1;
       StringGridEmpregados.Cells[0,StringGridEmpregados.RowCount-1]:= SQLQuery.Fields[0].Text;
       StringGridEmpregados.Cells[1,StringGridEmpregados.RowCount-1]:= SQLQuery.Fields[1].AsString;
       StringGridEmpregados.Cells[2,StringGridEmpregados.RowCount-1]:= SQLQuery.Fields[2].AsString;
       SQLQuery.Next;
     end;
     SQLQuery.Close;
     SQLTransaction.Commit;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FormPrincipal.Caption:= 'Exemplo de SqLite3 no Lazarus';
  SQLite3Connection.DatabaseName:='banco.db';
  SQLite3Connection.Connected:=True;
  SQLTransaction.DataBase:= SQLite3Connection;
  SQLQuery.DataBase:= SQLite3Connection;
  SQLQuery.Transaction:= SQLTransaction;
end;

procedure TFormPrincipal.ButtonRefreshClick(Sender: TObject);
begin
  RefreshEmpregados;
end;

procedure TFormPrincipal.ButtonExcluirClick(Sender: TObject);
begin
     if StringGridEmpregados.row > 0 then  begin
        StringGridEmpregados.Cells[0, StringGridEmpregados.Row];
        ApagarEmpregado(StringGridEmpregados.Cells[0, StringGridEmpregados.Row]);
        RefreshEmpregados;
  end;
end;

procedure TFormPrincipal.ButtonEditarClick(Sender: TObject);
begin
   if StringGridEmpregados.row > 0 then  begin
        StringGridEmpregados.Cells[0, StringGridEmpregados.Row];
        EditarEmpregado(StringGridEmpregados.Cells[0, StringGridEmpregados.Row]);
        RefreshEmpregados;
  end;
end;

procedure TFormPrincipal.ButtonNovoClick(Sender: TObject);
begin
  uCadastroEmpregado.FormCriacaoEmpregado.ShowModal;
  RefreshEmpregados;
end;

end.


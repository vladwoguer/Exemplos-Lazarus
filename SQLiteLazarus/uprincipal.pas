unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls, ExtCtrls;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    DataSourceTabelaDatos: TDataSource;
    DBGridTabelaDatos: TDBGrid;
    LabelConectado: TLabel;
    ShapeConectado: TShape;
    SQLite3Connection: TSQLite3Connection;
    SQLQueryTabelaDatos: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin

  SQLite3Connection.DatabaseName:='datos.db';
  try
     SQLite3Connection.Connected:=True;
     ShapeConectado.Brush.Color:= clGreen;

  except
    ShowMessage('Não foi possível acessar o banco de dados');
  end;
  SQLTransaction.DataBase:= SQLite3Connection;
  SQLQueryTabelaDatos.DataBase:= SQLite3Connection;
  SQLQueryTabelaDatos.SQL.Text:= 'Select * FROM datos ';
  SQLQueryTabelaDatos.Open;
  DataSourceTabelaDatos.DataSet:= SQLQueryTabelaDatos;
  DBGridTabelaDatos.DataSource:= DataSourceTabelaDatos;
  DBGridTabelaDatos.AutoFillColumns:=True;

end;

end.


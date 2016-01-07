unit uEdicaoEmpregado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TFormEdicaoEmpregado }

  TFormEdicaoEmpregado = class(TForm)
    ButtonCancelar: TButton;
    ButtonOK: TButton;
    ComboBoxDepartamento: TComboBox;
    EditNome: TEdit;
    LabelDepartamento: TLabel;
    LabelNome: TLabel;
    SQLite3Connection: TSQLite3Connection;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    procedure AtualizaEmpregado(id:integer; nome:string; cd_departamento:integer);
  public
    { public declarations }
    id_empregado: integer;
  end;

var
  FormEdicaoEmpregado: TFormEdicaoEmpregado;

implementation

{$R *.lfm}

{ TFormEdicaoEmpregado }
procedure TFormEdicaoEmpregado.AtualizaEmpregado(id:integer; nome:string; cd_departamento:integer);
begin
    SQLQuery.SQL.Text:= 'UPDATE empregado set nome='+''''+nome+''''+', departamento='+IntToStr(cd_departamento)+' WHERE id='+IntToStr(id);
    SQLTransaction.Active:= False;
    SQLTransaction.StartTransaction;
    SQLQuery.ExecSQL;
    SQLTransaction.Commit;
    Close;
end;

procedure TFormEdicaoEmpregado.ButtonCancelarClick(Sender: TObject);
begin
  FormEdicaoEmpregado.Close;
end;

procedure TFormEdicaoEmpregado.ButtonOKClick(Sender: TObject);
begin
   AtualizaEmpregado(id_empregado,EditNome.Text,Integer(ComboBoxDepartamento.Items.Objects[ComboBoxDepartamento.ItemIndex]));
end;

procedure TFormEdicaoEmpregado.FormCreate(Sender: TObject);
begin
  FormEdicaoEmpregado.Caption:= 'Edição Funcionario';
  SQLite3Connection.DatabaseName:='banco.db';
  SQLite3Connection.Connected:=True;
  SQLTransaction.DataBase:= SQLite3Connection;
  SQLQuery.DataBase:= SQLite3Connection;
  SQLQuery.Transaction:= SQLTransaction;
end;

procedure TFormEdicaoEmpregado.FormShow(Sender: TObject);
begin
    ComboBoxDepartamento.Clear;
    SQLQuery.SQL.Text:= 'SELECT id,nome FROM departamento';
    SQLTransaction.Active:=False;
    SQLTransaction.StartTransaction;
    SQLQuery.Open;
    while not SQLQuery.EOF do begin
      ComboBoxDepartamento.AddItem(SQLQuery.Fields[1].AsString,TObject(SQLQuery.Fields[0].AsInteger));
      SQLQuery.Next;
    end;
    SQLQuery.Close;
    SQLTransaction.Commit;
     SQLQuery.SQL.Text := 'SELECT e.id,e.nome,d.nome FROM empregado e, departamento d WHERE e.departamento = d.id AND e.id='+IntToStr(id_empregado);
     SQLTransaction.Active:=False;
     SQLTransaction.StartTransaction;
     SQLQuery.Open;
     if SQLQuery.EOF then begin
       FormEdicaoEmpregado.Close;
     end else
     begin
       FormEdicaoEmpregado.EditNome.Text:= SQLQuery.Fields[1].AsString;

     end;
     SQLQuery.Close;
     SQLTransaction.Commit;


end;

end.


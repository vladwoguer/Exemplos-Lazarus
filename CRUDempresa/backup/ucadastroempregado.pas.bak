unit uCadastroEmpregado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TFormCriacaoEmpregado }

  TFormCriacaoEmpregado = class(TForm)
    ButtonOK: TButton;
    ButtonCancelar: TButton;
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
    procedure InserirEmpregado(nome: string; cd_departamento: Integer);
  public
    { public declarations }
  end;

var
  FormCriacaoEmpregado: TFormCriacaoEmpregado;

implementation

{$R *.lfm}

{ TFormCriacaoEmpregado }

procedure TFormCriacaoEmpregado.InserirEmpregado(nome: String; cd_departamento: Integer);
begin
    SQLQuery.SQL.Text:= 'INSERT INTO empregado(nome,departamento) values ('+''''+nome+''''+','+IntToStr(cd_departamento)+')';
    SQLTransaction.Active:= False;
    SQLTransaction.StartTransaction;
    SQLQuery.ExecSQL;
    SQLTransaction.Commit;
end;

procedure TFormCriacaoEmpregado.FormCreate(Sender: TObject);
begin
  FormCriacaoEmpregado.Caption:= 'Cadastro Funcionario';
  SQLite3Connection.DatabaseName:='banco.db';
  SQLite3Connection.Connected:=True;
  SQLTransaction.DataBase:= SQLite3Connection;
  SQLQuery.DataBase:= SQLite3Connection;
  SQLQuery.Transaction:= SQLTransaction;
end;

procedure TFormCriacaoEmpregado.ButtonCancelarClick(Sender: TObject);
begin
  FormCriacaoEmpregado.Close;
end;

procedure TFormCriacaoEmpregado.ButtonOKClick(Sender: TObject);
begin
  InserirEmpregado(EditNome.Text, Integer(ComboBoxDepartamento.Items.Objects[ComboBoxDepartamento.ItemIndex]));
  FormCriacaoEmpregado.Close;
end;

procedure TFormCriacaoEmpregado.FormShow(Sender: TObject);
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
end;

end.


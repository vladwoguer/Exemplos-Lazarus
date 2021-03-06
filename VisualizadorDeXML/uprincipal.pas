//Exemplo Vladwoguer Bezerra Dezembro 2015
unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, DOM, XMLRead;

type

  { TFormVisualizadorXML }

  TFormVisualizadorXML = class(TForm)
    ButtonLer: TButton;
    ButtonAbrir: TButton;
    EditNomeDoArquivo: TEdit;
    LabelNomeArquivo: TLabel;
    OpenDialogAbrirXML: TOpenDialog;
    TreeViewXML: TTreeView;
    procedure ButtonAbrirClick(Sender: TObject);
    procedure ButtonLerClick(Sender: TObject);
  private
    { private declarations }
    procedure DomToTree(noDoDOM: TDOMNode; noPai: TTreeNode);
  public
    { public declarations }
  end;

var
  FormVisualizadorXML: TFormVisualizadorXML;

implementation

{$R *.lfm}

{ TFormVisualizadorXML }

procedure TFormVisualizadorXML.DomToTree(noDoDOM: TDOMNode; noPai: TTreeNode);
var
  I: integer;
  novoTreeNode: TTreeNode;
  textoDoNo: string;
  noAtributo: TDOMNode;
begin
  // considera apenas nós elementos
  if noDoDOM.NodeType <> ELEMENT_NODE then
    Exit;
  // Inclui o nó
  textoDoNo := noDoDOM.NodeName;   // Texto do nó começa com o nome do nó
  if (noDoDOM.ChildNodes.Count = 1) and (noDoDOM.ChildNodes[0].NodeValue <> '')  then begin
    textoDoNo := textoDoNo + ' = ' + noDoDOM.ChildNodes[0].NodeValue;   // Se não tiver fihos coloca o valor
  end;
  novoTreeNode := TreeViewXML.Items.AddChild(noPai, textoDoNo); // Adiciona efetivamente o nó
  // Inclui atributos, se existirem
  for I := 0 to noDoDOM.Attributes.Length - 1 do begin
    noAtributo := noDoDOM.Attributes.Item[I];
    TreeViewXML.Items.AddChild(novoTreeNode,
      '[' + noAtributo.NodeName + ' = "' + noAtributo.NodeValue + '"]');// Adiciona atributos como filhos
  end;
  // Inclui cada nó filho
  if noDoDOM.HasChildNodes then
    for I := 0 to noDoDOM.ChildNodes.Count - 1 do  begin
      DomToTree(noDoDOM.ChildNodes.Item[I], novoTreeNode);  // Chama recursivamente nos filhos
    end;
end;

procedure TFormVisualizadorXML.ButtonAbrirClick(Sender: TObject);
begin
  if OpenDialogAbrirXML.Execute then begin
     EditNomeDoArquivo.Text := OpenDialogAbrirXML.FileName;
     ButtonLer.Enabled := True;
  end;
end;

procedure TFormVisualizadorXML.ButtonLerClick(Sender: TObject);
var
  Documento: TXMLDocument;
begin
  TreeViewXML.Items.Clear;  // Limpa a árvore
  XMLRead.ReadXMLFile(Documento, EditNomeDoArquivo.Text);// Lê o XML atráves do local do arquivo
  DomToTree(Documento.DocumentElement, nil); // Tranforma de uma árvore DOM para uma árvore TreeView, nil é porque vai se o root(raiz) da árvore
  TreeViewXML.FullExpand; // Expande todos os nós
  Documento.Free; // Libera memória
end;

end.


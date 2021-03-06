unit eDiagnos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TDiagnosEdit = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
  private
  procedure New;
  procedure Change;
    { Private declarations }
  public
  Insert:boolean;
  id:integer;
    { Public declarations }
  end;

var
  DiagnosEdit: TDiagnosEdit;

implementation

{$R *.dfm}

uses cDiagnoses, fDM;
var Diag:TDiagnoses;

procedure TDiagnosEdit.Button1Click(Sender: TObject);
begin
  if Insert then
    new
  else
   Change;
end;

procedure TDiagnosEdit.Change;
begin
  Diag:=TDiagnoses.Create;
  Diag.GetAtr(id);
  Diag.code_:=LabeledEdit1.Text;
  Diag.name_:=LabeledEdit2.Text;
  Diag.ChangeAtr;
  dm.RefTable(dm.QDiagBrowse);
  close;
 // Diag.Destroy;
end;

procedure TDiagnosEdit.LabeledEdit1Change(Sender: TObject);
var Str:String;
begin
  if Length(LabeledEdit1.Text)>8 then
  begin
    ShowMessage('�� ������ 8 �������!');
    str:= LabeledEdit1.Text;
    SetLength(str,8);
    LabeledEdit1.Text:=str;
  end;

end;

procedure TDiagnosEdit.New;
begin
  Diag:=TDiagnoses.Create;
  Diag.code_:=LabeledEdit1.Text;
  Diag.name_:=LabeledEdit2.Text;
  Diag.New;
  dm.RefTable(dm.QDiagBrowse);
  close;

 // Diag.Destroy;
end;

end.

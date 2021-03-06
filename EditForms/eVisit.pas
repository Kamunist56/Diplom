unit eVisit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, cVisit;

type
  TVisitEdit = class(TForm)
    LookPac: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    LookDoc: TDBLookupComboBox;
    Label2: TLabel;
    LookDiag: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    Visit: TVisit;
    { Private declarations }
  public
    Insert: Boolean;
    idVisit: integer;

    procedure AddRec;
    procedure ChangeRec;
    procedure Del;
    { Public declarations }
  end;

var
  VisitEdit: TVisitEdit;

implementation

{$R *.dfm}

uses fDM;

{ TVisitEdit }

procedure TVisitEdit.AddRec;
begin
  Visit := TVisit.Create;
  Visit.dateVisit := DateTimePicker1.Date;
  Visit.Pac.id := LookPac.KeyValue;
  Visit.Doc.id := LookDoc.KeyValue;
  Visit.Diag.id := LookDiag.KeyValue;
  Visit.Destroy;
  Visit.New;
  dm.RefTable(dm.QVisitBrowse);
  close;
end;

procedure TVisitEdit.Button1Click(Sender: TObject);
begin
  if Insert then
    AddRec
  else
    ChangeRec;
end;

procedure TVisitEdit.ChangeRec;
begin
  Visit := TVisit.Create;
  Visit.Get(idVisit);
  Visit.dateVisit := DateTimePicker1.Date;
  Visit.Pac.id := LookPac.KeyValue;
  Visit.Doc.id := LookDoc.KeyValue;
  Visit.Diag.id := LookDiag.KeyValue;
  Visit.Change;
  Visit.Destroy;
  dm.RefTable(dm.QVisitBrowse);
  close;
end;

procedure TVisitEdit.Del;
begin
  Visit := TVisit.Create;
  Visit.Del(idVisit);
  Visit.Destroy;
  dm.RefTable(dm.QVisitBrowse);
end;

end.

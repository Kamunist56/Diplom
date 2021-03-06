unit fVisit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Data.DB, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TuVisit = class(TForm)
    DBGrid1: TDBGrid;
    ActionToolBar1: TActionToolBar;
    AC: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    DataSource1: TDataSource;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uVisit: TuVisit;

implementation

{$R *.dfm}

uses fDM, eVisit;

procedure TuVisit.Action1Execute(Sender: TObject);
begin
  dm.OpenVisitTables;
  VisitEdit.Show;
  VisitEdit.insert := true;

end;

procedure TuVisit.Action2Execute(Sender: TObject);
begin
  dm.OpenVisitTables;
  with VisitEdit do
  begin
    Show;
    insert := false;
    idVisit:=dm.QVisitBrowseid.AsInteger;
    LookPac.KeyValue:=dm.QVisitBrowseidPac.AsInteger;
    LookDoc.KeyValue:=dm.QVisitBrowseidDoc.AsInteger;
    LookDiag.KeyValue:=dm.QVisitBrowseidDiag.AsInteger;
    DateTimePicker1.Date:=(dm.QVisitBrowsedate_visit.AsDateTime);
  end;

  end;

procedure TuVisit.Action3Execute(Sender: TObject);
begin
  if MessageBox(Handle,'������� ������?','�������� ������',
  (MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    VisitEdit.idVisit:=dm.QVisitBrowseid.AsInteger;
    VisitEdit.Del;
  end;

end;

procedure TuVisit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

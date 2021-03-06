unit fPolikl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids, cAdress, cPlace;

type
  TuPolikl = class(TForm)
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
  uPolikl: TuPolikl;
  Polikl: TPlace;
  Adress: Tadress;

implementation

{$R *.dfm}

uses fDM, ePolikl;

procedure TuPolikl.Action1Execute(Sender: TObject);
begin
  dm.OpenAdressTables;
  PoliklEdit.Show;
  PoliklEdit.insert := true;
  PoliklEdit.LabeledEdit1.Clear;
end;

procedure TuPolikl.Action2Execute(Sender: TObject);
begin
  dm.OpenAdressTables;
  PoliklEdit.Show;
  PoliklEdit.insert := false;
  PoliklEdit.LabeledEdit1.text := dm.QPoliklBrowsename.AsString;
  PoliklEdit.Adress := Tadress.Create;
  PoliklEdit.Adress.GetAtr(dm.QPoliklBrowseid.AsInteger);
  PoliklEdit.lookArea.KeyValue := PoliklEdit.Adress.ar.id;
  PoliklEdit.LookLoc.KeyValue := PoliklEdit.Adress.Loc.id;
  PoliklEdit.LookStreet.KeyValue := PoliklEdit.Adress.Street.id;
  PoliklEdit.LookHouse.KeyValue := PoliklEdit.Adress.House_numb.id;
  PoliklEdit.Adress.Destroy;
end;

procedure TuPolikl.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, '������� �����������', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    Adress := Tadress.Create;
    Adress.Del(dm.QPoliklBrowseidAdress.AsInteger);
    Polikl := TPlace.Create('Polikl');
    Polikl.Del(dm.QPoliklBrowseid.AsInteger);
    dm.RefTable(dm.QPoliklBrowse);
  end;
end;

procedure TuPolikl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

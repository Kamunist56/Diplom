unit fSector;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, cSector;

type
  TuSector = class(TForm)
    AC: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    DBGrid1: TDBGrid;
    ActionToolBar1: TActionToolBar;
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
  uSector: TuSector;
  Sector: TSector;

implementation

{$R *.dfm}

uses eSector, fDM;

procedure TuSector.Action1Execute(Sender: TObject);
begin
  SectorEdit.Show;
  SectorEdit.Insert := true;
  dm.OpenPlaceTables;
end;

procedure TuSector.Action2Execute(Sender: TObject);
begin
  SectorEdit.Show;
  dm.OpenPlaceTables;
  SectorEdit.LookPolikl.KeyValue := dm.QBrowseSectorpolikl_id.AsInteger;
  SectorEdit.LabeledEdit1.Text := dm.QBrowseSectorname.AsString;
  SectorEdit.Insert := False;
  SectorEdit.idSector := dm.QBrowseSectorid.AsInteger;
end;

procedure TuSector.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, 'Удалить участок?', 'Удаление записи',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    Sector := TSector.Create;
    Sector.Del(dm.QBrowseSectorid.AsInteger);
    dm.RefTable(dm.QBrowseSector);
  end;
end;

procedure TuSector.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

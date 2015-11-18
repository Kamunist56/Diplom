unit fGrInval;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids, cSmallTables;

type
  TuGrInval = class(TForm)
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
  uGrInval: TuGrInval;
  Group:TSmallTables;

implementation

{$R *.dfm}

uses fDM;

procedure TuGrInval.Action1Execute(Sender: TObject);
var
  newName: String;
begin
  if InputQuery('Добавление новой группы', 'Введите наименование', newName)
  then
  begin
    Group := TSmallTables.Create('GroupInval');
    Group.name := newName;
    Group.New;
    dm.RefTable(dm.QGroupInvBrowse);
  end;

end;

procedure TuGrInval.Action2Execute(Sender: TObject);
begin
  Group := TSmallTables.Create('GroupInval');
  Group.GetAtr(dm.QGroupInvBrowseid.AsInteger);

  Group.name := InputBox('Редактирование группы',
    'Введите новое наименование', dm.QGroupInvBrowsename.AsString);
  Group.ChangeAtr;
  dm.RefTable(dm.QGroupInvBrowse);
end;

procedure TuGrInval.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, 'Удалить группу', 'Удаление записи',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    Group := TSmallTables.Create('GroupInval');
    Group.Del(dm.QGroupInvBrowseid.AsInteger);
  end;
  dm.RefTable(dm.QGroupInvBrowse);
end;

procedure TuGrInval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

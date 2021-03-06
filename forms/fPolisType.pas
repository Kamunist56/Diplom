unit fPolisType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids, cSmallTables;

type
  TuPolisType = class(TForm)
    DBGrid1: TDBGrid;
    ActionToolBar1: TActionToolBar;
    AC: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    DataSource1: TDataSource;
    procedure Action3Execute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uPolisType: TuPolisType;
  PolisType: TSmallTables;

implementation

{$R *.dfm}

uses fDM, ePolis;

procedure TuPolisType.Action1Execute(Sender: TObject);
var
  newName: String;
begin
  if InputQuery('���������� ������ ���� ������', '������� ������������', newName)
  then
  begin
    PolisType := TSmallTables.Create('PolisType');
    PolisType.name := newName;
    PolisType.New;
    dm.RefTable(dm.QpolisTypeBrowse);
  end;
end;

procedure TuPolisType.Action2Execute(Sender: TObject);
begin
  PolisType := TSmallTables.Create('PolisType');
  PolisType.GetAtr(dm.QpolisTypeBrowseid.AsInteger);

  PolisType.name := InputBox('�������������� ���� ������',
    '������� ����� ������������', dm.QpolisTypeBrowsename.AsString);
  PolisType.ChangeAtr;
  dm.RefTable(dm.QpolisTypeBrowse);
end;

procedure TuPolisType.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, '������� �����', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    PolisType := TSmallTables.Create('PolisType');
    PolisType.Del(dm.QpolisTypeBrowseid.AsInteger);
  end;
  dm.RefTable(dm.QpolisTypeBrowse);
end;

procedure TuPolisType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

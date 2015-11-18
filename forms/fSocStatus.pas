unit fSocStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids, cSmallTables;

type
  TuSocStatus = class(TForm)
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
  uSocStatus: TuSocStatus;
  SocStatus: TSmallTables;

implementation

{$R *.dfm}

uses fDM;

procedure TuSocStatus.Action1Execute(Sender: TObject);
var
  name: String;
begin
  SocStatus := TSmallTables.Create('SocStatus');
  InputQuery('���������� ����������� �������', '�������� ������������', name);
  SocStatus.name := name;
  SocStatus.New;
  dm.RefTable(dm.QSocStatusBrowse);
end;

procedure TuSocStatus.Action2Execute(Sender: TObject);
var
  name: String;
begin
  SocStatus := TSmallTables.Create('SocStatus');
  SocStatus.GetAtr(dm.QSocStatusBrowseid.AsInteger);
  name := InputBox('�������������� ����������� �������',
    '�������� ����� ������������', dm.QSocStatusBrowsename.AsString);
  SocStatus.name := name;
  SocStatus.ChangeAtr;
  dm.RefTable(dm.QSocStatusBrowse);
end;

procedure TuSocStatus.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, '������� ���������� ������', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    SocStatus := TSmallTables.Create('SocStatus');
    SocStatus.Del(dm.QSocStatusBrowseid.AsInteger);
    dm.RefTable(dm.QSocStatusBrowse);
  end;
end;

procedure TuSocStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

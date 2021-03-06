unit fWork;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TuWork = class(TForm)
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
  uWork: TuWork;

implementation

{$R *.dfm}

uses eWorkEdit, fDM;

procedure TuWork.Action1Execute(Sender: TObject);
begin
  WorkEdit.Show;
  WorkEdit.Insert:=true;
  dm.OpenAdressTables;
end;

procedure TuWork.Action2Execute(Sender: TObject);
begin
 dm.OpenAdressTables;
  with WorkEdit do
  begin
   Show;
   Insert:=false;
   idWork:=dm.QWorkBrowseid.AsInteger;
   LookLoc.KeyValue:=dm.QWorkBrowseidLoc.asinteger;
   LookArea.KeyValue:=dm.QWorkBrowseidAr.AsInteger;
   LookStreet.KeyValue:=dm.QWorkBrowseidStreet.AsInteger;
   LookHouse.KeyValue:=dm.QWorkBrowseidHouse.AsInteger;
   LabeledEdit1.Text:=dm.QWorkBrowseWorkName.AsString;
  end;

end;

procedure TuWork.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, '������� ����� ������', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    WorkEdit.Del;
  end;
end;

procedure TuWork.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

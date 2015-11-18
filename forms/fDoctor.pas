unit fDoctor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TuDoctor = class(TForm)
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
  uDoctor: TuDoctor;

implementation

{$R *.dfm}

uses fDM, eDoctor;

procedure TuDoctor.Action1Execute(Sender: TObject);
begin
  DoctorEdit.Show;
  DoctorEdit.Insert := true;
  dm.OpenPlaceTables;
  dm.OpenStatusTable;
end;

procedure TuDoctor.Action2Execute(Sender: TObject);
begin
  DoctorEdit.Show;
  DoctorEdit.Insert := false;
  dm.OpenPlaceTables;
  dm.OpenStatusTable;
  with DoctorEdit do
  begin
    idDoc := dm.QDoctorBrowseid.AsInteger;
    LabeledEdit1.Text := dm.QDoctorBrowsesurname.asstring;
    LabeledEdit2.Text := dm.QDoctorBrowsename.asstring;
    LabeledEdit3.Text := dm.QDoctorBrowsepatronymic.asstring;
    DateTimePicker1.Date :=
      VarToDateTime(dm.QDoctorBrowseenployment_date.AsVariant);
    DBLookupComboBox1.KeyValue := dm.QDoctorBrowseidposition.AsInteger;
    DBLookupComboBox2.KeyValue := dm.QDoctorBrowseidpolikl.AsInteger;
  end;
end;

procedure TuDoctor.Action3Execute(Sender: TObject);
begin
if  MessageBox(handle, 'Удалить запись о враче?', 'Удаление записи',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
    begin
      DoctorEdit.idDoc:=dm.QDoctorBrowseid.AsInteger;
      DoctorEdit.del;
    end;
end;

procedure TuDoctor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

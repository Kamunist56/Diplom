unit fAdress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TuAdress = class(TForm)
    AC: TActionManager;
    Action1: TAction;
    ActionToolBar1: TActionToolBar;
    DBGrid1: TDBGrid;
    Action2: TAction;
    Action3: TAction;
    DS: TDataSource;
    Action4: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uAdress: TuAdress;

implementation

{$R *.dfm}

uses eAdress, cAdress, fDM;


procedure TuAdress.Action1Execute(Sender: TObject);
begin
  AdressEdit.show;
  AdressEdit.OpenTables;
  AdressEdit.addAdress:=true;
end;

procedure TuAdress.Action2Execute(Sender: TObject);
begin
  AdressEdit.Show;
  AdressEdit.OpenTables;
  AdressEdit.addAdress:=false;
  AdressEdit.LookArea.KeyValue:=dm.QBrowseAdressidArea.AsInteger;
  AdressEdit.LookLoc.KeyValue:=dm.QBrowseAdressidLoc.AsInteger;
  AdressEdit.LookStreet.KeyValue:=dm.QBrowseAdressidLine.AsInteger;
  AdressEdit.LookHouse.KeyValue:=dm.QBrowseAdressidHouse.AsInteger;
end;

procedure TuAdress.Action3Execute(Sender: TObject);
begin
  Adress:=Tadress.create;
  Adress.Del(dm.QBrowseAdressid.AsInteger);
  Adress.Destroy;
  dm.RefTable(dm.QBrowseAdress);
end;

procedure TuAdress.Action4Execute(Sender: TObject);
var i:integer;
begin

  for i := 0 to dm.QBrowseAdress.FieldCount -1 do
     dm.QBrowseAdress.Fields[i].size:=DBGrid1.Width div dm.QBrowseAdress.FieldCount;

end;

procedure TuAdress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.

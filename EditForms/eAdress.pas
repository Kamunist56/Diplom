unit eAdress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.DBCtrls, Vcl.StdCtrls, cAdress, cSmallTables, fDM, Data.DB,
  Data.Win.ADODB;

type
  TAdressEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LookArea: TDBLookupComboBox;
    LookLoc: TDBLookupComboBox;
    LookStreet: TDBLookupComboBox;
    LookHouse: TDBLookupComboBox;
    Button1: TButton;
    Button5: TButton;
    Button6: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    AddAdress: Boolean;
    idAdress: integer;
    procedure OpenTables;
    procedure AddNewRecord(TableName: String; Query: TADoQuery);
    procedure DelRecord(TableName: String; Query: TADoQuery; id: integer);
    procedure ChangeRecord(TableName: String; Query: TADoQuery; id: integer);
    procedure NewAdress;
    procedure ChangeAdress;

    { Public declarations }
  end;

var
  AdressEdit: TAdressEdit;
  Adress: TAdress;

implementation

{$R *.dfm}

var
  Table_: TSmallTables;

  { TAdressEdit }

procedure TAdressEdit.AddNewRecord(TableName: String; Query: TADoQuery);
var
  s: String;
begin
  if InputQuery('���������� ������', '������� ������������', s) then
  begin
    Table_ := TSmallTables.Create(TableName);
    Table_.name:=s;
    Table_.New;
    Table_.Destroy;
    Query.Close;
    Query.Open;
  end;
end;

procedure TAdressEdit.Button10Click(Sender: TObject);
begin
  AddNewRecord('HouseNumber', dm.QSelectHoume);
end;

procedure TAdressEdit.Button11Click(Sender: TObject);
begin
  ChangeRecord('HouseNumber', dm.QSelectHoume, LookHouse.KeyValue);
end;

procedure TAdressEdit.Button12Click(Sender: TObject);
begin
  DelRecord('HouseNumber', dm.QSelectHoume, LookHouse.KeyValue);
end;

procedure TAdressEdit.Button13Click(Sender: TObject);
begin
  if AddAdress then
    NewAdress
  else
    ChangeAdress;
  Close;
  dm.RefTable(dm.QBrowseAdress);

end;

procedure TAdressEdit.Button1Click(Sender: TObject);
begin
  AddNewRecord('Area', dm.QselectArea);
end;

procedure TAdressEdit.Button2Click(Sender: TObject);
begin
  AddNewRecord('Street', dm.QselectStreet);
end;

procedure TAdressEdit.Button3Click(Sender: TObject);
begin
  ChangeRecord('Street', dm.QselectStreet, LookStreet.KeyValue);
end;

procedure TAdressEdit.Button4Click(Sender: TObject);
begin
  DelRecord('Street', dm.QselectStreet, LookStreet.KeyValue);
end;

procedure TAdressEdit.Button5Click(Sender: TObject);
begin
  ChangeRecord('Area', dm.QselectArea, LookArea.KeyValue);
end;

procedure TAdressEdit.Button6Click(Sender: TObject);
begin
  DelRecord('Area', dm.QselectArea, LookArea.KeyValue);
end;

procedure TAdressEdit.Button7Click(Sender: TObject);
begin
  AddNewRecord('Locality', dm.QselectLoc)
end;

procedure TAdressEdit.Button8Click(Sender: TObject);
begin
  ChangeRecord('Locality', dm.QselectLoc, LookLoc.KeyValue);
end;

procedure TAdressEdit.Button9Click(Sender: TObject);
begin
  DelRecord('Locality', dm.QselectLoc, LookLoc.KeyValue);;
end;

procedure TAdressEdit.ChangeAdress;
begin
  Adress := TAdress.Create;
  Adress.GetAtr(idAdress);
  Adress.loc.GetAtr(LookLoc.KeyValue);
  Adress.ar.GetAtr(LookArea.KeyValue);
  Adress.street.GetAtr( LookStreet.KeyValue);
  Adress.house_numb.GetAtr(LookHouse.KeyValue);
  Adress.ChangeAtr;
  Adress.Destroy;
end;

procedure TAdressEdit.ChangeRecord(TableName: String; Query: TADoQuery;
  id: integer);
begin
  Table_ := TSmallTables.Create(TableName);
  Table_.GetAtr(id);
  Table_.name := InputBox('�������������� ������',
    '������� ' + #13 + '����� ������������', Table_.name);
  Table_.ChangeAtr;
  Table_.Destroy;
  Query.Close;
  Query.Open;
end;

procedure TAdressEdit.DelRecord(TableName: String; Query: TADoQuery;
  id: integer);
begin
  if MessageBox(handle, '������� ������?', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    Table_ := TSmallTables.Create(TableName);
    Table_.Del(id);
    Table_.Destroy;
    Query.Close;
    Query.Open;
  end;
end;

procedure TAdressEdit.NewAdress;
begin
  Adress := TAdress.Create;
  Adress.loc.GetAtr( LookLoc.KeyValue);
  Adress.ar.GetAtr(LookArea.KeyValue);
  Adress.street.GetAtr(LookStreet.KeyValue);
  Adress.house_numb.GetAtr( LookHouse.KeyValue);
  Adress.New;
  Adress.Destroy;
end;

procedure TAdressEdit.OpenTables;
begin
  dm.QselectArea.Open;
  dm.QselectLoc.Open;
  dm.QSelectHoume.Open;
  dm.QselectStreet.Open;
end;

end.

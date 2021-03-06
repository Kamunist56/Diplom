unit cPlace;

interface

uses fDM, cAdress;

{ ����� ��� ������ � Polikl, Stat_work }
Type
  TPlace = Class
  public
    id: integer;
    name_: String;
    adress: TAdress;

    procedure Get(find_id: integer);
    procedure New;
    procedure ChangeAtr;
    procedure Del(idRec: integer);
    constructor Create(Table: String);
    destructor Destroy;

  private
    TableName: String;
  End;

implementation

{ TPlace }

procedure TPlace.ChangeAtr;
begin
  with dm.QPlace do
  begin
    close;
    SQL.Clear;
    SQL.add('update ' + TableName +
      ' set name=:name, adress=:adress where id=:id');
    Parameters.paramvalues['id'] := id;
    Parameters.paramvalues['name'] := name_;
    Parameters.paramvalues['adress'] := adress.id;
    ExecSQL;
  end;
end;

constructor TPlace.Create(Table: String);
begin
  adress := TAdress.Create;
  TableName := Table;
end;

procedure TPlace.Del(idRec: Integer);
begin
  with dm.QPlace do
  begin
    close;
    SQL.Clear;
    SQL.add('delete '+TableName+' where id=:id');
    Parameters.paramvalues['id'] := idRec;
    ExecSQL;
  end;
end;

destructor TPlace.Destroy;
begin
  adress.Destroy;
  inherited;
end;

procedure TPlace.Get(find_id: integer);
var
  idadr: integer;
begin
  with dm.QPlace do
  begin
    close;
    SQL.Clear;
    SQL.add('select name, adress, id from ' +TableName +' where id=:id');
      Parameters.paramvalues['id'] := find_id;
    open;
  end;
  idadr := dm.QPlace.FieldByName('adress').asinteger;

  adress.GetAtr(idadr);
  name_ := dm.QPlace.FieldByName('name').asString;
  id := find_id;
end;

procedure TPlace.New;
begin
  with dm.QPlace do
  begin
    close;
    SQL.Clear;
    SQL.add('insert '+TableName+' (name, adress) values (:name, :adress)');
    Parameters.paramvalues['name'] := name_;
    Parameters.paramvalues['adress'] := adress.id;
    ExecSQL;
  end;
end;

end.

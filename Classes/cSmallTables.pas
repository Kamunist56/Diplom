unit cSmallTables;

interface

{
  Класс для работы с таблицами:
  locality, area, street, house_number
  Group_inval, Polis_type, Position, SocStatus
}
type
  TSmallTables = Class
  public
    id: integer;
    name: string;

    procedure GetAtr(Find_id: integer);
    procedure ChangeAtr;
    procedure New;
    procedure Del(idRecord: integer);
    constructor Create(name: String);

  private
   tableName: string;
  End;

implementation

{ TSmall_tables }

uses fDM;

procedure TSmallTables.ChangeAtr;
begin
  dm.QSmall_tables.Close;
  dm.QSmall_tables.SQL.Clear;
  dm.QSmall_tables.SQL.Add('update ' + tableName +
    ' set name=:name where id=:id');
  dm.QSmall_tables.Parameters.ParamValues['id'] := id;
  dm.QSmall_tables.Parameters.ParamValues['name'] := name;
  dm.QSmall_tables.ExecSQL;
end;

constructor TSmallTables.Create(name: String);
begin
  tableName := Name;
end;

procedure TSmallTables.Del(idRecord: integer);
begin
  dm.QSmall_tables.Close;
  dm.QSmall_tables.SQL.Clear;
  dm.QSmall_tables.SQL.Add('delete from ' + tableName + ' where id=:id');
  dm.QSmall_tables.Parameters.ParamValues['id'] := idRecord;
  dm.QSmall_tables.ExecSQL;
end;

procedure TSmallTables.GetAtr(Find_id: integer);
begin
  dm.QSmall_tables.Close;
  dm.QSmall_tables.SQL.Clear;
  dm.QSmall_tables.SQL.Add('select name from ' + tableName + ' where id=:id');
  dm.QSmall_tables.Parameters.ParamValues['id'] := Find_id;
  dm.QSmall_tables.Open;
  name := dm.QSmall_tables.FieldByName('name').AsString;
  id := Find_id;
end;

procedure TSmallTables.New;
begin
  dm.QSmall_tables.Close;
  dm.QSmall_tables.SQL.Clear;
  dm.QSmall_tables.SQL.Add('insert ' + tableName +
    '(name) Values(:name)');
  dm.QSmall_tables.Parameters.ParamValues['name'] := name;
  dm.QSmall_tables.ExecSQL;
end;

end.

unit cSector;

interface
  {����� ��� ������ � �������� Sector}
uses cPlace, cAdress, fDM;

Type
  TSector = Class
  public
    id:integer;
    name: String;
    Polikl:TPlace;

    Procedure Get(Find_id:integer);
    procedure New(Sector:TSector);
    procedure Change(Sector:Tsector);
    procedure Del(Find_id:integer);
    constructor Create;
    destructor Destroy;

  End;

implementation

{ TSector }

procedure TSector.Change(Sector: Tsector);
begin
      With dm.Qsector do
  begin
     close;
     Sql.Add('update Sector set name=:name, polikl=:polikl)');
     Sql.Add('where id=:id');
     Parameters.ParamValues['id']:=Sector.id;
     Parameters.ParamValues['name']:=Sector.name;
     Parameters.ParamValues['polikl']:=Sector.Polikl.id;
     ExecSql;
  end;
end;

constructor TSector.Create;
begin
  Polikl:=TPlace.Create('Polikl');
end;

procedure TSector.Del(Find_id:integer);
begin
   With dm.Qsector do
  begin
     close;
     Sql.Add('delete Sector where id=:id');
     Parameters.ParamValues['id']:=Find_id;
     ExecSQL;
  end;
end;

destructor TSector.Destroy;
begin
  Polikl.Destroy;
end;

procedure TSector.Get(Find_id: integer);
begin
  With dm.Qsector do
  begin
     close;
     Sql.Add('select name, polikl from Sector where id=:id');
     Parameters.ParamValues['id']:=Find_id;
     open;
  end;
  name:=Dm.QSector.FieldByName('name').AsString;
  id:=find_id;
  Polikl:=TPlace.Create('Polikl');
  polikl.Get(dm.QSector.FieldByName('polikl').AsInteger);
end;

procedure TSector.New(Sector: TSector);
begin
    With dm.Qsector do
  begin
     close;
     Sql.Add('insert Sector (name, polikl)');
     Sql.Add('values(:name, :polikl) ');
     Parameters.ParamValues['name']:=Sector.name;
     Parameters.ParamValues['polikl']:=Sector.Polikl.id;
     ExecSql;
  end;
end;

end.

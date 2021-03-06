unit cPac;

interface

{ ����� ��� ������ � �������� ��������(Pac) }
uses fDM, cSmallTables, cAdress, cPlace, cSector, cPolis,System.Variants;

type
  TPacient = class
  public
    id: integer;
    surname, name_, patronymic, pol: string;
    groupInval: integer;
    date_birth: Tdate;
    Soc_status: string;
    Polis: TPolis;
    Adress: TAdress;
    Polikl,Work : TPlace;
    Sector: TSector;
    Soc: TSmallTables;

    procedure GetAtr(Find_id: integer);
    procedure ChangeAtrib;
    procedure New;
    procedure Del(Find_id: integer);
    constructor Create;
    destructor Destroy;
  end;

implementation

{ Pacient }

procedure TPacient.ChangeAtrib;
begin
  with dm.QPacUpd do
  begin
    close;
    Parameters.ParamValues['id'] := id;
    Parameters.ParamValues['name'] := name_;
    Parameters.ParamValues['surname'] := surname;
    Parameters.ParamValues['patronymic'] := patronymic;
    Parameters.ParamValues['pol'] := pol;
    Parameters.ParamValues['date_birth'] := date_birth;
    Parameters.ParamValues['soc_status'] := Soc.id;
    Parameters.ParamValues['polis'] := Polis.id;
    Parameters.ParamValues['adress'] := Adress.id;
    Parameters.ParamValues['stat_work'] := Work.id;
    Parameters.ParamValues['sector'] := Sector.id;
    Parameters.ParamValues['polikl'] := Polikl.id;
    Parameters.ParamValues['GroupInval'] := groupInval;
    ExecSQL;
  end;
end;

{ TPacient }
constructor TPacient.Create;
begin
  Polikl := TPlace.Create('Polikl');
  Sector := TSector.Create;
  Soc := TSmallTables.Create('SocStatus');
  Polis := TPolis.Create;
  Adress := TAdress.Create;;
  Work := TPlace.Create('StatWork');
end;

procedure TPacient.Del(Find_id: integer);
begin
  with dm.Qpacdel do
  begin
    close;
    Parameters.ParamValues['id'] := Find_id;
    ExecSQL;
    Adress.Del(Adress.id);
    Polis.Del(polis.id);
  end;
end;

destructor TPacient.Destroy;
begin
  Soc.Destroy;
  Polis.Destroy;
  Adress.Destroy;
  Work.Destroy;
  Sector.Destroy;
  Polikl.Destroy;
end;

procedure TPacient.GetAtr(Find_id: integer);
begin
  dm.QPacGet.close;
  dm.QPacGet.Parameters.ParamValues['id'] := Find_id;
  dm.QPacGet.open;
  id:=Find_id;
  name_ := dm.QPacGetname.AsString;
  surname := dm.QPacGetsurname.AsString;
  patronymic := dm.QPacGetpatronymic.AsString;
  pol := dm.QPacGetpol.AsString;
  date_birth := VarToDateTime(dm.QPacGetdate_birth.AsVariant);
  groupInval := dm.QPacGetGroupInval.ASinteger;

  Soc := TSmallTables.Create('SocStatus');
  Soc.GetAtr(dm.QPacGetid_soc.ASinteger);

  Polis := TPolis.Create;
  Polis.Get(dm.QPacGetid_polis.ASinteger);

  Adress := TAdress.Create;
  Adress.GetAtr(dm.QPacGetid_adress.ASinteger);

  Work := TPlace.Create('StatWork');
  Work.Get(dm.QPacGetid_work.ASinteger);

  Sector := TSector.Create;
  Sector.Get(dm.QPacGetid_sector.ASinteger);

  Polikl := TPlace.Create('Polikl');
  Polikl.Get(dm.QPacGetid_polikl.ASinteger);

  dm.QPacGet.close;
end;

procedure TPacient.New;
begin
  with dm.QPacIns do
  begin
    close;
    Parameters.ParamValues['name'] := name_;
    Parameters.ParamValues['surname'] := surname;
    Parameters.ParamValues['patronymic'] := patronymic;
    Parameters.ParamValues['pol'] := pol;
    Parameters.ParamValues['date_birth'] := date_birth;
    Parameters.ParamValues['soc_status'] := Soc.id;
    Parameters.ParamValues['polis'] := Polis.id;
    Parameters.ParamValues['adress'] := Adress.id;
    Parameters.ParamValues['stat_work'] := Work.id;
    Parameters.ParamValues['sector'] := Sector.id;
    Parameters.ParamValues['polikl'] := Polikl.id;
    Parameters.ParamValues['GroupInval'] := groupInval;
    ExecSQL;
  end;
end;

end.

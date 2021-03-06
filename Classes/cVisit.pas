unit cVisit;

interface
uses cpac, cDoctor, cDiagnoses, fDM;

type
 TVisit =Class
   public
   id:integer;
   dateVisit:Tdate;
   Pac:TPacient;
   Doc:TDoctor;
   Diag:TDiagnoses;

   procedure Get(Find_id: integer);
   procedure New;
   procedure Change;
   procedure Del(Find_id: integer);
   constructor Create;
   destructor Destroy;
 End;

implementation

{ TVisit }

procedure TVisit.Change;
begin
     with dm.QVisit do
  begin
    close;
    sql.clear;
    sql.Add('update Visit ');
    sql.Add('set date_visit=:date_visit, pac=:pac, doctor=:doctor, ');
    sql.Add('diagnos=:diagnos where id=:id');
    parameters.ParamValues['id']:=id;
    parameters.ParamValues['date_visit']:=dateVisit;
    parameters.ParamValues['pac']:=pac.id;
    parameters.ParamValues['doctor']:=doc.id;
    parameters.ParamValues['diagnos']:=diag.id;
    ExecSQl;
  end;
end;

constructor TVisit.Create;
begin
 doc:=TDoctor.Create;
 pac:=TPacient.Create;
 Diag:=TDiagnoses.Create;
end;

procedure TVisit.Del(Find_id: integer);
begin
    with dm.QVisit do
  begin
    close;
    sql.clear;
    sql.Add('delete Visit where id=:id');
    parameters.ParamValues['id']:=Find_id;
    ExecSQL;
  end;
end;



destructor TVisit.Destroy;
begin
  pac.Destroy;
  doc.Destroy;
  diag.Destroy;
end;

procedure TVisit.Get(Find_id: integer);
begin
  with dm.QVisit do
  begin
    close;
    sql.clear;
    sql.Add('select date_visit, pac, doctor, diagnos from Visit where id=:id');
    parameters.ParamValues['id']:=Find_id;
    open;
  end;
    id:=find_id;
    dateVisit:=dm.QVisit.FieldByName('date_visit').AsDateTime;
    pac.GetAtr(dm.QVisit.FieldByName('pac').AsInteger);
    doc.GetAtr(dm.QVisit.FieldByName('doctor').AsInteger);
    diag.GetAtr(dm.QVisit.FieldByName('diagnos').AsInteger);
end;

procedure TVisit.New;
begin
   with dm.QVisit do
  begin
    close;
    sql.clear;
    sql.Add('insert Visit (date_visit, pac, doctor, diagnos)');
    sql.Add('values (:date_visit, :pac, :doctor, :diagnos)');
    parameters.ParamValues['date_visit']:=dateVisit;
    parameters.ParamValues['pac']:=pac.id;
    parameters.ParamValues['doctor']:=doc.id;
    parameters.ParamValues['diagnos']:=diag.id;
    ExecSQl;
  end;
end;

end.

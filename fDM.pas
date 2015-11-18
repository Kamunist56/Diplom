unit fDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Inifiles;
{ описать классы
  Visit
  }
type
  TDM = class(TDataModule)
    AC: TADOConnection;
    QPacGet: TADOQuery;
    QPacUpd: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    WideStringField1: TWideStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    QSmall_tables: TADOQuery;
    QDiagnoses: TADOQuery;
    QDoctorGet: TADOQuery;
    QDoctorUpd: TADOQuery;
    QDoctorIns: TADOQuery;
    QDoctorDel: TADOQuery;
    QDoctorGetsurname: TStringField;
    QDoctorGetname: TStringField;
    QDoctorGetpatronymic: TStringField;
    QDoctorGetenployment_date: TWideStringField;
    QDoctorGetdemissal: TWideStringField;
    QDoctorGetposition: TStringField;
    QDoctorGetpolikl: TStringField;
    QPacIns: TADOQuery;
    QPacDel: TADOQuery;
    QPlace: TADOQuery;
    QAdress: TADOQuery;
    Qpolis: TADOQuery;
    QSector: TADOQuery;
    QSocStatus: TADOQuery;
    QStatWork: TADOQuery;
    QVisit: TADOQuery;
    QBrowseAdress: TADOQuery;
    QselectArea: TADOQuery;
    QselectAreaname: TStringField;
    DSArea: TDataSource;
    QselectAreaid: TAutoIncField;
    QselectLoc: TADOQuery;
    DSLoc: TDataSource;
    QselectStreet: TADOQuery;
    DSStreet: TDataSource;
    QSelectHoume: TADOQuery;
    DSHoume: TDataSource;
    QselectLocid: TAutoIncField;
    QselectLocname: TStringField;
    QselectStreetid: TAutoIncField;
    QselectStreetname: TStringField;
    QSelectHoumeid: TAutoIncField;
    QSelectHoumename: TStringField;
    QAdresslocality: TIntegerField;
    QAdressarea: TIntegerField;
    QAdressline: TIntegerField;
    QAdressnumber_line: TIntegerField;
    QSelectPolisType: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField11: TStringField;
    DSPolisType: TDataSource;
    QselectPolis: TADOQuery;
    DSPolis: TDataSource;
    QselectGroupInval: TADOQuery;
    AutoIncField3: TAutoIncField;
    StringField13: TStringField;
    DSGrInval: TDataSource;
    QselectSocStatus: TADOQuery;
    AutoIncField4: TAutoIncField;
    StringField14: TStringField;
    DSSocStatus: TDataSource;
    QSelectPolikl: TADOQuery;
    AutoIncField5: TAutoIncField;
    StringField15: TStringField;
    DSPolikl: TDataSource;
    QselectSector: TADOQuery;
    AutoIncField6: TAutoIncField;
    StringField16: TStringField;
    DSSector: TDataSource;
    QSelectWork: TADOQuery;
    AutoIncField7: TAutoIncField;
    StringField17: TStringField;
    DSWork: TDataSource;
    QselectPolisid: TAutoIncField;
    QselectPolisnumber: TStringField;
    QGetLastId: TADOQuery;
    QBrowseSector: TADOQuery;
    QBrowseSectorid: TAutoIncField;
    QBrowseSectorname: TStringField;
    QBrowseSectorpolikl: TStringField;
    QBrowseSectorpolikl_id: TAutoIncField;
    QpolisTypeBrowse: TADOQuery;
    QSocStatusBrowse: TADOQuery;
    QSocStatusBrowseid: TAutoIncField;
    QSocStatusBrowsename: TStringField;
    QBrowseAdressid: TAutoIncField;
    QBrowseAdresslocality: TStringField;
    QBrowseAdressarea: TStringField;
    QBrowseAdressstreet: TStringField;
    QBrowseAdressNumber_line: TStringField;
    QBrowseAdressidArea: TIntegerField;
    QBrowseAdressidLoc: TIntegerField;
    QBrowseAdressidLine: TIntegerField;
    QBrowseAdressidHouse: TIntegerField;
    QDiagBrowse: TADOQuery;
    QDiagBrowseid: TAutoIncField;
    QDiagBrowsecode: TStringField;
    QDiagBrowsename: TStringField;
    QpolisTypeBrowseid: TAutoIncField;
    QpolisTypeBrowsename: TStringField;
    QGroupInvBrowse: TADOQuery;
    QGroupInvBrowseid: TAutoIncField;
    QGroupInvBrowsename: TStringField;
    QPoliklBrowse: TADOQuery;
    QPoliklBrowseid: TAutoIncField;
    QPoliklBrowsename: TStringField;
    QPoliklBrowseidAdress: TIntegerField;
    QPoliklBrowseAdress: TStringField;
    QPacGetname: TStringField;
    QPacGetsurname: TStringField;
    QPacGetpatronymic: TStringField;
    QPacGetpol: TStringField;
    QPacGetdate_birth: TWideStringField;
    QPacGetsoc_status: TStringField;
    QPacGetpolis: TStringField;
    QPacGetadress: TStringField;
    QPacGetstat_worrk: TStringField;
    QPacGetsector: TStringField;
    QPacGetpolikl: TStringField;
    QPacGetid_soc: TAutoIncField;
    QPacGetid_adress: TIntegerField;
    QPacGetid_work: TAutoIncField;
    QPacGetid_polikl: TAutoIncField;
    QPacGetid_sector: TAutoIncField;
    QPacGetid_polis: TAutoIncField;
    QPacGetGroupInval: TIntegerField;
    QPacBrowse: TADOQuery;
    QPacBrowseidPac: TAutoIncField;
    QPacBrowsename: TStringField;
    QPacBrowsesurname: TStringField;
    QPacBrowsepatronymic: TStringField;
    QPacBrowsepol: TStringField;
    QPacBrowsedate_birth: TWideStringField;
    QPacBrowsesoc_status: TStringField;
    QPacBrowsepolis: TStringField;
    QPacBrowseadress: TStringField;
    QPacBrowsestat_worrk: TStringField;
    QPacBrowsesector: TStringField;
    QPacBrowsepolikl: TStringField;
    QPacBrowseid_soc: TAutoIncField;
    QPacBrowseid_adress: TAutoIncField;
    QPacBrowseid_work: TAutoIncField;
    QPacBrowseid_polikl: TAutoIncField;
    QPacBrowseid_sector: TAutoIncField;
    QPacBrowseid_polis: TAutoIncField;
    QDoctorBrowse: TADOQuery;
    QSelectPosition: TADOQuery;
    AutoIncField2: TAutoIncField;
    StringField12: TStringField;
    DSPosition: TDataSource;
    QDoctorBrowseid: TAutoIncField;
    QDoctorBrowsesurname: TStringField;
    QDoctorBrowsename: TStringField;
    QDoctorBrowsepatronymic: TStringField;
    QDoctorBrowseenployment_date: TWideStringField;
    QDoctorBrowsedemissal: TWideStringField;
    QDoctorBrowseposition: TStringField;
    QDoctorBrowsepolikl: TStringField;
    QDoctorBrowseidPolikl: TAutoIncField;
    QDoctorBrowseidPosition: TAutoIncField;
    QDoctorGetidPolikl: TAutoIncField;
    QDoctorGetidPosition: TAutoIncField;
    QSelectPac: TADOQuery;
    DSPac: TDataSource;
    QVisitBrowse: TADOQuery;
    QVisitBrowseid: TAutoIncField;
    QVisitBrowsedate_visit: TDateTimeField;
    QVisitBrowsepac: TStringField;
    QVisitBrowsedoc: TStringField;
    QVisitBrowsediagnos: TStringField;
    QVisitBrowseidPac: TAutoIncField;
    QVisitBrowseidDoc: TAutoIncField;
    QVisitBrowseidDiag: TAutoIncField;
    QSelectDoc: TADOQuery;
    DSDoc: TDataSource;
    QselectDiagnos: TADOQuery;
    DSDioagnos: TDataSource;
    QselectDiagnosid: TAutoIncField;
    QSelectDocid: TAutoIncField;
    QSelectDocFio: TStringField;
    QSelectPacid: TAutoIncField;
    QSelectPacfio: TStringField;
    QselectDiagnosname: TStringField;
    QposBrowse: TADOQuery;
    QposBrowseid: TAutoIncField;
    QposBrowsename: TStringField;
    QWorkBrowse: TADOQuery;
    QWorkBrowseid: TAutoIncField;
    QWorkBrowseWorkName: TStringField;
    QWorkBrowseadress: TStringField;
    QWorkBrowseidAr: TAutoIncField;
    QWorkBrowseidLoc: TAutoIncField;
    QWorkBrowseidStreet: TAutoIncField;
    QWorkBrowseidHouse: TAutoIncField;
    QWorkBrowseidAdress: TIntegerField;
    QPacBrowseGroupInval: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
  StringConnect:String;
    { Private declarations }
  public
  procedure ConnectBase;
  procedure RefTable(query:TadoQuery);
  procedure FiedsSizing(query:TadoQuery);
  procedure OpenAdressTables;
  procedure OpenPlaceTables;
  procedure OpenStatusTable;
  procedure OpenPolisTable;
  procedure OpenVisitTables;
  function GetLastId(TableName:String):integer;
  function Deleterecord:Boolean;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.ConnectBase;
var F:TiniFile;
    File_:String;
begin
  File_:= ExtractFilePath(ParamStr(0))+'Settings.ini';
  F:=TiniFile.Create(File_);
  StringConnect:=f.ReadString('General', 'ConnectStr','No string connect');
  f.Free;

  ac.Close;
  Ac.ConnectionString:=StringConnect;
  ac.Connected:=true;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   ConnectBase;
end;



function TDM.Deleterecord: Boolean;
begin

end;

procedure TDM.FiedsSizing(query: TadoQuery);
var i:integer;
begin
//  for I := 0 to query.FieldCount -1 do
//    query.Fields[i].Size:=

end;

function TDM.GetLastId(TableName: String): integer;
begin
  with QGetLastId do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(id) id from '+TableName);
    open;
  end;
  Result:= QgetLastId.FieldByName('id').asinteger;
end;

procedure TDM.OpenAdressTables;
begin
  Dm.QselectArea.Close;
  Dm.QselectLoc.Close;
  Dm.QSelectHoume.Close;
  Dm.qselectStreet.Close;

  Dm.QselectArea.Open;
  Dm.QselectLoc.Open;
  Dm.QSelectHoume.Open;
  Dm.qselectStreet.Open;
end;

procedure TDM.OpenPlaceTables;
begin
  QSelectPolikl.Close;
  QSelectWork.Close;
  QselectSector.Close;

  QSelectPolikl.Open;
  QSelectWork.Open;
  QselectSector.Open;
end;

procedure TDM.OpenPolisTable;
begin
  QSelectPolisType.Close;
  QselectPolis.Close;

  QSelectPolisType.Open;
  QselectPolis.Open;
end;

procedure TDM.OpenStatusTable;
begin
  QselectSocStatus.Close;
  QselectGroupInval.Close;
  QselectSocStatus.Open;
  QselectGroupInval.Open;
  QSelectPosition.Open;
end;

procedure TDM.OpenVisitTables;
begin
  QSelectPac.Open;
  QselectDoc.Open;
  QselectDiagnos.Open;
end;

procedure TDM.RefTable(query: TadoQuery);
begin
   query.Close;
   query.Open;
end;

end.

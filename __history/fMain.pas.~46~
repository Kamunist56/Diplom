unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ActnMenus, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls;

type
  TMain = class(TForm)
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    Action3: TAction;
    Action4: TAction;
    Action1: TAction;
    Action2: TAction;
    Action5: TAction;
    Action6: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action7: TAction;
    procedure Action10Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action15Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
  private
    function TestMDIChild(fName: string): boolean;
    procedure GetForm(InstanceClass: TComponentClass; Child: TForm);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses fAdress, fDM, fPac, fSector, cAdress, fSocStatus, fDiagnos,
  fPolisType, fGrInval, fPolikl, fDoctor, fVisit, fPosition, fWork, fAnalys;

procedure TMain.Action10Execute(Sender: TObject);
begin
  if TestMDIChild('uAdress') = false then
    Application.CreateForm(TuAdress, uAdress);
  uAdress.show;
  dm.RefTable(dm.QBrowseAdress);
end;

procedure TMain.Action11Execute(Sender: TObject);
begin
  if TestMDIChild('uPolikl') = false then
    Application.CreateForm(TuPolikl, uPolikl);
  uPolikl.show;
  dm.qPoliklBrowse.Open;
end;

procedure TMain.Action12Execute(Sender: TObject);
begin
  if TestMDIChild('uSocStatus') = false then
    Application.CreateForm(TuSocStatus, uSocStatus);
  uSocStatus.show;
  dm.QSocStatusBrowse.Open;
end;

procedure TMain.Action13Execute(Sender: TObject);
begin
  if TestMDIChild('uPolisType') = false then
    Application.CreateForm(TuPolisType, uPolisType);
  uPolisType.show;
  dm.QpolisTypeBrowse.Open;
end;

procedure TMain.Action14Execute(Sender: TObject);
begin
  if TestMDIChild('uGrInval') = false then
    Application.CreateForm(TuGrInval, uGrInval);
  uGrInval.show;
  dm.QGroupInvBrowse.Open;
end;

procedure TMain.Action15Execute(Sender: TObject);
begin
  if TestMDIChild('uWork') = false then
    Application.CreateForm(TuWork, uWork);
  uWork.show;
  dm.QWorkBrowse.Open;
end;

procedure TMain.Action1Execute(Sender: TObject);
begin
  if TestMDIChild('uDoctor') = false then
    Application.CreateForm(TuDoctor, uDoctor);
  uDoctor.show;
  dm.QDoctorBrowse.Open;
end;

procedure TMain.Action2Execute(Sender: TObject);
begin
  if TestMDIChild('uVisit') = false then
    Application.CreateForm(TuVisit, uVisit);
  uVisit.show;
  dm.QVisitBrowse.Open;
end;

procedure TMain.Action3Execute(Sender: TObject);
begin
  analys.show;
end;

procedure TMain.Action4Execute(Sender: TObject);
begin
  if TestMDIChild('Pac') = false then
    Application.CreateForm(TPac, Pac);
  Pac.show;
  dm.QPacBrowse.Open;

end;

procedure TMain.Action5Execute(Sender: TObject);
begin
  if TestMDIChild('uPosition') = false then
    Application.CreateForm(TuPosition, uPosition);
  uPosition.show;
  dm.QposBrowse.Open;
end;

procedure TMain.Action6Execute(Sender: TObject);
begin
  if TestMDIChild('uDiagnos') = false then
    Application.CreateForm(TuDiagnos, uDiagnos);
  uDiagnos.show;
  dm.QDiagBrowse.Open;
end;

procedure TMain.Action7Execute(Sender: TObject);
begin
  GetForm(TuSector, uSector);
end;

procedure TMain.Action9Execute(Sender: TObject);
begin
  if TestMDIChild('uSector') = false then
    Application.CreateForm(TuSector, uSector);
  uSector.show;
  dm.QBrowseSector.Open;
end;

procedure TMain.GetForm(InstanceClass: TComponentClass; Child: TForm);
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
    if mdiChildren[i].Name = Child.Name then
    begin
      Application.CreateForm(InstanceClass, Child);
    end;
  Child.show;
end;

function TMain.TestMDIChild(fName: string): boolean;
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
    if mdiChildren[i].Name = fName then
    begin
      result := true;
    end
    else
      result := false;
end;

end.

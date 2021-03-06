unit ePacient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, cPac;

type
  TPacientEdit = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    LookLoc: TDBLookupComboBox;
    LookHouse: TDBLookupComboBox;
    Label3: TLabel;
    Label5: TLabel;
    LookArea: TDBLookupComboBox;
    LookStreet: TDBLookupComboBox;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    LookPolikl: TDBLookupComboBox;
    LookSector: TDBLookupComboBox;
    LookPolisType: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    LookSoc: TDBLookupComboBox;
    LookGroup: TDBLookupComboBox;
    LookWork: TDBLookupComboBox;
    ComboBox1: TComboBox;
    Label13: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    Pacient: TPacient;

    procedure AddPac;
    procedure ChangPac;

    { Private declarations }
  public
    Insert: boolean;
    procedure GetPac;
    Procedure DelPac;

    { Public declarations }
  end;

var
  PacientEdit: TPacientEdit;

implementation

{$R *.dfm}

uses fDM;

procedure TPacientEdit.AddPac;
var
  IdPolis, IdAdress: Integer;
begin
  Pacient := TPacient.Create;
  with Pacient do
  Begin
    surname := LabeledEdit1.Text;
    name_ := LabeledEdit2.Text;
    patronymic := LabeledEdit3.Text;
    date_birth := DateTimePicker1.Date;
    pol := ComboBox1.Text;

    // ���������� �����������
    polikl.Get(LookPolikl.KeyValue);

    // �������
    Sector.Get(LookSector.KeyValue);

    // ������� ����� �����
    Polis.PolisNumber := Edit1.Text;
    Polis.PolisType.GetAtr(LookPolisType.KeyValue);
    Polis.new;
    // ������� �������� ��������� id ��� ������
    IdPolis := Dm.GetLastId('Polis');
    Polis.Get(IdPolis);

    // �����
    Adress.Loc.GetAtr(LookLoc.KeyValue);
    Adress.Ar.GetAtr(LookArea.KeyValue);
    Adress.Street.GetAtr(LookStreet.KeyValue);
    Adress.House_numb.GetAtr(LookHouse.KeyValue);
    Adress.new;
    IdAdress := Dm.GetLastId('Adress');
    Adress.GetAtr(IdAdress);

    // ���������� ������
    Soc.GetAtr(LookSoc.KeyValue);
    if LookSoc.KeyValue <> 5 then
      Pacient.groupInval := 5
    else
      Pacient.groupInval := LookGroup.KeyValue;

    // ����� ������
    Work.Get(LookWork.KeyValue);
    Pacient.Work.id := Work.id;
  End;
  Pacient.new;
end;

procedure TPacientEdit.Button2Click(Sender: TObject);
begin
  if Insert then
    AddPac
  else
    ChangPac;

  Dm.RefTable(Dm.QpacBrowse);
  close;
end;

procedure TPacientEdit.ChangPac;
var
  IdPolis, IdAdress: Integer;
begin
  Pacient := TPacient.Create;
  Pacient.GetAtr(Dm.QPacBrowseidPac.AsInteger);
  with Pacient do
  Begin
    surname := LabeledEdit1.Text;
    name_ := LabeledEdit2.Text;
    patronymic := LabeledEdit3.Text;
    date_birth := DateTimePicker1.Date;
    pol := ComboBox1.Text;

    // ���������� �����������
    polikl.Get(LookPolikl.KeyValue);

    // �������
    Sector.Get(LookSector.KeyValue);

    // �����
    Polis.Get(Pacient.Polis.id);
    Polis.PolisNumber := Edit1.Text;
    Polis.PolisType.GetAtr(LookPolisType.KeyValue);
    Polis.Change;

    // �����
    Adress.GetAtr(Pacient.Adress.id);
    Adress.Loc.GetAtr(LookLoc.KeyValue);
    Adress.Ar.GetAtr(LookArea.KeyValue);
    Adress.Street.GetAtr(LookStreet.KeyValue);
    Adress.House_numb.GetAtr(LookHouse.KeyValue);
    Adress.ChangeAtr;

    // ���������� ������
    Soc.GetAtr(LookSoc.KeyValue);
    if LookSoc.KeyValue <> 5 then
      Pacient.groupInval := 5
    else
      Pacient.groupInval := LookGroup.KeyValue;

    // ����� ������
    Work.Get(LookWork.KeyValue);
    Pacient.Work.id := Work.id;
  End;
  Pacient.ChangeAtrib;

end;

procedure TPacientEdit.CheckBox1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
    LookGroup.Enabled := false;
    LookGroup.KeyValue := 5
  end
  else
    LookGroup.Enabled := true;
end;

procedure TPacientEdit.DelPac;
begin
  Pacient:=TPacient.Create;
  Pacient.Del(dm.QPacBrowseidPac.AsInteger);
  dm.RefTable(dm.QPacBrowse);
end;

procedure TPacientEdit.GetPac;
begin

  Pacient := TPacient.Create;
  Pacient.GetAtr(Dm.QPacBrowseidPac.AsInteger);
  LabeledEdit1.Text := Pacient.surname;
  LabeledEdit2.Text := Pacient.name_;
  LabeledEdit3.Text := Pacient.patronymic;
  DateTimePicker1.Date := Pacient.date_birth;
  if Pacient.pol = '�' then
    ComboBox1.ItemIndex := 0
  else
    ComboBox1.ItemIndex := 1;
  LookPolikl.KeyValue := Pacient.polikl.id;
  LookSector.KeyValue := Pacient.Sector.id;
  LookPolisType.KeyValue := Pacient.Polis.PolisType.id;
  Edit1.Text := Dm.QPacBrowsePolis.Asstring;
  LookArea.KeyValue := Pacient.Adress.Ar.id;
  LookLoc.KeyValue := Pacient.Adress.Loc.id;
  LookStreet.KeyValue := Pacient.Adress.Street.id;
  LookHouse.KeyValue := Pacient.Adress.House_numb.id;

  if Dm.QPacBrowseGroupInval.AsInteger = 5 then
  begin
    LookGroup.Enabled := false;
    CheckBox1.Checked := false;
  end
  else
  begin
    LookGroup.Enabled := true;
    LookGroup.KeyValue := Dm.QPacBrowseGroupInval.AsInteger;
    CheckBox1.Checked := true;
  end;
  LookSoc.KeyValue := Dm.QPacBrowseid_soc.AsInteger;
  LookWork.KeyValue := Dm.QPacBrowseid_work.AsInteger;

end;

end.

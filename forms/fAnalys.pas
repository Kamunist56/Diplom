unit fAnalys;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.ExtCtrls;

type
  TAnalys = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    Qdan: TADOQuery;
    AC: TADOConnection;
    Qdandiagnos: TStringField;
    QdanData: TWideStringField;
    QdanCountDaignos: TIntegerField;
    QdancountDate: TIntegerField;
    Panel3: TPanel;
    Panel4: TPanel;
    StringGrid4: TStringGrid;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Panel5: TPanel;
    StringGrid5: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    Procedure CalcPiantGrid(Grid: TStringGrid; col, row: integer);
    Procedure paintGrid(Grid: TStringGrid; col, row: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Analys: TAnalys;
  p: array of array of integer;
  x: array of real; // x: array [1 .. 4] of real;
  y: array of real; // y: array [1 .. 4] of real;
  fm: array [1 .. 10] of integer;
  gm: array [1 .. 10] of integer;
  i, j, i1, j1, i2, j2, MIN: integer;
  f, g: string;

const
  mainMin = 5000;

implementation

{$R *.dfm}

uses fDM;

procedure TAnalys.Button1Click(Sender: TObject);
var
  i: integer;
begin
// ����� ������  ���� ���� ����!!!!
// ���� ������ ��� ����� ������� �� �����)
// ������� .gitignore
// history �� ������ �����




  Qdan.Open;
  with StringGrid1 do
  begin
    ColWidths[1] := 200;
    RowCount := Qdan.RecordCount + 1; // ��������� ���������� ���� � stringgrid
    ColCount := Qdan.FieldCount;
    cells[0, 0] := '�������';
    cells[1, 0] := '�������';
    cells[2, 0] := '�1';
    cells[3, 0] := 'X2';
    Qdan.First;
    while not Qdan.Eof do
      for i := 0 to Qdan.RecordCount - 1 do
      begin
        cells[0, i + 1] := Qdandiagnos.AsString;
        cells[1, i + 1] := QdanData.AsString;
        cells[2, i + 1] := QdanCountDaignos.AsString;
        cells[3, i + 1] := QdancountDate.AsString;
        Qdan.next;
      end;
  end;
  Qdan.Close;

end;

procedure TAnalys.Button2Click(Sender: TObject);
var
  i, c, r: integer;
  RowGrid: integer;
  ColGrid: integer;
  res: double;
  str: String;
begin

  // �� ������� �������� �������� � �������
  Button1Click(nil);
  RowGrid := StringGrid1.RowCount;
  ColGrid := StringGrid1.ColCount;
  setLength(y, 0);
  setLength(x, RowGrid); // ������ ������� �������� � �
  setLength(y, RowGrid);
  Edit1.Text := '';
  setLength(p, RowGrid, RowGrid);
  { ����������� � �������������
    ���-�� ����� � �������� ��� StringGrid2 }
  CalcPiantGrid(StringGrid2, RowGrid, RowGrid);

  for i := 1 to RowGrid - 1 do
  begin
    x[i] := strtofloat(StringGrid1.cells[2, i]);
  end;
  for i := 1 to RowGrid - 1 do
  begin
    y[i] := strtofloat(StringGrid1.cells[3, i]);
  end;

  // ������ ���������� P � ������ � ������� D1
  for i := 1 to RowGrid - 1 do
    for j := 1 to RowGrid - 1 do
      if i = j then
      begin
        p[i, j] := 0;
        StringGrid2.cells[i, j] := Floattostr(p[i, j]);
      end
      else
      begin
        res := round(sqrt(sqr(x[i] - x[j]) + sqr(y[i] - y[j])));
        p[i, j] := round(sqrt(sqr(x[i] - x[j]) + sqr(y[i] - y[j])));
        StringGrid2.cells[i, j] := Floattostr(p[i, j]);
      end;
  // ����� ������������ �������� ������� ���������� D1
  MIN := mainMin;
  for i := 1 to Length(p) - 4 do
    for j := i + 1 to Length(p[0]) - 4 do
      if p[i, j] < MIN then
      begin
        MIN := p[i, j];
        i1 := i; // ������� ������������ ��������
        j1 := j; // ������ ������������ ��������
      end;
  // ����������� � �������

  for i := 1 to Length(p) - 1 do
  begin
    if i = i1 then
      StringGrid3.cells[0, i] := StringGrid2.cells[0, i1] + ',' +
        StringGrid2.cells[0, j1];
    if (i <> j1) and (i <> i1) then
      if i < j1 then
        StringGrid3.cells[0, i] := StringGrid2.cells[0, i]
      else
        StringGrid3.cells[0, i - 1] := StringGrid2.cells[0, i]
  end;
  // ����������� � �������
  for i := 1 to Length(p) - 1 do
  begin
    if p[i, i1] > p[i, j1] then
    begin
      p[i, i1] := p[i, j1];
      p[i1, i] := p[i, i1];
    end;
  end;

  // ������������ ������� ���������� D2
  paintGrid(StringGrid3, Length(p) - 1, Length(p) - 1);
  i2 := 0;
  j2 := 0;
  for i := 1 to Length(p) - 1 do
    if i <> j1 then
    begin
      i2 := i2 + 1;
      for j := 1 to Length(p) - 1 do
        if j <> j1 then
        begin
          j2 := j2 + 1;
          p[i2, j2] := p[i, j];
          StringGrid3.cells[i2, j2] := IntToStr(p[i, j]);
        end;
      j2 := 0;
    end;
  // ����� ������������ �������� ������� ���������� D2
  MIN := mainMin;
  for i := 1 to 2 do
    for j := i + 1 to 3 do
      if p[i, j] < MIN then
      begin
        MIN := p[i, j];
        i1 := i;
        j1 := j;
      end;
  // ����������� � �������
  for i := 1 to 3 do
  begin
    if i = i1 then
      StringGrid4.cells[0, i] := StringGrid3.cells[0, i1] + ',' +
        StringGrid3.cells[0, j1];
    if (i <> j1) and (i <> i1) then
      if i < j1 then
        StringGrid4.cells[0, i] := StringGrid3.cells[0, i]
      else
        StringGrid4.cells[0, i - 1] := StringGrid3.cells[0, i]
  end;
  // ����������� � �������
  for i := 1 to 3 do
  begin
    if p[i, i1] < p[i, j1] then
    begin
      p[i, i1] := p[i, j1];
      p[i1, i] := p[i, i1];
    end;
  end;
  // ������������ ������� ���������� D3
  i2 := 0;
  j2 := 0;
  for i := 1 to 3 do
    if i <> j1 then
    begin
      i2 := i2 + 1;
      for j := 1 to 3 do
        if j <> j1 then
        begin
          j2 := j2 + 1;
          p[i2, j2] := p[i, j];
          StringGrid4.cells[i2, j2] := IntToStr(p[i, j]);
        end;
      j2 := 0;
    end;

  with StringGrid5 do
    for i := 0 to ColCount - 1 do
      Cols[i].Clear;

  f := StringGrid4.cells[0, 1];
  g := StringGrid4.cells[0, 2];
  i := strtoint(f[1]);
  j := strtoint(g[1]);
  if strtoint(StringGrid1.cells[3, i]) < strtoint(StringGrid1.cells[3, j]) then
    f := StringGrid4.cells[0, 1]
  else
    f := StringGrid4.cells[0, 2];
  // ����� �������� � �������
  j := 1;
  for i := 1 to Length(f) - 1 do
    if f[i] <> ',' then
    begin
      fm[j] := strtoint(f[i]);
      j := j + 1;
    end;
  for i := 1 to j do
    Edit1.Text := Edit1.Text + IntToStr(fm[i]);
  j := 1;
  for i := 1 to StringGrid1.RowCount - 1 do
    if pos(IntToStr(i), f) <> 0 then
    begin
      StringGrid5.cells[0, j] := StringGrid1.cells[0, i];
      StringGrid5.cells[1, j] := StringGrid1.cells[1, i];
      StringGrid5.cells[2, j] := StringGrid1.cells[2, i];
      StringGrid5.cells[3, j] := StringGrid1.cells[3, i];
      j := j + 1;
    end;
  StringGrid5.cells[0, 0] := '�������';
  StringGrid5.cells[1, 0] := '���';
  StringGrid5.cells[2, 0] := 'X1';
  StringGrid5.cells[3, 0] := 'X2';

  x := nil;
  // y:=nil;
  // p:=nil;
  setLength(p, 0);
  setLength(x, 0);
  // setLength(y,0);
end;

procedure TAnalys.CalcPiantGrid(Grid: TStringGrid; col, row: integer);
var
  c, r: integer;
begin
  for c := 0 to col do
  begin
    if Grid.ColCount < c then
    begin
      Grid.ColCount := Grid.ColCount + 1;
      Grid.cells[c, 0] := IntToStr(c);
    end
    else
      Grid.cells[c, 0] := IntToStr(c);

    for r := 0 to row do
      if Grid.RowCount < r then
      begin
        Grid.RowCount := Grid.RowCount + 1;
        Grid.cells[0, r] := IntToStr(r);
      end
      else
        Grid.cells[0, r] := IntToStr(r);
    Grid.cells[0, 0] := '';
  end;

end;

procedure TAnalys.paintGrid(Grid: TStringGrid; col, row: integer);
var
  c, r: integer;
begin
  for c := 0 to col do
  begin
    if Grid.ColCount < c then
    begin
      Grid.ColCount := Grid.ColCount + 1;
    end;
    for r := 0 to row do
      if Grid.RowCount < r then
      begin
        Grid.RowCount := Grid.RowCount + 1;
      end
  end;

end;

end.

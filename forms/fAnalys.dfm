object Analys: TAnalys
  Left = 0
  Top = 0
  Caption = #1040#1085#1072#1083#1080#1079
  ClientHeight = 636
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 636
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 688
      Height = 180
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 0
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 686
        Height = 178
        Align = alClient
        ColCount = 3
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        ColWidths = (
          207
          125
          64)
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 181
      Width = 328
      Height = 409
      Align = alLeft
      TabOrder = 1
      object StringGrid4: TStringGrid
        Left = 1
        Top = 201
        Width = 326
        Height = 207
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
      end
      object StringGrid2: TStringGrid
        Left = 1
        Top = 1
        Width = 326
        Height = 200
        Align = alTop
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 590
      Width = 688
      Height = 45
      Align = alBottom
      TabOrder = 2
      object Button1: TButton
        Left = 13
        Top = 5
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 94
        Top = 6
        Width = 75
        Height = 25
        Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
        TabOrder = 1
        OnClick = Button2Click
      end
      object Edit1: TEdit
        Left = 190
        Top = 6
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object Panel5: TPanel
      Left = 329
      Top = 181
      Width = 360
      Height = 409
      Align = alClient
      TabOrder = 3
      object StringGrid5: TStringGrid
        Left = 1
        Top = 201
        Width = 358
        Height = 207
        Align = alClient
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        ColWidths = (
          154
          64
          64
          64
          64)
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object StringGrid3: TStringGrid
        Left = 1
        Top = 1
        Width = 358
        Height = 200
        Align = alTop
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 1
      end
    end
  end
  object Qdan: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  diag.name diagnos'
      '       ,pac.date_birth Data'
      '       ,count(visit.diagnos) CountDaignos'
      #9'   ,count(pac.date_birth) countDate'
      #9'   '#9'   '
      
        '  from Visit left outer join diagnoses diag on Visit.diagnos=dia' +
        'g.id'
      '             left outer join pac on visit.pac=pac.id'
      'group by pac.date_birth,diag.name')
    Left = 590
    Top = 30
    object Qdandiagnos: TStringField
      FieldName = 'diagnos'
      Size = 255
    end
    object QdanData: TWideStringField
      FieldName = 'Data'
      Size = 10
    end
    object QdanCountDaignos: TIntegerField
      FieldName = 'CountDaignos'
      ReadOnly = True
    end
    object QdancountDate: TIntegerField
      FieldName = 'countDate'
      ReadOnly = True
    end
  end
  object AC: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1qaz!QAZ;Persist Security Info=True' +
      ';User ID=prog;Initial Catalog=Class_of_diseases;Data Source=95.1' +
      '05.104.92;Use Procedure for Prepare=1;Auto Translate=True;Packet' +
      ' Size=4096;Workstation ID=KAM;Use Encryption for Data=False;Tag ' +
      'with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 548
    Top = 26
  end
end

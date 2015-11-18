object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
    Width = 771
    Height = 636
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = -129
    ExplicitHeight = 592
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 769
      Height = 180
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 0
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 767
        Height = 178
        Align = alClient
        ColCount = 3
        FixedCols = 0
        TabOrder = 0
      end
    end
    object StringGrid2: TStringGrid
      Left = 2
      Top = 186
      Width = 337
      Height = 156
      TabOrder = 1
    end
    object StringGrid3: TStringGrid
      Left = 350
      Top = 186
      Width = 415
      Height = 156
      TabOrder = 2
    end
    object StringGrid4: TStringGrid
      Left = -2
      Top = 348
      Width = 341
      Height = 189
      TabOrder = 3
    end
    object Button2: TButton
      Left = 326
      Top = 559
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 4
    end
    object StringGrid5: TStringGrid
      Left = 350
      Top = 348
      Width = 409
      Height = 189
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 14
      Top = 561
      Width = 121
      Height = 21
      TabOrder = 6
    end
  end
  object Button1: TButton
    Left = 245
    Top = 559
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
  object Qdan: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  row_number() over(ORDER BY z.K_klient) col,'
      
        ' k.Fam +'#39' '#39'+ k.Name +'#39' '#39'+ k.Oth Klient, COUNT(z.K_zakaz) X1, SUM' +
        '(Itog) X2 '
      'from Zakaz z inner join Klient k on k.K_klient=z.K_klient'
      'group by z.K_klient, k.Fam, k.Name, k.Oth')
    Left = 590
    Top = 30
    object Qdancol: TLargeintField
      FieldName = 'col'
      ReadOnly = True
    end
    object QdanKlient: TStringField
      FieldName = 'Klient'
      ReadOnly = True
      Size = 62
    end
    object QdanX1: TIntegerField
      FieldName = 'X1'
      ReadOnly = True
    end
    object QdanX2: TIntegerField
      FieldName = 'X2'
      ReadOnly = True
    end
  end
  object AC: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=Lesovik;Data Source=PROG;Use Procedure ' +
      'for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation I' +
      'D='#1040#1056#1058#1059#1056'-'#1055#1050';Use Encryption for Data=False;Tag with column collati' +
      'on when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 548
    Top = 26
  end
end

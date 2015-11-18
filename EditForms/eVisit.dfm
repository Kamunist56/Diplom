object VisitEdit: TVisitEdit
  Left = 0
  Top = 0
  Caption = 'uVisit'
  ClientHeight = 193
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 43
    Height = 13
    Caption = #1055#1072#1094#1080#1077#1085#1090
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 24
    Height = 13
    Caption = #1042#1088#1072#1095
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 42
    Height = 13
    Caption = #1044#1080#1072#1075#1085#1086#1079
  end
  object Label4: TLabel
    Left = 208
    Top = 8
    Width = 85
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1077#1097#1077#1085#1080#1103
  end
  object LookPac: TDBLookupComboBox
    Left = 16
    Top = 21
    Width = 177
    Height = 21
    KeyField = 'id'
    ListField = 'fio'
    ListSource = DM.DSPac
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 208
    Top = 24
    Width = 121
    Height = 21
    Date = 42313.868733981480000000
    Time = 42313.868733981480000000
    TabOrder = 1
  end
  object LookDoc: TDBLookupComboBox
    Left = 16
    Top = 64
    Width = 177
    Height = 21
    KeyField = 'id'
    ListField = 'Fio'
    ListSource = DM.DSDoc
    TabOrder = 2
  end
  object LookDiag: TDBLookupComboBox
    Left = 16
    Top = 107
    Width = 177
    Height = 21
    KeyField = 'id'
    ListField = 'name'
    ListSource = DM.DSDioagnos
    TabOrder = 3
  end
  object Button1: TButton
    Left = 254
    Top = 153
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    OnClick = Button1Click
  end
end

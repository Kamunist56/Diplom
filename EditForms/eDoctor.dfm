object DoctorEdit: TDoctorEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'/'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1088#1072#1095#1072
  ClientHeight = 196
  ClientWidth = 398
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
    Left = 216
    Top = 16
    Width = 131
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103' '#1085#1072' '#1088#1072#1073#1086#1090#1091
  end
  object Label2: TLabel
    Left = 216
    Top = 57
    Width = 57
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object Label3: TLabel
    Left = 216
    Top = 96
    Width = 67
    Height = 13
    Caption = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
  end
  object LabeledEdit3: TLabeledEdit
    Left = 16
    Top = 111
    Width = 178
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    TabOrder = 0
  end
  object LabeledEdit2: TLabeledEdit
    Left = 16
    Top = 72
    Width = 178
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103
    TabOrder = 1
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 32
    Width = 178
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 216
    Top = 32
    Width = 131
    Height = 21
    Date = 42294.127070486110000000
    Time = 42294.127070486110000000
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 216
    Top = 72
    Width = 161
    Height = 21
    KeyField = 'id'
    ListField = 'name'
    ListSource = DM.DSPosition
    TabOrder = 4
  end
  object Button1: TButton
    Left = 302
    Top = 152
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 5
    OnClick = Button1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 216
    Top = 111
    Width = 161
    Height = 21
    KeyField = 'id'
    ListField = 'name'
    ListSource = DM.DSPolikl
    TabOrder = 6
  end
end

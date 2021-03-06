object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 838
  Width = 673
  object AC: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1qaz!QAZ;Persist Security Info=True' +
      ';User ID=prog;Initial Catalog=Class_of_diseases;Data Source=95.1' +
      '05.104.92'
    ConnectionTimeout = 5
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 16
  end
  object QPacGet: TADOQuery
    Connection = AC
    CursorType = ctStatic
    CommandTimeout = 5
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select pac.name, pac.surname, pac.patronymic,'
      #9'   pac.pol,'
      #9'   pac.date_birth,'
      #9'   ss.name soc_status,'
      #9'   p.number polis,'
      #9'   ar.name +'#39' '#39'+ loc.name +'#39' '#39'+ ln.name +'#39' '#39'+nln.name adress,'
      #9'   stw.name stat_worrk,'
      #9'   sec.name sector,'
      #9'   pl.name polikl,'
      #9'   ss.id id_soc,'
      #9'   ad.Id id_adress,'
      #9'   stw.id id_work,'
      #9'   pl.id id_polikl,'
      #9'   sec.id id_sector,'
      #9'   polis.id id_polis,'
      '     GroupInval'
      ''
      ' from Pac left join SocStatus ss on pac.soc_status=ss.id'
      #9#9#9'left join Polis p on pac.polis=p.id'
      #9#9#9'left join Adress ad on pac.adress= ad.id'
      #9#9#9'left join Area ar on ad.area=ar.id'
      #9#9#9'left join Locality loc on ad.locality=loc.id'
      #9#9#9'left join street ln on ad.line=ln.id'
      #9#9#9'left join HouseNumber nln on ad.number_line=nln.id'
      #9#9#9'left join statwork stw on pac.stat_work=stw.id'
      #9#9#9'left join Sector sec on pac.sector=sec.id'
      #9#9#9'left join Polikl pl on pac.polikl=pl.id'
      #9#9#9'left join Polis on pac.polis=Polis.id'
      'where pac.id=:id')
    Left = 24
    Top = 248
    object QPacGetname: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'name'
      Size = 50
    end
    object QPacGetsurname: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'surname'
      Size = 50
    end
    object QPacGetpatronymic: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'patronymic'
      Size = 50
    end
    object QPacGetpol: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'pol'
      Size = 1
    end
    object QPacGetdate_birth: TWideStringField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'date_birth'
      Size = 10
    end
    object QPacGetsoc_status: TStringField
      DisplayLabel = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1090#1072#1090#1091#1089
      FieldName = 'soc_status'
    end
    object QPacGetGroupInval: TIntegerField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080
      FieldName = 'GroupInval'
    end
    object QPacGetpolis: TStringField
      DisplayLabel = #1055#1086#1083#1080#1089
      FieldName = 'polis'
    end
    object QPacGetadress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'adress'
      ReadOnly = True
      Size = 50
    end
    object QPacGetstat_worrk: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
      FieldName = 'stat_worrk'
      Size = 50
    end
    object QPacGetpolikl: TStringField
      DisplayLabel = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
      FieldName = 'polikl'
      Size = 15
    end
    object QPacGetsector: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1086#1082
      FieldName = 'sector'
      Size = 5
    end
    object QPacGetid_soc: TAutoIncField
      FieldName = 'id_soc'
      ReadOnly = True
      Visible = False
    end
    object QPacGetid_adress: TIntegerField
      FieldName = 'id_adress'
      ReadOnly = True
      Visible = False
    end
    object QPacGetid_work: TAutoIncField
      FieldName = 'id_work'
      ReadOnly = True
      Visible = False
    end
    object QPacGetid_polikl: TAutoIncField
      FieldName = 'id_polikl'
      ReadOnly = True
      Visible = False
    end
    object QPacGetid_sector: TAutoIncField
      FieldName = 'id_sector'
      ReadOnly = True
      Visible = False
    end
    object QPacGetid_polis: TAutoIncField
      FieldName = 'id_polis'
      ReadOnly = True
      Visible = False
    end
  end
  object QPacUpd: TADOQuery
    Connection = AC
    CursorType = ctStatic
    CommandTimeout = 5
    Parameters = <
      item
        Name = 'surname'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'patronymic'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'date_birth'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'soc_status'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'polis'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'adress'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'stat_work'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'sector'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'polikl'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pol'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'GroupInval'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE [dbo].[Pac]'
      '   SET [surname] = :surname'
      '      ,[name] = :name'
      '      ,[patronymic] = :patronymic'
      '      ,[date_birth] = :date_birth'
      '      ,[soc_status] = :soc_status'
      '      ,[polis] = :polis'
      '      ,[adress] =:adress'
      '      ,[stat_work] = :stat_work'
      '      ,[sector] = :sector'
      '      ,[polikl] = :polikl'
      '      ,[pol] = :pol'
      '      ,[GroupInval] = :GroupInval'
      ' WHERE id =:id')
    Left = 96
    Top = 240
    object StringField1: TStringField
      FieldName = 'name'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'surname'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'patronymic'
      Size = 100
    end
    object StringField4: TStringField
      FieldName = 'pol'
      Size = 1
    end
    object WideStringField1: TWideStringField
      FieldName = 'date_birth'
      Size = 10
    end
    object StringField5: TStringField
      FieldName = 'soc_status'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'polis'
    end
    object StringField7: TStringField
      FieldName = 'adress'
      ReadOnly = True
      Size = 203
    end
    object StringField8: TStringField
      FieldName = 'stat_worrk'
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'sector'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'polikl'
      Size = 50
    end
  end
  object QSmall_tables: TADOQuery
    Connection = AC
    CursorType = ctStatic
    CommandTimeout = 5
    Parameters = <
      item
        Name = 'id'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'name'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'TableName'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 24
    Top = 64
  end
  object QDiagnoses: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 24
    Top = 120
  end
  object QDoctorGet: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT doc.[surname]'
      '      ,doc.[name]'
      '      ,doc.[patronymic]'
      '      ,doc.[enployment_date]'
      '      ,doc.[demissal]'
      '      ,pos.name position'
      '      ,p.name polikl'
      '      ,p.id idPolikl'
      '      ,pos.id idPosition'
      
        '  FROM [Doctor] doc inner join Position pos on doc.position=pos.' +
        'id'
      '                    inner join Polikl p on p.id=doc.polikl'
      ''
      'where doc.id=:id')
    Left = 24
    Top = 192
    object QDoctorGetsurname: TStringField
      FieldName = 'surname'
      Size = 100
    end
    object QDoctorGetname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object QDoctorGetpatronymic: TStringField
      FieldName = 'patronymic'
      Size = 100
    end
    object QDoctorGetenployment_date: TWideStringField
      FieldName = 'enployment_date'
      Size = 10
    end
    object QDoctorGetdemissal: TWideStringField
      FieldName = 'demissal'
      Size = 10
    end
    object QDoctorGetposition: TStringField
      FieldName = 'position'
      Size = 50
    end
    object QDoctorGetpolikl: TStringField
      FieldName = 'polikl'
      Size = 50
    end
    object QDoctorGetidPolikl: TAutoIncField
      FieldName = 'idPolikl'
      ReadOnly = True
    end
    object QDoctorGetidPosition: TAutoIncField
      FieldName = 'idPosition'
      ReadOnly = True
    end
  end
  object QDoctorUpd: TADOQuery
    Connection = AC
    Parameters = <
      item
        Name = 'surname'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'patronymic'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'enployment_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'position'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'polikl'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE [dbo].[Doctor]'
      '   SET [surname] =:surname'
      '      ,[name] =:name'
      '      ,[patronymic] = :patronymic'
      '      ,[enployment_date] = :enployment_date'
      '      ,[position] = :position'
      '      ,[polikl] = :polikl'
      ' WHERE  id =:id')
    Left = 96
    Top = 192
  end
  object QDoctorIns: TADOQuery
    Connection = AC
    Parameters = <
      item
        Name = 'surname'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'patronymic'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'enployment_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'position'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'polikl'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT  [dbo].[Doctor]'
      '           ([surname]'
      '           ,[name]'
      '           ,[patronymic]'
      '           ,[enployment_date]'
      '           ,[position]'
      '           ,[polikl])'
      '     VALUES'
      '           (:surname'
      '           ,:name'
      '           ,:patronymic'
      '           ,:enployment_date'
      '           ,:position'
      '           ,:polikl)')
    Left = 168
    Top = 192
  end
  object QDoctorDel: TADOQuery
    Connection = AC
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'delete doctor where id=:id')
    Left = 232
    Top = 192
  end
  object QPacIns: TADOQuery
    Connection = AC
    Parameters = <
      item
        Name = 'surname'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'patronymic'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'date_birth'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'soc_status'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'polis'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'adress'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'stat_work'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'sector'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'polikl'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'pol'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'GroupInval'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT     [dbo].[Pac]'
      '           ([surname]'
      '           ,[name]'
      '           ,[patronymic]'
      '           ,[date_birth]'
      '           ,[soc_status]'
      '           ,[polis]'
      '           ,[adress]'
      '           ,[stat_work]'
      '           ,[sector]'
      '           ,[polikl]'
      '           ,[pol]'
      '           ,GroupInval)'
      '     VALUES'
      '           (:surname'
      '           ,:name'
      '           ,:patronymic'
      '           ,:date_birth'
      '           ,:soc_status'
      '           ,:polis'
      '           ,:adress'
      '           ,:stat_work'
      '           ,:sector'
      '           ,:polikl'
      '           ,:pol'
      '           ,:GroupInval)'
      '')
    Left = 168
    Top = 240
  end
  object QPacDel: TADOQuery
    Connection = AC
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Delete pac where id=:id')
    Left = 232
    Top = 240
  end
  object QPlace: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 88
    Top = 64
  end
  object QAdress: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select locality, area, line, number_line from adress')
    Left = 88
    Top = 120
    object QAdresslocality: TIntegerField
      FieldName = 'locality'
    end
    object QAdressarea: TIntegerField
      FieldName = 'area'
    end
    object QAdressline: TIntegerField
      FieldName = 'line'
    end
    object QAdressnumber_line: TIntegerField
      FieldName = 'number_line'
    end
  end
  object Qpolis: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 144
    Top = 64
  end
  object QSector: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 144
    Top = 120
  end
  object QSocStatus: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 208
    Top = 64
  end
  object QStatWork: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 216
    Top = 120
  end
  object QVisit: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 272
    Top = 64
  end
  object QBrowseAdress: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT adr.[id]'
      '      ,loc.name locality'
      '      ,ar.name area'
      '      ,st.name street'
      '      ,hn.name Number_line'
      #9'  ,adr.area idArea'
      #9'  ,adr.locality idLoc'
      #9'  ,adr.line idLine'
      #9'  ,adr.number_line idHouse'
      '  FROM Adress adr inner join area ar on adr.area=ar.id'
      '                  inner join Street st on st.id=adr.line'
      #9#9#9#9'  inner join Locality loc on loc.id=adr.locality'
      #9#9#9#9'  inner join HouseNumber hn on hn.id=adr.number_line')
    Left = 32
    Top = 376
    object QBrowseAdressid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QBrowseAdressarea: TStringField
      DisplayLabel = #1054#1073#1083#1072#1089#1090#1100
      DisplayWidth = 20
      FieldName = 'area'
      Size = 50
    end
    object QBrowseAdresslocality: TStringField
      DisplayLabel = #1053#1072#1089#1077#1083#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      DisplayWidth = 20
      FieldName = 'locality'
    end
    object QBrowseAdressstreet: TStringField
      DisplayLabel = #1059#1083#1080#1094#1072
      DisplayWidth = 20
      FieldName = 'street'
    end
    object QBrowseAdressNumber_line: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072
      DisplayWidth = 10
      FieldName = 'Number_line'
      Size = 10
    end
    object QBrowseAdressidArea: TIntegerField
      FieldName = 'idArea'
      Visible = False
    end
    object QBrowseAdressidLoc: TIntegerField
      FieldName = 'idLoc'
      Visible = False
    end
    object QBrowseAdressidLine: TIntegerField
      FieldName = 'idLine'
      Visible = False
    end
    object QBrowseAdressidHouse: TIntegerField
      FieldName = 'idHouse'
      Visible = False
    end
  end
  object QselectArea: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from area')
    Left = 528
    Top = 8
    object QselectAreaname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object QselectAreaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object DSArea: TDataSource
    DataSet = QselectArea
    Left = 600
    Top = 8
  end
  object QselectLoc: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from Locality')
    Left = 528
    Top = 56
    object QselectLocid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QselectLocname: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSLoc: TDataSource
    DataSet = QselectLoc
    Left = 600
    Top = 56
  end
  object QselectStreet: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from Street')
    Left = 528
    Top = 104
    object QselectStreetid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QselectStreetname: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSStreet: TDataSource
    DataSet = QselectStreet
    Left = 600
    Top = 104
  end
  object QSelectHoume: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from HouseNumber'
      '')
    Left = 528
    Top = 160
    object QSelectHoumeid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QSelectHoumename: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSHoume: TDataSource
    DataSet = QSelectHoume
    Left = 600
    Top = 160
  end
  object QSelectPolisType: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from PolisType'
      '')
    Left = 528
    Top = 216
    object AutoIncField1: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField11: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSPolisType: TDataSource
    DataSet = QSelectPolisType
    Left = 608
    Top = 216
  end
  object QselectPolis: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, number from Polis'
      '')
    Left = 528
    Top = 272
    object QselectPolisid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QselectPolisnumber: TStringField
      FieldName = 'number'
    end
  end
  object DSPolis: TDataSource
    DataSet = QselectPolis
    Left = 608
    Top = 272
  end
  object QselectGroupInval: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from GroupInval')
    Left = 528
    Top = 328
    object AutoIncField3: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField13: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSGrInval: TDataSource
    DataSet = QselectGroupInval
    Left = 608
    Top = 328
  end
  object QselectSocStatus: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from SocStatus'
      '')
    Left = 528
    Top = 376
    object AutoIncField4: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField14: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSSocStatus: TDataSource
    DataSet = QselectSocStatus
    Left = 608
    Top = 376
  end
  object QSelectPolikl: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name, adress from polikl'
      '')
    Left = 528
    Top = 432
    object AutoIncField5: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField15: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSPolikl: TDataSource
    DataSet = QSelectPolikl
    Left = 608
    Top = 432
  end
  object QselectSector: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from Sector'
      '')
    Left = 528
    Top = 488
    object AutoIncField6: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField16: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSSector: TDataSource
    DataSet = QselectSector
    Left = 608
    Top = 488
  end
  object QSelectWork: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name, adress from StatWork'
      '')
    Left = 528
    Top = 544
    object AutoIncField7: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField17: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSWork: TDataSource
    DataSet = QSelectWork
    Left = 608
    Top = 544
  end
  object QGetLastId: TADOQuery
    Connection = AC
    Parameters = <>
    Left = 24
    Top = 304
  end
  object QBrowseSector: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT sec.[id]'
      '      ,Sec.[name]'
      '      ,p.[name] polikl'
      #9'  ,p.id polikl_id'
      '  FROM [Sector] sec inner join Polikl p on p.id=sec.polikl')
    Left = 120
    Top = 376
    object QBrowseSectorid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QBrowseSectorname: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'name'
      Size = 10
    end
    object QBrowseSectorpolikl: TStringField
      DisplayLabel = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
      FieldName = 'polikl'
      Size = 50
    end
    object QBrowseSectorpolikl_id: TAutoIncField
      FieldName = 'polikl_id'
      ReadOnly = True
      Visible = False
    end
  end
  object QpolisTypeBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  [id]'
      '      ,[name]'
      '  FROM [PolisType]')
    Left = 208
    Top = 376
    object QpolisTypeBrowseid: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QpolisTypeBrowsename: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'name'
      Size = 50
    end
  end
  object QSocStatusBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT sc.[id]'
      '      ,sc.[name]'
      '  FROM SocStatus sc')
    Left = 32
    Top = 432
    object QSocStatusBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QSocStatusBrowsename: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 20
      FieldName = 'name'
    end
  end
  object QDiagBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [id]'
      '      ,[code]'
      '      ,cast([name] as varchar(255)) name'
      '  FROM [Diagnoses]')
    Left = 120
    Top = 432
    object QDiagBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QDiagBrowsecode: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'code'
      Size = 8
    end
    object QDiagBrowsename: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'name'
      ReadOnly = True
      Size = 50
    end
  end
  object QGroupInvBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT  [id]'
      '      ,[name]'
      '  FROM [GroupInval]')
    Left = 208
    Top = 432
    object QGroupInvBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QGroupInvBrowsename: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'name'
      Size = 50
    end
  end
  object QPoliklBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      'SELECT p.[id]'
      '      ,p.[name]'
      '      ,p.[adress] idAdress'
      #9'  ,ar.name +'#39', '#39' + loc.name +'#39', '#39'+st.name+'#39', '#39'+ hn.name Adress'
      '  FROM [Polikl] p left outer join Adress a on a.id=p.adress'
      '                  left outer join area ar on ar.id=a.area'
      #9#9#9#9'  left outer join Locality loc on loc.id=a.locality'
      #9#9#9#9'  left outer join Street st on st.id=a.line'
      #9#9#9#9'  left outer join HouseNumber hn on hn.id=a.number_line')
    Left = 32
    Top = 488
    object QPoliklBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QPoliklBrowsename: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'name'
      Size = 30
    end
    object QPoliklBrowseidAdress: TIntegerField
      FieldName = 'idAdress'
      Visible = False
    end
    object QPoliklBrowseAdress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Adress'
      ReadOnly = True
      Size = 50
    end
  end
  object QPacBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    CommandTimeout = 5
    Parameters = <>
    SQL.Strings = (
      'Select pac.id idPac,'
      '     pac.name, pac.surname, pac.patronymic,'
      #9'   pac.pol,'
      #9'   pac.date_birth,'
      #9'   ss.name soc_status,'
      #9'   p.number polis,'
      #9'   ar.name +'#39' '#39'+ loc.name +'#39' '#39'+ ln.name +'#39' '#39'+nln.name adress,'
      #9'   stw.name stat_worrk,'
      #9'   sec.name sector,'
      #9'   pl.name polikl,'
      #9'   ss.id id_soc,'
      #9'   ad.Id id_adress,'
      #9'   stw.id id_work,'
      #9'   pl.id id_polikl,'
      #9'   sec.id id_sector,'
      #9'   polis.id id_polis,'
      '     gr.name GroupInval'
      ' from Pac left join SocStatus ss on pac.soc_status=ss.id'
      #9#9#9'left join Polis p on pac.polis=p.id'
      #9#9#9'left join Adress ad on pac.adress= ad.id'
      #9#9#9'left join Area ar on ad.area=ar.id'
      #9#9#9'left join Locality loc on ad.locality=loc.id'
      #9#9#9'left join street ln on ad.line=ln.id'
      #9#9#9'left join HouseNumber nln on ad.number_line=nln.id'
      #9#9#9'left join statwork stw on pac.stat_work=stw.id'
      #9#9#9'left join Sector sec on pac.sector=sec.id'
      #9#9#9'left join Polikl pl on pac.polikl=pl.id'
      #9#9#9'left join Polis on pac.polis=Polis.id'
      '      left join GroupInval gr on pac.GroupInval=gr.id')
    Left = 120
    Top = 488
    object QPacBrowseidPac: TAutoIncField
      FieldName = 'idPac'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowsesurname: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'surname'
    end
    object QPacBrowsename: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'name'
    end
    object QPacBrowsepatronymic: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'patronymic'
    end
    object QPacBrowsepol: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'pol'
      Size = 1
    end
    object QPacBrowsedate_birth: TWideStringField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'date_birth'
      Size = 10
    end
    object QPacBrowsesoc_status: TStringField
      DisplayLabel = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1090#1072#1090#1091#1089
      FieldName = 'soc_status'
      Size = 15
    end
    object QPacBrowsepolis: TStringField
      DisplayLabel = #1055#1086#1083#1080#1089
      FieldName = 'polis'
    end
    object QPacBrowseadress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'adress'
      ReadOnly = True
    end
    object QPacBrowsestat_worrk: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
      FieldName = 'stat_worrk'
    end
    object QPacBrowsesector: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1086#1082
      DisplayWidth = 5
      FieldName = 'sector'
      Size = 5
    end
    object QPacBrowsepolikl: TStringField
      DisplayLabel = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
      FieldName = 'polikl'
      Size = 25
    end
    object QPacBrowseid_soc: TAutoIncField
      FieldName = 'id_soc'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowseid_adress: TAutoIncField
      FieldName = 'id_adress'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowseid_work: TAutoIncField
      FieldName = 'id_work'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowseid_polikl: TAutoIncField
      FieldName = 'id_polikl'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowseid_sector: TAutoIncField
      FieldName = 'id_sector'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowseid_polis: TAutoIncField
      FieldName = 'id_polis'
      ReadOnly = True
      Visible = False
    end
    object QPacBrowseGroupInval: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080
      FieldName = 'GroupInval'
      Size = 50
    end
  end
  object QDoctorBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT d.[id]'
      '      ,[surname]'
      '      ,d.[name]'
      '      ,[patronymic]'
      '      ,[enployment_date]'
      '      ,[demissal]'
      '      ,p.name position'
      #9'    ,polikl.name polikl'
      '      ,polikl.id idPolikl'
      '      ,p.id idPosition'
      '  FROM [Doctor] d left outer join position p on d.position=p.id'
      '                  left outer join polikl on polikl.id=d.polikl')
    Left = 208
    Top = 488
    object QDoctorBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QDoctorBrowsesurname: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 15
      FieldName = 'surname'
      Size = 100
    end
    object QDoctorBrowsename: TStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'name'
      Size = 100
    end
    object QDoctorBrowsepatronymic: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'patronymic'
      Size = 100
    end
    object QDoctorBrowseenployment_date: TWideStringField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103' '#1085#1072' '#1088#1072#1073#1086#1090#1091
      FieldName = 'enployment_date'
      Size = 10
    end
    object QDoctorBrowsedemissal: TWideStringField
      FieldName = 'demissal'
      Visible = False
      Size = 10
    end
    object QDoctorBrowseposition: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      DisplayWidth = 10
      FieldName = 'position'
      Size = 50
    end
    object QDoctorBrowsepolikl: TStringField
      DisplayLabel = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
      DisplayWidth = 20
      FieldName = 'polikl'
      Size = 50
    end
    object QDoctorBrowseidPolikl: TAutoIncField
      FieldName = 'idPolikl'
      ReadOnly = True
      Visible = False
    end
    object QDoctorBrowseidPosition: TAutoIncField
      FieldName = 'idPosition'
      ReadOnly = True
      Visible = False
    end
  end
  object QSelectPosition: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id, name from Position'
      '')
    Left = 528
    Top = 592
    object AutoIncField2: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object StringField12: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object DSPosition: TDataSource
    DataSet = QSelectPosition
    Left = 608
    Top = 592
  end
  object QSelectPac: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [id]'
      
        '      ,[surname]+'#39' '#39'+[name]+'#39' '#39'+[patronymic]+'#39' ('#39'+(Cast([date_bi' +
        'rth] as varChar(10))+'#39')'#39') fio'
      '  FROM [Pac]')
    Left = 528
    Top = 648
    object QSelectPacid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QSelectPacfio: TStringField
      FieldName = 'fio'
      ReadOnly = True
      Size = 315
    end
  end
  object DSPac: TDataSource
    DataSet = QSelectPac
    Left = 608
    Top = 648
  end
  object QVisitBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT vs.[id]'
      '      ,[date_visit]'
      '      ,pac.surname +'#39' '#39'+ pac.name +'#39' '#39'+pac.patronymic pac'
      '      ,doc.surname +'#39' '#39'+ doc.name +'#39' '#39'+doc.patronymic doc'
      '      ,diag.name diagnos'
      #9'  ,pac.id idPac'
      #9'  ,doc.id idDoc'
      #9'  ,diag.id idDiag'
      '  FROM [Visit] vs left outer join Doctor doc on doc.id=vs.doctor'
      '                  left outer join pac on pac.id=vs.pac'
      #9#9#9#9'  left outer join diagnoses diag on diag.id=vs.diagnos')
    Left = 32
    Top = 544
    object QVisitBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QVisitBrowsedate_visit: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1077#1097#1077#1085#1080#1103
      FieldName = 'date_visit'
    end
    object QVisitBrowsepac: TStringField
      DisplayLabel = #1055#1072#1094#1080#1077#1085#1090
      FieldName = 'pac'
      ReadOnly = True
    end
    object QVisitBrowsedoc: TStringField
      DisplayLabel = #1042#1088#1072#1095
      FieldName = 'doc'
      ReadOnly = True
    end
    object QVisitBrowsediagnos: TStringField
      DisplayLabel = #1044#1080#1072#1075#1085#1086#1079
      FieldName = 'diagnos'
      Size = 10
    end
    object QVisitBrowseidPac: TAutoIncField
      FieldName = 'idPac'
      ReadOnly = True
      Visible = False
    end
    object QVisitBrowseidDoc: TAutoIncField
      FieldName = 'idDoc'
      ReadOnly = True
      Visible = False
    end
    object QVisitBrowseidDiag: TAutoIncField
      FieldName = 'idDiag'
      ReadOnly = True
      Visible = False
    end
  end
  object QSelectDoc: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT doc.[id]'
      
        '      ,doc.[surname]+'#39' '#39'+doc.[name]+'#39' '#39'+doc.[patronymic]+'#39' ('#39'+po' +
        's.name+'#39')'#39' Fio'
      
        '  FROM doctor doc left outer join position pos on pos.id=doc.pos' +
        'ition')
    Left = 528
    Top = 704
    object QSelectDocid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QSelectDocFio: TStringField
      FieldName = 'Fio'
      ReadOnly = True
      Size = 355
    end
  end
  object DSDoc: TDataSource
    DataSet = QSelectDoc
    Left = 608
    Top = 704
  end
  object QselectDiagnos: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [id]'
      '      ,[name]'
      '  FROM [Diagnoses]')
    Left = 528
    Top = 760
    object QselectDiagnosid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object QselectDiagnosname: TStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object DSDioagnos: TDataSource
    DataSet = QselectDiagnos
    Left = 608
    Top = 760
  end
  object QposBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [id]'
      '      ,[name]'
      '  FROM [Position]')
    Left = 120
    Top = 544
    object QposBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QposBrowsename: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      FieldName = 'name'
      Size = 50
    end
  end
  object QWorkBrowse: TADOQuery
    Connection = AC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT work.[id]'
      '      ,work.[name] WorkName'
      '      ,ar.name+'#39' '#39'+loc.name+'#39' '#39'+st.name+'#39' '#39'+hs.name adress'
      #9'  ,ar.id idAr'
      #9'  ,loc.id idLoc'
      #9'  ,st.id idStreet'
      #9'  ,hs.id idHouse'
      #9'  ,work.adress idAdress '
      
        '  FROM [StatWork] work left outer join adress ad on work.adress=' +
        'ad.id'
      '  left outer join area ar on ad.area=ar.id'
      '  left outer join locality loc on ad.locality=loc.id'
      '  left outer join street st on ad.line=st.id'
      '  left outer join HouseNumber hs on ad.number_line=hs.id ')
    Left = 208
    Top = 544
    object QWorkBrowseid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object QWorkBrowseWorkName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'WorkName'
      Size = 50
    end
    object QWorkBrowseadress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 70
      FieldName = 'adress'
      ReadOnly = True
      Size = 203
    end
    object QWorkBrowseidAr: TAutoIncField
      FieldName = 'idAr'
      ReadOnly = True
      Visible = False
    end
    object QWorkBrowseidLoc: TAutoIncField
      FieldName = 'idLoc'
      ReadOnly = True
      Visible = False
    end
    object QWorkBrowseidStreet: TAutoIncField
      FieldName = 'idStreet'
      ReadOnly = True
      Visible = False
    end
    object QWorkBrowseidHouse: TAutoIncField
      FieldName = 'idHouse'
      ReadOnly = True
      Visible = False
    end
    object QWorkBrowseidAdress: TIntegerField
      FieldName = 'idAdress'
    end
  end
end

object uPosition: TuPosition
  Left = 0
  Top = 0
  Caption = 'uPosition'
  ClientHeight = 313
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 23
    Width = 598
    Height = 290
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 598
    Height = 23
    ActionManager = AC
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object AC: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = Action1
          end>
      end
      item
        Items = <
          item
            Action = Action1
          end
          item
            Action = Action2
          end
          item
            Action = Action3
          end>
      end
      item
        Items = <
          item
            Action = Action1
          end
          item
            Action = Action2
          end
          item
            Action = Action3
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 336
    Top = 96
    StyleName = 'Platform Default'
    object Action1: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = Action3Execute
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.QposBrowse
    Left = 272
    Top = 144
  end
end

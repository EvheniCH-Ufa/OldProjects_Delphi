object Task_Frm: TTask_Frm
  Left = 540
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1079#1072#1076#1072#1085#1080#1103
  ClientHeight = 616
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 566
    Width = 500
    Height = 50
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      500
      50)
    object Cancel_Bttn: TButton
      Left = 410
      Top = 16
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
      OnClick = Cancel_BttnClick
    end
    object Apply_Bttn: TButton
      Left = 240
      Top = 16
      Width = 75
      Height = 22
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Apply_BttnClick
    end
    object Ok_Bttn: TButton
      Left = 325
      Top = 16
      Width = 75
      Height = 22
      Caption = #1054#1082
      TabOrder = 2
      OnClick = Ok_BttnClick
    end
    object Button1: TButton
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      Visible = False
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 566
    Align = alTop
    ParentColor = True
    TabOrder = 1
    object BasicProperty_GrBox: TGroupBox
      Left = 4
      Top = 4
      Width = 492
      Height = 36
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 352
        Top = 12
        Width = 67
        Height = 13
        Caption = #8470' '#1044#1086#1075#1086#1074#1086#1088#1072':'
      end
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 123
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1077#1082#1090#1072':'
      end
      object DBEdit2: TDBEdit
        Left = 424
        Top = 8
        Width = 60
        Height = 21
        DataField = 'NumDogovora'
        DataSource = Basic_Frm.Projects_DS
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 136
        Top = 8
        Width = 196
        Height = 21
        DataField = 'ProjectName'
        DataSource = Basic_Frm.Projects_DS
        ReadOnly = True
        TabOrder = 0
      end
    end
    object NameZdanie_GrBox: TGroupBox
      Left = 4
      Top = 112
      Width = 244
      Height = 82
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1079#1076#1072#1085#1080#1103' ('#1089#1086#1086#1088#1091#1078#1077#1085#1080#1103'): '
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object DBMem_Zdanie: TDBMemo
        Left = 6
        Top = 19
        Width = 232
        Height = 54
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'Zdanie'
        DataSource = Basic_Frm.Tasks_DS
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 252
      Top = 112
      Width = 244
      Height = 82
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103': '
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object DBMem_Desc: TDBMemo
        Left = 6
        Top = 19
        Width = 232
        Height = 54
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'TaskDescription'
        DataSource = Basic_Frm.Tasks_DS
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 44
      Width = 492
      Height = 66
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
      DesignSize = (
        492
        66)
      object Label8: TLabel
        Left = 8
        Top = 12
        Width = 124
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1079#1072#1076#1072#1085#1080#1077' '#1085#1072' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1091':'
      end
      object Label2: TLabel
        Left = 288
        Top = 12
        Width = 37
        Height = 13
        Caption = #1086#1090#1076#1077#1083#1091':'
      end
      object Label6: TLabel
        Left = 8
        Top = 40
        Width = 124
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100':'
      end
      object DBEd_TaskName: TDBEdit
        Left = 136
        Top = 8
        Width = 140
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'TaskName'
        DataSource = Basic_Frm.Tasks_DS
        TabOrder = 0
      end
      object Cmb_Otdel: TComboBox
        Left = 332
        Top = 8
        Width = 152
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = Cmb_OtdelChange
        OnKeyPress = Cmb_OtdelKeyPress
      end
      object Cmb_User: TComboBox
        Left = 136
        Top = 36
        Width = 348
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = Cmb_UserChange
        OnKeyPress = Cmb_UserKeyPress
      end
    end
    object CountEx_GrBox: TGroupBox
      Left = 169
      Top = 198
      Width = 162
      Height = 72
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1086#1074' '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 5
      object Label4: TLabel
        Left = 7
        Top = 20
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = #1079#1072#1082#1072#1079#1095#1080#1082#1091':'
      end
      object Label5: TLabel
        Left = 21
        Top = 48
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = #1074' '#1072#1088#1093#1080#1074':'
      end
      object DBEd_CountZakaz: TDBEdit
        Left = 68
        Top = 16
        Width = 76
        Height = 21
        DataField = 'CountZakazchiku'
        DataSource = Basic_Frm.Tasks_DS
        ReadOnly = True
        TabOrder = 0
      end
      object DBEd_CountArhiv: TDBEdit
        Left = 68
        Top = 44
        Width = 76
        Height = 21
        DataField = 'CountVArhiv'
        DataSource = Basic_Frm.Tasks_DS
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Srok_GrBox: TGroupBox
      Left = 334
      Top = 198
      Width = 162
      Height = 72
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1057#1088#1086#1082' '#1089#1076#1072#1095#1080' '#1079#1072#1076#1072#1085#1080#1103': '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 6
      object DateRealiz_DTPicker: TDateTimePicker
        Left = 20
        Top = 26
        Width = 116
        Height = 28
        Date = 39559.622309386580000000
        Time = 39559.622309386580000000
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = DateRealiz_DTPickerChange
      end
    end
    object TipPerpleta_DBRGrp: TDBRadioGroup
      Left = 4
      Top = 198
      Width = 162
      Height = 72
      Caption = ' '#1058#1080#1087' '#1087#1077#1088#1077#1087#1083#1077#1090#1072': '
      DataField = 'Pereplet'
      DataSource = Basic_Frm.Tasks_DS
      Items.Strings = (
        '    '#1082#1072#1088#1090#1086#1085' ('#1082')'
        '    '#1087'/'#1090' ('#1087'/'#1101')'
        '    '#1087#1072#1087#1082#1072' ('#1087')')
      TabOrder = 4
      Values.Strings = (
        '    '#1082#1072#1088#1090#1086#1085' ('#1082')'
        '    '#1087'/'#1090' ('#1087'/'#1101')'
        '    '#1087#1072#1087#1082#1072' ('#1087')')
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 274
      Width = 492
      Height = 180
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1060#1072#1081#1083#1099': '
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      DesignSize = (
        492
        180)
      object Files_DBGrid: TDBGrid
        Left = 4
        Top = 40
        Width = 484
        Height = 111
        DataSource = Files_DS
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = Files_DBGridCellClick
        OnDrawColumnCell = Files_DBGridDrawColumnCell
        OnEditButtonClick = Files_DBGridEditButtonClick
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'FileView'
            Title.Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
            Width = 370
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ispolnitelyu'
            PickList.Strings = (
              #1042#1093#1086#1076#1103#1097#1080#1081
              #1048#1089#1093#1086#1076#1103#1097#1080#1081)
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Width = 78
            Visible = True
          end>
      end
      object NewFile_BitBtn: TBitBtn
        Left = 26
        Top = 14
        Width = 91
        Height = 25
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1072#1081#1083
        Anchors = []
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = NewFile_BitBtnClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00EAF2FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00104B7C00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF008AD5FF00002F6C00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0056A8850089E4FF0000459A00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00123B7A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF002E9F910067C8FF000030A100FF00FF00FF00FF00FF00FF00FF00
          FF0092DCFF00002E8100FF00FF00FF00FF00FF00FF00FF00FF0088ECFF00004D
          8300004A790000478D00003BB400002EBF00002FBC000037AF00003F9400004E
          A30067BAFF00003A9B00FF00FF00FF00FF00FF00FF00FF00FF006CEEFF0054DA
          FC0067F8FF005BE2FF005BC5FF00002EC0004BBBFF0049C3FF0050CDFF0068D9
          FF0078CEFF00002BA500FF00FF00FF00FF00FF00FF00FF00FF0029AA85003CC1
          880030C05A0023B476005BE0FF000036AA000087ED000043A8000039A8000031
          B4000023C2000023BD000039AC00002F8B00003B9100003C8F00AFFFDC00A9FF
          C200B3FFA1003BCF5D0061FAFF0000408F0049E3FF0054EBFF005EEBFF0056CF
          FF0077D1FF000023B30061CBFF007AE1FF0089D5FF00FF00FF00FF00FF00FF00
          FF00B6FFAE002BC157003ADBE300005C7F0029AD96003FBA80003EBA78002AA4
          920060D3FF000057B20026A38F004CB48500FF00FF00FF00FF00FF00FF00FF00
          FF00C7FFBA0051C76E0088FFFF0093FFFF00B8FFE700BAFFB900C3FFB30039B4
          640064E5FF00003A7400AFFFE600D3FFD200FF00FF00FF00FF00FF00FF00FF00
          FF00EDFFD1007BB07100FF00FF00FF00FF00FF00FF00FF00FF00CDFFB00047C2
          600063EDF90000527D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D8FFBD004FB6
          5B0085F5EB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E3FFDA006EA8
          6E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00EFFFFA00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object EditFile_BitBtn: TBitBtn
        Left = 143
        Top = 14
        Width = 90
        Height = 25
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1084#1103' '#1092#1072#1081#1083#1072
        Anchors = []
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = EditFile_BitBtnClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002020
          2000FF00FF00FF00FF00FF00FF00FF00FF002020200020202000202020002020
          20002020200020202000202020002020200020202000FF00FF00FF00FF00FF00
          FF00202020002020200020202000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0020202000FF00FF009393930020202000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0020202000FF00FF00FF00FF009393930020202000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0020202000FF00FF00FF00FF009393930020202000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0020202000FF00FF00FF00FF009393930020202000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0020202000FF00FF00FF00FF00939393002020
          2000FF00FF0020202000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0020202000FF00FF00FF00FF002020
          2000202020002020200020202000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00202020002020200000FF
          FF000000000000000000FF00FF0020202000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00202020002020
          2000FF00FF008484840000000000FF00FF0020202000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002020
          2000FF00FF00FF00FF008484840020202000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0020202000FF00FF00FF00FF009393930020202000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0020202000FF00FF00FF00FF0020202000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF002020200020202000FF00FF0020202000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0020202000FF00FF00}
      end
      object DeleteFile_BitBtn: TBitBtn
        Left = 259
        Top = 14
        Width = 90
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1092#1072#1081#1083#1072
        Anchors = []
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = DeleteFile_BitBtnClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF000000FF00000080000000800080808000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF0080808000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000FF0000008000000080000000800080808000FF00FF00FF00
          FF00FF00FF000000FF00000080000000800080808000FF00FF00FF00FF00FF00
          FF00FF00FF000000FF000000800000008000000080000000800080808000FF00
          FF000000FF000000800000008000000080000000800080808000FF00FF00FF00
          FF00FF00FF00FF00FF000000FF00000080000000800000008000000080008080
          8000000080000000800000008000000080000000800080808000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000800000008000000080000000
          80000000800000008000000080000000800080808000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF0000008000000080000000
          800000008000000080000000800080808000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000008000000080000000
          8000000080000000800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00000080000000
          8000000080000000800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF0000008000000080000000
          8000000080000000800080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF000000800000008000000080008080
          800000008000000080000000800080808000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF0000008000000080000000800080808000FF00
          FF000000FF0000008000000080000000800080808000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF00000080000000800080808000FF00FF00FF00
          FF00FF00FF000000FF0000008000000080000000800080808000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF0000008000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000FF00000080000000800000008000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000FF00000080000000FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object LoadFile_BitBtn: TBitBtn
        Left = 375
        Top = 14
        Width = 91
        Height = 25
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083' '#1085#1072' '#1089#1074#1086#1081' '#1082#1086#1084#1087#1100#1102#1090#1077#1088
        Anchors = []
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = LoadFile_BitBtnClick
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF6666664B4B4B4B4B4B4B4B
          4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B666666FFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFF818181C5C5C5C1C1C1B4B4B4B4B4B4B4B4B4B4
          B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B44B4B4BFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFF818181DADADACDCDCDCDCDCDC5C5C5C5C5C5C5C5C5C5C5C5C5C5C5
          C5C5C5C1C1C1B4B4B44B4B4BFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF818181
          E6E6E6E6E6E6CDCDCDCDCDCDCDCDCDCDCDCDCDCDCD001FFFCDCDCD00BF00B4B4
          B4595959FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF8E8E8ED8E9ECD8E9ECD8E9
          ECD8E9ECD8E9ECD8E9ECE6E6E6E6E6E6E6E6E6DADADACDCDCD666666FFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFF9A9A9AA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7FFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFF001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF001FFF
          FFFFFFFFFFFFFFFFFFA8A8A84B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B
          4B4B4B4B4B4B4B4B4B4BA7A7A7FFFFFF0000FFFFFF001FFFFFFFFFFFFFFF001F
          FF9A9A9A99F8FF99F8FF99F8FF55DFFFAADFD555DFFF55DFFFAADFD555DFFF55
          C0D44B4B4BFFFFFF0000FFFFFFFFFFFF001FFFFFFFFFFFFFFF001FFFA9FFFFA9
          FFFFA9FFFF99F7FFA9FFFF98F7FF98F7FF54DFFFAADFD555DFFF4B4B4BFFFFFF
          0000FFFFFFFFFFFFFFFFFF001FFF001FFF001FFF001FFFA9FFFFA9FFFFA9FFFF
          99F8FF99F8FF55DFFF98F7FF55DFFFAADFD54B4B4BFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF001FFFD8E9ECA9FFFFA9FFFFA9FFFFA9FFFF99F7FF99F7
          FF55DFFF99F8FF55DFFF595959FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF001F
          FFC1C1C1D8E9ECD8E9ECD8E9ECA9FFFF9A9A9A9A9A9A9A9A9A55BFD354BFD355
          BFD3737373FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7B4B4B49A
          9A9A9A9A9A9A9A9A55DFFF55DFFF55DFFF55DFFF55DFFF54BFD3818181FFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4A9FFFF00F2FF00F1FF55BFD3
          8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DB4B4B4FFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFC1C1C19B9B9B8D8D8D8D8D8D9B9B9BB4B4B4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
      end
      object LoadPrFiles_BitBtn: TBitBtn
        Left = 160
        Top = 152
        Width = 172
        Height = 25
        Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083#1099' '#1087#1088#1086#1077#1082#1090#1072' '#1085#1072' '#1089#1074#1086#1081' '#1082#1086#1084#1087#1100#1102#1090#1077#1088
        Anchors = []
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083#1099' '#1087#1088#1086#1077#1082#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = LoadPrFiles_BitBtnClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B
          4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B00FF00FF00FF00FF00FF00
          FF00FF00FF00C6C6C60084848400848484008484840084848400848484008484
          840084848400848484008484840084848400848484004B4B4B00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600848484004B4B4B00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600848484004B4B4B00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600848484004B4B4B00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6C600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004B4B
          4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF004B4B4B00FF00FF00FF00FF004B4B4B00DFFF
          FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF00DFFFFF004B4B4B00FF00
          FF00FF00FF00FF00FF004B4B4B004B4B4B004B4B4B00FF00FF004B4B4B0080FF
          FF0080FFFF0080FFFF0080FFFF0080FFFF0060DFDF0080FFFF004B4B4B00FF00
          FF00FF00FF004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B0080FF
          FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF004B4B4B00FF00
          FF00FF00FF00FF00FF00FF00FF004B4B4B00FF00FF00FF00FF004B4B4B0000FF
          FF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF0080FFFF004B4B4B00FF00
          FF00FF00FF00FF00FF00FF00FF004B4B4B00FF00FF00FF00FF004B4B4B004B4B
          4B004B4B4B004B4B4B0010BFCF0080FFFF0080FFFF00DFFFFF004B4B4B00FF00
          FF00FF00FF00FF00FF00FF00FF004B4B4B00FF00FF00FF00FF004B4B4B0000FF
          FF00FFFFFF0000CFCF004B4B4B004B4B4B004B4B4B004B4B4B00FF00FF004B4B
          4B004B4B4B004B4B4B004B4B4B0084848400FF00FF00FF00FF00FF00FF004B4B
          4B004B4B4B004B4B4B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 457
      Width = 244
      Height = 101
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1054#1090#1084#1077#1090#1082#1072' '#1086#1073' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1080' '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 8
      object TaskPrin_Lbl: TLabel
        Left = 16
        Top = 32
        Width = 194
        Height = 13
        Cursor = crHandPoint
        Caption = #1047#1072#1076#1072#1085#1080#1077' '#1087#1088#1080#1085#1080#1084#1072#1102' 12.66.9000 '#1074' 16:15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = TaskPrin_LblClick
      end
      object TaskGotovo_Lbl: TLabel
        Left = 16
        Top = 64
        Width = 96
        Height = 13
        Cursor = crHandPoint
        Caption = #1047#1072#1076#1072#1085#1080#1077' '#1074#1099#1087#1086#1083#1085#1080#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = TaskGotovo_LblClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 252
      Top = 457
      Width = 244
      Height = 101
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 9
      object DBMem_Komment: TDBMemo
        Left = 6
        Top = 16
        Width = 232
        Height = 77
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'Recenz'
        DataSource = Basic_Frm.Tasks_DS
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  object OtdelsTbl: TADOTable
    Active = True
    Connection = DM.ADOConnectionDB
    CursorType = ctStatic
    TableName = 'OtdelTbl'
    Left = 320
    Top = 248
    object OtdelsTblId_Otdel: TAutoIncField
      FieldName = 'Id_Otdel'
      ReadOnly = True
    end
    object OtdelsTblOtdelName: TWideStringField
      FieldName = 'OtdelName'
      Size = 50
    end
    object OtdelsTblShow: TBooleanField
      FieldName = 'Show'
    end
  end
  object Tasks_DS: TDataSource
    Left = 384
    Top = 248
  end
  object UsersTbl: TADOTable
    Active = True
    Connection = DM.ADOConnectionDB
    CursorType = ctStatic
    TableName = 'WorkmansTbl'
    Left = 352
    Top = 248
    object UsersTblId_Workman: TAutoIncField
      FieldName = 'Id_Workman'
      ReadOnly = True
    end
    object UsersTblWorkmanName: TWideStringField
      FieldName = 'WorkmanName'
      Size = 50
    end
    object UsersTblPassword: TWideStringField
      FieldName = 'Password'
      Size = 255
    end
    object UsersTblRF_Otdel: TIntegerField
      FieldName = 'RF_Otdel'
    end
    object UsersTblRF_Dolg: TIntegerField
      FieldName = 'RF_Dolg'
    end
    object UsersTblPrava: TWordField
      FieldKind = fkLookup
      FieldName = 'Prava'
      LookupDataSet = DM.Dolgnosti_Tbl
      LookupKeyFields = 'id'
      LookupResultField = 'Prava'
      KeyFields = 'RF_Dolg'
      Lookup = True
    end
    object UsersTblShow: TBooleanField
      FieldName = 'Show'
    end
  end
  object OpenDialog: TOpenDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*'
    Left = 140
    Top = 354
  end
  object Files_DS: TDataSource
    DataSet = DM.Files_Query
    OnDataChange = Files_DSDataChange
    Left = 136
    Top = 240
  end
end

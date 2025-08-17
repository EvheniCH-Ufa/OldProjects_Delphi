object Project_Frm: TProject_Frm
  Left = 1342
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1087#1088#1086#1077#1082#1090#1072
  ClientHeight = 535
  ClientWidth = 330
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 484
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object GroupBox4: TGroupBox
      Left = 4
      Top = 186
      Width = 322
      Height = 64
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        '  '#1044#1072#1090#1072' '#1089#1076#1072#1095#1080' '#1087#1088#1086#1077#1082#1090#1072'                              '#1047#1072#1082#1072#1079#1095#1080#1082'      ' +
        '             '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
      object DateRealiz_DTPicker: TDateTimePicker
        Left = 8
        Top = 20
        Width = 121
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
      object Zakazchik_DBEdit: TDBEdit
        Left = 152
        Top = 22
        Width = 161
        Height = 21
        DataField = 'Zakazchik'
        DataSource = Basic_Frm.Projects_DS
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 4
      Width = 322
      Height = 76
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      DesignSize = (
        322
        76)
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 67
        Height = 13
        Caption = #8470' '#1044#1086#1075#1086#1074#1086#1088#1072':'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 69
        Height = 13
        Caption = #1048#1084#1103' '#1087#1088#1086#1077#1082#1090#1072':'
      end
      object DBEdit1: TDBEdit
        Left = 80
        Top = 12
        Width = 236
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NumDogovora'
        DataSource = Basic_Frm.Projects_DS
        TabOrder = 0
      end
      object ProjectName_DBEdit: TDBEdit
        Left = 80
        Top = 44
        Width = 236
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ProjectName'
        DataSource = Basic_Frm.Projects_DS
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 86
      Width = 322
      Height = 94
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1054#1087#1080#1089#1072#1085#1080#1077' '
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
      object DBMemo1: TDBMemo
        Left = 6
        Top = 19
        Width = 310
        Height = 66
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'ProjectDescription'
        DataSource = Basic_Frm.Projects_DS
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 386
      Width = 322
      Height = 94
      Align = alCustom
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '
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
      object DBMemo2: TDBMemo
        Left = 6
        Top = 19
        Width = 310
        Height = 66
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'Komment'
        DataSource = Basic_Frm.Projects_DS
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 4
      Top = 256
      Width = 322
      Height = 124
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1060#1072#1081#1083#1099' '#1087#1088#1086#1077#1082#1090#1072' '
      Color = clBtnFace
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 4
      object TZ_File_SpButton: TSpeedButton
        Left = 296
        Top = 19
        Width = 22
        Height = 22
        Caption = '...'
        OnClick = TZ_File_SpButtonClick
      end
      object Label3: TLabel
        Left = 4
        Top = 22
        Width = 69
        Height = 13
        Caption = #1058#1077#1093'. '#1079#1072#1076#1072#1085#1080#1077':'
      end
      object Label4: TLabel
        Left = 4
        Top = 46
        Width = 68
        Height = 13
        Caption = #1058#1077#1093'. '#1091#1089#1083#1086#1074#1080#1103':'
      end
      object TU_File_SpButton: TSpeedButton
        Tag = 1
        Left = 296
        Top = 43
        Width = 22
        Height = 22
        Caption = '...'
        OnClick = TZ_File_SpButtonClick
      end
      object Label5: TLabel
        Left = 4
        Top = 70
        Width = 66
        Height = 13
        Caption = #1043#1088#1072#1092#1080#1082' '#1043#1048#1055':'
      end
      object GrGIP_File_SpButton: TSpeedButton
        Tag = 2
        Left = 296
        Top = 67
        Width = 22
        Height = 22
        Caption = '...'
        OnClick = TZ_File_SpButtonClick
      end
      object Label6: TLabel
        Left = 4
        Top = 94
        Width = 83
        Height = 13
        Caption = #1057#1086#1089#1090#1072#1074' '#1087#1088#1086#1077#1082#1090#1072':'
      end
      object Sostav_File_SpButton: TSpeedButton
        Tag = 3
        Left = 296
        Top = 91
        Width = 22
        Height = 22
        Caption = '...'
        OnClick = TZ_File_SpButtonClick
      end
      object TZ_File_DBEdit: TDBEdit
        Left = 90
        Top = 20
        Width = 206
        Height = 21
        DataField = 'TZ_File'
        DataSource = Basic_Frm.Projects_DS
        ReadOnly = True
        TabOrder = 0
      end
      object TU_File_DBEdit: TDBEdit
        Left = 90
        Top = 44
        Width = 206
        Height = 21
        DataField = 'TU_File'
        DataSource = Basic_Frm.Projects_DS
        ReadOnly = True
        TabOrder = 1
      end
      object GrGIP_File_DBEdit: TDBEdit
        Left = 90
        Top = 68
        Width = 206
        Height = 21
        DataField = 'GrGIP_File'
        DataSource = Basic_Frm.Projects_DS
        ReadOnly = True
        TabOrder = 2
      end
      object Sostav_File_DBEdit: TDBEdit
        Left = 90
        Top = 92
        Width = 206
        Height = 21
        DataField = 'Sostav_File'
        DataSource = Basic_Frm.Projects_DS
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 485
    Width = 330
    Height = 50
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      330
      50)
    object OK_Bttn: TButton
      Left = 152
      Top = 16
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = OK_BttnClick
    end
    object Cancel_Bttn: TButton
      Left = 240
      Top = 16
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object OpenDialog: TOpenDialog
    Left = 132
    Top = 206
  end
end

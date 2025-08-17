object Settings_Frm: TSettings_Frm
  Left = 459
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 344
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 294
    Width = 300
    Height = 50
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object Ok_Btn: TButton
      Left = 112
      Top = 16
      Width = 75
      Height = 21
      Caption = 'Ok'
      TabOrder = 0
      OnClick = Ok_BtnClick
    end
    object Cancel_Btn: TButton
      Left = 206
      Top = 16
      Width = 75
      Height = 21
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = Cancel_BtnClick
    end
    object Aply_Btn: TButton
      Left = 19
      Top = 16
      Width = 75
      Height = 21
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = Aply_BtnClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 293
    Align = alTop
    TabOrder = 1
    DesignSize = (
      300
      293)
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 292
      Height = 140
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1055#1088#1086#1077#1082#1090#1099' '
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 80
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1042' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077
      end
      object Label1: TLabel
        Left = 8
        Top = 50
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1099#1077
      end
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1060#1086#1085
      end
      object Label7: TLabel
        Left = 8
        Top = 110
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1077
      end
      object PrBackgr_ClrBx: TColorBox
        Left = 100
        Top = 16
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1092#1086#1085#1072' '#1089#1087#1080#1089#1082#1072' '#1087#1088#1086#1077#1082#1090#1086#1074
        NoneColorColor = clMenu
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 0
      end
      object PrGotov_ClrBx: TColorBox
        Left = 100
        Top = 46
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1079#1072#1087#1080#1089#1077#1081' '#1074#1099#1087#1086#1083#1085#1077#1085#1099#1093' '#1087#1088#1086#1077#1082#1090#1086#1074
        NoneColorColor = clMenu
        Selected = clTeal
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 1
      end
      object PrNegotov_ClrBx: TColorBox
        Left = 100
        Top = 76
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1079#1072#1087#1080#1089#1077#1081' '#1088#1072#1079#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1093' '#1087#1088#1086#1077#1082#1090#1086#1074
        NoneColorColor = clMenu
        Selected = 12171775
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 2
      end
      object PrNeVSrok_ClrBx: TColorBox
        Left = 100
        Top = 106
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1079#1072#1087#1080#1089#1077#1081' '#1088#1072#1079#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1093' '#1087#1088#1086#1077#1082#1090#1086#1074
        NoneColorColor = clMenu
        Selected = 16767368
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 146
      Width = 292
      Height = 140
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1047#1072#1076#1072#1085#1080#1103' '
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 80
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1042' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077
      end
      object Label5: TLabel
        Left = 8
        Top = 50
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1099#1077
      end
      object Label6: TLabel
        Left = 8
        Top = 20
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1060#1086#1085
      end
      object Label8: TLabel
        Left = 8
        Top = 110
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1077
      end
      object TaskBackgr_ClrBx: TColorBox
        Left = 100
        Top = 16
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1092#1086#1085#1072' '#1089#1087#1080#1089#1082#1072' '#1079#1072#1076#1072#1085#1080#1081
        NoneColorColor = clMenu
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 0
      end
      object TaskGotov_ClrBx: TColorBox
        Left = 100
        Top = 46
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1079#1072#1087#1080#1089#1077#1081' '#1074#1099#1087#1086#1083#1085#1077#1085#1099#1093' '#1079#1072#1076#1072#1085#1080#1081
        NoneColorColor = clMenu
        Selected = clTeal
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 1
      end
      object TaskNegotov_ClrBx: TColorBox
        Left = 100
        Top = 76
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1079#1072#1087#1080#1089#1077#1081' '#1088#1072#1079#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1093' '#1079#1072#1076#1072#1085#1080#1081
        NoneColorColor = clMenu
        Selected = 12171775
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 2
      end
      object TaskNeVSrok_ClrBx: TColorBox
        Left = 100
        Top = 106
        Width = 186
        Height = 22
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1086#1090#1088#1080#1089#1086#1074#1082#1080' '#1079#1072#1087#1080#1089#1077#1081' '#1088#1072#1079#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1093' '#1087#1088#1086#1077#1082#1090#1086#1074
        NoneColorColor = clMenu
        Selected = 16767368
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
        ItemHeight = 16
        TabOrder = 3
      end
    end
  end
end

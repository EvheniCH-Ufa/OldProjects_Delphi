object Basic_Frm: TBasic_Frm
  Left = 80
  Top = 127
  Width = 908
  Height = 496
  Caption = 'Basic_Frm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 425
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 0
      Top = 72
      Width = 300
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = #1058#1077#1082#1089#1090' '#1076#1086' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 300
      Top = 72
      Width = 300
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = #1058#1077#1082#1089#1090' '#1087#1086#1089#1083#1077' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 600
      Top = 72
      Width = 300
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = #1058#1077#1082#1089#1090' '#1087#1086#1089#1083#1077' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 0
      Top = 0
      Width = 900
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = #1050#1083#1102#1095
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 0
      Top = 24
      Width = 900
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object BeforeCodingMem: TMemo
      Left = 0
      Top = 96
      Width = 300
      Height = 353
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
    object AfterCodingMem: TMemo
      Left = 300
      Top = 96
      Width = 300
      Height = 353
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
    object AfterRecodingMem: TMemo
      Left = 600
      Top = 96
      Width = 300
      Height = 353
      ScrollBars = ssBoth
      TabOrder = 2
      WordWrap = False
    end
    object ChBoxStatusStr: TCheckBox
      Left = 0
      Top = 48
      Width = 450
      Height = 24
      Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103
      Checked = True
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
    object ChBoxNullControl: TCheckBox
      Left = 450
      Top = 48
      Width = 450
      Height = 24
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1089#1080#1084#1074#1086#1083#1072' #0'
      Checked = True
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 4
    end
  end
  object MainMenu1: TMainMenu
    Top = 424
    object FileMM: TMenuItem
      Caption = #1060#1072#1081#1083
      object OpenMM: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        OnClick = OpenMMClick
      end
      object N1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
        OnClick = N2Click
      end
      object ExitMM: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = ExitMMClick
      end
    end
    object N6: TMenuItem
      Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
      object CodingMM: TMenuItem
        Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
        OnClick = CodingMMClick
      end
      object EncodingMM: TMenuItem
        Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
        OnClick = EncodingMMClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    Left = 32
    Top = 424
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    Left = 64
    Top = 424
  end
end

object Form1: TForm1
  Left = 189
  Top = 110
  Width = 698
  Height = 610
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    690
    556)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 690
    Height = 24
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1050#1083#1102#1095' '#1076#1083#1103' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RecodingBttn: TButton
    Left = 300
    Top = 522
    Width = 90
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1056#1072#1089#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = RecodingBttnClick
  end
  object KeyMem: TMemo
    Left = 0
    Top = 24
    Width = 690
    Height = 48
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 80
    Width = 690
    Height = 476
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object MemBeforeCoding: TMemo
      Left = 1
      Top = 1
      Width = 688
      Height = 152
      Color = clBtnHighlight
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object MemAfterRecoding: TMemo
      Left = 1
      Top = 305
      Width = 688
      Height = 160
      Color = clBtnHighlight
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object MemAfterCoding: TMemo
      Left = 1
      Top = 153
      Width = 688
      Height = 152
      Color = clBtnHighlight
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  object CodingBttn: TButton
    Left = 70
    Top = 451
    Width = 90
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    Visible = False
    OnClick = CodingBttnClick
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 408
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N4Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N5: TMenuItem
      Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
      object N6: TMenuItem
        Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
        OnClick = CodingBttnClick
      end
      object N7: TMenuItem
        Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
        OnClick = RecodingBttnClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = 
      'E:\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\Delphi\'#1047#1048'\'#1064#1080#1092#1088#1086#1074#1072#1085#1080#1077' '#1072#1083#1075#1086#1088#1080#1090#1084#1086#1084' RC-4\Coding_RC_' +
      '4.~dpr'
    Filter = #1058#1077#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*txt'
    FilterIndex = 0
    Left = 8
    Top = 416
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*txt'
    Left = 40
    Top = 416
  end
end

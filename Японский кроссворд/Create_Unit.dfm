object Create_Frm: TCreate_Frm
  Left = 508
  Top = 417
  Width = 331
  Height = 220
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1088#1086#1089#1089#1074#1086#1088#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 120
    Width = 77
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1103#1095#1077#1081#1082#1080
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 8
    Width = 156
    Height = 100
    Caption = ' '#1056#1072#1079#1084#1077#1088#1099' '#1074#1077#1088#1093#1085#1077#1081' '#1087#1072#1085#1077#1083#1080' '
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 5
      Height = 13
      Caption = 'y'
    end
    object TopX_Edit: TEdit
      Left = 40
      Top = 24
      Width = 40
      Height = 21
      TabOrder = 0
      Text = '5'
    end
    object TopY_Edit: TEdit
      Left = 40
      Top = 64
      Width = 40
      Height = 21
      TabOrder = 1
      Text = '5'
    end
    object TopX_UpDn: TUpDown
      Left = 80
      Top = 24
      Width = 16
      Height = 21
      Associate = TopX_Edit
      Min = 5
      Max = 150
      Position = 5
      TabOrder = 2
    end
    object TopY_UpDn: TUpDown
      Left = 80
      Top = 64
      Width = 16
      Height = 21
      Associate = TopY_Edit
      Min = 5
      Max = 150
      Position = 5
      TabOrder = 3
    end
  end
  object GroupBox1: TGroupBox
    Left = 164
    Top = 8
    Width = 156
    Height = 100
    Caption = ' '#1056#1072#1079#1084#1077#1088#1099' '#1083#1077#1074#1086#1081' '#1087#1072#1085#1077#1083#1080' '
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 5
      Height = 13
      Caption = 'y'
    end
    object LeftX_Edit: TEdit
      Left = 40
      Top = 24
      Width = 40
      Height = 21
      TabOrder = 0
      Text = '5'
    end
    object LeftY_Edit: TEdit
      Left = 40
      Top = 64
      Width = 40
      Height = 21
      TabOrder = 1
      Text = '5'
    end
    object LeftX_UpDn: TUpDown
      Left = 80
      Top = 24
      Width = 16
      Height = 21
      Associate = LeftX_Edit
      Min = 5
      Max = 150
      Position = 5
      TabOrder = 2
    end
    object LeftY_UpDn: TUpDown
      Left = 80
      Top = 64
      Width = 16
      Height = 21
      Associate = LeftY_Edit
      Min = 5
      Max = 150
      Position = 5
      TabOrder = 3
    end
  end
  object SizeCell_Ed: TEdit
    Left = 95
    Top = 116
    Width = 40
    Height = 21
    TabOrder = 2
    Text = '17'
  end
  object UpDown1: TUpDown
    Left = 135
    Top = 116
    Width = 16
    Height = 21
    Associate = SizeCell_Ed
    Min = 10
    Max = 20
    Position = 17
    TabOrder = 3
    OnChanging = UpDown1Changing
  end
  object Create_Btn: TButton
    Left = 120
    Top = 150
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 4
    OnClick = Create_BtnClick
  end
  object Cancel_Btn: TButton
    Left = 224
    Top = 150
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object Ok_Btn: TButton
    Left = 24
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 6
    OnClick = Ok_BtnClick
  end
end

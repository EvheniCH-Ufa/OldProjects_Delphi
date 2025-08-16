object Ws_Frm: TWs_Frm
  Tag = 2
  Left = 411
  Top = 304
  BorderStyle = bsDialog
  ClientHeight = 92
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = Pass_EdKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 92
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 84
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    end
    object Pass_Ed: TEdit
      Left = 4
      Top = 24
      Width = 192
      Height = 21
      MaxLength = 100
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = Pass_EdKeyPress
    end
    object PasOk_Btn: TButton
      Left = 16
      Top = 56
      Width = 76
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 1
      OnKeyPress = Pass_EdKeyPress
    end
    object PasCancel_Btn: TButton
      Left = 108
      Top = 56
      Width = 76
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
      OnKeyPress = Pass_EdKeyPress
    end
  end
end

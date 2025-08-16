object Key_Frm: TKey_Frm
  Left = 383
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Key_Frm'
  ClientHeight = 98
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 318
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1083#1102#1095', '#1076#1083#1080#1085#1085#1086#1081' '#1074' 32 '#1089#1080#1084#1074#1086#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 12
    Top = 32
    Width = 294
    Height = 21
    MaxLength = 32
    TabOrder = 0
  end
  object OKBttn: TButton
    Left = 56
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKBttnClick
  end
  object CancelBttn: TButton
    Left = 187
    Top = 64
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBttnClick
  end
end

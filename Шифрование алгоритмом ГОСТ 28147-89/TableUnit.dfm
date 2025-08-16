object Table_Frm: TTable_Frm
  Left = 368
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Table_Frm'
  ClientHeight = 242
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 342
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1090#1072#1073#1083#1080#1094#1091' '#1079#1072#1084#1077#1085
    Color = clOlive
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 28
    Width = 326
    Height = 174
    Color = clYellow
    ColCount = 17
    Ctl3D = True
    DefaultColWidth = 18
    DefaultRowHeight = 18
    FixedColor = clMoneyGreen
    RowCount = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnSetEditText = StringGrid1SetEditText
    ColWidths = (
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18
      18)
  end
  object OkBttn: TButton
    Left = 64
    Top = 210
    Width = 75
    Height = 24
    Caption = 'Ok'
    TabOrder = 1
    OnClick = OkBttnClick
  end
  object CancelBttn: TButton
    Left = 203
    Top = 210
    Width = 75
    Height = 24
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
  end
end

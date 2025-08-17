object Files_Frm: TFiles_Frm
  Left = 938
  Top = 174
  Width = 540
  Height = 500
  Caption = 'Files_Frm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 56
    Width = 69
    Height = 13
    Caption = 'FileDescription'
  end
  object Label2: TLabel
    Left = 304
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Komment'
  end
  object Label3: TLabel
    Left = 72
    Top = 176
    Width = 37
    Height = 13
    Caption = 'Recenz'
  end
  object FileName_DBText: TDBText
    Left = 56
    Top = 328
    Width = 369
    Height = 17
    Color = clWhite
    DataField = 'FileView'
    ParentColor = False
  end
  object FileDescription_DBMm: TDBMemo
    Left = 48
    Top = 72
    Width = 185
    Height = 89
    DataField = 'FileDescription'
    TabOrder = 0
  end
  object Komment_DBMm: TDBMemo
    Left = 288
    Top = 64
    Width = 185
    Height = 89
    DataField = 'Komment'
    TabOrder = 1
  end
  object Recenz_DBMm: TDBMemo
    Left = 48
    Top = 192
    Width = 185
    Height = 89
    DataField = 'Recenz'
    TabOrder = 2
  end
  object OK_Bttn: TButton
    Left = 112
    Top = 384
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = OK_BttnClick
  end
  object Cancel_Bttn: TButton
    Left = 304
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 441
    Height = 41
    TabOrder = 5
    object SelectFile_Bttn: TButton
      Left = 408
      Top = 8
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = SelectFile_BttnClick
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 12
      Width = 393
      Height = 21
      DataField = 'FileView'
      ReadOnly = True
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 168
    Top = 392
  end
end

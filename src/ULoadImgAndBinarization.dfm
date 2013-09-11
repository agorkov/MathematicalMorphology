object FLoadImgAndBinarization: TFLoadImgAndBinarization
  Left = 0
  Top = 0
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1080' '#1073#1080#1085#1072#1088#1080#1079#1072#1094#1080#1103' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 289
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object IIn: TImage
    Left = 8
    Top = 8
    Width = 249
    Height = 249
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IInDblClick
  end
  object IOut: TImage
    Left = 378
    Top = 8
    Width = 249
    Height = 249
    Center = True
    Proportional = True
    Stretch = True
  end
  object BClose: TButton
    Left = 8
    Top = 263
    Width = 619
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    TabOrder = 0
    OnClick = BCloseClick
  end
  object GBThresold: TGroupBox
    Left = 263
    Top = 8
    Width = 109
    Height = 89
    Caption = #1055#1086#1088#1086#1075#1086#1074#1072#1103' ...'
    TabOrder = 1
    object LEThresold: TLabeledEdit
      Left = 3
      Top = 32
      Width = 86
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1088#1086#1075':'
      TabOrder = 0
      Text = '50'
    end
    object BThresoldBinarization: TButton
      Left = 3
      Top = 59
      Width = 103
      Height = 25
      Caption = #1041#1080#1085#1072#1088#1080#1079#1072#1094#1080#1103
      TabOrder = 1
      OnClick = BThresoldBinarizationClick
    end
    object UpDown1: TUpDown
      Left = 89
      Top = 32
      Width = 16
      Height = 21
      Associate = LEThresold
      Max = 255
      Position = 50
      TabOrder = 2
    end
  end
  object OPD: TOpenPictureDialog
    Filter = 'All|*.jpg;*.jpeg;*.bmp'
    Left = 16
    Top = 16
  end
end

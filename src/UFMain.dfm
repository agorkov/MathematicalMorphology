object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1084#1072#1090#1077#1084#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1084#1086#1088#1092#1086#1083#1086#1075#1080#1080'...'
  ClientHeight = 435
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ImgOrigin: TImage
    Left = 8
    Top = 93
    Width = 330
    Height = 330
    Center = True
    Proportional = True
    Stretch = True
    OnMouseDown = ImgOriginMouseDown
  end
  object GPImgSettings: TGroupBox
    Left = 8
    Top = 6
    Width = 330
    Height = 81
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103':'
    TabOrder = 0
    object Label1: TLabel
      Left = 71
      Top = 20
      Width = 45
      Height = 13
      Caption = '- '#1096#1080#1088#1080#1085#1072
    end
    object Label2: TLabel
      Left = 71
      Top = 47
      Width = 44
      Height = 13
      Caption = '- '#1074#1099#1089#1086#1090#1072
    end
    object EImgW: TEdit
      Left = 17
      Top = 20
      Width = 32
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '10'
    end
    object UDImgW: TUpDown
      Left = 49
      Top = 20
      Width = 16
      Height = 21
      Associate = EImgW
      Min = 2
      Max = 30
      Position = 10
      TabOrder = 1
      OnClick = UDClick
    end
    object EImgH: TEdit
      Left = 17
      Top = 47
      Width = 32
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '10'
    end
    object UDImgH: TUpDown
      Left = 49
      Top = 47
      Width = 16
      Height = 21
      Associate = EImgH
      Min = 2
      Max = 30
      Position = 10
      TabOrder = 3
      OnClick = UDClick
    end
  end
end

object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1084#1072#1090#1077#1084#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1084#1086#1088#1092#1086#1083#1086#1075#1080#1080'...'
  ClientHeight = 435
  ClientWidth = 1018
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
  object ImgIn: TImage
    Left = 8
    Top = 93
    Width = 330
    Height = 330
    Center = True
    Proportional = True
    Stretch = True
    OnMouseDown = ImgInMouseDown
  end
  object ImgMask: TImage
    Left = 344
    Top = 93
    Width = 330
    Height = 330
    Center = True
    Proportional = True
    Stretch = True
    OnMouseDown = ImgMaskMouseDown
  end
  object ImgOut: TImage
    Left = 680
    Top = 93
    Width = 330
    Height = 330
    Center = True
    Proportional = True
    Stretch = True
  end
  object GBIIn: TGroupBox
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
    object EIinW: TEdit
      Left = 17
      Top = 20
      Width = 32
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '10'
    end
    object UDIInW: TUpDown
      Left = 49
      Top = 20
      Width = 16
      Height = 21
      Associate = EIinW
      Min = 2
      Max = 30
      Position = 10
      TabOrder = 1
      OnClick = UDIInClick
    end
    object EIInH: TEdit
      Left = 17
      Top = 47
      Width = 32
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '10'
    end
    object UDIInH: TUpDown
      Left = 49
      Top = 47
      Width = 16
      Height = 21
      Associate = EIInH
      Min = 2
      Max = 30
      Position = 10
      TabOrder = 3
      OnClick = UDIInClick
    end
    object BSaveIIn: TButton
      Left = 152
      Top = 15
      Width = 163
      Height = 53
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 4
      OnClick = BSaveIInClick
    end
  end
  object GPIMask: TGroupBox
    Left = 344
    Top = 6
    Width = 330
    Height = 81
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1084#1072#1089#1082#1080':'
    TabOrder = 1
    object Label3: TLabel
      Left = 71
      Top = 20
      Width = 45
      Height = 13
      Caption = '- '#1096#1080#1088#1080#1085#1072
    end
    object Label4: TLabel
      Left = 71
      Top = 47
      Width = 44
      Height = 13
      Caption = '- '#1074#1099#1089#1086#1090#1072
    end
    object LMaskX: TLabel
      Left = 136
      Top = 20
      Width = 35
      Height = 13
      Caption = 'LMaskX'
    end
    object LMaskY: TLabel
      Left = 136
      Top = 47
      Width = 35
      Height = 13
      Caption = 'LMaskY'
    end
    object EMaskW: TEdit
      Left = 17
      Top = 20
      Width = 32
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '3'
    end
    object UDMaskW: TUpDown
      Left = 49
      Top = 20
      Width = 15
      Height = 21
      Associate = EMaskW
      Min = 1
      Max = 10
      Position = 3
      TabOrder = 1
      OnClick = UDMaskClick
    end
    object EMaskH: TEdit
      Left = 17
      Top = 47
      Width = 32
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '3'
    end
    object UDMaskH: TUpDown
      Left = 49
      Top = 47
      Width = 15
      Height = 21
      Associate = EMaskH
      Min = 1
      Max = 10
      Position = 3
      TabOrder = 3
      OnClick = UDMaskClick
    end
    object BSaveMask: TButton
      Left = 208
      Top = 15
      Width = 107
      Height = 53
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 4
      OnClick = BSaveMaskClick
    end
  end
  object PCMorphology: TPageControl
    Left = 680
    Top = 8
    Width = 330
    Height = 79
    ActivePage = TSMain
    TabOrder = 2
    object TSMain: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      object BDilatation: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 45
        Caption = #1044#1080#1083#1072#1090#1072#1094#1080#1103
        TabOrder = 0
        OnClick = BDilatationClick
      end
      object BErosion: TButton
        Left = 84
        Top = 3
        Width = 75
        Height = 45
        Caption = #1069#1088#1086#1079#1080#1103
        TabOrder = 1
        OnClick = BErosionClick
      end
      object BClosing: TButton
        Left = 165
        Top = 3
        Width = 75
        Height = 45
        Caption = #1047#1072#1084#1099#1082#1072#1085#1080#1077
        TabOrder = 2
        OnClick = BClosingClick
      end
      object BOpening: TButton
        Left = 246
        Top = 3
        Width = 75
        Height = 45
        Caption = #1056#1072#1079#1084#1099#1082#1072#1085#1080#1077
        TabOrder = 3
        OnClick = BOpeningClick
      end
    end
  end
  object SPD: TSavePictureDialog
    Filter = 'Portable Network Graphics (*.png)|*.png'
    Left = 24
    Top = 104
  end
end

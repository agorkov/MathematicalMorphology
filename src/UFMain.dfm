object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1084#1072#1090#1077#1084#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1084#1086#1088#1092#1086#1083#1086#1075#1080#1080'...'
  ClientHeight = 597
  ClientWidth = 1031
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object ImgMask: TImage
    Left = 349
    Top = 93
    Width = 330
    Height = 330
    OnMouseDown = ImgMaskMouseDown
  end
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
  object ImgResult: TImage
    Left = 690
    Top = 93
    Width = 330
    Height = 330
    Center = True
    Proportional = True
    Stretch = True
    OnClick = ImgResultClick
  end
  object GBMaskSettings: TGroupBox
    Left = 349
    Top = 6
    Width = 330
    Height = 81
    Caption = #1053#1072#1090#1089#1088#1086#1081#1082#1080' '#1084#1072#1089#1082#1080':'
    TabOrder = 1
    object Label3: TLabel
      Left = 71
      Top = 20
      Width = 45
      Height = 13
      Caption = '- '#1096#1080#1088#1080#1085#1072
    end
    object Label4: TLabel
      Left = 72
      Top = 47
      Width = 44
      Height = 13
      Caption = '- '#1074#1099#1089#1086#1090#1072
    end
    object Label5: TLabel
      Left = 122
      Top = 11
      Width = 68
      Height = 13
      Caption = #1062#1077#1085#1090#1088' '#1084#1072#1089#1082#1080':'
    end
    object Label7: TLabel
      Left = 176
      Top = 28
      Width = 44
      Height = 13
      Caption = '- '#1074#1099#1089#1086#1090#1072
    end
    object Label6: TLabel
      Left = 176
      Top = 55
      Width = 45
      Height = 13
      Caption = '- '#1096#1080#1088#1080#1085#1072
    end
    object EMaskH: TEdit
      Left = 17
      Top = 47
      Width = 32
      Height = 21
      TabOrder = 2
      Text = '3'
      OnChange = EMaskHChange
    end
    object UDMaskH: TUpDown
      Left = 49
      Top = 47
      Width = 16
      Height = 21
      Associate = EMaskH
      Min = 1
      Max = 30
      Position = 3
      TabOrder = 3
    end
    object UDMaskW: TUpDown
      Left = 49
      Top = 20
      Width = 16
      Height = 21
      Associate = EMaskW
      Min = 1
      Max = 30
      Position = 3
      TabOrder = 1
    end
    object EMaskW: TEdit
      Left = 17
      Top = 20
      Width = 32
      Height = 21
      TabOrder = 0
      Text = '3'
      OnChange = EMaskWChange
    end
    object EMaskCX: TEdit
      Left = 122
      Top = 55
      Width = 32
      Height = 21
      TabOrder = 6
      Text = '2'
      OnChange = EMaskCXChange
    end
    object UDMaskCX: TUpDown
      Left = 154
      Top = 55
      Width = 16
      Height = 21
      Associate = EMaskCX
      Min = 1
      Max = 30
      Position = 2
      TabOrder = 7
    end
    object EMaskCY: TEdit
      Left = 122
      Top = 28
      Width = 32
      Height = 21
      TabOrder = 4
      Text = '2'
      OnChange = EMaskCYChange
    end
    object UDMaskCY: TUpDown
      Left = 154
      Top = 28
      Width = 16
      Height = 21
      Associate = EMaskCY
      Min = 1
      Max = 30
      Position = 2
      TabOrder = 5
    end
    object BSelectMask: TButton
      Left = 226
      Top = 16
      Width = 95
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 8
      OnClick = BSelectMaskClick
    end
    object BSaveMask: TButton
      Left = 226
      Top = 47
      Width = 95
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 9
      OnClick = BSaveMaskClick
    end
  end
  object BSaveResult: TButton
    Left = 690
    Top = 561
    Width = 330
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1086#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
    TabOrder = 5
    OnClick = BSaveResultClick
  end
  object GBOtherMorphOperation: TGroupBox
    Left = 690
    Top = 429
    Width = 330
    Height = 126
    Caption = #1044#1088#1091#1075#1080#1077' '#1084#1086#1088#1092#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
    TabOrder = 2
    object BHitorMiss: TButton
      Left = 16
      Top = 24
      Width = 145
      Height = 25
      Caption = #1059#1089#1087#1077#1093'/'#1053#1077#1091#1076#1072#1095#1072
      TabOrder = 0
      OnClick = BHitorMissClick
    end
    object BComditional_dilation: TButton
      Left = 176
      Top = 24
      Width = 145
      Height = 25
      Caption = #1059#1089#1083#1086#1074#1085#1086#1077' '#1085#1072#1088#1072#1097#1080#1074#1072#1085#1080#1077
      TabOrder = 1
      OnClick = BComditional_dilationClick
    end
    object BBorder: TButton
      Left = 16
      Top = 55
      Width = 145
      Height = 25
      Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1075#1088#1072#1085#1080#1094
      TabOrder = 2
      OnClick = BBorderClick
    end
    object BCarcass: TButton
      Left = 176
      Top = 55
      Width = 145
      Height = 25
      Caption = #1052#1086#1088#1092#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1082#1072#1088#1082#1072#1089
      TabOrder = 3
      OnClick = BCarcassClick
    end
    object Скелетизация: TButton
      Left = 16
      Top = 86
      Width = 305
      Height = 25
      Caption = #1057#1082#1077#1083#1077#1090#1080#1079#1072#1094#1080#1103
      TabOrder = 4
      OnClick = СкелетизацияClick
    end
  end
  object GBImgLog: TGroupBox
    Left = 8
    Top = 432
    Width = 330
    Height = 157
    Caption = #1051#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080':'
    TabOrder = 3
    object BNot: TButton
      Left = 3
      Top = 24
      Width = 324
      Height = 25
      Caption = 'Not'
      TabOrder = 0
      OnClick = BNotClick
    end
    object BAnd: TButton
      Left = 3
      Top = 67
      Width = 324
      Height = 25
      Caption = 'And'
      TabOrder = 1
      OnClick = BAndClick
    end
    object BOR: TButton
      Left = 3
      Top = 98
      Width = 324
      Height = 25
      Caption = 'Or'
      TabOrder = 2
      OnClick = BORClick
    end
    object BXOR: TButton
      Left = 3
      Top = 129
      Width = 324
      Height = 25
      Caption = 'xOr'
      TabOrder = 3
      OnClick = BXORClick
    end
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
      TabOrder = 0
      Text = '4'
      OnChange = EImgWChange
    end
    object UDImgW: TUpDown
      Left = 49
      Top = 20
      Width = 16
      Height = 21
      Associate = EImgW
      Min = 2
      Max = 5000
      Position = 4
      TabOrder = 1
    end
    object EImgH: TEdit
      Left = 17
      Top = 47
      Width = 32
      Height = 21
      TabOrder = 2
      Text = '4'
      OnChange = EImgHChange
    end
    object UDImgH: TUpDown
      Left = 49
      Top = 47
      Width = 16
      Height = 21
      Associate = EImgH
      Min = 2
      Max = 5000
      Position = 4
      TabOrder = 3
    end
    object BSelectImg: TButton
      Left = 122
      Top = 20
      Width = 87
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 4
      OnClick = BSelectImgClick
    end
    object BSaveImg: TButton
      Left = 121
      Top = 47
      Width = 88
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 6
      OnClick = BSaveImgClick
    end
    object BLoadImage: TButton
      Left = 215
      Top = 20
      Width = 112
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080' '#1073#1080#1085#1072#1088#1080#1079#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BLoadImageClick
    end
    object BSaveImage: TButton
      Left = 215
      Top = 47
      Width = 112
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' ('#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = BSaveImageClick
    end
  end
  object GPOperations: TGroupBox
    Left = 690
    Top = 6
    Width = 330
    Height = 81
    Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080':'
    TabOrder = 4
    object BDilation: TButton
      Left = 17
      Top = 20
      Width = 144
      Height = 25
      Caption = #1053#1072#1088#1072#1097#1080#1074#1072#1085#1080#1077
      TabOrder = 0
      OnClick = BDilationClick
    end
    object BErosion: TButton
      Left = 176
      Top = 20
      Width = 144
      Height = 25
      Caption = #1069#1088#1086#1079#1080#1103
      TabOrder = 1
      OnClick = BErosionClick
    end
    object BOpening: TButton
      Left = 176
      Top = 51
      Width = 145
      Height = 25
      Caption = #1056#1072#1079#1084#1099#1082#1072#1085#1080#1077
      TabOrder = 3
      OnClick = BOpeningClick
    end
    object BClosing: TButton
      Left = 16
      Top = 51
      Width = 145
      Height = 25
      Caption = #1047#1072#1084#1099#1082#1072#1085#1080#1077
      TabOrder = 2
      OnClick = BClosingClick
    end
  end
end

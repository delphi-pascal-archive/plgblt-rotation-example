object MainForm: TMainForm
  Left = 227
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PlgBlt rotation example'
  ClientHeight = 534
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object ImgPanel: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 407
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object Img: TImage
      Left = 2
      Top = 2
      Width = 552
      Height = 399
      Align = alClient
      Center = True
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 407
    Width = 560
    Height = 127
    Align = alBottom
    TabOrder = 1
    object SpeedLbl: TLabel
      Left = 10
      Top = 10
      Width = 356
      Height = 16
      Caption = 'Vitesse de rotation (entre 3 et 25 pour une rotation optimale) :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object MinLbl: TLabel
      Left = 20
      Top = 65
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object MaxLbl: TLabel
      Left = 347
      Top = 65
      Width = 14
      Height = 16
      Caption = '40'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object MiddleLbl: TLabel
      Left = 190
      Top = 65
      Width = 14
      Height = 16
      Caption = '20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SepBevel: TBevel
      Left = 10
      Top = 89
      Width = 351
      Height = 2
    end
    object ChooseBitmapLbl: TLabel
      Left = 10
      Top = 98
      Width = 105
      Height = 16
      Caption = 'Choisir le bitmap :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SepBevel2: TBevel
      Left = 369
      Top = 10
      Width = 2
      Height = 111
    end
    object HyperlinkLbl: TLabel
      Left = 384
      Top = 78
      Width = 169
      Height = 43
      Cursor = crHandPoint
      Alignment = taCenter
      Caption = 'Auteur: Bacterius. Source destinee a www.delphifr.com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      WordWrap = True
      OnClick = HyperlinkLblClick
    end
    object SpeedBar: TTrackBar
      Left = 10
      Top = 30
      Width = 359
      Height = 33
      Max = 40
      Frequency = 5
      Position = 3
      TabOrder = 0
      OnChange = SpeedBarChange
    end
    object BitmapList: TComboBox
      Left = 116
      Top = 95
      Width = 245
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 1
      Text = 'Bacterius'
      OnChange = BitmapListChange
      Items.Strings = (
        'Bacterius'
        'Spirale')
    end
    object PauseBtn: TButton
      Left = 380
      Top = 10
      Width = 173
      Height = 23
      Caption = 'Pause'
      TabOrder = 2
      OnClick = PauseBtnClick
    end
    object QuitBtn: TButton
      Left = 380
      Top = 41
      Width = 173
      Height = 24
      Caption = 'Exit'
      TabOrder = 3
      OnClick = QuitBtnClick
    end
  end
  object RotationTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = RotationTimerTimer
    Left = 8
    Top = 8
  end
end

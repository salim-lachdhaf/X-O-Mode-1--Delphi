object Form1: TForm1
  Left = 235
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'X | O <By Salim (S@)>'
  ClientHeight = 314
  ClientWidth = 752
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 273
    Height = 225
    Caption = '   Players Names  '
    Enabled = False
    Font.Charset = ARABIC_CHARSET
    Font.Color = clScrollBar
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object play1: TLabeledEdit
      Left = 40
      Top = 56
      Width = 193
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 21
      EditLabel.Caption = 'Player 1'
      EditLabel.Color = clBlack
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clRed
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe Print'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentColor = False
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      EditLabel.Layout = tlCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object play2: TLabeledEdit
      Left = 40
      Top = 128
      Width = 193
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 21
      EditLabel.Caption = 'Player 2'
      EditLabel.Color = clBlack
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clRed
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe Print'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentColor = False
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      EditLabel.Layout = tlCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 192
      Width = 75
      Height = 25
      Caption = 'OK'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clInactiveCaptionText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 65
    Caption = '   Player Mode   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clScrollBar
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Radio2: TRadioButton
      Left = 184
      Top = 32
      Width = 81
      Height = 17
      Caption = ' 2 player'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Radio2Click
    end
    object Radio1: TRadioButton
      Left = 8
      Top = 32
      Width = 153
      Height = 17
      Caption = ' 1 player (Very easy)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Radio1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 288
    Top = 8
    Width = 457
    Height = 297
    Caption = '  Comment jouer  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Constantia'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Memo1: TMemo
      Left = 8
      Top = 24
      Width = 441
      Height = 265
      Color = clBlack
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      Lines.Strings = (
        ''
        
          '1- Selectionner la lettre a jouer (a5tar el  7aref yelli T7eb 3l' +
          'ih);'
        ''
        
          '2- Choisir la place a deplacer (A5tar win T7eb t7out el7ref yell' +
          'i e5terta);'
        ''
        
          '3- Si place souhait'#233' est verifier Alors valider En tapant sur la' +
          ' touche <ENTRER>;'
        
          '     Si non verifier la place a deplacer (si la place est accept' +
          'er alors la celule sera '
        '        Color'#233' en VERT);'
        ''
        '4-  Le tour sera changer automatiquement a ton advers'#233're;'
        ''
        
          '5- Celui qui rempli l'#39'un des colone ou l'#39'un des ligne ou l'#39'un de' +
          's diagonale sera THE '
        'WINNER'
        ''
        
          'RQ:tu doit choisir les trois premier lettre et apr'#233's tu sera cap' +
          'pable de les deplacer '
        'si '
        'non elles seront pas depla'#231'able'
        ''
        '6-  <S@> ENJOY <S@>  '
        '')
      ParentFont = False
      TabOrder = 0
    end
  end
end

object frmRoder: TfrmRoder
  Left = 429
  Top = 145
  Caption = 'Roder Marketplace'
  ClientHeight = 758
  ClientWidth = 1099
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 1097
    Height = 753
    ActivePage = tbsSell
    TabOrder = 0
    object tbsBuy: TTabSheet
      Caption = 'Buy Items'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = 0
      Font.Name = 'Roboto Bk'
      Font.Style = [fsBold]
      ParentFont = False
      object pnlBuy: TPanel
        Left = 416
        Top = 20
        Width = 241
        Height = 105
        BevelOuter = bvNone
        Caption = 'Buy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -67
        Font.Name = 'Roboto Bk'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object tbsSell: TTabSheet
      Caption = 'Sell Items'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object pnlSell: TPanel
        Left = 424
        Top = 20
        Width = 241
        Height = 105
        BevelOuter = bvNone
        Caption = 'Sell'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -67
        Font.Name = 'Roboto Bk'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtName: TEdit
        Left = 72
        Top = 210
        Width = 121
        Height = 41
        BevelOuter = bvRaised
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
  end
end

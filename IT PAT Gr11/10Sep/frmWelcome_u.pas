unit frmWelcome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, frmHealthHarmony_u,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmWelcome = class(TForm)
    pnlWelcome: TPanel;
    imgGirl: TImage;
    btnContinue: TButton;
    btnAbout: TButton;
    redtAbout: TRichEdit;
    lblCopyright: TLabel;
    procedure btnContinueClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWelcome: TfrmWelcome;

implementation

{$R *.dfm}

uses frmSignUp_u, frmLoading_u;

procedure TfrmWelcome.btnAboutClick(Sender: TObject);
begin
  redtAbout.Visible := true;
  redtAbout.lines.LoadFromFile('About.rtf');

  imgGirl.Left := 30;
end;

procedure TfrmWelcome.btnContinueClick(Sender: TObject);
begin
  frmLoading.iPage := 1;
  frmLoading.Show;
  frmWelcome.Hide;
end;

procedure TfrmWelcome.FormActivate(Sender: TObject);
begin
 redtAbout.Visible := false;

  with pnlWelcome do
  begin
    font.Color := frmHealth.clprimary;
    font.Size := 22;
    font.Name := 'Roboto';
    font.Style := [TFontStyle.fsBold];
    caption := 'Welcome to Health Harmony';
  end;

  imgGirl.Stretch := true;
  imgGirl.Picture.LoadFromFile('images/girlTennis.png');
  imgGirl.Left := (frmWelcome.Width div 2) - (imgGirl.Width div 2);

  with btnContinue do
  begin
    font.name := 'Roboto';
    font.Style := [TFontStyle.fsBold];
    font.Size := 11;
  end;

  with btnAbout do
  begin
    font.name := 'Roboto';
    font.Style := [TFontStyle.fsBold];
    font.Size := 11;
  end;

  with lblCopyright do
  begin
    font.Name := 'Roboto';
    font.Size := 14;
    font.Style := [TFontStyle.fsUnderline];
    caption := 'Copyright © '  + #13 + FormatDateTime('yyyy', date) + #13 + 'Tiaan Bothma';
  end;
end;

end.

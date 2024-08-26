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
    procedure FormCreate(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWelcome: TfrmWelcome;

implementation

{$R *.dfm}

uses frmSignUp_u;

procedure TfrmWelcome.btnAboutClick(Sender: TObject);
begin
  redtAbout.lines.LoadFromFile('About.rtf');
end;

procedure TfrmWelcome.btnContinueClick(Sender: TObject);
begin
  frmWelcome.Hide;
end;

procedure TfrmWelcome.FormCreate(Sender: TObject);
begin

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

end;

end.

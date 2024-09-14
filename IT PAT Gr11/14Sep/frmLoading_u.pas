unit frmLoading_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, GIFImg;

type
  TfrmLoading = class(TForm)
    imgLoading: TImage;
    lblTitle: TLabel;
    tmrTimer: TTimer;
    procedure GoToPage();
    procedure tmrTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iPage : integer;
  end;

var
  frmLoading: TfrmLoading;

implementation

{$R *.dfm}

uses frmSignUp_u, frmLogIn_u, frmHealthHarmony_u, frmSettings_u, frmWelcome_u;

procedure TfrmLoading.FormActivate(Sender: TObject);
begin
  //init vars
  tmrTimer.Interval := 3000;
  tmrTimer.Enabled := true;

  with lblTitle do
  begin
    font.Name := 'Roboto';
    font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
    font.Size := 40;
    left := (frmLoading.Width div 2) - (width div 2);
  end;

  imgLoading.Picture.LoadFromFile('images/loading.gif');
  imgLoading.Left := (frmLoading.Width div 2) - (imgLoading.Width div 2);
  (imgLoading.Picture.Graphic as TGifImage).Animate := true;
  (imgLoading.Picture.Graphic as TGifImage).AnimationSpeed := 10000;
end;

procedure TfrmLoading.GoToPage;
begin
  case iPage of
  1 : begin frmSignUp.show; frmLoading.Hide; end;
  end;

  iPage := 0;

  tmrTimer.Enabled := false;
end;

procedure TfrmLoading.tmrTimerTimer(Sender: TObject);
begin
  GoToPage();
end;

end.

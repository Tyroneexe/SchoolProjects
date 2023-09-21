unit frmSplashScreen_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pngimage, jpeg,
  Vcl.ComCtrls;

type
  TfrmSplashScreen = class(TForm)
    imgRoderLogo: TImage;
    tmrTimer: TTimer;
    imgLoadingBar: TImage;
    pbLoading: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure tmrTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.dfm}

uses frmRoder_u;

procedure TfrmSplashScreen.FormActivate(Sender: TObject);
begin

  //Import the fotos
  imgRoderLogo.Picture.LoadFromFile('Logo.png');
  imgLoadingBar.Picture.LoadFromFile('RoderLoadingBar.png');

  //Assign Position

  //Formule om die komponent in die middle van die skerm te kry
  imgRoderLogo.Left := (frmSplashScreen.Width div 2) - (imgRoderLogo.Width div 2);
  imgRoderLogo.Top := (frmSplashScreen.Height div 2) - (imgRoderLogo.Height div 2) - 22;

  imgLoadingBar.Top := imgRoderLogo.Top + imgRoderLogo.Height + 20;
  imgLoadingBar.Left := (frmSplashScreen.Width div 2) - (imgLoadingBar.Width div 2);

  pbLoading.Top := (imgLoadingBar.Top + imgLoadingBar.Height) + 30;
  pbLoading.Left := (frmSplashScreen.Width div 2) - (pbLoading.Width div 2);

  //Begin die timer
  tmrTimer.Enabled := True;

end;
procedure TfrmSplashScreen.FormCreate(Sender: TObject);
begin

  //Loading bar for the loading page (splash screen)
  pbLoading.Position := 100;

end;

procedure TfrmSplashScreen.tmrTimerTimer(Sender: TObject);
begin
  // Hide die splash screen
  frmSplashScreen.Hide;

  // Gaan na die main form na die splash screen
  frmRoder.Show;

  // Disable die timer sodat dit nie weer execute nie
  tmrTimer.Enabled := False;
end;

end.

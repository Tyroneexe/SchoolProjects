unit frmSplashScreen_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pngimage, jpeg;

type
  TfrmSplashScreen = class(TForm)
    imgRoderLogo: TImage;
    tmrTimer: TTimer;
    imgLoadingBar: TImage;
    procedure FormActivate(Sender: TObject);
    procedure tmrTimerTimer(Sender: TObject);
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
  imgRoderLogo.Picture.LoadFromFile('Logo.png');
  imgLoadingBar.Picture.LoadFromFile('RoderLoadingBar.png');

  //Assign Position

  //Formule om die komponent in die middle van die skerm te kry
  imgRoderLogo.Left := (frmSplashScreen.Width div 2) - (imgRoderLogo.Width div 2);
  imgRoderLogo.Top := (frmSplashScreen.Height div 2) - (imgRoderLogo.Height div 2) - 12;

  imgLoadingBar.Top := imgRoderLogo.Top + imgRoderLogo.Height + 10;
  imgLoadingBar.Left := (frmSplashScreen.Width div 2) - (imgLoadingBar.Width div 2);

  tmrTimer.Enabled := True;

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

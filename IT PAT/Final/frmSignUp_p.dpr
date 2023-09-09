program frmSignUp_p;

uses
  Vcl.Forms,
  frmSignUp_u in 'frmSignUp_u.pas' {frmSignUp},
  frmRoder_u in 'frmRoder_u.pas' {frmRoder},
  frmLogIn_u in 'frmLogIn_u.pas' {frmLogIn},
  dmData_u in 'dmData_u.pas' {dmData: TDataModule},
  frmAbout_u in 'frmAbout_u.pas' {frmAbout},
  frmSplashScreen_u in 'frmSplashScreen_u.pas' {frmSplashScreen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmRoder, frmRoder);
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmSplashScreen, frmSplashScreen);
  Application.Run;
end.

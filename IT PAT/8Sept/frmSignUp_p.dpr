program frmSignUp_p;

uses
  Vcl.Forms,
  frmSignUp_u in 'frmSignUp_u.pas' {frmSignUp},
  frmRoder_u in 'frmRoder_u.pas' {frmRoder},
  frmLogIn_u in 'frmLogIn_u.pas' {frmLogIn},
  dmData_u in 'dmData_u.pas' {DataModule1: TDataModule},
  frmAbout_u in 'frmAbout_u.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmRoder, frmRoder);
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.

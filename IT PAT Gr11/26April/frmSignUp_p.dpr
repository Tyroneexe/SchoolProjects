program frmSignUp_p;

uses
  Vcl.Forms,
  frmSignUp_u in 'frmSignUp_u.pas' {frmSignUp},
  dmData_u in 'dmData_u.pas' {dmData: TDataModule},
  frmHealthHarmony_u in 'frmHealthHarmony_u.pas' {frmHealth},
  frmLogIn_u in 'frmLogIn_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfrmHealth, frmHealth);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

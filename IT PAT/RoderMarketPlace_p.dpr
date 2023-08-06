program RoderMarketPlace_p;

uses
  Vcl.Forms,
  RoderMarketPlace_u in 'RoderMarketPlace_u.pas' {frmRoder},
  frmSignUp_u in 'frmSignUp_u.pas' {frmSignUp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRoder, frmRoder);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.Run;
end.

program RoderMarketPlace_p;

uses
  Vcl.Forms,
  RoderMarketPlace_u in 'RoderMarketPlace_u.pas' {frmRoder};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRoder, frmRoder);
  Application.Run;
end.

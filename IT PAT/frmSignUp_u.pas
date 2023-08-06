unit frmSignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JPEG, Vcl.StdCtrls;

type
  TfrmSignUp = class(TForm)
    imgBackground: TImage;
    pnlWelcome: TPanel;
    imgWelcome: TImage;
    edtEmail: TEdit;
    edtPassword: TEdit;
    edtUserName: TEdit;
    pnlUserName: TPanel;
    pnlEmail: TPanel;
    pnlPassword: TPanel;
    pnlCreateAccount: TPanel;
    btnCreateAccount: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses RoderMarketPlace_u;

procedure TfrmSignUp.FormCreate(Sender: TObject);
var

  primaryClr, secondaryClr, lightBlueClr : Cardinal;

begin
  // Start of the program

  primaryClr := RGB(11, 49, 140);
  secondaryClr := RGB(216, 224, 242);
  lightBlueClr := RGB(79, 149, 255);

  //Load Images
  imgBackground.Picture.LoadFromFile('SignUpImage.jpg');
  imgWelcome.Picture.LoadFromFile('Logo.png');

  //Set the Colors
  pnlWelcome.Font.Color := primaryClr;
  pnlCreateAccount.Font.Color := lightBlueClr;

  // Assign Positions
  pnlWelcome.Left := (frmSignUp.Width div 2) - ((pnlWelcome.Width div 2) - 40);
  imgWelcome.Left := (pnlWelcome.Left - pnlWelcome.Width) + 30;

  pnlCreateAccount.Top := (imgWelcome.Top + imgWelcome.Height) + 50;
  pnlCreateAccount.Left := (frmSignUp.Width div 2) - (pnlCreateAccount.Width div 2);

  pnlUserName.Left := (frmSignUp.Width div 2) - (pnlUserName.Width div 2); // Hierdie formule center die komponente
  pnlEmail.Left := (frmSignUp.Width div 2) - (pnlEmail.Width div 2); // Ek kan ook pnlEmail.Left := pnlUserName.Left; maar dalk later soek ek die een edit langer en groter;
  pnlPassword.Left := (frmSignUp.Width div 2) - (pnlPassword.Width div 2);

  edtUserName.Left := (frmSignUp.Width div 2) - (edtUserName.Width div 2);
  edtEmail.Left := (frmSignUp.Width div 2) - (edtEmail.Width div 2);
  edtPassword.Left := (frmSignUp.Width div 2) - (edtPassword.Width div 2);

  btnCreateAccount.Left := (frmSignUp.Width div 2) - (btnCreateAccount.Width div 2);

end;

end.

unit frmSignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JPEG, Vcl.StdCtrls, dmData_u;

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
    procedure btnCreateAccountClick(Sender: TObject);
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

procedure TfrmSignUp.btnCreateAccountClick(Sender: TObject);
var

  sPassword, sEmail, sUsername: string;

  bVlag1, bVlag2, bVlag3 : boolean;

begin
  //Lees die variables in
  sUsername := edtUserName.Text;
  sEmail := edtEmail.Text;
  sPassword := edtPassword.Text;

  bVlag1 := false;
  bVlag2 := false;
  bVlag3  := false;

//Check of die password korrek is
  // 8 karakters lank
  if Length(sPassword) >= 8
    then bVlag1 := true
    else MessageDlg('This is an alert message.', TMsgDlgType.mtError, [mbOK, mbCancel], 0);

  // Hoof en klein letters
  if sPassword[1] in ['A'..'Z']
    then bVlag2 := true
    else Showmessage('Die Password moet begin met `n Hoofletter');

  // Nommers
  if sPassword[Length(sPassword)] in ['1'..'9']
  then bVlag3 := true
  else ShowMessage('Die Password met eindig met `n nommer');



  if bVlag1 and bVlag2 and bVlag3
    then begin
          //Maak die Access db oop
          DataModule1.ADOTable1.Open;

          // Maak n nuwe lyn in die db vir die nuwe inligting
          DataModule1.ADOTable1.Append;

          // Add die nuwe waardes na die database se regte fields
          DataModule1.ADOTable1.FieldByName('UserName').AsString := sUsername;
          DataModule1.ADOTable1.FieldByName('Email').AsString := sEmail;
          DataModule1.ADOTable1.FieldByName('Password').AsString := sPassword;

          //Post die nuwe inligting
          DataModule1.ADOTable1.Post;

          ShowMessage('Jy is geregistreer met Roder...WELKOM!');

          edtUserName.Clear;
          edtEmail.Clear;
          edtPassword.Clear;

          pnlCreateAccount.Caption := 'Account Created';
    end;


end;


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
  pnlEmail.Left := (frmSignUp.Width div 2) - (pnlEmail.Width div 2); // Kan ook pnlEmail.Left := pnlUserName.Left; maar dalk later soek ek die een edit langer en groter;
  pnlPassword.Left := (frmSignUp.Width div 2) - (pnlPassword.Width div 2);

  edtUserName.Left := (frmSignUp.Width div 2) - (edtUserName.Width div 2);
  edtEmail.Left := (frmSignUp.Width div 2) - (edtEmail.Width div 2);
  edtPassword.Left := (frmSignUp.Width div 2) - (edtPassword.Width div 2);

  btnCreateAccount.Left := (frmSignUp.Width div 2) - (btnCreateAccount.Width div 2);

end;

end.

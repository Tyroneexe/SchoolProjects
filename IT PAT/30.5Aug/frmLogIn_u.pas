unit frmLogIn_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, JPEG, pngimage, dmData_u;

type
  TfrmLogIn = class(TForm)
    imgBackground: TImage;
    imgWelcome: TImage;
    pnlWelcome: TPanel;
    pnlLogIn: TPanel;
    pnlEmail: TPanel;
    pnlPassword: TPanel;
    edtEmail: TEdit;
    edtPassword: TEdit;
    btnLogIn: TButton;
    btbtnReset: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btbtnResetClick(Sender: TObject);
    procedure btnLogInClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogIn: TfrmLogIn;

implementation

{$R *.dfm}

uses frmRoder_u, frmSignUp_u;

procedure TfrmLogIn.btbtnResetClick(Sender: TObject);
begin
  //Reset die komponente soos dit oorspronklik was
  edtEmail.Clear;
  edtPassword.Clear;

  edtEmail.SetFocus;
end;

procedure TfrmLogIn.btnLogInClick(Sender: TObject);
var
  sEmail, sPassword: string;
  bAccountFound, bPasswordCorrect: Boolean;
  iConfirmLogIn : integer;

begin
  // Check database vir the account

  sEmail := edtEmail.Text;
  sPassword := edtPassword.Text;

  //Maak false sodat ons kan toets
  bAccountFound := False;
  bPasswordCorrect := False;

  // Open die Access database
  DataModule1.ADOTableUsers.Open;

  // Loop deur die database totdat dit nie meer kan nie
  {Eof = end of file}
  //met ander woorde. terwyl dit nie die einde van die db is nie doen alles
  while not DataModule1.ADOTableUsers.Eof do
  begin
    // as daar n match email in die database is stop by hierdie lyn
    if DataModule1.ADOTableUsers.FieldByName('Email').AsString = sEmail
      then
        begin
          // as die password in die edit die password in die database match dan log in
          if DataModule1.ADOTableUsers.FieldByName('Password').AsString = sPassword
            then
              begin
                iConfirmLogIn :=  MessageDlg('Welcome Back! Successfully logged into your account!', TMsgDlgType.mtConfirmation, [mbOK, mbCancel], 0);
                if iConfirmLogIn = mrOk
                  then
                    begin
                    //Kry die user se id sodat ons kan kyk wie is die current user
                    DataModule1.sUserID := DataModule1.ADOTableUsers.FieldByName('ID').AsString;

                    //Gaan na die main form
                    frmRoder.Show;
                    frmLogIn.Hide;

                    //Daar was n account gevind
                    bAccountFound := True;

                    //Die password match
                    bPasswordCorrect := True;

                    // Exit die loop as daar n match is
                    Break;
                  end
                    else
                      begin
                        //Die user will nie nou in log nie hyt dit gecancel
                        frmSignUp.Show;
                        frmLogin.Hide;

                        //Maak die variables true sodat die program weet dat die account daar is
                        // maar die user wil nie inlog nie
                        bAccountFound := True;
                        bPasswordCorrect := True;

                        //Break want die user se account is gevind
                        Break;
                      end;
              end
              else
              begin
                // Password is verkeerd
                bAccountFound := True;

                // Exit die loop as email bestaan maar password is verkeerd
                Break;
              end;
            end;

    // Move na die volgende record in die database
    DataModule1.ADOTableUsers.Next;
  end;

  // Close the database table
  DataModule1.ADOTableUsers.Close;

  // As account nie gevind was nie of password is verkeerd
  if not bAccountFound
    then
      MessageDlg('No Account Was Found', TMsgDlgType.mtError, [mbOK, mbCancel], 0)
  else if not bPasswordCorrect
    then
      MessageDlg('Incorrect Password', TMsgDlgType.mtError, [mbOK, mbCancel], 0);

end;

procedure TfrmLogIn.FormCreate(Sender: TObject);
var

  primaryClr, secondaryClr, lightBlueClr : Cardinal; //32 bit int (bv. vir RGB values)

begin
  // Start of the program

  //Custom kleure
  primaryClr := RGB(11, 49, 140);
  secondaryClr := RGB(216, 224, 242);
  lightBlueClr := RGB(79, 149, 255);

  //Load Images
  imgWelcome.Picture.LoadFromFile('Logo.png');
  imgBackground.Picture.LoadFromFile('LogInImage.jpg');

  //Assign Colors
  pnlWelcome.Font.Color := primaryClr;
  pnlLogIn.Font.Color := lightBlueClr;

  //Assign Positions
  imgWelcome.Top := 20;
  pnlWelcome.Left := (frmLogIn.Width div 2) - ((pnlWelcome.Width div 2) - 40);
  imgWelcome.Left := (pnlWelcome.Left - pnlWelcome.Width) + 30;

  pnlLogIn.Top := (imgWelcome.Top + imgWelcome.Height) + 20;
  pnlLogIn.Left := (frmLogIn.Width div 2) - (pnlLogIn.Width div 2);

  //Formule om dit te center in die middle van die page
  edtEmail.Left := (frmLogIn.Width div 2) - (edtEmail.Width div 2);
  edtPassword.Left := (frmLogIn.Width div 2) - (edtPassword.Width div 2);
  pnlEmail.Left := (frmLogIn.Width div 2) - (pnlEmail.Width div 2);
  pnlPassword.Left := (frmLogIn.Width div 2) - (pnlPassword.Width div 2);

  btnLogIn.Left := (frmLogIn.Width div 2) - (btnLogIn.Width div 2);

  btbtnReset.Left := (frmLogIn.Width div 2) - (btbtnReset.Width div 2);

end;

end.

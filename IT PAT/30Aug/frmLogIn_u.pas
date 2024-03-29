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
  // Check database for the account

  sEmail := edtEmail.Text;
  sPassword := edtPassword.Text;
  bAccountFound := False;
  bPasswordCorrect := False;

  // Open the Access database
  DataModule1.ADOTable1.Open;

  // Loop deur die database totdat dit nie meer kan nie
  while not DataModule1.ADOTable1.Eof do
  begin
    // if there is a match email in the database
    if DataModule1.ADOTable1.FieldByName('Email').AsString = sEmail
      then
        begin
          // if the password mathces
          if DataModule1.ADOTable1.FieldByName('Password').AsString = sPassword 
            then
              begin
                iConfirmLogIn :=  MessageDlg('Welcome Back! Successfully logged into your account!', TMsgDlgType.mtConfirmation, [mbOK, mbCancel], 0);
                if iConfirmLogIn = mrOk
                  then
                    begin
                    DataModule1.sUserID := DataModule1.ADOTable1.FieldByName('ID').AsString;
                    frmRoder.Show;
                    frmLogIn.Hide;
                    bAccountFound := True;
                    bPasswordCorrect := True;
                    Break; // Exit the loop if match is found
                  end
                    else
                      begin
                        frmSignUp.Show;
                        frmLogin.Hide;
                        //Maak die variables true sodat die program weet dat die account daar is maar die user wil nie inlog nie
                        bAccountFound := True;
                        bPasswordCorrect := True;
                        Break;
                      end;
              end
              else
              begin
                // Password is incorrect
                bAccountFound := True;
                // Exit die loop if email exists but password is wrong
                Break;
              end;
            end;

    // Move to the next record in the database
    DataModule1.ADOTable1.Next;
  end;

  // Close the database table
  DataModule1.ADOTable1.Close;

  // If no account was found or password is incorrect
  if not bAccountFound
    then
      MessageDlg('No Account Was Found', TMsgDlgType.mtError, [mbOK, mbCancel], 0)
  else if not bPasswordCorrect
    then
      MessageDlg('Incorrect Password', TMsgDlgType.mtError, [mbOK, mbCancel], 0);

end;

procedure TfrmLogIn.FormCreate(Sender: TObject);
var

  primaryClr, secondaryClr, lightBlueClr : Cardinal;

begin
  // Start of the program

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

  edtEmail.Left := (frmLogIn.Width div 2) - (edtEmail.Width div 2);
  edtPassword.Left := (frmLogIn.Width div 2) - (edtPassword.Width div 2);
  pnlEmail.Left := (frmLogIn.Width div 2) - (pnlEmail.Width div 2);
  pnlPassword.Left := (frmLogIn.Width div 2) - (pnlPassword.Width div 2);

  btnLogIn.Left := (frmLogIn.Width div 2) - (btnLogIn.Width div 2);

  btbtnReset.Left := (frmLogIn.Width div 2) - (btbtnReset.Width div 2);

end;

end.

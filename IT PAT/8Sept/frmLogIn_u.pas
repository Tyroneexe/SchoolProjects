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
    lblForgotPassword: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btbtnResetClick(Sender: TObject);
    procedure btnLogInClick(Sender: TObject);
    procedure lblForgotPasswordClick(Sender: TObject);
  private
    { Private declarations }
      sEmail : string;
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

  bAccountFound, bPasswordCorrect: Boolean;
  iConfirmLogIn : integer;
  sPassword : string;

begin
  // Check database vir the account

  //Maak false sodat ons kan toets; daar is mos noggie n account gevind nie
  bAccountFound := False;
  bPasswordCorrect := False;

  //initialize variables
  sPassword := edtPassword.Text;
  sEmail := edtEmail.Text;

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
  else
    if not bPasswordCorrect
      then
        MessageDlg('Incorrect Password', TMsgDlgType.mtError, [mbOK, mbCancel], 0);

end;

procedure TfrmLogIn.FormCreate(Sender: TObject);
var

  primaryClr, lightBlueClr : Cardinal; //32 bit int (bv. vir RGB values)

begin
  // Start of the program

  //initialize variables
  sEmail := edtEmail.Text;



  //Custom kleure
  primaryClr := RGB(11, 49, 140);
//  secondaryClr := RGB(216, 224, 242);
  lightBlueClr := RGB(79, 149, 255);

  //Load Images
  imgWelcome.Picture.LoadFromFile('Logo.png');
  imgBackground.Picture.LoadFromFile('LogInImage.jpg');

  //Assign Colors
  pnlWelcome.Font.Color := primaryClr;
  pnlLogIn.Font.Color := lightBlueClr;
  lblForgotPassword.Font.Color := clWhite;

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

  lblForgotPassword.Left := (frmLogIn.Width div 2) - (lblForgotPassword.Width div 2);

end;

procedure TfrmLogIn.lblForgotPasswordClick(Sender: TObject);
var

  sNewPassword : string;
  iConfirmNewPassword : integer;

begin

  sEmail := edtEmail.Text;

  iConfirmNewPassword := MessageDlg('Do you want to change your password', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0);
    if iConfirmNewPassword = mrOk
      then
        begin

          //Maak die db oop
          DataModule1.ADOTableUsers.Open;

          //Begin by die eerste lyn
          DataModule1.ADOTableUsers.First;

          //Terwyl dit nie die end van die database is nie
          {eof = end of file}
          while not DataModule1.ADOTableUsers.Eof do
            begin
              // as daar n match email in die database is stop by hierdie lyn
              if DataModule1.ADOTableUsers.FieldByName('Email').AsString = sEmail
                then
                  begin
                    //Die user mag nou die password verander
                    sNewPassword := inputbox('Change Password','What should your new password be','');

                    //password moet begin met n hoofletter, is langer of = as 8 en eindig met n nommer
                    if (sNewPassword[1] in ['A'..'Z'])
                      then
                          begin
                            if (length(sNewPassword) >= 8)
                              then
                                begin
                                  if (sNewPassword[length(sNewPassword)] in ['0'..'9'])
                                    then
                                      begin
                                        //Sit die db in edit mode
                                        DataModule1.ADOTableUsers.Edit;

                                        //Die password in die db moet die nuwe password wees
                                        DataModule1.ADOTableUsers.FieldByName('Password').AsString := sNewPassword;

                                        //Post die nuwe verandering
                                        DataModule1.ADOTableUsers.Post;

                                        //password has been changed
                                        ShowMessage('Password has been successfully changed');

                                        //stop as daar n email gevind is
                                        Break;
                                      end
                                        else
                                          begin
                                            //Daar bestaan nie sulke email in die database nie
                                            MessageDlg('Password has to bend with a number', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);

                                            //Exit die while loop want daar is nie sulke account nie
                                            Break;
                                          end;
                                end
                                  else
                                    begin
                                      //Daar bestaan nie sulke email in die database nie
                                      MessageDlg('Password has to be 8 Characters or Longer', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);

                                      //Exit die while loop want daar is nie sulke account nie
                                      Break;
                                    end;
                          end
                            else
                              begin
                                //die password begin nie met n hoofletter nie
                                MessageDlg('The Password has to begin with a Capital Letter', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);

                                //Stop want daar is n error
                                Break;
                              end;
                  end
                    else
                      begin
                        //Daar bestaan nie sulke email in die database nie
                        MessageDlg('No account was found', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);

                        //Exit die while loop want daar is nie sulke account nie
                        Break;
                      end;

                  //Gaan na die volgende lyn in die db
                  DataModule1.ADOTableUsers.Next;

            end;


           DataModule1.ADOTableUsers.Close;

           frmRoder.Show;
           frmLogIn.Hide;


        end
          else
            MessageDlg('Password Change Cancelled', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

end;

end.

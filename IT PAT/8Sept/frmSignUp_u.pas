unit frmSignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, JPEG, pngimage, dmData_u, Math;

type
  TfrmSignUp = class(TForm)
    pnlWelcome: TPanel;
    pnlCreateAccount: TPanel;
    pnlUserName: TPanel;
    pnlEmail: TPanel;
    pnlPassword: TPanel;
    edtUserName: TEdit;
    edtEmail: TEdit;
    edtPassword: TEdit;
    btbtnGeneratePassword: TBitBtn;
    btnCreateAccount: TButton;
    btnLogIn: TButton;
    btbtnReset: TBitBtn;
    imgBackground: TImage;
    imgWelcome: TImage;
    lblAlreadyHaveAccount: TLabel;
    lsbCustomerType: TListBox;
    rgGender: TRadioGroup;
    lblCustomType: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btbtnResetClick(Sender: TObject);
    procedure btbtnGeneratePasswordClick(Sender: TObject);
    procedure btnCreateAccountClick(Sender: TObject);
    procedure btnLogInClick(Sender: TObject);
  private
    { Private declarations }
    sUserName, sEmail, sPassword : string;
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses frmRoder_u, frmLogIn_u;

procedure TfrmSignUp.btbtnGeneratePasswordClick(Sender: TObject);
var

  cEmail : char;
  iPosEmail, iRandom : integer;

begin
  sUsername := edtUserName.Text;
  sEmail := edtEmail.Text;

  //Check of edits nie empty is nie
  if (not sUserName.IsEmpty) and (not sEmail.IsEmpty)
    then
      begin
        if (sUserName[Length(sUserName)] in ['1'..'9'])
          then
            //Die user kannie eindig met n nommer nie
            MessageDlg('UserName cannot end with a number', TMsgDlgType.mtError, [mbOK, mbCancel], 0)
          else
            //add die laaste karakter van username in uppercase
            sPassword := Uppercase(edtUserName.Text[Length(sUserName)]);

      //Net valid emails het @
      if sEmail.Contains('@')
        then
          begin
            //Kry die posisie voor die @
            iPosEmail := pos('@', sEmail);
            //add die char voor die @ na n variable sodat ons dit kan add
            cEmail := copy(sEmail, iPosEmail - 1, 1)[1]; //Char voor die @ teken
            //add die char na die volle password
            sPassword := sPassword + cEmail;
          end
        else
          begin
            //Die email het nie n '@' in nie so dit is nie n regte email nie
            MessageDlg('Not a valid Email', TMsgDlgType.mtError, [mbOK, mbCancel], 0);

            //clear die email en fokus sodat hy dit weer kan invul
            edtEmail.Clear;
            edtEmail.SetFocus;

            //Exit die procedure want daar is n error met die user se email.
            Exit;
          end;

      //terwyl die password korter as 8 is moet hy by add
      while length(sPassword) < 8
        do
          begin
            // Random char vir sEmail
            {ons minus een want dit begin by 0, dws 5 chars is dan 0, 1, 2, 3, 4 maar die random range sluit 5 in so dit sal n error gooi}
            iRandom := RandomRange(0, Length(sEmail) - 1); // Random char vir sEmail
            //add een want ons het 1 geminus nou moet ons weer + 1
            insert(sEmail[iRandom + 1], sPassword, Length(sPassword) + 1); // Add 1 want dit begin by 0

            //dan kry ons n random int van username
            iRandom := RandomRange(0, Length(sUserName) - 1);
            //insert die random char van Username na die sPassword
            insert(sUserName[iRandom + 1], sPassword, Length(sPassword) + 1);
          end;

      //wat, waarin, waar
      insert(IntToStr(random(10)), sPassword, length(sPassword) + 1);

      // Display the generated password
      ShowMessage('Generated Password: ' + sPassword);

      //Sit die password in die edt
      edtPassword.Text := sPassword;
      end
        else //Username of email is empty
          begin
            //Check watse een is empty; is username of email empty
            if sUsername.IsEmpty
              then
                begin
                  //Username is empty so ons gooi n error
                  MessageDlg('Username cannot be empty', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
                  edtUserName.SetFocus;
                end;
                //if email is empty
                if sEmail.IsEmpty
                  then
                    begin
                      //Email is empty so ons gooi n error
                      MessageDlg('Email cannot be empty', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
                      edtUserName.SetFocus;
                    end;
          end;
end;

procedure TfrmSignUp.btbtnResetClick(Sender: TObject);
begin
  //reset all die components soos dit was in die begin
  edtUserName.Clear;
  edtEmail.Clear;
  edtPassword.Clear;
  lsbCustomerType.ItemIndex := -1;
  rgGender.ItemIndex := -1;

  //sit die cursor terug by die username edit
  edtUserName.SetFocus;
end;

procedure TfrmSignUp.btnCreateAccountClick(Sender: TObject);
var

  bVlag1, bVlag2, bVlag3, bVlag4, bVlag5 : boolean;

begin
  //Lees die variables in
  sUsername := edtUserName.Text;
  sEmail := edtEmail.Text;
  sPassword := edtPassword.Text;

  //Set alles eerste fals sodat ons kan toets
  bVlag1 := False;
  bVlag2 := False;
  bVlag3 := False;
  bVlag4 := False;
  bVlag5 := False;

//Check of die password korrek is
  // moet 8 karakters lank
  if Length(sPassword) >= 8
    then bVlag1 := true
    else MessageDlg('The Password is too short', TMsgDlgType.mtInformation, [mbOK, mbCancel], 0);

  // moet begin met n hood letter
  if (sPassword[1] in ['A'..'Z'])
    then bVlag2 := true
    else Showmessage('Password must begin with a capital letter');

  // moet eindig met n nommer
  if sPassword[Length(sPassword)] in ['1'..'9']
  then bVlag3 := true
  else ShowMessage('Password must end with a number');

  //Check of niks empty is nie
  if (sUserName.IsEmpty) or (sEmail.IsEmpty) or (sPassword.IsEmpty)
  then
    //as iets emtpy is kyk wat empty is
    begin
      if (sUserName.IsEmpty)
        then
          begin
            MessageDlg('Please enter a UserName', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
            edtUserName.SetFocus;
          end;
      if (sEmail.IsEmpty)
        then
          begin
            MessageDlg('Please enter an Email', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
            edtEmail.SetFocus;
          end;
      if (sPassword.IsEmpty)
        then
          begin
            MessageDlg('Please enter a Password', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
            edtPassword.SetFocus;
          end;
    end
    else bVlag4 := true;

  //Valid emails hets altyd n @ in
  if sEmail.Contains('@')
    then bVlag5 := true
      else
        begin
          MessageDlg('Not a valid Email', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
          edtEmail.Clear;
          edtEmail.SetFocus;
        end;


  //as alles die minimum requirements voldoen dan add acc na die db toe
  if bVlag1 and bVlag2 and bVlag3 and bVlag4 and bVlag5
    then
      begin
        //Maak die Access db oop
        DataModule1.ADOTableUsers.Open;

        // Maak n nuwe lyn in die db vir die nuwe inligting
        DataModule1.ADOTableUsers.Append;

        // Add die nuwe waardes na die database se regte fields
        DataModule1.ADOTableUsers.FieldByName('UserName').AsString := sUsername;
        DataModule1.ADOTableUsers.FieldByName('Email').AsString := sEmail;
        DataModule1.ADOTableUsers.FieldByName('Password').AsString := sPassword;

        //Post die nuwe inligting
        DataModule1.ADOTableUsers.Post;

        // Gee die current user i id
        //Ons gee die id aan n PUBLIC var sodat ons in roder ook die ID kan gebruik
        //Ons kan dan so die user se naam en inligting vind
        DataModule1.sUserID := DataModule1.ADOTableUsers.FieldByName('ID').AsString;

        //Close the Database
        DataModule1.ADOTableUsers.Close;

        ShowMessage('You are registered with Roder...WELCOME!');

        //Gaan na die main Roder frm toe
        frmRoder.Show;
        frmSignUp.Hide;
      end;


end;

procedure TfrmSignUp.btnLogInClick(Sender: TObject);
begin
  //Die user het n account en will in log en nie n nuwe account maak nie
  frmLogIn.Show;
  frmSignUp.Hide;
end;

procedure TfrmSignUp.FormCreate(Sender: TObject);
var

  clPrimaryClr, clLightBlueClr : Cardinal; //32 bit integer (can be used to store RGB value)

begin
  // Start of the program

  clPrimaryClr := RGB(11, 49, 140);
//  secondaryClr := RGB(216, 224, 242);
  clLightBlueClr := RGB(79, 149, 255);

  //Load Images
  imgBackground.Picture.LoadFromFile('SignUpImage.jpg');
  imgWelcome.Picture.LoadFromFile('Logo.png');

  //Set the Colors
  pnlWelcome.Font.Color := clPrimaryClr;
  pnlCreateAccount.Font.Color := clLightBlueClr;

  // Assign Positions

  {hierso center ons net all die componenets deur n formule te gebruik}
  pnlWelcome.Left := (frmSignUp.Width div 2) - ((pnlWelcome.Width div 2) - 40);
  imgWelcome.Left := (pnlWelcome.Left - pnlWelcome.Width) + 30;

  pnlCreateAccount.Top := (imgWelcome.Top + imgWelcome.Height) + 20;
  pnlCreateAccount.Left := (frmSignUp.Width div 2) - (pnlCreateAccount.Width div 2);

  // Hierdie formule center die komponente
  pnlUserName.Left := (frmSignUp.Width div 2) - (pnlUserName.Width div 2);

  // Kan ook pnlEmail.Left := pnlUserName.Left; maar dalk later soek ek die een edit langer en groter;
  pnlEmail.Left := (frmSignUp.Width div 2) - (pnlEmail.Width div 2);

  pnlPassword.Left := (frmSignUp.Width div 2) - (pnlPassword.Width div 2);

  edtUserName.Left := (frmSignUp.Width div 2) - (edtUserName.Width div 2);
  edtEmail.Left := (frmSignUp.Width div 2) - (edtEmail.Width div 2);
  edtPassword.Left := (frmSignUp.Width div 2) - (edtPassword.Width div 2);

  btnCreateAccount.Left := (frmSignUp.Width div 2) - (btnCreateAccount.Width div 2);

  btnLogIn.Width := btnCreateAccount.Width - 50;
  btnLogIn.Height := btnCreateAccount.Height - 10;
  btnLogIn.Left := btnCreateAccount.Left + (50 div 2);

  btbtnReset.Left := (frmSignUp.Width div 2) - (btbtnReset.Width div 2);

  lblAlreadyHaveAccount.Font.Color := clLightBlueClr;
  lblAlreadyHaveAccount.Left := (frmSignUp.Width div 2) - (lblAlreadyHaveAccount.Width div 2);
  lblAlreadyHaveAccount.Font.Style := [fsBold];

  lblCustomType.Font.Color := clLightBlueClr;
  lblCustomType.Font.Style := [fsBold];

  btbtnGeneratePassword.Left := (edtPassword.Left + edtPassword.Width) + 5;
end;

end.

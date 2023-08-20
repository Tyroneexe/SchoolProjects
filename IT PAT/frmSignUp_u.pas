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
    bVlag5 : Boolean;
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

  sPassword := Uppercase(edtUserName.Text[Length(sUserName)]);

  if sEmail.Contains('@')
    then
      begin
        iPosEmail := pos('@', sEmail);
        cEmail := copy(sEmail, iPosEmail - 1, 1)[1]; //Char voor die @ teken
        sPassword := sPassword + cEmail;
        bVlag5 := true;
      end
    else
      begin
        MessageDlg('Not a valid Email', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
        edtEmail.Clear;
        edtEmail.SetFocus;
      end;

  while length(sPassword) < 8
    do
      begin
        iRandom := RandomRange(0, Length(sEmail) - 1); // Random char vir sEmail
      {ons minus een want dit begin by 0...5 chars is dan 0, 1, 2, 3, 4 maar die random range sluit 5 in so dit sal n error gooi}
        insert(sEmail[iRandom + 1], sPassword, Length(sPassword) + 1); // Add 1 want dit begin by 0

        iRandom := RandomRange(0, Length(sUserName) - 1);
        insert(sUserName[iRandom + 1], sPassword, Length(sPassword) + 1);
      end;

  //wat, waarin, waar
  insert(IntToStr(random(10)), sPassword, length(sPassword) + 1);

  // Display the generated password
  ShowMessage('Generated Password: ' + sPassword);

  //Sit die password in die edt
  edtPassword.Text := sPassword;
end;

procedure TfrmSignUp.btbtnResetClick(Sender: TObject);
begin
  edtUserName.Clear;
  edtEmail.Clear;
  edtPassword.Clear;
  lsbCustomerType.ItemIndex := -1;
  rgGender.ItemIndex := -1;


  edtUserName.SetFocus;
end;

procedure TfrmSignUp.btnCreateAccountClick(Sender: TObject);
var

  bVlag1, bVlag2, bVlag3, bVlag4 : boolean;

begin
  //Lees die variables in
  sUsername := edtUserName.Text;
  sEmail := edtEmail.Text;
  sPassword := edtPassword.Text;

  bVlag1 := false;
  bVlag2 := false;
  bVlag3 := false;
  bVlag4 := false;

//Check of die password korrek is
  // 8 karakters lank
  if Length(sPassword) >= 8
    then bVlag1 := true
    else MessageDlg('The Password is too short', TMsgDlgType.mtInformation, [mbOK, mbCancel], 0);

  // Hoof en klein letters
  if (sPassword[1] in ['A'..'Z'])
    then bVlag2 := true
    else Showmessage('Password must begin with a capital letter');

  // Nommers
  if sPassword[Length(sPassword)] in ['1'..'9']
  then bVlag3 := true
  else ShowMessage('Password must end with a number');

  //Check of niks empty is nie
  if (sUserName.IsEmpty) or (sEmail.IsEmpty) or (sPassword.IsEmpty)
  then
    begin
      if (sUserName.IsEmpty)
        then MessageDlg('Please enter a UserName', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
      if (sEmail.IsEmpty)
        then MessageDlg('Please enter an Email', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
      if (sPassword.IsEmpty)
        then MessageDlg('Please enter a Password', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
    end
  else bVlag4 := true;

  if sEmail.Contains('@')
    then bVlag5 := true
    else
    begin
      MessageDlg('Not a valid Email', TMsgDlgType.mtError, [mbOK, mbCancel], 0);
      edtEmail.Clear;
      edtEmail.SetFocus;
    end;


  if bVlag1 and bVlag2 and bVlag3 and bVlag4 and bVlag5
    then
      begin
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

        // Gee die current user i id
        DataModule1.sUserID := DataModule1.ADOTable1.FieldByName('ID').AsString;

        //Close the Database
        DataModule1.ADOTable1.Close;

        ShowMessage('You are registered with Roder...WELCOME!');

        frmRoder.Show;
        frmSignUp.Hide;
      end;


end;

procedure TfrmSignUp.btnLogInClick(Sender: TObject);
begin
  frmLogIn.Show;
  frmSignUp.Hide;
end;

procedure TfrmSignUp.FormCreate(Sender: TObject);
var

  primaryClr, secondaryClr, lightBlueClr : Cardinal; //32 bit integer (can be used to store RGB value)

begin
  // Start of the program

  bVlag5 := false;

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

  pnlCreateAccount.Top := (imgWelcome.Top + imgWelcome.Height) + 20;
  pnlCreateAccount.Left := (frmSignUp.Width div 2) - (pnlCreateAccount.Width div 2);

  pnlUserName.Left := (frmSignUp.Width div 2) - (pnlUserName.Width div 2); // Hierdie formule center die komponente
  pnlEmail.Left := (frmSignUp.Width div 2) - (pnlEmail.Width div 2); // Kan ook pnlEmail.Left := pnlUserName.Left; maar dalk later soek ek die een edit langer en groter;
  pnlPassword.Left := (frmSignUp.Width div 2) - (pnlPassword.Width div 2);

  edtUserName.Left := (frmSignUp.Width div 2) - (edtUserName.Width div 2);
  edtEmail.Left := (frmSignUp.Width div 2) - (edtEmail.Width div 2);
  edtPassword.Left := (frmSignUp.Width div 2) - (edtPassword.Width div 2);

  btnCreateAccount.Left := (frmSignUp.Width div 2) - (btnCreateAccount.Width div 2);

  btnLogIn.Width := btnCreateAccount.Width;
  btnLogIn.Height := btnCreateAccount.Height - 10;
  btnLogIn.Left := btnCreateAccount.Left;

  btbtnReset.Left := (frmSignUp.Width div 2) - (btbtnReset.Width div 2);

  lblAlreadyHaveAccount.Font.Color := lightBlueClr;
  lblAlreadyHaveAccount.Left := (frmSignUp.Width div 2) - (lblAlreadyHaveAccount.Width div 2);
  lblAlreadyHaveAccount.Font.Style := [fsBold];

  lblCustomType.Font.Color := lightBlueClr;
  lblCustomType.Font.Style := [fsBold];

  btbtnGeneratePassword.Left := (edtPassword.Left + edtPassword.Width) + 5;
end;

end.

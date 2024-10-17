unit frmSignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pngimage, jpeg,
  Vcl.StdCtrls, Vcl.ComCtrls, dmData_u, Vcl.Buttons, math, {email} ComObj;

type
  TfrmSignUp = class(TForm)
    imgTopBar: TImage;
    pnlSign: TPanel;
    imgGirl: TImage;
    pnlUp: TPanel;
    edtNaam: TEdit;
    edtVan: TEdit;
    edtEpos: TEdit;
    lblNaam: TLabel;
    lblVan: TLabel;
    lblepos: TLabel;
    lblBirth: TLabel;
    dtpBirth: TDateTimePicker;
    cbbGeslag: TComboBox;
    lblGeslag: TLabel;
    btnSignUp: TButton;
    imgLogo: TImage;
    btnLogIn: TButton;
    lblAlreadyLogIn: TLabel;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btbtnGeneratePassword: TBitBtn;
    chbAdmin: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btbtnGeneratePasswordClick(Sender: TObject);
    procedure btnLogInClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function isEmailValid(semail : string) : Boolean;
    procedure btbtnGeneratePasswordMouseEnter(Sender: TObject);
    procedure btbtnGeneratePasswordMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    sPassword : string;
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses frmHealthHarmony_u, frmLogIn_u, frmSettings_u, frmWelcome_u;

procedure TfrmSignUp.btbtnGeneratePasswordClick(Sender: TObject);
var

  sName, sEmail, sVan : string;
  I, irandom, iemail: Integer;

begin

  semail := edtepos.Text;

  //as email valid is
  if IsEmailValid(semail) then
    begin
      sName := edtnaam.text;
      svan := edtvan.Text;
      irandom := randomrange(10,100);

      spassword := copy(sName, 1, 2) + copy(sVan, 1, 2);

      delete(semail, pos('@', semail), length(sEmail));

      while length(spassword) <> 6 do
        begin
          iemail := randomrange(1, length(sEmail) + 1);
          insert(semail[iemail], spassword, length(sPassword));
        end;

      insert(IntToStr(irandom), spassword, length(sPassword));

      edtPassword.Text := spassword;
    end
      else
        begin
          MessageDlg('Email is not valid', TMsgDlgType.mtError, [mbOK], 0);
          exit;
        end;
end;

procedure TfrmSignUp.btbtnGeneratePasswordMouseEnter(Sender: TObject);
begin
  with btbtnGeneratePassword do
  begin
    Width := Width + 5;
    Height := Height + 5;
  end;
end;

procedure TfrmSignUp.btbtnGeneratePasswordMouseLeave(Sender: TObject);
begin
  with btbtnGeneratePassword do
  begin
    Width := 26;
    Height := 25;
  end;
end;

procedure TfrmSignUp.btnLogInClick(Sender: TObject);
begin
  frmLogIn.Show;
  frmSignUp.Hide;
end;

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
var

  I: Integer;
  sname : string;

  //email
  {Outlook : OLEVariant;
  MailItem : Variant;
  sTo,sSubject,sBody : string;}

begin
  sname := edtNaam.Text;

  for I := 1 to length(sname) do
    begin
      if sname[i] in ['0'..'9']
        then
          begin
            MessageDlg('User name cannot contain any numbers', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
            edtNaam.Clear;
            edtVan.Clear;
            edtEpos.Clear;
            edtPassword.Clear;
            cbbGeslag.Clear;
            edtNaam.SetFocus;
            exit;
          end;

    end;

  //Maak seker velde is nie leeg nie
  if (edtNaam.text <> '') or (edtvan.Text <> '') or (edtepos.Text <> '') or (cbbGeslag.Text <> '')
    then
      begin
        //Check of user bo 18 is of dat datum nie geldig is nie
        if ((yearof(date) - yearof(dtpBirth.date)) >= 18) and ((yearof(date) - yearof(dtpBirth.date) < 120))
          then
            begin

              //skryf user in db
              with dmData do
              begin
                tblUsers.open;
                tblUsers.Edit;
                tblUsers.last;
                tblUsers.insert;

                tblUsers['Naam'] := sname;
                tblUsers['Van'] := edtvan.Text;
                tblUsers['Epos'] := edtepos.Text;
                tblUsers['Geslag'] := cbbGeslag.Text;
                tblUsers['GeboorteDatum'] := dtpBirth.Date;
                tblUsers['Password'] := sPassword;
                tblUsers['isAdmin'] := chbAdmin.Checked;
                tblUsers['TotalSpent'] := 0;
                tblUsers['HasPremium'] := false;
                tblUsers['Notification'] := '';

                tblUsers.Post;
              end;


              {
              //Send welcome Email
              //add ComObj in uses

              //Lees data in
               sTo := edtEpos.Text;
               sSubject := 'Welcome';
               sBody := 'Welcome ' + sname + ' to Health Harmony';

               try
                  //Kry outlook uit RAM
                 Outlook := GetActiveOleObject('Outlook.Application') ;
               except
                  //Anders sit outlook in RAM
                 Outlook := CreateOleObject('Outlook.Application') ;
               end;
                try
                  //Maak dinamiese Variant
                  MailItem := Outlook.CreateItem(0);
                  MailItem.Subject := sSubject;
                  MailItem.Recipients.Add(sTo);
                  MailItem.Body := sBody;
                  MailItem.Send;
                finally
                  //Haal Outlook uit RAM
                  Outlook := Unassigned;
                end;
                }


              ShowMessage('Welcome to Health Harmony, Let`s get Healthy');

              //Gaan na die main form
              frmHealth.Show;
              frmSignUp.Hide;
            end
            else
              begin
                MessageDlg('User must be 18 or above', TMsgDlgType.mtError, [mbOK], 0);
                exit;
              end;

      end
      else
        begin
          MessageDlg('Please fill in all fields', TMsgDlgType.mtError, [mbOK], 0);
          exit;
        end;

end;

procedure TfrmSignUp.Button1Click(Sender: TObject);
begin
  frmHealth.Show;
  frmSignUp.Hide;
end;

procedure TfrmSignUp.Button2Click(Sender: TObject);
begin
  frmSignUp.Hide;
  frmSettings.Show;
end;

procedure TfrmSignUp.FormActivate(Sender: TObject);
begin
  lblAlreadyLogIn.font.Color := frmHealth.clPrimary;
end;

procedure TfrmSignUp.FormCreate(Sender: TObject);
begin
  sPassword := '';

  //Load Images
  imgTopBar.Picture.LoadFromFile('images/appBar.png');
  imgTopBar.Stretch := True;

  imgGirl.Picture.LoadFromFile('images/girlTennis.png');
  imgGirl.Stretch := True;

  imgLogo.Picture.LoadFromFile('images/logo.png');
  imgLogo.Stretch := True;

  //Load Captions
  pnlSign.Caption := 'Sign';
  pnlUp.Caption := 'Up';

  //Size and Postition
  lblNaam.Left := 35;
  lblVan.Left := 35;
  lblepos.Left := 35;
  lblBirth.Left := 35;
  lblGeslag.Left := 35;
  lblPassword.Left := 35;

  edtNaam.Left := 35;
  edtVan.Left := 35;
  edtEpos.Left := 35;
  cbbGeslag.Left := 35;
  dtpBirth.Left := 35;
  edtPassword.Left := 35;

  edtNaam.Width := 150;
  edtVan.Width := 150;
  edtEpos.Width := 150;
  cbbGeslag.Width := 150;
  dtpBirth.Width := 150;
  edtPassword.Width := 150;

  btbtnGeneratePassword.Left := edtPassword.Left + edtPassword.Width + 2;

end;

function TfrmSignUp.isEmailValid(semail : string): Boolean;
begin

  if (pos('@', semail) <> 0) and (pos('.com', semail) <> 0) then
    begin
      result := true;
    end
    else
      result := false;

end;

end.

unit frmSignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pngimage, jpeg,
  Vcl.StdCtrls, Vcl.ComCtrls, dmData_u, Vcl.Buttons, math;

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
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btbtnGeneratePasswordClick(Sender: TObject);
    procedure IsEmailValid(Sender: TObject);
    procedure btnLogInClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    bEmailValid : Boolean;
    sPassword : string;
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses frmHealthHarmony_u, frmLogIn_u;

procedure TfrmSignUp.btbtnGeneratePasswordClick(Sender: TObject);
var

  sName, sEmail, sVan : string;
  I, irandom, iemail: Integer;

begin
  //Check of die email valid is
  IsEmailValid(nil);

  //as email is
  if bEmailValid then
    begin
      sName := edtnaam.text;
      semail := edtepos.Text;
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

procedure TfrmSignUp.btnLogInClick(Sender: TObject);
begin
  frmLogIn.Show;
  frmSignUp.Hide;
end;

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
var

  cGeslag : char;

begin

  //Maak seker velde is nie leeg nie
  if (edtNaam.text <> '') or (edtvan.Text <> '') or (edtepos.Text <> '') or (cbbGeslag.Text <> '')
    then
      begin
        //Check of user bo 18 is
        if (yearof(date) - yearof(dtpBirth.date)) >= 18
          then
            begin
              cGeslag := upcase(cbbGeslag.Text[1]);

              //skryf user in db
              with dmData do
              begin
                tblUsers.open;
                tblUsers.Edit;
                tblUsers.last;
                tblUsers.insert;

                tblUsers['Naam'] := edtnaam.Text;
                tblUsers['Van'] := edtvan.Text;
                tblUsers['Epos'] := edtepos.Text;
                tblUsers['Geslag'] := cGeslag;
                tblUsers['GeboorteDatum'] := dtpBirth.Date;
                tblUsers['Password'] := sPassword;

                tblUsers.Post;
              end;


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

procedure TfrmSignUp.FormCreate(Sender: TObject);
begin
  sPassword := '';
  bEmailValid := false;

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

procedure TfrmSignUp.IsEmailValid(Sender: TObject);
var

  semail : string;

begin
  semail := edtepos.text;

  if pos('@', semail) <> 0 then
    begin
      bEmailValid := true;
    end;

end;

end.

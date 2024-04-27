unit frmLogIn_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dmData_u;

type
  TfrmLogIn = class(TForm)
    imgTopBar: TImage;
    imgGirl: TImage;
    lblNaam: TLabel;
    lblepos: TLabel;
    imgLogo: TImage;
    lblPassword: TLabel;
    pnlLog: TPanel;
    pnlIn: TPanel;
    edtNaam: TEdit;
    edtEpos: TEdit;
    btnLogIn: TButton;
    edtPassword: TEdit;
    pnlOr: TPanel;
    procedure FormCreate(Sender: TObject);
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

uses frmHealthHarmony_u;

procedure TfrmLogIn.btnLogInClick(Sender: TObject);
var

  sname, semail, spassword : string;
  bfound : Boolean;

begin

  sname := edtNaam.Text;
  semail := edtepos.Text;
  spassword := edtPassword.Text;
  bfound := false;


  if (sname <> '') or (semail <> '') and (spassword <> '')
    then
      begin
        with dmData do
          begin
            tblUsers.Open;
            tblUsers.First;
            while (not tblUsers.eof) and (bfound = false) do
              begin
                if (sname = tblUsers['Naam']) and (spassword = tblUsers['Password'])
                  then
                    begin
                      bfound := true;
                      sUserID := tblUsers['GebruikerID'];
                      showmessage('Successfully Logged In');
                      frmHealth.Show;
                      frmLogIn.Hide;
                    end;

                if (semail = tblUsers['Epos']) and (spassword = tblUsers['Password'])
                  then
                    begin
                      bfound := true;
                      sUserID := tblUsers['GebruikerID'];
                      showmessage('Successfully Logged In');
                      frmHealth.Show;
                      frmLogIn.Hide;
                    end;

                tblUsers.Next;
              end;

          end;
      end
      else
        begin
          MessageDlg('Please fill in all fields', TMsgDlgType.mtError , [mbOk], 0);
        end;
end;

procedure TfrmLogIn.FormCreate(Sender: TObject);
begin
  //Load Images
  imgTopBar.Picture.LoadFromFile('images/appBar.png');
  imgTopBar.Stretch := True;

  imgGirl.Picture.LoadFromFile('images/girlTennis.png');
  imgGirl.Stretch := True;

  imgLogo.Picture.LoadFromFile('images/logo.png');
  imgLogo.Stretch := True;


  //Size and Postition
  lblNaam.Left := 35;
  lblepos.Left := 35;
  lblPassword.Left := 35;
  btnLogIn.Left := 35;
  pnlOr.Left := 35;

  edtNaam.Left := 35;
  edtEpos.Left := 35;
  edtPassword.Left := 35;

  edtNaam.Width := 150;
  edtEpos.Width := 150;
  edtPassword.Width := 150;
end;

end.

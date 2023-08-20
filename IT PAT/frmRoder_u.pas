unit frmRoder_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u, jpeg, pngimage,
  Vcl.ExtCtrls;

type
  TfrmRoder = class(TForm)
    PageControl: TPageControl;
    tbsBuy: TTabSheet;
    tbsSell: TTabSheet;
    tbsCheckout: TTabSheet;
    tbsSettings: TTabSheet;
    pnlWelcome: TPanel;
    imgLogo: TImage;
    pnlOder: TPanel;
    lblChangeTheme: TLabel;
    lblLogOut: TLabel;
    lblChangeName: TLabel;
    btnLogOut: TButton;
    btnChangeUserName: TButton;
    rgChangeTheme: TRadioGroup;
    imgLogoCheckout: TImage;
    pnlOderCheckout: TPanel;
    pnlCheckout: TPanel;
    lblTotalAllTime: TLabel;
    lblTotalAllTimeMoney: TLabel;
    lblAmountInCheckout: TLabel;
    lblAmountInCheckoutMoney: TLabel;
    lblRoderBTW: TLabel;
    lblRoderBTWMoney: TLabel;
    lblTotalAmountInCheckout: TLabel;
    lblTotalAmountInCheckoutMoney: TLabel;
    imgLogoSell: TImage;
    pnlOderSell: TPanel;
    lblUserName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure btnChangeUserNameClick(Sender: TObject);
    procedure rgChangeThemeClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
  private
    { Private declarations }
    rAmountInCheckout, rRoderTakes, rTotalAmountInCheckout : real;
  public
    { Public declarations }
  end;

  const
  rBTW = 15/100;

var
  frmRoder: TfrmRoder;

implementation

{$R *.dfm}

uses frmSignUp_u;

procedure TfrmRoder.btnChangeUserNameClick(Sender: TObject);
var

  sNewUserName : string;

begin
  //Change User Name

  //Wat moet die nuwe username wees
  sNewUserName := InputBox('New UserName','What should your new UserName be?','');

  //Open the db
  DataModule1.ADOTable1.Open;

  //Gaan na die eerste lyn
  DataModule1.ADOTable1.First;

  //Gaan totdat dit die laaste een in die db vind
  while not DataModule1.ADOTable1.Eof do
  begin
    //as die ID = db se id
    if DataModule1.ADOTable1.FieldByName('ID').AsString = DataModule1.sUserID then
    begin
      //Se die db dat ek iets wil verander
      DataModule1.ADOTable1.Edit;

      //Verander die userName
      DataModule1.ADOTable1.FieldByName('UserName').AsString := sNewUserName;

      // Post the changes to the database
      DataModule1.ADOTable1.Post;

      ShowMessage('Successfuly changed the UserName to ' + DataModule1.ADOTable1.FieldByName('UserName').AsString);

      // Breuk die loop as daar n match is
      Break;
    end;

    // Gaan na die volgnde lyn
    DataModule1.ADOTable1.Next;
  end;

  //Maak db toe
  DataModule1.ADOTable1.Close;
end;

procedure TfrmRoder.btnLogOutClick(Sender: TObject);
begin
  //Go back to sign up page
  frmSignUp.Show;
  frmRoder.Hide;
end;

procedure TfrmRoder.FormCreate(Sender: TObject);
var

  primaryClr, secondaryClr, lightBlueClr : Cardinal;

begin
  //Start of the program

  primaryClr := RGB(11, 49, 140);
  secondaryClr := RGB(216, 224, 242);
  lightBlueClr := RGB(79, 149, 255);

  rgChangeTheme.ItemIndex := 0; //Begin die program op light mode

  //Load Images
  imgLogo.Picture.LoadFromFile('Logo.png');
  imgLogoCheckout.Picture.LoadFromFile('Logo.png');

  //Assign Positions

    //Buy Page
    pnlWelcome.Left := 20;
    pnlWelcome.Top := 20;
    lblUserName.Left := (pnlWelcome.Left + pnlWelcome.Width) + 10;
    lblUserName.Top := 12;

    //Settings Page
    pnlOder.Left := (frmRoder.Width div 2) - ((pnlOder.Width div 2) - 40);
    imgLogo.Left := (pnlOder.Left - pnlOder.Width) + 30;

    lblChangeTheme.Left := (frmRoder.Width div 2) - (lblChangeTheme.Width div 2); //Center die komponent
    lblLogOut.Left := (frmRoder.Width div 2) - (lblLogOut.Width div 2);
    lblChangeName.Left := (frmRoder.Width div 2) - (lblChangeName.Width div 2);

    btnLogOut.Left := (frmRoder.Width div 2) - (btnLogOut.Width div 2);
    btnChangeUserName.Left := (frmRoder.Width div 2) - (btnChangeUserName.Width div 2);
    rgChangeTheme.Left := (frmRoder.Width div 2) - (rgChangeTheme.Width div 2);

    //Checkout Page
    lblTotalAllTime.Left := (frmRoder.Width div 2) - (lblTotalAllTime.Width div 2) - (lblTotalAllTimeMoney.Width div 2);
    lblAmountInCheckout.Left := 20;
    lblRoderBTW.Left := 20;
    lblTotalAmountInCheckout.Left := 20;

    lblTotalAllTimeMoney.Left := (lblTotalAllTime.Left + lblTotalAllTime.Width) + 5;
    lblAmountInCheckoutMoney.Left := (lblAmountInCheckout.Left + lblAmountInCheckout.Width) + 5;
    lblRoderBTWMoney.Left := (lblRoderBTW.Left + lblRoderBTW.Width) + 5;
    lblTotalAmountInCheckoutMoney.Left := (lblTotalAmountInCheckout.Left + lblTotalAmountInCheckout.Width) + 5;

    //Sell Page
    pnlOderSell.Left := (frmRoder.Width div 2) - ((pnlOder.Width div 2) - 40);
    imgLogoSell.Left := (pnlOder.Left - pnlOder.Width) + 30;

  //Assign Colors
  pnlWelcome.Font.Color := primaryClr;
  lblUserName.Font.Color := primaryClr;
  pnlOder.Font.Color := primaryClr;

  lblChangeTheme.Font.Color := lightBlueClr;
  lblLogOut.Font.Color := lightBlueClr;
  lblChangeName.Font.Color := lightBlueClr;

  lblTotalAllTime.Font.Color := lightBlueClr;
  lblTotalAllTimeMoney.Font.Color := lightBlueClr;

  pnlOderCheckout.Font.Color := primaryClr;
  pnlCheckout.Font.Color := primaryClr;

end;

procedure TfrmRoder.PageControlChange(Sender: TObject);
begin
  //Open the db
  DataModule1.ADOTable1.Open;

  //Gaan na die eerste lyn
  DataModule1.ADOTable1.First;

  //Gaan totdat dit die laaste een in die db vind
  while not DataModule1.ADOTable1.Eof do
  begin
    //as die ID = db se id
    if DataModule1.ADOTable1.FieldByName('ID').AsString = DataModule1.sUserID then
    begin
      //Dan is die UserName die current user se db
      lblUserName.Caption := DataModule1.ADOTable1.FieldByName('UserName').AsString;
      // Exit die loop as daar n match is
      Break;
    end;

    // Gaan na die volgnde lyn
    DataModule1.ADOTable1.Next;
  end;

  //Maak db toe
  DataModule1.ADOTable1.Close;
end;

procedure TfrmRoder.rgChangeThemeClick(Sender: TObject);
begin
  //Change the color of the form

  if rgChangeTheme.ItemIndex = 1
    then
      begin
        frmRoder.Color := clGray
      end
    else
      begin
        frmRoder.Color := clBtnFace;
      end;

end;

end.

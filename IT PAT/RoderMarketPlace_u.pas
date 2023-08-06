unit RoderMarketPlace_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Math,
  Vcl.StdCtrls, Vcl.OleCtnrs, Vcl.Imaging.pngimage, Vcl.Menus; //Import math for calculations

type
  TfrmRoder = class(TForm)
    PageControl: TPageControl;
    tbsBuy: TTabSheet;
    tbsSell: TTabSheet;
    pnlWelcome: TPanel;
    pnlSell: TPanel;
    edtName: TEdit;
    edtPrice: TEdit;
    edtPickupLocation: TEdit;
    pnlName: TPanel;
    pnlPrice: TPanel;
    pnlLocation: TPanel;
    tbsCheckOut: TTabSheet;
    pnlCheckOut: TPanel;
    pnlOfAllTime: TPanel;
    pnlRoderCut: TPanel;
    pnlCheckOutPrice: TPanel;
    pnlFinalCheckoutPrice: TPanel;
    btnTheme: TButton;
    DarkModePopup: TPopupMenu;
    LigthMode1: TMenuItem;
    DarkMode1: TMenuItem;
    pnlBuy: TPanel;
    imgWelcomeIcon: TImage;
    pnlWelcome2: TPanel;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnThemeClick(Sender: TObject);
    procedure DarkMode1Click(Sender: TObject);
    procedure LigthMode1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    //Global Variables
    rOfAllTime, rCheckout, rRoderCut, rFinalCheckOutPrice : real;
  public
    { Public declarations }
  end;

var
  frmRoder: TfrmRoder;

implementation

{$R *.dfm}

uses frmSignUp_u;

procedure TfrmRoder.btnThemeClick(Sender: TObject);
begin
  DarkModePopup.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmRoder.Button1Click(Sender: TObject);
begin
  frmSignUp.Show;
  frmRoder.Hide;
end;

procedure TfrmRoder.DarkMode1Click(Sender: TObject);
begin
  // Switch To Dark Mode
  frmRoder.Color := rgb(169, 169, 169);
  //frmRoder.Color := rgb(105, 105, 105);

end;

procedure TfrmRoder.FormActivate(Sender: TObject);
var

  primaryClr, secondaryClr, lightBlueClr : Cardinal; // Cardinal = unsigned 32-bit integer

begin
  // Start of the application

  //check if user has an account

  frmRoder.Show;
  frmSignUp.Hide;

  primaryClr := RGB(11, 49, 140);
  secondaryClr := RGB(216, 224, 242);
  lightBlueClr := RGB(79, 149, 255);

  // Assign Position to Components
  pnlCheckOut.Left := PageControl.Width div 2 - pnlCheckOut.Width div 2;
  pnlWelcome.Left := 30;
  pnlBuy.Left := 30;
  pnlBuy.Top := (pnlWelcome.Top + pnlWelcome.Height) - 10;
  pnlSell.Left := PageControl.Width div 2 - pnlSell.Width div 2;

  imgWelcomeIcon.Left := (pnlWelcome.Left + pnlWelcome.Width);
  pnlWelcome2.Left := (imgWelcomeIcon.Left + imgWelcomeIcon.Width) - 42;


  pnlName.Top := (pnlSell.Top + pnlSell.Height) + 20; //Bottom + 20
  pnlName.Left := 22;
  edtName.Top := (pnlName.Top + pnlName.Height) + 5;
  edtName.Left := 20;

  pnlPrice.Top := (edtName.Top + edtName.Height) + 20;
  pnlPrice.Left := 12;
  edtPrice.Top := (pnlPrice.Top + pnlPrice.Height) + 5;
  edtPrice.Left := 20;

  pnlLocation.Top := (edtPrice.Top + edtPrice.Height) + 20;
  pnlLocation.Left := 22;
  edtPickupLocation.Top := (pnlLocation.Top + pnlLocation.Height) + 5;
  edtPickupLocation.Left := 20;

  pnlCheckOutPrice.Left := 100;
  pnlRoderCut.Left := 100;
  pnlFinalCheckoutPrice.Left := 100;

  // Assign Width and Height to Components

    // Sell Page
  edtName.Width := 300;
  edtName.Height := 40;

  edtPrice.Width := 300;
  edtPrice.Height := 50;

  edtPickupLocation.Width := 300;
  edtPickupLocation.Height := 50;

    // Check Out Page
  pnlOfAllTime.Width := 500;
  pnlOfAllTime.Height := 50;
  pnlOfAllTime.Top := (pnlCheckOut.Top + pnlCheckOut.Height) + 10;
  pnlOfAllTime.Left := PageControl.Width div 2 - pnlOfAllTime.Width div 2;

  pnlCheckOutPrice.Width := 500;
  pnlCheckOutPrice.Height := 50;

  pnlRoderCut.Width := 500;
  pnlRoderCut.Height := 50;

  pnlFinalCheckoutPrice.Width := 500;
  pnlFinalCheckoutPrice.Height := 50;

  // Assign Colors to Components
  pnlWelcome.Font.Color := primaryClr;
  pnlWelcome2.Font.Color := primaryClr;
  pnlSell.Font.Color := primaryClr;
  pnlCheckOut.Font.Color := primaryClr;

  edtName.Color := secondaryClr;
  edtPrice.Color := secondaryClr;
  edtPickupLocation.Color := secondaryClr;

  pnlName.Font.Color := primaryClr;
  pnlPrice.Font.Color := primaryClr;
  pnlLocation.Font.Color := primaryClr;

  pnlOfAllTime.Font.Color := lightBlueClr;
  pnlBuy.Font.Color := lightBlueClr;

  // Init Components
  pnlOfAllTime.Caption := 'Total Amount Ever Spent : ' + FloatToStrF(rOfAllTime, ffCurrency, 8, 2);
  pnlCheckOutPrice.Caption := 'Amount Ready to be Checked Out : ' + FloatToStrF(rCheckout, ffCurrency, 8, 2);
  pnlRoderCut.Caption := 'The Amount Roder Takes : ' + FloatToStrF(rRoderCut, ffCurrency, 8, 2);
  pnlFinalCheckoutPrice.Caption := 'Final Check Out Price : ' + FloatToStrF(rFinalCheckOutPrice, ffCurrency, 8, 2);


end;

procedure TfrmRoder.LigthMode1Click(Sender: TObject);
begin
  // Switch to Light Mode
  frmRoder.Color := clWhite;
end;

end.


// Connect To Database
// Log In User
// Create Another frm
// Able to Add item
// Check if item is bike or part
// Tabbies in sell page so that the price is even in a column
// Hints op die buttons
// Validate wat die user doen
// Retry (Clear the Buttons)

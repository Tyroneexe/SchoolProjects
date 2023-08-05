unit RoderMarketPlace_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Math,
  Vcl.StdCtrls, Vcl.OleCtnrs; //Import math for calculations

type
  TfrmRoder = class(TForm)
    PageControl: TPageControl;
    tbsBuy: TTabSheet;
    tbsSell: TTabSheet;
    pnlBuy: TPanel;
    pnlSell: TPanel;
    edtName: TEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    //Global Variables
  public
    { Public declarations }
  end;

var
  frmRoder: TfrmRoder;

implementation

{$R *.dfm}

procedure TfrmRoder.FormActivate(Sender: TObject);
begin
  // Start of the application

  // Assign Position to Components
  pnlBuy.Left := PageControl.Width div 2 - pnlBuy.Width div 2;

  edtName.Top := (pnlSell.Top + pnlSell.Height) + 20; //Bottom + 20
  edtName.Left := 20;

  // Assign Width and Height to Components
  edtName.Width := 300;
  edtName.Height := 40;

  // Assign Colors to Components
  edtName.Color := RGB(216, 224, 242);
end;

end.


// Primary Color RGB(49, 80, 153)
// Secondary Color RGB(216, 224, 242)
// Ligth Mode Background Color white or clBtnFace
// Dark Mode Background Color grey or dark grey

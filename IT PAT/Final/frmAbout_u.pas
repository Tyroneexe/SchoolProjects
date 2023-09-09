unit frmAbout_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, pngimage, Vcl.StdCtrls, Vcl.ComCtrls, dmData_u;

  { Import
  pngimage vir die images
  import dmData_u vir die database
  }

type
  TfrmAbout = class(TForm)
    imgBackToRoder: TImage;
    tmrTimer: TTimer;
    imgLogo: TImage;
    pnlOder: TPanel;
    redtAboutRoder: TRichEdit;
    btnViewStats: TButton;
    lblUsers: TLabel;
    lblProducts: TLabel;
    pnlUserNumber: TPanel;
    pnlProductsNumber: TPanel;
    shpUsers: TShape;
    shpProducts: TShape;
    procedure FormCreate(Sender: TObject);
    procedure imgBackToRoderClick(Sender: TObject);
    procedure imgBackToRoderMouseEnter(Sender: TObject);
    procedure imgBackToRoderMouseLeave(Sender: TObject);
    procedure tmrTimerTimer(Sender: TObject);
    procedure btnViewStatsClick(Sender: TObject);
  private
    { Private declarations }
    iImgBackWidth, iImgBackHeight : integer;
    clPrimaryClr, clLightBlueClr : Cardinal;
    bStatsAbout : Boolean;
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

uses frmRoder_u;

procedure TfrmAbout.btnViewStatsClick(Sender: TObject);
var

  iAantalUsers, iAantalProducts : integer;

begin

  if bStatsAbout //Die user will die stats sien
    then
      begin
        //View Roder stats

        //initialize variables
        iAantalUsers := 0;
        iAantalProducts := 0;

        //Verwyder dit sodat daar plek is vir die stats
        redtAboutRoder.Visible := False;

        //en maak die stats visible
        lblUsers.Visible := True;
        lblProducts.Visible := True;

        pnlUserNumber.Visible := True;
        pnlProductsNumber.Visible := True;

        shpUsers.Visible := True;
        shpProducts.Visible := True;

        //skyf die components in die plek van die rich edit
        lblUsers.Top := 200;
        lblProducts.Top := 300;
        lblUsers.Left := 20;
        lblProducts.Left := 20;

        pnlProductsNumber.Top := lblProducts.Top - 12;
        pnlProductsNumber.Left := lblProducts.Left + lblProducts.Width + 10;

        pnlUserNumber.Top := lblUsers.Top - 12;
        pnlUserNumber.Left := pnlProductsNumber.Left;

        shpUsers.Top := pnlUserNumber.Top;
        shpUsers.Left := pnlUserNumber.Left + pnlUserNumber.Width + 10;

        shpProducts.Top := pnlProductsNumber.Top;
        shpProducts.Left :=  pnlProductsNumber.Left + pnlProductsNumber.Width + 10;

        shpUsers.Width := 10;
        shpProducts.Width := 10;

        //Gee die shapes color
        shpUsers.Brush.Color := clPrimaryClr;
        shpProducts.Brush.Color := clLightBlueClr;


        //Die panel nommer moet die hoeveelheid wees wat in die database is

        //Users
        //Maak die database oop
        dmData.ADOTableUsers.Open;

        //Gaan na die eerste lyn toe
        dmData.ADOTableUsers.First;

        //Gaan deur die db terwyl dit nie die einde van die db is nie
        while not dmData.ADOTableUsers.Eof do
          begin
            //Die database gaan deur die database en tel hoeveel users is daar
            inc(iAantalUsers);

            //Gaan na die volgende lyn totday dit nie meer kan nie
            dmData.ADOTableUsers.Next;

          end;

        //Display die hoeveel users in die db
        pnlUserNumber.Caption := IntToStr(iAantalUsers);

        //Maak die database toe
        dmData.ADOTableUsers.Close;



        //Products
        //Maak die database oop
        dmData.ADOTableProducts.Open;

        //Gaan na die eerste lyn toe
        dmData.ADOTableProducts.First;

        //Gaan deur die db terwyl dit nie die einde van die db is nie
        while not dmData.ADOTableProducts.Eof do
          begin
            //Die database gaan deur die database en tel hoeveel users is daar
            inc(iAantalProducts);

            //Gaan na die volgende lyn totday dit nie meer kan nie
            dmData.ADOTableProducts.Next;

          end;

        //Display die hoeveel products in die db
        pnlProductsNumber.Caption := IntToStr(iAantalProducts);

        //Maak die database toe
        dmData.ADOTableProducts.Close;



        //Maak die shapes groter
        shpUsers.Width := iAantalUsers * 10;
        shpProducts.Width := iAantalProducts * 10;

        //Gee die user die opsie om weer About te sien
        btnViewStats.Caption := 'About Roder';
      end
        else //User will weer About sien
          begin
            //Maak die About weer visible
            redtAboutRoder.Visible := True;

            //Die stats moet nie sigbaar wees nie
            lblUsers.Visible := False;
            lblProducts.Visible := False;

            pnlUserNumber.Visible := False;
            pnlProductsNumber.Visible := False;

            shpUsers.Visible := False;
            shpProducts.Visible := False;

            //Maak die btn se caption weer sodat die stats gesien kan word
            btnViewStats.Caption := 'View Roder Stats';
          end;

  //True na false OF False na true;
  bStatsAbout := not bStatsAbout;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  //Start of the program

  //initialze components and variables
  iImgBackWidth := imgBackToRoder.Width;
  iImgBackHeight := imgBackToRoder.Height;

  clPrimaryClr := RGB(11, 49, 140);
  clLightBlueClr := RGB(79, 149, 255);

  bStatsAbout := True;

  //Load images
  imgBackToRoder.Picture.LoadFromFile('BackIcon.png');
  imgLogo.Picture.LoadFromFile('Logo.png');

  //Assign Positions
  pnlOder.Left := (frmAbout.Width div 2) - ((pnlOder.Width div 2) - 40);
  imgLogo.Left := (pnlOder.Left - pnlOder.Width) + 30;

  //Assign Colors
  pnlOder.Font.Color := clPrimaryClr;

  //Info about roder in the rich edit
  redtAboutRoder.Clear;

  //Format die rich edit
  redtAboutRoder.ReadOnly := True;
  redtAboutRoder.Font.Name := 'Roboto';
  redtAboutRoder.Font.Size := 14;
  redtAboutRoder.SelAttributes.Name := 'Ravie';
  redtAboutRoder.SelAttributes.Size := 22;
  redtAboutRoder.SelAttributes.Bold := True;
  redtAboutRoder.SelAttributes.Underline := True;
  redtAboutRoder.SelAttributes.Color := clPrimaryClr;
  redtAboutRoder.Paragraph.Alignment := taCenter;


  redtAboutRoder.Lines.Add('About Roder');
  redtAboutRoder.Lines.Add('');

  redtAboutRoder.Paragraph.Alignment := taLeftJustify;


  redtAboutRoder.lines.Add('At Roder Marketplace, we`re on a mission to empower motorcycle enthusiasts worldwide by providing a secure and convenient platform to buy and sell used motorbikes and motorcycle parts.');
  redtAboutRoder.Lines.Add('');
  redtAboutRoder.Lines.Add('We believe in promoting affordability, sustainability, and community engagement within the motorcycling community.');

  //Die stats moet nie sigbaar wees in die begin nie
  lblUsers.Visible := False;
  lblProducts.Visible := False;

  pnlUserNumber.Visible := False;
  pnlProductsNumber.Visible := False;

  shpUsers.Visible := False;
  shpProducts.Visible := False;


end;

procedure TfrmAbout.imgBackToRoderClick(Sender: TObject);
begin
  //Go back to Roder frm
  frmRoder.Show;
  frmAbout.Hide;
end;

procedure TfrmAbout.imgBackToRoderMouseEnter(Sender: TObject);
begin
  tmrTimer.Enabled := True;

  // Start the timer to gradually increase the size
  tmrTimer.Tag := 1;

end;

procedure TfrmAbout.imgBackToRoderMouseLeave(Sender: TObject);
begin

  //reset die image size want jy leave die button
  imgBackToRoder.Height := 30;
  imgBackToRoder.Width := 30;
  imgBackToRoder.Stretch := True;

  //stop die animation as ek nie op die img is nie
  tmrTimer.Tag := 0;

end;

procedure TfrmAbout.tmrTimerTimer(Sender: TObject);
begin
  //elke 10ms (timer se interval) doen hy hierdie code

  // Maak die image elke keer groter

  if tmrTimer.Tag = 1
    then
      begin

        //as die width kleiner is as max width dan increase anders decrease
         if imgBackToRoder.Width < 40
          then
            begin
              imgBackToRoder.Width := imgBackToRoder.Width + 1;
              imgBackToRoder.Height := imgBackToRoder.Height + 1;
            end
              else
                begin
                  imgBackToRoder.Width := imgBackToRoder.Width - 1;
                  imgBackToRoder.Height := imgBackToRoder.Height - 1;
                end;

      // Stop the timer as die image die target grootte is
        if (imgBackToRoder.Width = 40) and (imgBackToRoder.Height = 40)
          or
          (imgBackToRoder.Width = iImgBackWidth) and (imgBackToRoder.Height = iImgBackHeight)
            then
              //stop die timer
              tmrTimer.Enabled := False;
      end;
end;

end.

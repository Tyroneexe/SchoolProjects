unit frmHealthHarmony_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u;

type
  TfrmHealth = class(TForm)
    pnlHealthHarmony: TPanel;
    imgLogo: TImage;
    pcPages: TPageControl;
    tsWorkout: TTabSheet;
    tsDiet: TTabSheet;
    btnUpgrade: TButton;
    lblUpgrade: TLabel;
    lblPro: TLabel;
    lblMoreFeatures: TLabel;
    imgLock: TImage;
    lblWorkout: TLabel;
    lblDiet: TLabel;
    lblFatLoss: TLabel;
    lblTracking: TLabel;
    lblRecipes: TLabel;
    lblStatistic: TLabel;
    tsFatLoss: TTabSheet;
    tsTracking: TTabSheet;
    shRecipes: TTabSheet;
    tsStatistic: TTabSheet;
    procedure FormCreate(Sender: TObject);
    //My functions
    procedure pcPagesChange(Sender: TObject);
    procedure CreateUserInfoContainer(Sender: TObject);
    procedure GetUserDetails(Sender: TObject);
    //
    procedure lblWorkoutClick(Sender: TObject);
    procedure ChangeNavBarColor(Sender: TObject);
    procedure lblDietClick(Sender: TObject);
    procedure lblFatLossClick(Sender: TObject);
    procedure lblTrackingClick(Sender: TObject);
    procedure lblRecipesClick(Sender: TObject);
    procedure lblStatisticClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    clPrimary, clLightPurple : TColor;
    sname, svan : string;
  public
    { Public declarations }
  end;

var
  frmHealth: TfrmHealth;

implementation

{$R *.dfm}

procedure TfrmHealth.FormActivate(Sender: TObject);
begin
  GetUserDetails(nil);
  CreateUserInfoContainer(nil);
end;

procedure TfrmHealth.FormCreate(Sender: TObject);
begin
  //Initiliaze vars
  clPrimary := rgb(22,67,255); //1657FF
  clLightPurple := rgb(212, 211, 255); //d4d3ff
  pcPages.TabIndex := 0;

  //Load Images and Colors
  imgLogo.Picture.LoadFromFile('images/logo.png');
  imgLogo.Stretch := true;

  imgLock.Picture.LoadFromFile('images/lock.png');
  imgLock.Stretch := true;

  lblPro.Font.Color := clPrimary;
  btnUpgrade.Brush.Color := clPrimary;

  lblWorkout.Font.Color := clPrimary;
  lblDiet.Font.Color := clSilver;
  lblFatloss.Font.Color := clSilver;
  lblTracking.Font.Color := clSilver;
  lblRecipes.Font.Color := clSilver;
  lblStatistic.Font.Color := clSilver;


  //Size and Position
  lblWorkout.Left := 50;
  lblDiet.Left := 50;
  lblFatloss.Left := 50;
  lblTracking.Left := 50;
  lblRecipes.Left := 50;
  lblStatistic.Left := 50;

  lblWorkout.Top := 80;
  lblDiet.Top := lblWorkout.Top + lblWorkout.Height + 20;
  lblFatloss.Top := lblDiet.Top + lblDiet.Height + 20;
  lblTracking.Top := lblFatloss.Top + lblFatloss.Height + 20;
  lblRecipes.Top := lblTracking.Top + lblTracking.Height + 20;
  lblStatistic.Top := lblRecipes.Top + lblRecipes.Height + 20;
end;

procedure TfrmHealth.lblDietClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  lblDiet.Font.Color := clPrimary;
  pcPages.TabIndex := 1;
end;

procedure TfrmHealth.lblFatLossClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  lblFatLoss.Font.Color := clPrimary;
  pcPages.TabIndex := 2;
end;

procedure TfrmHealth.lblRecipesClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  lblRecipes.Font.Color := clPrimary;
  pcPages.TabIndex := 4;
end;

procedure TfrmHealth.lblStatisticClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  lblStatistic.Font.Color := clPrimary;
  pcPages.TabIndex := 5;
end;

procedure TfrmHealth.lblTrackingClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  lblTracking.Font.Color := clPrimary;
  pcPages.TabIndex := 3;
end;

procedure TfrmHealth.lblWorkoutClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  lblWorkout.Font.Color := clPrimary;
  pcPages.TabIndex := 0;
end;

procedure TfrmHealth.pcPagesChange(Sender: TObject);
var

  iPageController : integer;

begin

  ipagecontroller := pcpages.TabIndex;

  ChangeNavBarColor(nil);

  case ipagecontroller of
   0 : lblWorkout.Font.Color := clPrimary;
   1 : lblDiet.Font.Color := clprimary;
   2 : lblFatloss.Font.Color := clprimary;
   3 : lblTracking.Font.Color := clprimary;
   4 : lblRecipes.Font.Color := clprimary;
   5 : lblStatistic.Font.Color := clprimary;
  end;

end;

procedure TfrmHealth.ChangeNavBarColor(Sender: TObject);
begin
  lblWorkout.Font.Color := clSilver;
  lblDiet.Font.Color := clSilver;
  lblFatloss.Font.Color := clSilver;
  lblTracking.Font.Color := clSilver;
  lblRecipes.Font.Color := clSilver;
  lblStatistic.Font.Color := clSilver;
end;

procedure TfrmHealth.CreateUserInfoContainer(Sender: TObject);
var

  I : integer;
  bfound : Boolean;
  grbuserInfo : TGroupBox;
  imgTopBar : TImage;
  lblUserName : Tlabel;


begin

  for i := 0 to pcPages.pagecount - 1 do
  begin
    //Create GroupBox
    grbuserInfo := TGroupBox.Create(pcPages.Pages[i]);
    grbuserInfo.Parent := pcPages.Pages[i];
    grbuserInfo.Caption := '';
    grbuserInfo.Height := 500;
    grbuserInfo.Width := 300;
    grbuserInfo.Top := 120;
    grbuserInfo.Left := 120;

    //Create Image
    imgTopBar := TImage.Create(pcPages.Pages[i]);
    imgTopbar.Parent := grbuserinfo;
    imgTopbar.Left := 0;
    imgtopbar.Top := 0;
    imgtopbar.Height := 130;
    imgtopbar.Width := grbuserinfo.Width;
    imgTopbar.Picture.LoadFromFile('images/appBar.png');
    imgTopbar.Stretch := true;

    //Create label for name
    lblusername := TLabel.Create(pcPages.Pages[i]);
    lblusername.parent := grbuserInfo;
    lblusername.Left := 10;
    lblusername.Top := 5;
    lblUsername.Font.Name := 'Roboto';
    lblUsername.Font.Color := clWhite;
    lblusername.Font.Size := 28;
    lblUsername.Caption := sname;
  end;
end;

procedure TfrmHealth.GetUserDetails(Sender: TObject);
begin

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while not tblUsers.Eof do
      begin
        if tblUsers['GebruikerID'] = sUserID
          then
            begin
              sname := tblUsers['Naam'];
              svan := tblUsers['Van'];
            end;


        tblUsers.Next;
      end;
  end;

end;

end.

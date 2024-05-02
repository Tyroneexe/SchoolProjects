unit frmHealthHarmony_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u, math,
  Vcl.Buttons;

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
    imgWorkout: TImage;
    imgDiet: TImage;
    imgFatLoss: TImage;
    imgTracking: TImage;
    imgRecipes: TImage;
    imgStats: TImage;
    redtWorkout: TRichEdit;
    lblUserWorkout: TLabel;
    imgWorkoutBack: TImage;
    grbInsertWorkout: TGroupBox;
    lbDays: TListBox;
    redtInsertWorkout: TRichEdit;
    btnSubmitWorkout: TButton;
    lblInsertWorkout: TLabel;
    btbtnDeleteWorkout: TBitBtn;
    imgRecipeBack: TImage;
    lblRecipe: TLabel;
    redtRecipe: TRichEdit;
    edtSearchRecipe: TEdit;
    imgSearchIcon: TImage;
    ScrollBox1: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure pcPagesChange(Sender: TObject);
    //My functions
    procedure CreateUserInfoContainer(Sender: TObject);
    procedure GetUserDetails(Sender: TObject);
    procedure LoadNavBarIcons(Sender: TObject);
    procedure ChangeNavBarColor(Sender: TObject);
    procedure LoadPages(Sender: TObject);
    procedure PreviousPage(Sender: TObject);
    //
    procedure lblWorkoutClick(Sender: TObject);
    procedure lblDietClick(Sender: TObject);
    procedure lblFatLossClick(Sender: TObject);
    procedure lblTrackingClick(Sender: TObject);
    procedure lblRecipesClick(Sender: TObject);
    procedure lblStatisticClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imgWorkoutClick(Sender: TObject);
    procedure imgDietClick(Sender: TObject);
    procedure imgFatLossClick(Sender: TObject);
    procedure imgTrackingClick(Sender: TObject);
    procedure imgRecipesClick(Sender: TObject);
    procedure imgStatsClick(Sender: TObject);
    procedure lbDaysClick(Sender: TObject);
    procedure btbtnDeleteWorkoutClick(Sender: TObject);
    procedure btnSubmitWorkoutClick(Sender: TObject);
    procedure imgRecipeBackClick(Sender: TObject);
    procedure imgWorkoutBackClick(Sender: TObject);
    procedure imgSearchIconClick(Sender: TObject);
    procedure edtSearchRecipeClick(Sender: TObject);
  private
    { Private declarations }
    clPrimary, clLightPurple : TColor;
    sname, svan : string;
    tfile, tfile2 : textfile;
  public
    { Public declarations }
  end;

var
  frmHealth: TfrmHealth;

implementation

{$R *.dfm}

procedure TfrmHealth.LoadPages(Sender: TObject);
var

  sline : string;

begin
  //Workout Page
  if fileExists('UserWorkout.txt')
    then
      begin
        grbInsertWorkout.Visible := false;
        redtWorkout.Visible := true;
        btbtnDeleteWorkout.Visible := true;
        assignfile(tfile, 'UserWorkout.txt');

        reset(tfile);

        while not eof(tfile) do
          begin
            readln(tfile, sline);

            if (pos('MONDAY', uppercase(sline)) <> 0) or (pos('TUESDAY', uppercase(sline)) <> 0) or (pos('WEDNESDAY', uppercase(sline)) <> 0) or (pos('THURSDAY', uppercase(sline)) <> 0) or (pos('FRIDAY', uppercase(sline)) <> 0)
                  or (pos('SATURDAY', uppercase(sline)) <> 0) or (pos('SUNDAY', uppercase(sline)) <> 0)
              then
                begin
                  if redtworkout.Lines.Text <> ''
                    then
                      redtWorkout.Lines.Add('');
                  redtworkout.SelAttributes.Name := 'Roboto';
                  redtWorkout.SelAttributes.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
                  redtworkout.SelAttributes.Size := 22;
                  redtWorkout.Lines.Add(sline);
                end
                else redtWorkout.Lines.Add(sline);

          end;

        closefile(tfile);
      end
    else
      begin
        //user needs to insert details
        redtWorkout.Visible := false;
        btbtnDeleteWorkout.Visible := false;
        grbInsertWorkout.Visible := true;
        grbInsertWorkout.Left := redtworkout.Left;
        grbInsertWorkout.Top := redtworkout.Top;
        lbDays.ItemIndex := 0;

        redtInsertWorkout.SelAttributes.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
        redtInsertWorkout.SelAttributes.Name := 'Roboto';
        redtInsertWorkout.SelAttributes.Size := 22;
        redtInsertWorkout.Lines.Add(lbDays.Items[lbDays.ItemIndex] + ':');
      end;
end;

procedure TfrmHealth.FormActivate(Sender: TObject);
begin
  dmData.sUserID := '1';
  GetUserDetails(nil);
  CreateUserInfoContainer(nil);

  //Load Captions
  lblUserWorkout.Caption := sname + '`s Workout Program';

  //Load pages
  LoadPages(nil);

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
  imgSearchIcon.Picture.LoadFromFile('images/searchIcon.png');
  imgSearchIcon.Stretch := true;

  imgWorkoutBack.Picture.LoadFromFile('images/back.png');
  imgWorkoutBack.Stretch := true;
  imgRecipeBack.Picture.LoadFromFile('images/back.png');
  imgRecipeBack.Stretch := true;

  LoadNavBarIcons(nil);
  imgWorkout.Picture.LoadFromFile('images/blueGym.png');
  imgWorkout.Stretch := true;
  imgDiet.Stretch := true;
  imgFatLoss.Stretch := true;
  imgTracking.Stretch := true;
  imgRecipes.Stretch := true;
  imgStats.Stretch := true;

  lblPro.Font.Color := clPrimary;
  btnUpgrade.Brush.Color := clPrimary;

  lblWorkout.Font.Color := clPrimary;
  lblDiet.Font.Color := clSilver;
  lblFatloss.Font.Color := clSilver;
  lblTracking.Font.Color := clSilver;
  lblRecipes.Font.Color := clSilver;
  lblStatistic.Font.Color := clSilver;

  //Size and Position
  lblWorkout.Left := 60;
  lblDiet.Left := 60;
  lblFatloss.Left := 60;
  lblTracking.Left := 60;
  lblRecipes.Left := 60;
  lblStatistic.Left := 60;

  lblWorkout.Top := 80;
  lblDiet.Top := lblWorkout.Top + lblWorkout.Height + 20;
  lblFatloss.Top := lblDiet.Top + lblDiet.Height + 20;
  lblTracking.Top := lblFatloss.Top + lblFatloss.Height + 20;
  lblRecipes.Top := lblTracking.Top + lblTracking.Height + 20;
  lblStatistic.Top := lblRecipes.Top + lblRecipes.Height + 20;

  imgWorkout.Top := lblWorkout.Top;
  imgDiet.Top := lblDiet.Top;
  imgFatloss.Top := lblFatloss.Top;
  imgTracking.Top := lblTracking.Top;
  imgRecipes.Top := lblRecipes.Top;
  imgStats.Top := lblStatistic.Top;

end;

procedure TfrmHealth.lbDaysClick(Sender: TObject);
var

  sline : string;
  i: Integer;

begin

  //juffrou het gese append maak nuwe lyn
   if not FileExists('UserWorkout.txt')
    then
      begin
        assignfile(tfile, 'UserWorkout.txt');
        Rewrite(tfile);
      end
  else
    Append(tfile);

    for i := 0 to redtInsertWorkout.Lines.Count - 1 do
      begin
        writeln(tfile, redtInsertWorkout.Lines[i]);
      end;

  closefile(tfile);

  redtInsertWorkout.Clear;

  redtInsertWorkout.SelAttributes.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
  redtInsertWorkout.SelAttributes.Name := 'Roboto';
  redtInsertWorkout.SelAttributes.Size := 22;
  redtInsertWorkout.Lines.Add(lbDays.Items[lbDays.ItemIndex] + ':');
end;

procedure TfrmHealth.lblDietClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblDiet.Font.Color := clPrimary;
  imgDiet.Picture.LoadFromFile('images/blueApple.png');
  pcPages.TabIndex := 1;
end;

procedure TfrmHealth.lblFatLossClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblFatLoss.Font.Color := clPrimary;
  imgFatLoss.Picture.LoadFromFile('images/blueBike.png');
  pcPages.TabIndex := 2;
end;

procedure TfrmHealth.lblRecipesClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblRecipes.Font.Color := clPrimary;
  imgRecipes.Picture.LoadFromFile('images/blueCart.png');
  pcPages.TabIndex := 4;
end;

procedure TfrmHealth.lblStatisticClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblStatistic.Font.Color := clPrimary;
  imgStats.Picture.LoadFromFile('images/blueGraph.png');
  pcPages.TabIndex := 5;
end;

procedure TfrmHealth.lblTrackingClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblTracking.Font.Color := clPrimary;
  imgTracking.Picture.LoadFromFile('images/blueCalender.png');
  pcPages.TabIndex := 3;
end;

procedure TfrmHealth.lblWorkoutClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblWorkout.Font.Color := clPrimary;
  imgWorkout.Picture.LoadFromFile('images/blueGym.png');
  pcPages.TabIndex := 0;
end;

procedure TfrmHealth.pcPagesChange(Sender: TObject);
var

  iPageController : integer;

begin

  ipagecontroller := pcpages.TabIndex;

  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);

  case ipagecontroller of
   0 : begin lblWorkout.Font.Color := clPrimary; imgWorkout.Picture.LoadFromFile('images/blueGym.png'); end;
   1 : begin lblDiet.Font.Color := clprimary; imgDiet.Picture.LoadFromFile('images/blueApple.png'); end;
   2 : begin lblFatloss.Font.Color := clprimary; imgFatLoss.Picture.LoadFromFile('images/blueBike.png'); end;
   3 : begin lblTracking.Font.Color := clprimary; imgTracking.Picture.LoadFromFile('images/blueCalender.png'); end;
   4 : begin lblRecipes.Font.Color := clprimary; imgRecipes.Picture.LoadFromFile('images/blueCart.png'); end;
   5 : begin lblStatistic.Font.Color := clprimary; imgStats.Picture.LoadFromFile('images/blueGraph.png'); end;
  end;

end;

procedure TfrmHealth.btbtnDeleteWorkoutClick(Sender: TObject);
begin
  //delete the user's workout file

  if MessageDlg('Do you want to delete and reset your Workout Program?', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes
    then
      begin
        DeleteFile('UserWorkout.txt');
        showmessage('Program successfully deleted.');
        //Load pages again after program is deleted
        LoadPages(nil);
        redtInsertWorkout.Clear;
      end;
end;

procedure TfrmHealth.btnSubmitWorkoutClick(Sender: TObject);
var

  i : integer;

begin
  Append(tfile);

    for i := 0 to redtInsertWorkout.Lines.Count - 1 do
      begin
        writeln(tfile, redtInsertWorkout.Lines[i]);
      end;

  closefile(tfile);

  LoadPages(nil);
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
  imgTopBar, imgGirl : TImage;
  lblUserName, lblUserVan : Tlabel;

begin

  for i := 0 to 2 do
  begin
    //Create GroupBox
    grbuserInfo := TGroupBox.Create(pcPages.Pages[i]);
    grbuserInfo.Parent := pcPages.Pages[i];
    grbuserInfo.Caption := '';
    grbuserInfo.Height := 500;
    grbuserInfo.Width := 350;
    grbuserInfo.Top := 10;
    grbuserInfo.Left := pcPages.Width - grbuserinfo.Width - 20;

    //Create Top Bar Image
    imgTopBar := TImage.Create(pcPages.Pages[i]);
    imgTopbar.Parent := grbuserinfo;
    imgTopbar.Left := 0;
    imgtopbar.Top := 0;
    imgtopbar.Height := 130;
    imgtopbar.Width := grbuserinfo.Width;
    imgTopbar.Picture.LoadFromFile('images/appBar.png');
    imgTopbar.Stretch := true;

    //Create label for name and van
    lblusername := TLabel.Create(pcPages.Pages[i]);
    lblusername.parent := grbuserInfo;
    lblusername.Left := 10;
    lblusername.Top := 10;
    lblUsername.Font.Name := 'Roboto';
    lblUsername.Font.Color := clWhite;
    lblusername.Font.Size := 28;
    lblUsername.Caption := sname;

    lblUserVan := TLabel.Create(pcPages.Pages[i]);
    lblUserVan.parent := grbuserInfo;
    lblUserVan.Left := 10;
    lblUserVan.Top := lblusername.Top + lblusername.Height + 10;
    lblUserVan.Font.Name := 'Roboto';
    lblUserVan.Font.Color := clWhite;
    lblUserVan.Font.Size := 28;
    lblUserVan.Caption := svan;

    //Create tennis girl image
    imgGirl := TImage.Create(pcPages.Pages[i]);
    imgGirl.Parent := grbuserinfo;
    imgGirl.Height := 470;
    imgGirl.Width := floor(grbuserinfo.Width / 1.5);
    imgGirl.Left := grbuserinfo.Width - imggirl.Width;
    imgGirl.Top := 0;
    imgGirl.Picture.LoadFromFile('images/girlTennis.png');
    imgGirl.Stretch := true;
  end;
end;

procedure TfrmHealth.edtSearchRecipeClick(Sender: TObject);
begin
  if edtSearchRecipe.Focused then edtSearchRecipe.Clear;
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
procedure TfrmHealth.imgDietClick(Sender: TObject);
begin
  lblDietClick(nil);
end;

procedure TfrmHealth.imgFatLossClick(Sender: TObject);
begin
  lblFatLossClick(nil);
end;

procedure TfrmHealth.imgRecipeBackClick(Sender: TObject);
begin
  PreviousPage(nil);
end;

procedure TfrmHealth.imgRecipesClick(Sender: TObject);
begin
  lblRecipesClick(nil);
end;

procedure TfrmHealth.imgSearchIconClick(Sender: TObject);
var

  sline, ssearch : string;

begin
  ssearch := edtSearchRecipe.Text;

  if fileexists('Recipes.txt') then
    assignfile(tfile2, 'Recipes.txt')
    else
      begin
        Showmessage('Recipes not available at this moment');
        exit;
      end;

  reset(tfile2);

  while not eof(tfile2) do
    begin
      readln(tfile2, sline);

      if pos(ssearch, sline) > 0
        then showmessage(sline);

    end;

  closefile(tfile2);
end;

procedure TfrmHealth.imgStatsClick(Sender: TObject);
begin
  lblStatisticClick(nil);
end;

procedure TfrmHealth.imgTrackingClick(Sender: TObject);
begin
  lblTrackingClick(nil);
end;

procedure TfrmHealth.imgWorkoutBackClick(Sender: TObject);
begin
  PreviousPage(nil);
end;

procedure TfrmHealth.imgWorkoutClick(Sender: TObject);
begin
  lblWorkoutClick(nil);
end;

procedure tfrmHealth.LoadNavBarIcons(Sender: TObject);
begin
  imgWorkout.Picture.LoadFromFile('images/gym.png');
  imgDiet.Picture.LoadFromFile('images/apple.png');
  imgFatLoss.Picture.LoadFromFile('images/bike.png');
  imgTracking.Picture.LoadFromFile('images/calender.png');
  imgRecipes.Picture.LoadFromFile('images/cart.png');
  imgStats.Picture.LoadFromFile('images/graph.png');
end;

procedure TfrmHealth.PreviousPage(Sender: TObject);
var

  ipage : integer;

begin

  ipage := pcpages.ActivePageIndex;

  if ipage = pcPages.PageCount - 1
    then
      pcPages.ActivePageIndex := 0;

  if ipage = 0
    then
      pcPages.ActivePageIndex := pcPages.PageCount - 1;
end;

end.

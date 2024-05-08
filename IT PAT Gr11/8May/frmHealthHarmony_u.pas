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
    tsRecipes: TTabSheet;
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
    edtSearchRecipe: TEdit;
    imgRecipeSearchIcon: TImage;
    scbRecipes: TScrollBox;
    lbRecipes: TListBox;
    edtSearchDiet: TEdit;
    imgDietSearchIcon: TImage;
    imgDietBack: TImage;
    lblDietTitle: TLabel;
    scbDiet: TScrollBox;
    lbDiet: TListBox;
    lblTotalCalories: TLabel;
    lblNumberCalories: TLabel;
    tbsTracking: TTabSheet;
    imgSettings: TImage;
    imgSearch: TImage;
    imgProfile: TImage;
    procedure FormCreate(Sender: TObject);
    procedure pcPagesChange(Sender: TObject);
    //My functions
    procedure CreateUserInfoContainer(Sender: TObject);
    procedure GetUserDetails(Sender: TObject);
    procedure LoadNavBarIcons(Sender: TObject);
    procedure ChangeNavBarColor(Sender: TObject);
    procedure LoadWorkoutPage(Sender: TObject);
    procedure PreviousPage(Sender: TObject);
    procedure AddCaloriesClick(Sender: TObject);
    procedure LoadStatsPage(Sender: TObject);
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
    procedure imgRecipeSearchIconClick(Sender: TObject);
    procedure edtSearchRecipeClick(Sender: TObject);
    procedure edtSearchRecipeChange(Sender: TObject);
    procedure lbRecipesClick(Sender: TObject);
    procedure imgDietBackClick(Sender: TObject);
    procedure imgDietSearchIconClick(Sender: TObject);
    procedure lbDietClick(Sender: TObject);
    procedure edtSearchDietClick(Sender: TObject);
    procedure edtSearchDietChange(Sender: TObject);
    procedure btnUpgradeClick(Sender: TObject);
    procedure imgProfileClick(Sender: TObject);
  private
    { Private declarations }
    clPrimary, clLightPurple : TColor;
    sname, svan : string;
    tfile, tfile2 : textfile;
    itotalCalories : integer;
    bPremium : Boolean;
  public
    { Public declarations }
  end;

var
  frmHealth: TfrmHealth;

implementation

{$R *.dfm}

uses frmSettings_u;

procedure TfrmHealth.LoadWorkoutPage(Sender: TObject);
var

  sline : string;

begin
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
  LoadWorkoutPage(nil);

end;

procedure TfrmHealth.FormCreate(Sender: TObject);
begin
  //Initiliaze vars
  clPrimary := rgb(22,67,255); //1657FF
  clLightPurple := rgb(212, 211, 255); //d4d3ff
  lbRecipes.visible := false;
  lbDiet.Visible := false;
  pcPages.TabIndex := 1;

  //Load Images and Colors
  imgLogo.Picture.LoadFromFile('images/logo.png');
  imgLogo.Stretch := true;
  imgLock.Picture.LoadFromFile('images/lock.png');
  imgLock.Stretch := true;
  imgRecipeSearchIcon.Picture.LoadFromFile('images/searchIcon.png');
  imgRecipeSearchIcon.Stretch := true;
  imgDietSearchIcon.Picture.LoadFromFile('images/searchIcon.png');
  imgDietSearchIcon.Stretch := true;
  imgDietBack.Picture.LoadFromFile('images/back.png');
  imgDietBack.Stretch := true;

  imgProfile.Picture.LoadFromFile('images/profile.png');
  imgProfile.Stretch := true;
  imgSettings.Picture.LoadFromFile('images/settings.png');
  imgSettings.Stretch := true;
  imgSearch.Picture.LoadFromFile('images/searchIcon.png');
  imgSearch.Stretch := true;

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

  imgProfile.Height := imgRecipeSearchIcon.Height;
  imgProfile.Width := imgRecipeSearchIcon.Width;
  imgProfile.Top := imgWorkout.Top;
  imgProfile.Left := pcPages.Left - imgProfile.Width - 10;
  imgSettings.Height := imgProfile.Height;
  imgSettings.Width := imgProfile.Width;
  imgSettings.Top := imgProfile.Top + imgProfile.Height + 10;
  imgSettings.Left := pcPages.Left - imgSettings.Width - 10;
  imgSearch.Height := imgProfile.Height;
  imgSearch.Width := imgProfile.Width;
  imgSearch.Top := imgSettings.Top + imgSettings.Height + 10;
  imgSearch.Left := pcPages.Left - imgSearch.Width - 10;

  //Diet Page
  with lblDietTitle do
    begin
      Left := lblRecipe.Left;
      Top := lblRecipe.Top;
      Width := lblRecipe.Width;
      Height := lblRecipe.Height;
    end;

  with imgDietBack do
    begin
      Left := imgRecipeBack.Left;
      Top := imgRecipeBack.Top;
      Width := imgRecipeBack.Width;
      Height := imgRecipeBack.Height;
    end;

  with imgDietSearchIcon do
    begin
      Left := imgRecipeSearchIcon.Left;
      Top := imgRecipeSearchIcon.Top;
      Width := imgRecipeSearchIcon.Width;
      Height := imgRecipeSearchIcon.Height;
    end;

  with edtSearchDiet do
    begin
      Left := edtSearchRecipe.Left;
      Top := edtSearchRecipe.Top;
      Width := edtSearchRecipe.Width;
      Height := edtSearchRecipe.Height;
    end;

  with lbDiet do
    begin
      Left := lbRecipes.Left;
      Top := lbRecipes.Top;
      Width := lbRecipes.Width;
      Height := lbRecipes.Height;
    end;

  LoadStatsPage(nil);
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

procedure TfrmHealth.lbDietClick(Sender: TObject);
begin
  edtSearchDiet.Text := lbDiet.Items[lbDiet.ItemIndex];

  lbDiet.Visible := false;
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

procedure TfrmHealth.lbRecipesClick(Sender: TObject);
begin
  edtSearchRecipe.Text := lbRecipes.Items[lbRecipes.ItemIndex];

  lbRecipes.Visible := false;
end;

procedure TfrmHealth.pcPagesChange(Sender: TObject);
var

  iPageController : integer;

begin

  ipagecontroller := pcpages.TabIndex;

  if not bPremium then
    begin
      if ipagecontroller = 5
        then
          begin
            pcpages.TabIndex := 4;
            MessageDlg('You have to have premium to view your stats', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
            exit;
          end;
    end;


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
        LoadWorkoutPage(nil);
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

  LoadWorkoutPage(nil);
end;

procedure TfrmHealth.btnUpgradeClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to buy Premium' + #13 + 'R500.00 for lifetime Premium',
                  TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo] ,0) = mrYes
    then
      bPremium := true;
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
  imgTopBar, imgGirl : TImage;
  lblUserName, lblUserVan : Tlabel;
  grbuserInfo : TGroupBox;

begin

  for i := 0 to pcpages.PageCount - 1 do
  begin
    //continue is opposite van "break" (skip een looop in die for loop)
    if (I = 1) or (i = 4) then continue;

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

procedure TfrmHealth.edtSearchDietChange(Sender: TObject);
var

  ssearch : string;

begin
  lbDiet.Visible := true;
    lbDiet.Clear;

  ssearch := edtSearchDiet.Text;

  with dmData do
  begin
    tblDiet.Open;
    tblDiet.First;
    while not tblDiet.Eof do
      begin
        if pos(UpperCase(ssearch), uppercase(tblDiet['FoodName'])) > 0
          then
            begin
              lbDiet.AddItem(tblDiet['FoodName'], lbDiet);
            end;

        tblDiet.Next;
      end;
  end;

  if edtSearchDiet.Text = '' then
    lbDiet.Visible := false;
end;

procedure TfrmHealth.edtSearchDietClick(Sender: TObject);
begin
  edtSearchDiet.Clear;
end;

procedure TfrmHealth.edtSearchRecipeChange(Sender: TObject);
var

  sline, ssearch, srecipename : string;

begin
  lbRecipes.Visible := true;
  ssearch := edtSearchRecipe.text;
  lbRecipes.Clear;

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

      srecipename := copy(sline, 1, pos('#', sline) - 1);

      if pos(uppercase(ssearch), uppercase(srecipename)) > 0
        then
          lbRecipes.AddItem(srecipename, lbRecipes);
    end;

  closefile(tfile2);

  if edtSearchRecipe.Text = '' then
    lbRecipes.Visible := false;

end;

procedure TfrmHealth.edtSearchRecipeClick(Sender: TObject);
begin
  edtSearchRecipe.Clear;
end;

procedure TfrmHealth.GetUserDetails(Sender: TObject);
var

  bfound : Boolean;

begin
  bfound := false;

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = sUserID
          then
            begin
              sname := tblUsers['Naam'];
              svan := tblUsers['Van'];

              bfound := true;
            end;

        tblUsers.Next;
      end;
  end;

end;
procedure TfrmHealth.imgDietBackClick(Sender: TObject);
begin
  PreviousPage(nil);
end;

procedure TfrmHealth.imgDietClick(Sender: TObject);
begin
  lblDietClick(nil);
end;

procedure TfrmHealth.imgDietSearchIconClick(Sender: TObject);
var

  ssearch : string;
  iypos, ixpos, icountSCBItems : integer;

begin
  ssearch := edtSearchDiet.Text;
  lbDiet.Visible := false;
  iypos := 20;
  ixpos := 20;

  //Clear die scroll box sodat ek net die bikes of net die parts kan bou
  // control count kyk vir al die children in die scrollbox
  for icountSCBItems := scbDiet.ControlCount - 1 downto 0 do
    begin
      //Free is amper soos delete
      {Free se vir die Ram om te vergeet van dit}
      //Controls laat jy die children edit en verander
      scbDiet.Controls[icountSCBItems].Free;
    end;

  with dmData do
  begin
    tblDiet.Open;
    tblDiet.First;
    while not tblDiet.Eof do
      begin
        if pos(UpperCase(ssearch), uppercase(tblDiet['FoodName'])) > 0
          then
            begin
              //create groupbox
              var grbDiet := TGroupBox.Create(scbDiet);
              with grbDiet do
                begin
                  Parent := scbDiet;
                  Left := ixpos;
                  Top := iypos;
                  Width := 210;
                  Height := 200;

                  //as die groub box nie kan inpas nie dan gaan na die volgende lyn
                  if (Left + Width) >= scbDiet.Width
                    then
                      begin
                        iXPos := 20;
                        Left := iXPos;
                        Top := Top + Height + 20;
                        iYPos := iYPos + (Height) + 20;
                      end;

                  iXPos := iXPos + Width + 20;
                end;

              var lblFoodName := TLabel.Create(grbDiet);
              with lblFoodName do
                begin
                  Parent := grbDiet;
                  Font.Name := 'Roboto';
                  Font.Size := 14;
                  Caption := tblDiet['FoodName'];
                  Left := (grbDiet.Width div 2) - (Width div 2);
                  Top := 20;
                end;

              var btnAddCalories := TButton.Create(grbDiet);
              with btnAddCalories do
                begin
                  Parent := grbDiet;
                  Font.Name := 'Roboto';
                  Font.Size := 14;
                  Caption := 'Add';
                  Width := 90;
                  Height := 50;
                  Left := 100;
                  Top := 100;
                  Name := 'btn' + inttostr(tblDiet['FoodID']);
                  OnClick := AddCaloriesClick;
                end;
            end;

        tblDiet.Next;
      end;
  end;
end;

procedure TfrmHealth.imgFatLossClick(Sender: TObject);
begin
  lblFatLossClick(nil);
end;

procedure TfrmHealth.imgProfileClick(Sender: TObject);
begin
  frmHealth.Hide;
  frmSettings.Show;
end;

procedure TfrmHealth.imgRecipeBackClick(Sender: TObject);
begin
  PreviousPage(nil);
end;

procedure TfrmHealth.imgRecipesClick(Sender: TObject);
begin
  lblRecipesClick(nil);
end;

procedure TfrmHealth.imgRecipeSearchIconClick(Sender: TObject);
var

  sline, ssearch, srecipename, sname1, sname2 : string;
  iYpos, icountSCBItems : integer;

begin
  ssearch := edtSearchRecipe.Text;
  lbRecipes.Visible := false;
  iypos := 20;
  sname1 := '';
  sname2 := '';

  //Clear die scroll box sodat ek net die bikes of net die parts kan bou
    // control count kyk vir al die children in die scrollbox
  for icountSCBItems := scbRecipes.ControlCount - 1 downto 0 do
    begin
      //Free is amper soos delete
      {Free se vir die Ram om te vergeet van dit}
      //Controls laat jy die children edit en verander
      scbRecipes.Controls[icountSCBItems].Free;
    end;

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

      if pos(uppercase(ssearch), uppercase(sline)) > 0
        then
        begin
          //build recipes
          var grbRecipe := TGroupBox.Create(scbRecipes);
          grbRecipe.Parent := scbRecipes;
          grbRecipe.Caption := '';
          grbRecipe.Height := 200;
          grbRecipe.Width := scbRecipes.Width - 40;
          grbRecipe.Top := iypos;
          grbRecipe.Left := 20;

           //as die groub box nie kan inpas nie dan gaan na die volgende lyn
            if (grbRecipe.Left + grbRecipe.Width) >= scbRecipes.Width
              then
                begin
                  grbRecipe.Top := grbRecipe.Top + grbRecipe.Height + 20;
                  iYPos := iYPos + (grbRecipe.Height) + 20;
                end;

          srecipename := copy(sline, 1, pos('#', sline) - 1);

          var lblRecipeName := TLabel.Create(grbRecipe);
          lblRecipeName.Parent := grbRecipe;
          lblRecipeName.font.Name := 'Roboto';
          lblRecipeName.Font.Size := 22;
          lblRecipeName.Font.style := [TFontStyle.fsBold];
          lblRecipeName.caption := srecipename;

          lblRecipeName.top := 20;
          lblRecipeName.Left := (grbRecipe.Width div 2) - (lblRecipeName.Width div 2);

          var btnRecipe := TButton.Create(grbRecipe);
          btnRecipe.Parent := grbRecipe;
          btnRecipe.Parent := grbRecipe;
          btnRecipe.font.Name := 'Roboto';
          btnRecipe.Font.Size := 16;
          btnRecipe.Font.style := [TFontStyle.fsBold];
          btnRecipe.caption := 'Let`s Make This';
          btnRecipe.Width := grbRecipe.Width - 40;
          btnRecipe.Height := 30;
          btnRecipe.top := grbRecipe.Height - btnRecipe.Height - 20;
          btnRecipe.Left := (grbRecipe.Width div 2) - (btnRecipe.Width div 2);
        end;

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

  ipage := pcpages.TabIndex;

  if ipage = pcPages.PageCount - 1 //as einde is
    then
    begin
      pcpages.TabIndex := 0;
    end
    else
      begin
        if ipage = 0 //as begin is
          then
            begin
              if bPremium
                then
                  pcpages.TabIndex := pcPages.PageCount - 1
                else
                  pcpages.TabIndex := pcPages.PageCount - 2;
            end
          else
            pcpages.TabIndex := pcpages.TabIndex - 1;
      end;
end;

procedure TfrmHealth.AddCaloriesClick(Sender: TObject);
var

  sFoodName : string;
  btnClickedButton : TButton;
  bfound : Boolean;
  iservings : integer;

begin
  bfound := false;
  iservings := 0;
  btnClickedButton := Sender as TButton;
  sFoodName := btnClickedButton.Name;
  delete(sfoodname, 1, 3);

  if MessageDlg('Do you want to add this to your total calories eaten?',TMsgDlgType.mtConfirmation, [mbNo, mbYes], 0) = mrYes
    then
      begin
        with dmData do
        begin
          tblDiet.Open;
          tblDiet.First;
          while (not tblDiet.Eof) and (bfound = false) do
            begin
              if tblDiet['FoodID'] = strtoint(sfoodname)
                then
                  begin
                    iservings := strtoint(inputbox('Servings','How many servings did you have',''));
                    itotalCalories := itotalcalories + (tblDiet['Calories'] * iservings);
                    bfound := true;
                  end;

              tblDiet.Next;
            end;
        end;
      end;

  lblNumberCalories.caption := inttostr(itotalCalories);
end;

procedure TfrmHealth.LoadStatsPage(Sender: TObject);
begin
  if bPremium
    then
      begin
        //Loadstats
      end;
end;

end.

unit frmHealthHarmony_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u, math,
  Vcl.Buttons, System.DateUtils;

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
    grbNextWorkout: TGroupBox;
    grbSteps: TGroupBox;
    grbSleep: TGroupBox;
    lblImprovements: TLabel;
    imgRed: TImage;
    imgYellow: TImage;
    imgPurple: TImage;
    lblNextWorkout: TLabel;
    lblTheNextWorkout: TLabel;
    lblDateNextWorkout: TLabel;
    lblFullWorkout: TLabel;
    lblViewWorkout: TLabel;
    lblSteps: TLabel;
    lblTotalSteps: TLabel;
    lblCountSteps: TLabel;
    lblHoursSleep: TLabel;
    lblTotalHoursSleep: TLabel;
    lblCountSleep: TLabel;
    grbCalories: TGroupBox;
    lblCalories: TLabel;
    lblCaloriesBurned: TLabel;
    lblCountCalories: TLabel;
    btnHealthData: TButton;
    lblImproveCals: TLabel;
    lblImproveSteps: TLabel;
    lblImproveSleep: TLabel;
    lblCalsImproved: TLabel;
    lblStepsImproved: TLabel;
    lblSleepImproved: TLabel;
    imgArrowCals: TImage;
    imgArrowSteps: TImage;
    imgArrowSleep: TImage;
    lblNotification: TLabel;
    redtNotifications: TRichEdit;
    btbtnReadNotification: TBitBtn;
    imgTrackingBack: TImage;
    lblTrackingTitle: TLabel;
    dtpTracking: TDateTimePicker;
    redtRecipesMade: TRichEdit;
    lblDateTracking: TLabel;
    lblCaloriesTracking: TLabel;
    lblStepsTracking: TLabel;
    lblSleepTracking: TLabel;
    lblRecipesTracking: TLabel;
    redtRecipe: TRichEdit;
    imgStatBack: TImage;
    lblStatisticTitle: TLabel;
    lblWeightTracking: TLabel;
    imgWeight: TImage;
    lblImproveWeight: TLabel;
    lblWeightImproved: TLabel;
    imgArrowWeight: TImage;
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
    procedure LoadFatLossPage(Sender: TObject);
    procedure LoadFatLossHealthData(Sender: TObject);
    procedure LoadImprovements(Sender: TObject);
    procedure GetNotifications(Sender: TObject);
    procedure LoadTrackingPage(Sender: TObject);
    procedure AddRecipe(Sender: TObject);
    procedure GoToSettings(Sender: TObject);
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
    procedure imgSettingsClick(Sender: TObject);
    procedure imgSearchClick(Sender: TObject);
    procedure lblViewWorkoutClick(Sender: TObject);
    procedure btnHealthDataClick(Sender: TObject);
    procedure btbtnReadNotificationClick(Sender: TObject);
    procedure imgTrackingBackClick(Sender: TObject);
    procedure dtpTrackingChange(Sender: TObject);
    procedure imgStatBackClick(Sender: TObject);
  private
    { Private declarations }
    clPrimary, clLightPurple : TColor;
    sname, svan : string;
    tfile, tfile2 : textfile;
    itotalCalories : integer;
    bPremium : Boolean;
    arrDayNames : array[1..7] of string;
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
  dmData.sUserID := '1'; //remove
  GetUserDetails(nil);
  CreateUserInfoContainer(nil);

  //Load Captions
  lblUserWorkout.Caption := sname + '`s Workout Program';

  //Load pages
  GetNotifications(nil);
  LoadWorkoutPage(nil);
  LoadFatLossPage(nil); //As workout program verander moet dit rebuild
  LoadStatsPage(nil);
  LoadTrackingPage(nil);
end;

procedure TfrmHealth.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  //Initiliaze vars
  clPrimary := rgb(22,67,255); //1657FF
  clLightPurple := rgb(212, 211, 255); //d4d3ff
  btbtnReadNotification.Caption := '';
  dtpTracking.Date := date();

  lbRecipes.visible := false;
  redtRecipe.Visible := false;
  lbDiet.Visible := false;

  lblDateTracking.Caption := formatdatetime('DD MMM YYYY', date);

  pcPages.TabIndex := 5;

 for i := 1 to 7 do
  begin
    case i of
      1: arrDayNames[i] := 'Sunday';
      2: arrDayNames[i] := 'Monday';
      3: arrDayNames[i] := 'Tuesday';
      4: arrDayNames[i] := 'Wednesday';
      5: arrDayNames[i] := 'Thursday';
      6: arrDayNames[i] := 'Friday';
      7: arrDayNames[i] := 'Saturday';
    end;
  end;

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
  imgTrackingBack.Picture.LoadFromFile('images/back.png');
  imgTrackingBack.Stretch := true;
  imgStatBack.Picture.LoadFromFile('images/back.png');
  imgStatBack.Stretch := true;

  imgRed.Picture.LoadFromFile('images/redContainer.png');
  imgRed.Stretch := true;
  imgYellow.Picture.LoadFromFile('images/yellowContainer.png');
  imgYellow.Stretch := true;
  imgPurple.Picture.LoadFromFile('images/purpleContainer.png');
  imgPurple.Stretch := true;
  imgWeight.Picture.LoadFromFile('images/redContainer.png');
  imgWeight.Stretch := true;

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
  lblImproveCals.Font.Color := clWhite;
  lblImproveSleep.Font.Color := clWhite;
  lblImproveSteps.Font.Color := clWhite;
  lblImproveWeight.Font.Color := clWhite;
  lblCalsImproved.Font.Color := clWhite;
  lblSleepImproved.Font.Color := clWhite;
  lblStepsImproved.Font.Color := clWhite;
  lblWeightImproved.Font.Color := clWhite;

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

  imgYellow.Height := imgRed.Height;
  imgYellow.Width := imgRed.Width;
  imgYellow.Left := imgRed.Left + imgRed.Width + 35;
  imgPurple.Height := imgRed.Height;
  imgPurple.Width := imgRed.Width;
  imgPurple.Left := imgYellow.Left + imgYellow.Width + 35;
  imgWeight.Height := imgRed.Height;
  imgWeight.Width := imgRed.Width;
  imgWeight.Left := imgPurple.Left + imgPurple.Width + 35;

  lblImproveCals.Left := imgRed.Left + 20;
  lblImproveCals.Top := imgRed.Top + 20;
  lblImproveSteps.Left := imgYellow.Left + 20;
  lblImproveSteps.Top := imgYellow.Top + 20;
  lblImproveSleep.Left := imgPurple.Left + 20;
  lblImproveSleep.Top := imgPurple.Top + 20;
  lblImproveWeight.Left := imgWeight.Left + 20;
  lblImproveWeight.Top := imgWeight.Top + 20;

  lblCalsImproved.Top := imgRed.Top + imgRed.Height - lblCalsImproved.Height - 20;
  lblCalsImproved.Left := imgRed.Left + 20;
  lblStepsImproved.Top := imgYellow.Top + imgYellow.Height - lblStepsImproved.Height - 20;
  lblStepsImproved.Left := imgYellow.Left + 20;
  lblSleepImproved.Top := imgPurple.Top + imgPurple.Height - lblSleepImproved.Height - 20;
  lblSleepImproved.Left := imgPurple.Left + 20;
  lblWeightImproved.Top := imgWeight.Top + imgWeight.Height - lblWeightImproved.Height - 20;
  lblWeightImproved.Left := imgWeight.Left + 20;

  imgTrackingBack.Width := imgWorkoutBack.Width;
  imgTrackingBack.Height := imgWorkoutBack.Height;
  lblTrackingTitle.Left := lblUserWorkout.Left;
  lblTrackingTitle.Top := lblUserWorkout.Top;
  imgTrackingBack.Left := imgWorkoutBack.Left;
  imgTrackingBack.Top := imgWorkoutBack.Top;

  lblStepsTracking.Top := lblCaloriesTracking.Top + lblCaloriesTracking.Height + 30;
  lblSleepTracking.Top := lblStepsTracking.Top + lblStepsTracking.Height + 30;
  lblWeightTracking.Top := lblSleepTracking.Top + lblSleepTracking.Height + 30;

//  Recipe Page
  with redtRecipe do
    begin
      font.Name := 'Roboto';
      font.size := 14;

      Paragraph.TabCount := 1;
      Paragraph.Tab[0] := 100;
    end;


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
    if bPremium
    then
      pcPages.TabIndex := 5
    else
      begin
        MessageDlg('You have to have premium to view your stats', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        exit;
      end;
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblStatistic.Font.Color := clPrimary;
  imgStats.Picture.LoadFromFile('images/blueGraph.png');
end;

procedure TfrmHealth.lblTrackingClick(Sender: TObject);
begin
  ChangeNavBarColor(nil);
  LoadNavBarIcons(nil);
  lblTracking.Font.Color := clPrimary;
  imgTracking.Picture.LoadFromFile('images/blueCalender.png');
  pcPages.TabIndex := 3;
end;

procedure TfrmHealth.lblViewWorkoutClick(Sender: TObject);
begin
  pcPages.TabIndex := 0;
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
  LoadFatLossPage(nil);
  GetNotifications(nil);

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

procedure TfrmHealth.btbtnReadNotificationClick(Sender: TObject);
var

  bfound : boolean;

begin
  bfound := false;

  with dmData do
  begin
    tblUsers.Open;
    tblusers.First;
    while (not tblusers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = suserid
          then
            begin
              tblUsers.edit;
              tblUsers['Notification'] := '';
              tblUsers.Post;

              bfound := true;
            end;


        tblusers.Next;
      end;
  end;

  redtNotifications.SelAttributes.size := 20;
  redtNotifications.SelAttributes.Style := [TFontStyle.fsBold];
  redtNotifications.Lines.Add('There is no new notifications');

  btbtnReadNotification.Enabled := false;
end;

procedure TfrmHealth.btnHealthDataClick(Sender: TObject);
var

  icountsteps, icountSleep, icountcals : integer;
  rweight : real;
  bToday, bfound : Boolean;

begin
  bToday := false;
  bfound := false;
  icountsteps := strtoint(inputbox('Steps', 'How many steps did you take today', ''));
  icountsleep := strtoint(inputbox('Sleep', 'How many hours did you sleep?', ''));
  icountcals := strtoint(InputBox('Calories', 'How many calories did you eat today', ''));
  rweight := strtofloat(inputbox('Weight','What is your weight',''));

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while (not tblHealthData.Eof) do
      begin
        if (tblHealthData['GebruikerID'] = strtoint(suserid)) and (tblHealthData['Datum'] = date)
          then
              bToday := true;

        tblHealthData.Next;
      end;

  if bToday
    then
      begin
        tblHealthData.First;

        while (not tblHealthData.Eof) and (bfound = false) do
          begin
            if (tblHealthData['GebruikerID'] = strtoint(suserid)) and (tblHealthData['Datum'] = date)
              then
                begin
                  showmessage('vandag bestaan'); //remove
                  tblHealthData.Edit;

                  tblHealthData['Calories'] := icountcals;
                  tblHealthData['Steps'] := icountsteps;
                  tblHealthData['SleepHours'] := icountsleep;
                  tblHealthData['Weight'] := rweight;

                  tblHealthData.Post;
                  bfound := true;
                end;

            tblHealthData.Next;
          end;
      end
      else
        begin
          showmessage('nuwe'); //remove
          tblHealthData.Last;
          tblHealthData.Insert;

          tblHealthData['GebruikerID'] := suserid;
          tblHealthData['Datum'] := Date();
          tblHealthData['Calories'] := icountcals;
          tblHealthData['Steps'] := icountsteps;
          tblHealthData['SleepHours'] := icountsleep;
          tblHealthData['Weight'] := rweight;

          tblHealthData.Post;
        end;
  end;

  lblCountSteps.Caption := inttostr(icountsteps);
  lblCountSleep.Caption := inttostr(icountsleep);
  lblCountCalories.Caption := inttostr(icountcals);

  lblCountCalories.Left := (grbCalories.Width div 2) - (lblCountCalories.Width div 2);
end;

procedure TfrmHealth.btnSubmitWorkoutClick(Sender: TObject);
var

  i : integer;

begin
  redtWorkout.Clear;

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
  lblUserName, lblUserVan, lblAge, lblBirthDate, lblGender, lblWeight: Tlabel;
  grbuserInfo : TGroupBox;
  sBirthDate, sGender : string;
  rWeight : real;

begin
  bfound := false;

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = strtoint(sUserID)
          then
            begin
              sBirthDate := DatetoStr(tblUsers['GeboorteDatum']);
              sGender := tblUsers['Geslag'];

              bfound := true;
            end;

        tblUsers.Next;
      end;

    //Get the user's weight
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
      begin
        if tblHealthData['GebruikerID'] = strtoint(sUserID)
          then
            begin
              rWeight := tblHealthData['Weight'];
            end;

        tblHealthData.Next;
      end;
  end;


  for i := 0 to pcpages.PageCount - 1 do
  begin
    //continue is opposite van "break" (skip een loop in die for loop)
    //Ek soek nie die info box ooral nie
    if (I = 1) or (i = 4) then continue;

    //Create GroupBox
    grbuserInfo := TGroupBox.Create(pcPages.Pages[i]);
    grbuserInfo.Parent := pcPages.Pages[i];
    grbuserInfo.Caption := '';
    grbuserInfo.Height := 500;
    grbuserInfo.Width := 350;
    grbuserInfo.Top := 10;
    grbuserInfo.Left := pcPages.Width - grbuserinfo.Width - 20;
    grbUserinfo.OnClick := GoToSettings;

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

    //Create user info
    lblAge := TLabel.Create(pcPages.Pages[i]);
    with lblAge do
    begin
      Parent := grbUserinfo;
      Top := 150;
      left := 20;
      caption := 'Age: ' + inttostr(YearOf(Date) - yearof(strtodate(sBirthDate)));
      font.Name := 'Roboto';
      font.Size := 14;
    end;

    lblBirthDate := TLabel.Create(pcPages.Pages[i]);
    with lblBirthDate do
    begin
      Parent := grbUserinfo;
      Top := lblAge.Top + lblAge.Height + 20;
      left := 20;
      caption := 'Birth: ' + FormatDateTime('DD MMM YYYY', strtodate(sBirthDate));
      Font := lblAge.Font;
    end;

    lblGender := TLabel.Create(pcPages.Pages[i]);
    with lblGender do
    begin
      Parent := grbUserinfo;
      Top := lblBirthDate.Top + lblBirthDate.Height + 20;
      left := 20;
      caption := 'Geslag: ' + sGender;
      Font := lblAge.Font;
    end;

    lblWeight := TLabel.Create(pcPages.Pages[i]);
    with lblWeight do
    begin
      Parent := grbUserinfo;
      Top := lblGender.Top + lblGender.Height + 20;
      left := 20;
      caption := 'Weight: ' + floattostr(rWeight) + ' kg';
      Font := lblAge.Font;
    end;
  end;
end;

procedure TfrmHealth.GoToSettings(Sender: TObject);
begin
  frmHealth.Hide;
  frmSettings.Show;
end;

procedure TfrmHealth.dtpTrackingChange(Sender: TObject);
var

  bfound : Boolean;
  srecipes : string;
  I : integer;

begin
  bfound := false;
  lblDateTracking.Caption := formatdatetime('DD MMM YYYY', dtpTracking.Date);

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while (not tblHealthData.Eof) and (bfound = false) do
      begin
        if (tblHealthData['GebruikerID'] = strtoint(suserid)) and (tblHealthData['Datum'] = dtpTracking.Date)
          then
            begin
              lblCaloriesTracking.Caption := 'Calories: ' + inttostr(tblHealthData['Calories']);
              lblStepsTracking.Caption := 'Steps: ' + inttostr(tblHealthData['Steps']);
              lblSleepTracking.Caption := 'Sleep: ' + inttostr(tblHealthData['SleepHours']);
              lblWeightTracking.Caption := 'Weight: ' + inttostr(tblHealthData['Weight']);

               if tblHealthData['Recipes'] <> ''
                then
                  begin
                    srecipes := tblHealthData['Recipes'];
                    for I := 1 to length(srecipes) do
                      begin
                        if srecipes[i] = ','
                          then srecipes[i] := #13;
                      end;
                    redtRecipesMade.Lines.Add(srecipes);
                  end;

              bfound := true;
            end;


        tblHealthData.Next;
      end;
  end;

  if bfound = false
    then
      begin
        lblCaloriesTracking.Caption := 'Calories: No Data';
        lblStepsTracking.Caption := 'Steps: No Data';
        lblSleepTracking.Caption := 'Sleep: No Data';
        lblWeightTracking.Caption := 'Weight: No Data';
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

  if bfound = false
    then Showmessage('No User was found');

end;

procedure TfrmHealth.imgTrackingBackClick(Sender: TObject);
begin
  PreviousPage(nil);
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
  iYpos, icountSCBItems, itellrecipe : integer;

begin
  ssearch := edtSearchRecipe.Text;
  redtRecipe.Visible := false;
  scbRecipes.Visible := true;
  lbRecipes.Visible := false;
  iypos := 20;
  sname1 := '';
  sname2 := '';
  itellrecipe := 0;

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
      inc(itellrecipe);

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
          btnRecipe.font.Name := 'Roboto';
          btnRecipe.Font.Size := 16;
          btnRecipe.Font.style := [TFontStyle.fsBold];
          btnRecipe.caption := 'Let`s Make This';
          btnRecipe.Width := grbRecipe.Width - 40;
          btnRecipe.Height := 30;
          btnRecipe.top := grbRecipe.Height - btnRecipe.Height - 20;
          btnRecipe.Left := (grbRecipe.Width div 2) - (btnRecipe.Width div 2);
          btnRecipe.Name := 'btn' + inttostr(itellrecipe);
          btnRecipe.OnClick := addRecipe;
        end;

    end;

  closefile(tfile2);
end;

procedure TfrmHealth.AddRecipe(Sender: TObject);
var

  btnClickedButton : TButton;
  slineid, sline, sfoodname, singredients, ssteps : string;
  ilineid, itelline, i : integer;
  bToday, bfound : Boolean;

begin
  redtRecipe.Clear;

  btnClickedButton := Sender as TButton;
  slineid := btnClickedButton.Name;
  delete(slineid, 1, 3);
  ilineid := strtoint(slineid);

  itelline := 0;
  bfound := false;
  bToday := false;

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
      inc(itelline);

      showmessage('lyn nommer: ' + inttostr(itelline) + ' btn id: ' + inttostr(ilineid)); //remove
      if itelline = ilineid
        then
          begin

            sfoodname := copy(sline, 1, pos('#', sline) - 1);

            redtRecipe.Paragraph.Alignment := taCenter;
            with redtRecipe.SelAttributes do
            begin
              name := 'Roboto';
              size := 20;
              style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
            end;
              redtRecipe.Lines.Add(sfoodname);
              redtRecipe.Paragraph.Alignment := taLeftJustify;

            delete(sline, pos('#', sline) - 1, length(sfoodname));
            singredients := copy(sline, 1, pos('#', sline) - 1);

            for I := 1 to length(singredients) do
              begin
                //", " word -> "#13#9"
                if singredients[i] = ','
                  then
                    begin
                      singredients[i] := #13;
                      singredients[i+1] := #9;
                    end;
              end;

            redtRecipe.SelAttributes.Style := [TFontStyle.fsBold];
            redtRecipe.Lines.Add('Ingredients: ');
            redtRecipe.Lines.Add(#9 + singredients + #13);

            redtRecipe.SelAttributes.Style := [TFontStyle.fsBold];
            redtRecipe.Lines.Add('How to make?: ');
            delete(sline, 1, length(singredients) + 1);
            ssteps := copy(sline, 1, length(sline));
            redtRecipe.Lines.Add(ssteps);
          end;
    end;

  closefile(tfile2);

  //Wys die recipe
  scbRecipes.Visible := false;
  redtRecipe.Visible := true;
  redtRecipe.Top := scbRecipes.Top;
  redtRecipe.Left := scbRecipes.Left;
  redtRecipe.width := scbRecipes.Width;
  redtRecipe.Height := scbRecipes.Height;

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while (not tblHealthData.Eof) do
      begin
        if (tblHealthData['GebruikerID'] = strtoint(suserid)) and (tblHealthData['Datum'] = date)
          then
              bToday := true;

        tblHealthData.Next;
      end;

  if bToday
    then
      begin
        tblHealthData.First;

        while (not tblHealthData.Eof) and (bfound = false) do
          begin
            if (tblHealthData['GebruikerID'] = strtoint(suserid)) and (tblHealthData['Datum'] = date)
              then
                begin
                  showmessage('vandag bestaan'); //remove
                  tblHealthData.Edit;

                  tblHealthData['Recipes'] := tblHealthData['Recipes'] + ',' + sfoodname;

                  tblHealthData.Post;
                  bfound := true;
                end;

            tblHealthData.Next;
          end;
      end
      else
        begin
          showmessage('nuwe'); //remove
          tblHealthData.Last;
          tblHealthData.Insert;

          tblHealthData['GebruikerID'] := suserid;
          tblHealthData['Datum'] := Date();
          tblHealthData['Recipes'] := sfoodname;

          tblHealthData.Post;
        end;
  end;

end;

procedure TfrmHealth.imgSearchClick(Sender: TObject);
var

  sfindpage : string;

begin
  sfindpage := inputbox('Find a Page','What page do you want to go to?','');

  sfindpage := uppercase(sfindpage);

  if pos('WORK', sfindpage) > 0 then pcPages.TabIndex := 0;
  if pos('DIET', sfindpage) > 0 then pcPages.TabIndex := 1;
  if pos('FAT', sfindpage) > 0 then pcPages.TabIndex := 2;
  if pos('TRACK', sfindpage) > 0 then pcPages.TabIndex := 3;
  if pos('RECIPE', sfindpage) > 0 then pcPages.TabIndex := 4;
  if pos('STAT', sfindpage) > 0
    then
      begin
        if bPremium then pcPages.TabIndex := 5
          else
            begin
              MessageDlg('You have to have premium to view your stats', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
              exit;
            end;
      end;

end;

procedure TfrmHealth.imgSettingsClick(Sender: TObject);
begin
  frmHealth.Hide;
  frmSettings.Show;
end;

procedure TfrmHealth.imgStatBackClick(Sender: TObject);
begin
  PreviousPage(nil);
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
  //Initialize
  with lblStatisticTitle do
  begin
  Font := lblUserWorkout.Font;
  Left := lblUserworkout.left;
  Top := lblUserWorkout.Top;
  end;
  with imgStatBack do
  begin
    Width := imgWorkoutBack.Width;
    Height := imgWorkoutBack.Height;
    Left := imgWorkoutBack.Left;
    Top := imgWorkoutBack.Top;
  end;

  if bPremium
  then
  begin
    //
  end;
end;

procedure TfrmHealth.LoadFatLossPage(Sender: TObject);
var

  sline, sline2, sworkout : string;
  iNumDay, icopycounter : integer;
  bnextworkout, bnextworkout2 : boolean;

begin
  bnextworkout := false;
  bnextworkout2 := false;
  inumday := Dayofweek(Now);
  icopycounter := 0;

  //Load Health data
  LoadFatLossHealthData(nil);
  LoadImprovements(nil);

  // Next Workout section
  if DayOfWeek(Now) = 7 //as dit saturday is
    then iNumDay := DayOfWeek(Now) - 6
    else iNumDay := DayOfWeek(Now) + 1;

  //As wokrout program verander moet dit weer rebuild
  if pcPages.TabIndex = 2 then
    begin
      if fileExists('UserWorkout.txt') then
      begin
        assignfile(tfile, 'UserWorkout.txt');
        reset(tfile);

        while not eof(tfile) do
          begin
            readln(tfile, sline);

            //Die volgende dag is maandag so hy moet weer deur die loop gaan om maandag te copy
            if inumday = 2
              then
                begin
                  reset(tfile);

                  while not eof(tfile) do
                    begin
                      readln(tfile, sline2);

                      if pos(':', sline2) > 0
                        then bnextworkout2 := false;

                      if bnextworkout2
                        then
                          begin
                            sworkout := sworkout + sline2 + ', ';
                            inc(icopycounter);
                            if icopycounter = 4
                              then sworkout := sworkout + #13;
                          end;

                      if pos(UpperCase(arrDayNames[inumday]), uppercase(sline2)) > 0
                        then bnextworkout2 := true;

                    end;

                  //Kan hier n "break;" sit maar nie nodig nie
                end;

            if pos(':', sline) > 0
              then bnextworkout := false;

            if bnextworkout
              then
                begin
                  sworkout := sworkout + sline + ', ';
                  inc(icopycounter);
                  if icopycounter = 4
                    then sworkout := sworkout + #13;
                end;

            if pos(UpperCase(arrDayNames[inumday]), uppercase(sline)) > 0
              then bnextworkout := true;
          end;

        closefile(tfile);

        //remove die laaste comma
        delete(sworkout, length(sworkout) - 1, 2);

        lblTheNextWorkout.Caption := arrDayNames[inumday];
        lblDateNextWorkout.Caption := FormatDateTime('DD MMMM YYYY',date() + 1);
        lblDateNextWorkout.Left := grbNextWorkout.Width - lblDateNextWorkout.Width - 30;
        lblFullWorkout.Caption := sworkout;

      end
      else
        begin
          MessageDlg('You do not have a workout program yet, let`s make one!',TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
          pcPages.TabIndex := 0;
        end;
    end;

end;

procedure TfrmHealth.LoadFatLossHealthData(Sender: TObject);
begin
  //Hierso het ons nie n "bfound" nie want ek wil die laaste record check

  //Load health data
  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while (not tblHealthData.Eof) do
      begin
        if tblHealthData['GebruikerID'] = suserid
          then
            begin
              if tblHealthData['Datum'] = date
                then
                  begin
                    lblCountSteps.Caption := inttostr(tblHealthData['Steps']);
                    lblCountSleep.Caption := inttostr(tblHealthData['SleepHours']);
                    lblCountCalories.Caption := inttostr(tblHealthData['Calories']);

                    lblCountCalories.Left := (grbCalories.Width div 2) - (lblCountCalories.Width div 2);
                  end;

              if tblHealthData['Datum'] = date - 1
                then
                  begin
                    lblCountSteps.Caption := inttostr(tblHealthData['Steps']);
                    lblCountSleep.Caption := inttostr(tblHealthData['SleepHours']);
                    lblCountCalories.Caption := inttostr(tblHealthData['Calories']);

                    lblCountCalories.Left := (grbCalories.Width div 2) - (lblCountCalories.Width div 2);
                  end;
            end;

        tblHealthData.Next;
      end;

  end;

end;

procedure TfrmHealth.LoadImprovements(Sender: TObject);
var

  iPrevCals, iCals : integer;
  iPrevSteps, iSteps : integer;
  iPrevSleep, iSleep : integer;
  rPrevWeight, rWeight : real;

begin
  icals := 0;
  iprevcals := 0;
  isleep := 0;
  iprevsleep := 0;
  isteps := 0;
  iprevsteps := 0;
  rWeight := 0;
  rPrevWeight := 0;

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
      begin
        if tblHealthData['GebruikerID'] = suserid
          then
            begin
              if tblHealthData['Datum'] = date
                then
                  begin
                    iCals := tblHealthData['Calories'];
                    iSleep := tblHealthData['SleepHours'];
                    iSteps := tblHealthData['Steps'];
                    rWeight := tblHealthData['Weight'];
                  end;

              if tblHealthData['Datum'] = date - 1
                then
                  begin
                    iPrevCals := tblHealthData['Calories'];
                    iPrevSleep := tblHealthData['SleepHours'];
                    iPrevSteps := tblHealthData['Steps'];
                    rPrevWeight := tblHealthData['Weight'];
                  end;
            end;

        tblHealthData.next;
      end;
  end;

  lblCalsImproved.Caption := inttostr(iPrevCals - iCals);
  lblSleepImproved.Caption := inttostr(iPrevSleep - iSleep);
  lblStepsImproved.Caption := inttostr(iPrevSteps - iSteps);
  lblWeightImproved.Caption := floattostr(roundto(rWeight - rPrevWeight, -1));

  imgArrowCals.Top := lblCalsImproved.Top + 5;
  imgArrowCals.Left := lblCalsImproved.Left + lblCalsImproved.Width + 20;

  imgArrowSteps.Top := lblStepsImproved.Top + 5;
  imgArrowSteps.Left := lblStepsImproved.Left + lblStepsImproved.Width + 20;

  imgArrowSleep.Top := lblSleepImproved.Top + 5;
  imgArrowSleep.Left := lblSleepImproved.Left + lblSleepImproved.Width + 20;

  imgArrowWeight.Top := lblWeightImproved.Top + 5;
  imgArrowWeight.Left := lblWeightImproved.Left + lblWeightImproved.Width + 20;

  if iprevcals - icals > 0
    then imgArrowCals.Picture.LoadFromFile('images/arrowUp.png')
    else imgArrowCals.Picture.LoadFromFile('images/arrowDown.png');

  if iprevsleep - isleep > 0
    then imgArrowSleep.Picture.LoadFromFile('images/arrowUp.png')
    else imgArrowSleep.Picture.LoadFromFile('images/arrowDown.png');

  if iprevsteps - isteps > 0
    then imgArrowSteps.Picture.LoadFromFile('images/arrowUp.png')
    else imgArrowSteps.Picture.LoadFromFile('images/arrowDown.png');

  if roundto(rWeight - rPrevWeight, -1) > 0
    then imgArrowWeight.Picture.LoadFromFile('images/arrowUp.png')
    else imgArrowWeight.Picture.LoadFromFile('images/arrowDown.png');
end;

procedure TfrmHealth.GetNotifications(Sender: TObject);
var

  bfound : boolean;

begin
  bfound := false;
  redtNotifications.Clear;

  with dmData do
  begin
    tblUsers.Open;
    tblusers.First;
    while (not tblusers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = suserid
          then
            begin
              if tblUsers['Notification'] <> ''
                then
                  begin
                    redtNotifications.Lines.Add(tblUsers['Notification']);
                    btbtnReadNotification.Enabled := true;
                  end
                else
                  begin
                    btbtnReadNotification.Enabled := false;
                    redtNotifications.SelAttributes.size := 20;
                    redtNotifications.SelAttributes.Style := [TFontStyle.fsBold];
                    redtNotifications.Lines.Add('There is no new notifications');
                  end;

              bfound := true;
            end;


        tblusers.Next;
      end;
  end;
end;

procedure TfrmHealth.LoadTrackingPage(Sender: TObject);
var

  bfound : Boolean;
  srecipes : string;
  I : integer;

begin
  lblDateTracking.Caption := formatdatetime('DD MMM YYYY', date);
  bfound := false;

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while (not tblHealthData.Eof) and (bfound = false) do
      begin
        if (tblHealthData['GebruikerID'] = strtoint(suserid)) and (tblHealthData['Datum'] = date)
          then
            begin
              lblCaloriesTracking.Caption := 'Calories: ' + inttostr(tblHealthData['Calories']);
              lblStepsTracking.Caption := 'Steps: ' + inttostr(tblHealthData['Steps']);
              lblSleepTracking.Caption := 'Sleep: ' + inttostr(tblHealthData['SleepHours']);
              lblWeightTracking.Caption := 'Weight: ' + inttostr(tblHealthData['Weight']);

              if tblHealthData['Recipes'] <> ''
                then
                  begin
                    srecipes := tblHealthData['Recipes'];
                    for I := 1 to length(srecipes) do
                      begin
                        if srecipes[i] = ','
                          then srecipes[i] := #13;
                      end;
                    redtRecipesMade.Lines.Add(srecipes);
                  end;

              bfound := true;
            end;

        tblHealthData.Next;
      end;
  end;

  if bfound = false
    then
      begin
        lblCaloriesTracking.Caption := 'Calories: No Data';
        lblStepsTracking.Caption := 'Steps: No Data';
        lblSleepTracking.Caption := 'Sleep: No Data';
        lblWeightTracking.Caption := 'Weight: No Data';
      end;

end;
end.

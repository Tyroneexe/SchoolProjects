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
    lblWeight: TLabel;
    lblWeighed: TLabel;
    lblCountWeight: TLabel;
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
    imgNotification: TImage;
    grbStats: TGroupBox;
    btnCaloriesStat: TButton;
    btnStepsStat: TButton;
    btnWeightStat: TButton;
    btnSleepStat: TButton;
    shpGraph1: TShape;
    shpGraph2: TShape;
    shpGraph3: TShape;
    shpGraph5: TShape;
    shpGraph6: TShape;
    shpGraph7: TShape;
    shpGraph4: TShape;
    lblStatDate: TLabel;
    lblStatDay1: TLabel;
    lblStatDay2: TLabel;
    lblStatDay3: TLabel;
    lblStatDay4: TLabel;
    lblStatDay5: TLabel;
    lblStatDay6: TLabel;
    lblStatDay7: TLabel;
    lblNotificationBadge: TLabel;
    lblShape1: TLabel;
    lblShape2: TLabel;
    lblShape3: TLabel;
    lblShape4: TLabel;
    lblShape5: TLabel;
    lblShape6: TLabel;
    lblShape7: TLabel;
    lblStatTitle: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pcPagesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    //My eie procedures en functions
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
    procedure LoadTodayCalories(Sender: TObject);
    procedure GraphShapeNoDataStats(Sender: TObject);
    //
    procedure lblWorkoutClick(Sender: TObject);
    procedure lblDietClick(Sender: TObject);
    procedure lblFatLossClick(Sender: TObject);
    procedure lblTrackingClick(Sender: TObject);
    procedure lblRecipesClick(Sender: TObject);
    procedure lblStatisticClick(Sender: TObject);
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
    procedure imgNotificationClick(Sender: TObject);
    procedure lblNotificationBadgeClick(Sender: TObject);
    procedure btnCaloriesStatClick(Sender: TObject);
    procedure btnWeightStatClick(Sender: TObject);
    procedure btnStepsStatClick(Sender: TObject);
    procedure btnSleepStatClick(Sender: TObject);
  private
    { Private declarations }
    sname, svan, sDBNotify : string;
    tfile, tfile2 : textfile;
    itotalCalories : integer;
    bPremium : Boolean;
    arrDayNames : array[1..7] of string;
  public
    { Public declarations }
    iPages : integer;
    clPrimary, clSecondary : TColor;
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
var

  bfound : boolean;

begin
  bfound := false;

  GetUserDetails(nil);
  CreateUserInfoContainer(nil);

  //Load Captions
  lblUserWorkout.Caption := sname + '`s Workout Program';

  //Load Colors
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

  shpGraph1.Brush.Color := clPrimary;
  shpGraph2.Brush.Color := clPrimary;
  shpGraph3.Brush.Color := clPrimary;
  shpGraph4.Brush.Color := clPrimary;
  shpGraph5.Brush.Color := clPrimary;
  shpGraph6.Brush.Color := clPrimary;
  shpGraph7.Brush.Color := clPrimary;

  //Load pages
  GetNotifications(nil);
  LoadWorkoutPage(nil);
  LoadFatLossPage(nil); //As workout program verander moet dit rebuild
  LoadStatsPage(nil);
  LoadTrackingPage(nil);
  LoadTodayCalories(nil);

  //does user have premium
  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = strtoint(sUserID) then
          begin
            if tblUsers['HasPremium'] = true then
              bPremium := true;
          end;

        tblUsers.Next;

      end;

  end;
end;

procedure TfrmHealth.FormCreate(Sender: TObject);
var

  I, ispacebetweenshp, iTelShapes, iNumDay, iStatsDay : Integer;

begin
  //Initiliaze vars
  clPrimary := rgb(22,67,255); //1657FF
  clSecondary := rgb(212, 211, 255); //d4d3ff
  btbtnReadNotification.Caption := '';
  dtpTracking.Date := date();

  lbRecipes.visible := false;
  redtRecipe.Visible := false;
  lbDiet.Visible := false;

  lblDateTracking.Caption := formatdatetime('DD MMM YYYY', date);

  pcPages.TabIndex := 0;

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
  imgNotification.Picture.LoadFromFile('images/Notification.png');
  imgNotification.Stretch := true;

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
  imgNotification.Height := imgProfile.Height;
  imgNotification.Width := imgProfile.Width;
  imgNotification.Top := imgSettings.Top + imgSettings.Height + 10;
  imgNotification.Left := pcPages.Left - imgNotification.Width - 10;
  imgSearch.Height := imgProfile.Height;
  imgSearch.Width := imgProfile.Width;
  imgSearch.Top := imgNotification.Top + imgNotification.Height + 10;
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

  lblNotificationBadge.Left := imgNotification.Left + imgNotification.Width - 10;
  lblNotificationBadge.Top := imgNotification.Top - 10;

//  Recipe Page
  with redtRecipe do
    begin
      font.Name := 'Roboto';
      font.size := 14;

      Paragraph.TabCount := 1;
      Paragraph.Tab[0] := 100;
    end;

  //Stat Page
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

  iTelShapes := 7;
  ispacebetweenshp := (grbStats.Width - (itelshapes * 80)) div (itelshapes + 1);
  iNumDay := DayOfWeek(Now);

  shpGraph1.Left := ispacebetweenshp;
  shpGraph2.Left := ispacebetweenshp + 80 + ispacebetweenshp;
  shpGraph3.Left := ispacebetweenshp + 2 * (80 + ispacebetweenshp);
  shpGraph4.Left := ispacebetweenshp + 3 * (80 + ispacebetweenshp);
  shpGraph5.Left := ispacebetweenshp + 4 * (80 + ispacebetweenshp);
  shpGraph6.Left := ispacebetweenshp + 5 * (80 + ispacebetweenshp);
  shpGraph7.Left := ispacebetweenshp + 6 * (80 + ispacebetweenshp);

  for i := 1 to 7 do
  begin
    iStatsDay := (inumDay - i + 7) mod 7 + 1;
    case i of
      1: lblStatDay7.Caption := arrDayNames[iStatsDay];
      2: lblStatDay6.Caption := arrDayNames[iStatsDay];
      3: lblStatDay5.Caption := arrDayNames[iStatsDay];
      4: lblStatDay4.Caption := arrDayNames[iStatsDay];
      5: lblStatDay3.Caption := arrDayNames[iStatsDay];
      6: lblStatDay2.Caption := arrDayNames[iStatsDay];
      7: lblStatDay1.Caption := arrDayNames[iStatsDay];
    end;
  end;

  lblStatDay1.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay1.Left := grbStats.Left + shpGraph1.Left + (shpGraph1.Width div 2) - (lblStatDay1.Width div 2);

  lblStatDay2.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay2.Left := grbStats.Left + shpGraph2.Left + (shpGraph2.Width div 2) - (lblStatDay2.Width div 2);

  lblStatDay3.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay3.Left := grbStats.Left + shpGraph3.Left + (shpGraph3.Width div 2) - (lblStatDay3.Width div 2);

  lblStatDay4.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay4.Left := grbStats.Left + shpGraph4.Left + (shpGraph4.Width div 2) - (lblStatDay4.Width div 2);

  lblStatDay5.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay5.Left := grbStats.Left + shpGraph5.Left + (shpGraph5.Width div 2) - (lblStatDay5.Width div 2);

  lblStatDay6.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay6.Left := grbStats.Left + shpGraph6.Left + (shpGraph6.Width div 2) - (lblStatDay6.Width div 2);

  lblStatDay7.Top := grbStats.Top + grbStats.Height + 10;
  lblStatDay7.Left := grbStats.Left + shpGraph7.Left + (shpGraph7.Width div 2) - (lblStatDay7.Width div 2);

  lblStatDate.Caption := formatdatetime('DD MMMM', date - 6) + '  -->  ' + formatdatetime('DD MMMM', date);
  lblStatDate.Left := (grbStats.Width div 2) - (lblStatDate.Width div 2);

  lblShape1.Font.Color := clWhite;
  lblShape2.Font.Color := clWhite;
  lblShape3.Font.Color := clWhite;
  lblShape4.Font.Color := clWhite;
  lblShape5.Font.Color := clWhite;
  lblShape6.Font.Color := clWhite;
  lblShape7.Font.Color := clWhite;

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

procedure TfrmHealth.lblNotificationBadgeClick(Sender: TObject);
begin
  imgNotificationClick(nil);
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

  if (not bPremium) and (iPageController = 5) then
    begin
      pcpages.TabIndex := 4;
      MessageDlg('You have to have premium to view your stats', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      exit;
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
        if tblUsers['GebruikerID'] = strtoint(sUserID)
          then
            begin
              tblUsers.edit;
              tblUsers['Notification'] := sdbnotify;
              tblUsers.Post;

              bfound := true;
            end;


        tblusers.Next;
      end;
  end;

  redtNotifications.Font.Name := 'Roboto';
  redtNotifications.SelAttributes.size := 20;
  redtNotifications.SelAttributes.Style := [TFontStyle.fsBold];
  redtNotifications.Lines.Add('There is no new notifications');

  btbtnReadNotification.Enabled := false;
end;

procedure TfrmHealth.btnCaloriesStatClick(Sender: TObject);
begin
  lblStatTitle.Caption := 'Calories Eaten';
  lblStatTitle.Left := (grbStats.Width div 2) - (lblStatTitle.Width div 2);

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
    begin
      if tblHealthData['GebruikerID'] = strtoint(sUserID)
        then
        begin
          if (tblHealthData['Datum'] = (date - 6)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph1.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph1.Top := 455 - shpGraph1.Height;
                shpGraph1.Brush.Color := clPrimary;

                with lblShape1 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph1.Top;
                  Left := shpGraph1.Left + (shpGraph1.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph1.Height := 10;
                shpGraph1.Top := 455 - shpGraph1.Height;
              end;

          if (tblHealthData['Datum'] = (date - 5)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph2.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph2.Top := 455 - shpGraph2.Height;
                shpGraph2.Brush.Color := clPrimary;

                with lblShape2 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph2.Top;
                  Left := shpGraph2.Left + (shpGraph2.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph2.Height := 10;
                shpGraph2.Top := 455 - shpGraph2.Height;
              end;

          if (tblHealthData['Datum'] = (date - 4)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph3.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph3.Top := 455 - shpGraph3.Height;
                shpGraph3.Brush.Color := clPrimary;

                with lblShape3 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph3.Top;
                  Left := shpGraph3.Left + (shpGraph3.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph3.Height := 10;
                shpGraph3.Top := 455 - shpGraph3.Height;
              end;

          if (tblHealthData['Datum'] = (date - 3)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph4.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph4.Top := 455 - shpGraph4.Height;
                shpGraph4.Brush.Color := clPrimary;

                with lblShape4 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph4.Top;
                  Left := shpGraph4.Left + (shpGraph4.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph4.Height := 10;
                shpGraph4.Top := 455 - shpGraph4.Height;
              end;

          if (tblHealthData['Datum'] = (date - 2)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph5.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph5.Top := 455 - shpGraph5.Height;
                shpGraph5.Brush.Color := clPrimary;

                with lblShape5 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph5.Top;
                  Left := shpGraph5.Left + (shpGraph5.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph5.Height := 10;
                shpGraph5.Top := 455 - shpGraph5.Height;
              end;

          if (tblHealthData['Datum'] = (date - 1)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph6.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph6.Top := 455 - shpGraph6.Height;
                shpGraph6.Brush.Color := clPrimary;

                with lblShape6 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph6.Top;
                  Left := shpGraph6.Left + (shpGraph6.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph6.Height := 10;
                shpGraph6.Top := 455 - shpGraph6.Height;
              end;

          if (tblHealthData['Datum'] = (date)) and (tblHealthData['Calories'] <> 0)
            then
              begin
                shpGraph7.Height := (tblHealthData['Calories'] * 0.08);
                shpGraph7.Top := 455 - shpGraph7.Height;
                shpGraph7.Brush.Color := clPrimary;

                with lblShape7 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Calories']);
                  Top := shpGraph7.Top;
                  Left := shpGraph7.Left + (shpGraph7.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph7.Height := 10;
                shpGraph7.Top := 455 - shpGraph7.Height;
              end;
        end;


      tblHealthData.Next;
    end;
  end;

  GraphShapeNoDataStats(nil);
end;

procedure TfrmHealth.btnHealthDataClick(Sender: TObject);
var

  icountsteps, icountSleep : integer;
  rweight : real;
  bToday, bfound : Boolean;

begin
  bToday := false;
  bfound := false;
  icountsteps := strtoint(inputbox('Steps', 'How many steps did you take today', ''));
  icountsleep := strtoint(inputbox('Sleep', 'How many hours did you sleep?', ''));
  rweight := roundto(strtofloat(inputbox('Weight','What is your weight','')), -1);

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

                  tblHealthData.Edit;

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

          tblHealthData.Last;
          tblHealthData.Insert;

          tblHealthData['GebruikerID'] := suserid;
          tblHealthData['Datum'] := Date();
          tblHealthData['Steps'] := icountsteps;
          tblHealthData['SleepHours'] := icountsleep;
          tblHealthData['Weight'] := rweight;

          tblHealthData.Post;
        end;
  end;

  lblCountSteps.Caption := inttostr(icountsteps);
  lblCountSleep.Caption := inttostr(icountsleep);
  lblCountWeight.Caption := floattostr(rweight);

  lblCountWeight.Left := (grbCalories.Width div 2) - (lblCountWeight.Width div 2);
  //Update Improvements
  LoadImprovements(nil);
end;

procedure TfrmHealth.btnSleepStatClick(Sender: TObject);
begin
  lblStatTitle.Caption := 'Sleep Hours';
  lblStatTitle.Left := (grbStats.Width div 2) - (lblStatTitle.Width div 2);

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
    begin
      if tblHealthData['GebruikerID'] = strtoint(sUserID)
        then
        begin
          if (tblHealthData['Datum'] = (date - 6)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph1.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph1.Top := 455 - shpGraph1.Height;
                shpGraph1.Brush.Color := clPrimary;

                with lblShape1 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph1.Top;
                  Left := shpGraph1.Left + (shpGraph1.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph1.Height := 10;
                shpGraph1.Top := 455 - shpGraph1.Height;
              end;

          if (tblHealthData['Datum'] = (date - 5)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph2.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph2.Top := 455 - shpGraph2.Height;
                shpGraph2.Brush.Color := clPrimary;

                with lblShape2 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph2.Top;
                  Left := shpGraph2.Left + (shpGraph2.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph2.Height := 10;
                shpGraph2.Top := 455 - shpGraph2.Height;
              end;

          if (tblHealthData['Datum'] = (date - 4)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph3.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph3.Top := 455 - shpGraph3.Height;
                shpGraph3.Brush.Color := clPrimary;

                with lblShape3 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph3.Top;
                  Left := shpGraph3.Left + (shpGraph3.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph3.Height := 10;
                shpGraph3.Top := 455 - shpGraph3.Height;
              end;

          if (tblHealthData['Datum'] = (date - 3)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph4.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph4.Top := 455 - shpGraph4.Height;
                shpGraph4.Brush.Color := clPrimary;

                with lblShape4 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph4.Top;
                  Left := shpGraph4.Left + (shpGraph4.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph4.Height := 10;
                shpGraph4.Top := 455 - shpGraph4.Height;
              end;

          if (tblHealthData['Datum'] = (date - 2)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph5.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph5.Top := 455 - shpGraph5.Height;
                shpGraph5.Brush.Color := clPrimary;

                with lblShape5 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph5.Top;
                  Left := shpGraph5.Left + (shpGraph5.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph5.Height := 10;
                shpGraph5.Top := 455 - shpGraph5.Height;
              end;

          if (tblHealthData['Datum'] = (date - 1)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph6.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph6.Top := 455 - shpGraph6.Height;
                shpGraph6.Brush.Color := clPrimary;

                with lblShape6 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph6.Top;
                  Left := shpGraph6.Left + (shpGraph6.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph6.Height := 10;
                shpGraph6.Top := 455 - shpGraph6.Height;
              end;

          if (tblHealthData['Datum'] = (date)) and (tblHealthData['SleepHours'] <> 0)
            then
              begin
                shpGraph7.Height := (tblHealthData['SleepHours'] * 10);
                shpGraph7.Top := 455 - shpGraph7.Height;
                shpGraph7.Brush.Color := clPrimary;

                with lblShape7 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['SleepHours']);
                  Top := shpGraph7.Top;
                  Left := shpGraph7.Left + (shpGraph7.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph7.Height := 10;
                shpGraph7.Top := 455 - shpGraph7.Height;
              end;
        end;


      tblHealthData.Next;
    end;
  end;

  GraphShapeNoDataStats(nil);
end;

procedure TfrmHealth.btnStepsStatClick(Sender: TObject);
begin
  lblStatTitle.Caption := 'Steps Taken';
  lblStatTitle.Left := (grbStats.Width div 2) - (lblStatTitle.Width div 2);

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
    begin
      if tblHealthData['GebruikerID'] = strtoint(sUserID)
        then
        begin
          if (tblHealthData['Datum'] = (date - 6)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph1.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph1.Top := 455 - shpGraph1.Height;
                shpGraph1.Brush.Color := clPrimary;

                with lblShape1 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph1.Top;
                  Left := shpGraph1.Left + (shpGraph1.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph1.Height := 10;
                shpGraph1.Top := 455 - shpGraph1.Height;
              end;

          if (tblHealthData['Datum'] = (date - 5)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph2.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph2.Top := 455 - shpGraph2.Height;
                shpGraph2.Brush.Color := clPrimary;

                with lblShape2 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph2.Top;
                  Left := shpGraph2.Left + (shpGraph2.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph2.Height := 10;
                shpGraph2.Top := 455 - shpGraph2.Height;
              end;

          if (tblHealthData['Datum'] = (date - 4)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph3.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph3.Top := 455 - shpGraph3.Height;
                shpGraph3.Brush.Color := clPrimary;

                with lblShape3 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph3.Top;
                  Left := shpGraph3.Left + (shpGraph3.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph3.Height := 10;
                shpGraph3.Top := 455 - shpGraph3.Height;
              end;

          if (tblHealthData['Datum'] = (date - 3)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph4.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph4.Top := 455 - shpGraph4.Height;
                shpGraph4.Brush.Color := clPrimary;

                with lblShape4 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph4.Top;
                  Left := shpGraph4.Left + (shpGraph4.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph4.Height := 10;
                shpGraph4.Top := 455 - shpGraph4.Height;
              end;

          if (tblHealthData['Datum'] = (date - 2)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph5.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph5.Top := 455 - shpGraph5.Height;
                shpGraph5.Brush.Color := clPrimary;

                with lblShape5 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph5.Top;
                  Left := shpGraph5.Left + (shpGraph5.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph5.Height := 10;
                shpGraph5.Top := 455 - shpGraph5.Height;
              end;

          if (tblHealthData['Datum'] = (date - 1)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph6.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph6.Top := 455 - shpGraph6.Height;
                shpGraph6.Brush.Color := clPrimary;

                with lblShape6 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph6.Top;
                  Left := shpGraph6.Left + (shpGraph6.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph6.Height := 10;
                shpGraph6.Top := 455 - shpGraph6.Height;
              end;

          if (tblHealthData['Datum'] = (date)) and (tblHealthData['Steps'] <> 0)
            then
              begin
                shpGraph7.Height := (tblHealthData['Steps'] * 0.09);
                shpGraph7.Top := 455 - shpGraph7.Height;
                shpGraph7.Brush.Color := clPrimary;

                with lblShape7 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Steps']);
                  Top := shpGraph7.Top;
                  Left := shpGraph7.Left + (shpGraph7.Width div 2) - (Width div 2);
                end;
              end
              else
               begin
                shpGraph7.Height := 10;
                shpGraph7.Top := 455 - shpGraph7.Height;
              end;
        end;


      tblHealthData.Next;
    end;
  end;

  GraphShapeNoDataStats(nil);
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
var

  bFound : Boolean;

begin
  bFound := false;

  if MessageDlg('Are you sure you want to buy Premium' + #13 + 'R500.00 for lifetime Premium',
                  TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo] ,0) = mrYes
    then
      begin
        bPremium := true;

        with dmData do
        begin
          tblUsers.Open;
          tblUsers.First;
          while (not tblUsers.Eof) and (bfound = false) do
            begin
              if tblUsers['GebruikerID'] = strtoint(sUserID)
                then
                  begin
                    tblUsers['HasPremium'] := true;

                    bfound := true;
                  end;


              tblUsers.Next;
            end;
        end;

      end;
end;

procedure TfrmHealth.btnWeightStatClick(Sender: TObject);
begin
  LoadStatsPage(nil);
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
    if (I = 1) or (i = 4) or (i = 5) then continue;

    //Create GroupBox
    grbuserInfo := TGroupBox.Create(pcPages.Pages[i]);
    with grbuserinfo do
    begin
      Parent := pcPages.Pages[i];
      Caption := '';
      Height := 500;
      Width := 350;
      Top := 10;
      Left := pcPages.Width - grbuserinfo.Width - 20;
      OnClick := GoToSettings;
    end;

    //Create Top Bar Image
    imgTopBar := TImage.Create(pcPages.Pages[i]);
    with imgTopBar do
    begin
      Parent := grbuserinfo;
      Left := 0;
      Top := 0;
      Height := 130;
      Width := grbuserinfo.Width;
      Picture.LoadFromFile('images/appBar.png');
      Stretch := true;
    end;

    //Create label for name and van
    lblusername := TLabel.Create(pcPages.Pages[i]);
    with lblUserName do
    begin
      Parent := grbuserInfo;
      Left := 10;
      Top := 10;
      Font.Name := 'Roboto';
      Font.Color := clWhite;
      Font.Size := 28;
      Caption := sname;
    end;

    lblUserVan := TLabel.Create(pcPages.Pages[i]);
    with lblUserVan do
    begin
      Parent := grbuserInfo;
      Left := 10;
      Top := lblusername.Top + lblusername.Height + 10;
      Font.Name := 'Roboto';
      Font.Color := clWhite;
      Font.Size := 28;
      Caption := svan;
    end;

    //Create tennis girl image
    imgGirl := TImage.Create(pcPages.Pages[i]);
    with imgGirl do
    begin
      Parent := grbuserinfo;
      Height := 470;
      Width := floor(grbuserinfo.Width / 1.5);
      Left := grbuserinfo.Width - imggirl.Width;
      Top := 0;
      Picture.LoadFromFile('images/girlTennis.png');
      Stretch := true;
    end;


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
  redtRecipesMade.Clear;
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
              lblWeightTracking.Caption := 'Weight: ' + floattostr(tblHealthData['Weight']);

               if not tblHealthData['Recipes'] = ''
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

  if ssearch = ''
    then
      begin
        MessageDlg('Search Bar is empty, try searching for a food item', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        exit;
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
                  Width := 215;
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

                  iXPos := iXPos + Width + 15;
                end;

              var lblFoodName := TLabel.Create(grbDiet);
              with lblFoodName do
                begin
                  Parent := grbDiet;
                  Font.Name := 'Roboto';
                  Font.Size := 18;
                  Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
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
                  Width := grbDiet.Width - 20;
                  Height := 40;
                  Left := (grbDiet.Width div 2) - (Width div 2);
                  Top := grbDiet.Height - Height - 20;
                  Name := 'btn' + inttostr(tblDiet['FoodID']);
                  OnClick := AddCaloriesClick;
                end;

                var lblServing := TLabel.Create(grbDiet);
                with lblServing do
                begin
                  Parent := grbDiet;
                  Font.Name := 'Roboto';
                  font.Size := 14;
                  Alignment := taCenter;
                  caption := 'One Serving:' + #13 + inttostr(tblDiet['Calories']) + 'cals' + #13 + inttostr(tblDiet['Grams']) + 'g';
                  Top := lblFoodName.Top + lblFoodname.Height + 5;
                  Left := (grbDiet.Width div 2) - (Width div 2);
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

procedure TfrmHealth.imgNotificationClick(Sender: TObject);
var

  snotify, swarning, sNotImportant : string;
  bfound : Boolean;
  itel, ipos : integer;

begin
  bfound := false;
  itel := 1; //begin by die eerste karakter

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
    begin
      if tblUsers['GebruikerID'] = strtoint(sUserID)
        then
          begin
            if pos('1', tblUsers['Notification']) <> 0
              then snotify := tblUsers['Notification']
              else
                begin
                  Showmessage('No new notifications');
                  exit;
                end;

              while snotify <> '' do
                begin
                  ipos := Pos(',', snotify);

                    if ipos > 0 then
                    begin
                      swarning := copy(snotify, 1, ipos - 1);
                      delete(snotify, 1, ipos);
                    end
                    else
                      begin
                        swarning := snotify;
                        snotify := '';
                      end;

                    if swarning[1] = '1' then
                    begin
                      delete(swarning, 1, 1);
                      MessageDlg(swarning, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
                    end
                    else
                      begin
                        if sNotImportant = '' then
                          sNotImportant := swarning
                        else
                          sNotImportant := sNotImportant + ',' + swarning;
                      end;
                end;

              bfound := true;

              tblUsers.Edit;
              tblUsers['Notification'] := sNotImportant;
              tblUsers.Post;
          end;

      tblUsers.Next;
    end;
  end;

  GetNotifications(nil);

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

  sline, ssearch, srecipename, singredients : string;
  iYpos, icountSCBItems, itellrecipe : integer;

begin
  ssearch := edtSearchRecipe.Text;
  redtRecipe.Visible := false;
  scbRecipes.Visible := true;
  lbRecipes.Visible := false;
  iypos := 20;
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

  if ssearch = ''
    then
      begin
        MessageDlg('Search Bar is empty, try searching for a recipe', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        exit;
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
          with grbRecipe do
          begin
            Parent := scbRecipes;
            Caption := '';
            Height := 200;
            Width := scbRecipes.Width - 40;
            Top := iypos;
            Left := 20;

            iYPos := iYPos + (Height) + 20;
          end;

          srecipename := copy(sline, 1, pos('#', sline) - 1);
          delete(sline, 1, length(srecipename) + 1);
          singredients := copy(sline, 1, pos('#', sline) - 1);

          var lblRecipeName := TLabel.Create(grbRecipe);
          with lblRecipeName do
          begin
            Parent := grbRecipe;
            font.Name := 'Roboto';
            Font.Size := 22;
            Font.style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
            Caption := srecipename;

            Top := 20;
            Left := (grbRecipe.Width div 2) - (Width div 2);
          end;

          var btnRecipe := TButton.Create(grbRecipe);
          with btnRecipe do
          begin
            Parent := grbRecipe;
            font.Name := 'Roboto';
            Font.Size := 18;
            Font.style := [TFontStyle.fsBold];
            caption := 'Let`s Make This';
            Width := grbRecipe.Width - 40;
            Height := 50;
            top := grbRecipe.Height - Height - 20;
            Left := (grbRecipe.Width div 2) - (Width div 2);
            Name := 'btn' + inttostr(itellrecipe);
            OnClick := addRecipe;
          end;

          var lblIngredients := TLabel.Create(grbRecipe);
          with lblIngredients do
          begin
            Parent := grbRecipe;
            Font.Name := 'Roboto';
            Font.Size := 14;
            Alignment := taCenter;
            Caption := 'Ingredients:' + #13 + singredients;
            Top := lblRecipeName.Top + lblRecipeName.Height + 10;
            Left := (grbRecipe.Width div 2) - (Width div 2);
          end;
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
  if pos('STAT', sfindpage) > 0 then pcPages.TabIndex := 5;

  pcPagesChange(nil);

end;

procedure TfrmHealth.imgSettingsClick(Sender: TObject);
begin
  iPages := 1;
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
  bfound, bNewRecord : Boolean;
  iservings : integer;

begin
  bfound := false;
  iservings := 0;
  btnClickedButton := Sender as TButton;
  sFoodName := btnClickedButton.Name;
  delete(sfoodname, 1, 3);
  bNewRecord := false;

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

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
      begin
        if tblHealthData['Datum'] = date
          then bNewRecord := false
          else bNewRecord := true;

        tblHealthData.Next;
      end;

    if bNewRecord
      then
      begin
        tblHealthData.Last;
        tblHealthData.Insert;

        tblHealthData['GebruikerID'] := strtoint(suserid);
        tblHealthData['Datum'] := Date();
        tblHealthData['Calories'] := itotalCalories;

        tblHealthData.Post;
      end
      else
        begin
          if tblHealthData['Datum'] = date
            then
            begin
              tblHealthData.Edit;
              tblHealthData['Calories'] := itotalCalories;
              tblHealthData.Post;
            end;

        end;

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

  //Load Health data
  LoadFatLossHealthData(nil);
  LoadImprovements(nil);
end;

procedure TfrmHealth.LoadFatLossHealthData(Sender: TObject);
var

  bTodayExists, bYesterdayExists : Boolean;

begin
  //Hierso het ons nie n "bfound" nie want ek wil die laaste record check
  bTodayExists := true;
  bYesterdayExists := true;

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
                    bTodayExists := false;

                    lblCountSteps.Caption := inttostr(tblHealthData['Steps']);
                    lblCountSleep.Caption := inttostr(tblHealthData['SleepHours']);
                    lblCountWeight.Caption := floattostr(tblHealthData['Weight']) + ' kg';

                    lblCountWeight.Left := (grbCalories.Width div 2) - (lblCountWeight.Width div 2);
                  end
                  else
                    begin
                      if tblHealthData['Datum'] = date - 1
                        then
                          begin
                            bTodayExists := false;

                            lblCountSteps.Caption := inttostr(tblHealthData['Steps']);
                            lblCountSleep.Caption := inttostr(tblHealthData['SleepHours']);
                            lblCountWeight.Caption := floattostr(tblHealthData['Weight']) + ' kg';

                            lblCountWeight.Left := (grbCalories.Width div 2) - (lblCountWeight.Width div 2);
                          end;
                    end;

            end;

        tblHealthData.Next;
      end;

  end;


  if bTodayExists and bYesterdayExists
    then
      begin
        lblCountSleep.Caption := 'No Data';
        lblCountSteps.Caption := 'No Data';
        lblCountWeight.Caption := 'No Data';

        lblCountWeight.Left := (grbCalories.Width div 2) - (lblCountWeight.Width div 2);
      end;

end;

procedure TfrmHealth.LoadImprovements(Sender: TObject);
var

  iPrevCals, iCals : integer;
  iPrevSteps, iSteps : integer;
  iPrevSleep, iSleep : integer;
  rPrevWeight, rWeight : real;
  bEmpty, bTodayExists : Boolean;

begin
  bEmpty := false;
  bTodayExists := false;
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
        if tblHealthData['GebruikerID'] = strtoint(sUserID)
          then
            begin
              if tblHealthData['Datum'] = date
                then
                  begin
                    bTodayExists := false;

                    if (tblHealthData['Weight'] = 0) and
                       (tblHealthData['SleepHours'] = 0) and
                       (tblHealthData['Steps'] = 0) then
                      begin
                        bEmpty := True;
                        break;
                      end
                      else
                      begin
                        iCals := tblHealthData['Calories'];
                        iSleep := tblHealthData['SleepHours'];
                        iSteps := tblHealthData['Steps'];
                        rWeight := tblHealthData['Weight'];
                      end;
                  end
                  else bTodayExists := true;

              if tblHealthData['Datum'] = date - 1
                then
                  begin
                    if (tblHealthData['Weight'] = 0) and
                       (tblHealthData['SleepHours'] = 0) and
                       (tblHealthData['Steps'] = 0) then
                      begin
                        bEmpty := True;
                        break;
                      end
                      else
                      begin
                        iPrevCals := tblHealthData['Calories'];
                        iPrevSleep := tblHealthData['SleepHours'];
                        iPrevSteps := tblHealthData['Steps'];
                        rPrevWeight := tblHealthData['Weight'];
                      end;

                  end;

            end;

        tblHealthData.next;
      end;
  end;

  if bEmpty
  then
  begin
    lblCalsImproved.Caption := 'Not Enough Info';
    lblSleepImproved.Caption := 'Not Enough Info';
    lblStepsImproved.Caption := 'Not Enough Info';
    lblWeightImproved.Caption := 'Not Enough Info';

    imgArrowCals.Visible := false;
    imgArrowSteps.Visible := false;
    imgArrowSleep.Visible := false;
    imgArrowWeight.Visible := false;
  end
    else
      begin
        lblCalsImproved.Caption := inttostr(iCals - iPrevCals);
        lblSleepImproved.Caption := inttostr(iSleep - iPrevSleep);
        lblStepsImproved.Caption := inttostr(iSteps - iPrevSteps);
        lblWeightImproved.Caption := floattostr(roundto(rWeight - rPrevWeight, -1));

        imgArrowCals.Top := lblCalsImproved.Top + 5;
        imgArrowCals.Left := lblCalsImproved.Left + lblCalsImproved.Width + 20;

        imgArrowSteps.Top := lblStepsImproved.Top + 5;
        imgArrowSteps.Left := lblStepsImproved.Left + lblStepsImproved.Width + 20;

        imgArrowSleep.Top := lblSleepImproved.Top + 5;
        imgArrowSleep.Left := lblSleepImproved.Left + lblSleepImproved.Width + 20;

        imgArrowWeight.Top := lblWeightImproved.Top + 5;
        imgArrowWeight.Left := lblWeightImproved.Left + lblWeightImproved.Width + 20;

        if icals - iprevcals > 0
          then imgArrowCals.Picture.LoadFromFile('images/arrowUp.png')
          else imgArrowCals.Picture.LoadFromFile('images/arrowDown.png');

        if isleep - iprevsleep > 0
          then imgArrowSleep.Picture.LoadFromFile('images/arrowUp.png')
          else imgArrowSleep.Picture.LoadFromFile('images/arrowDown.png');

        if isteps - iprevsteps > 0
          then imgArrowSteps.Picture.LoadFromFile('images/arrowUp.png')
          else imgArrowSteps.Picture.LoadFromFile('images/arrowDown.png');

        if roundto(rWeight - rPrevWeight, -1) > 0
          then imgArrowWeight.Picture.LoadFromFile('images/arrowUp.png')
          else imgArrowWeight.Picture.LoadFromFile('images/arrowDown.png');
      end;

  if bTodayExists
    then
      begin
        lblCalsImproved.Caption := 'No Data';
        lblSleepImproved.Caption := 'No Data';
        lblStepsImproved.Caption := 'No Data';
        lblWeightImproved.Caption := 'No Data';

        imgArrowCals.Visible := false;
        imgArrowSteps.Visible := false;
        imgArrowSleep.Visible := false;
        imgArrowWeight.Visible := false;
      end;

end;

procedure TfrmHealth.GetNotifications(Sender: TObject);
var

  bfound : boolean;
  snotify, sline : string;
  ipos, itelNotifys : integer;

begin
  bfound := false;
  sline := '';
  sdbnotify := '';
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
                    snotify := tblUsers['Notification'];

                    while snotify <> '' do
                    begin
                      ipos := pos(',', snotify);

                      if ipos > 0
                        then
                        begin
                          sline := copy(snotify, 1, ipos - 1);
                          delete(snotify, 1, ipos);
                        end
                        else
                          begin
                            sline := snotify;
                            snotify := '';
                          end;

                      if sline[1] = '1'
                        then
                        begin
                          if sDBnotify = ''
                            then sDBnotify := sline
                            else sDBnotify := sDBnotify + ',' + sline;
                        end
                        else
                          begin
                            redtNotifications.Lines.Add(sline);
                          end;
                    end;

                    btbtnReadNotification.Enabled := true;
                  end
                else
                  begin
                    btbtnReadNotification.Enabled := false;
                    redtNotifications.SelAttributes.Name := 'Roboto';
                    redtNotifications.SelAttributes.size := 20;
                    redtNotifications.SelAttributes.Style := [TFontStyle.fsBold];
                    redtNotifications.Lines.Add('There is no new notifications');
                  end;

              bfound := true;
            end;


        tblusers.Next;
      end;


    //Check for important notificaitons
    if sDBNotify <> ''
      then
        begin
          lblNotificationBadge.Visible := true;
          itelNotifys := pos(',', sDBNotify) + 1;
          lblNotificationBadge.Caption := inttostr(itelNotifys);
        end
      else lblNotificationBadge.Visible := false;

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
              lblWeightTracking.Caption := 'Weight: ' + floattostr(tblHealthData['Weight']);

              if not tblHealthData['Recipes'] = ''
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

procedure TfrmHealth.LoadStatsPage(Sender: TObject);
begin
  lblStatTitle.Caption := 'Weight';
  lblStatTitle.Top := 0;
  lblStatTitle.Left := (grbStats.Width div 2) - (lblStatTitle.Width div 2);


  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
    begin
      if tblHealthData['GebruikerID'] = strtoint(sUserID)
        then
        begin
          if (tblHealthData['Datum'] = (date - 6)) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph1.Height := (tblHealthData['Weight'] * 3);
                shpGraph1.Top := 455 - shpGraph1.Height;
                shpGraph1.Brush.Color := clPrimary;

                with lblShape1 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph1.Top;
                  Left := shpGraph1.Left + (shpGraph1.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph1.Height := 10;
                shpGraph1.Top := 455 - shpGraph1.Height;
              end;

          if (tblHealthData['Datum'] = (date - 5)) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph2.Height := (tblHealthData['Weight'] * 3);
                shpGraph2.Top := 455 - shpGraph2.Height;
                shpGraph2.Brush.Color := clPrimary;

                with lblShape2 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph2.Top;
                  Left := shpGraph2.Left + (shpGraph2.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph2.Height := 10;
                shpGraph2.Top := 455 - shpGraph2.Height;
              end;

          if (tblHealthData['Datum'] = (date - 4)) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph3.Height := (tblHealthData['Weight'] * 3);
                shpGraph3.Top := 455 - shpGraph3.Height;
                shpGraph3.Brush.Color := clPrimary;

                with lblShape3 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph3.Top;
                  Left := shpGraph3.Left + (shpGraph3.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph3.Height := 10;
                shpGraph3.Top := 455 - shpGraph3.Height;
              end;

          if (tblHealthData['Datum'] = (date - 3)) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph4.Height := (tblHealthData['Weight'] * 3);
                shpGraph4.Top := 455 - shpGraph4.Height;
                shpGraph4.Brush.Color := clPrimary;

                with lblShape4 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph4.Top;
                  Left := shpGraph4.Left + (shpGraph4.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph4.Height := 10;
                shpGraph4.Top := 455 - shpGraph4.Height;
              end;

          if (tblHealthData['Datum'] = (date - 2)) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph5.Height := (tblHealthData['Weight'] * 3);
                shpGraph5.Top := 455 - shpGraph5.Height;
                shpGraph5.Brush.Color := clPrimary;

                with lblShape5 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph5.Top;
                  Left := shpGraph5.Left + (shpGraph5.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph5.Height := 10;
                shpGraph5.Top := 455 - shpGraph5.Height;
              end;

          if (tblHealthData['Datum'] = (date - 1)) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph6.Height := (tblHealthData['Weight'] * 3);
                shpGraph6.Top := 455 - shpGraph6.Height;
                shpGraph6.Brush.Color := clPrimary;

                with lblShape6 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph6.Top;
                  Left := shpGraph6.Left + (shpGraph6.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph6.Height := 10;
                shpGraph6.Top := 455 - shpGraph6.Height;
              end;

          if (tblHealthData['Datum'] = date) and (tblHealthData['Weight'] <> 0)
            then
              begin
                shpGraph7.Height := (tblHealthData['Weight'] * 3);
                shpGraph7.Top := 455 - shpGraph7.Height;
                shpGraph7.Brush.Color := clPrimary;

                with lblShape7 do
                begin
                  Font.Color := clWhite;
                  Caption := floattostr(tblHealthData['Weight']);
                  Top := shpGraph7.Top;
                  Left := shpGraph7.Left + (shpGraph7.Width div 2) - (Width div 2);
                end;
              end
              else
              begin
                shpGraph7.Height := 10;
                shpGraph7.Top := 455 - shpGraph7.Height;
              end;
        end;


      tblHealthData.Next;
    end;
  end;

  GraphShapeNoDataStats(nil);

end;

procedure TfrmHealth.LoadTodayCalories(Sender: TObject);
begin

  with dmData do
  begin
    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
    begin
      if tblHealthData['Datum'] = date
        then
          begin
            lblNumberCalories.Caption := inttostr(tblHealthData['Calories']);
            itotalCalories := tblHealthData['Calories'];
          end
          else
          begin
            lblNumberCalories.Caption := '0';
            itotalCalories := 0;
          end;


      tblHealthData.Next;
    end;

  end;

end;

procedure TfrmHealth.GraphShapeNoDataStats(Sender: TObject);
begin
  if (shpGraph1.Height = 50) or (shpGraph1.Height = 10)
    then
      begin
        shpGraph1.Height := 10;
        shpGraph1.Top := grbStats.Height - shpGraph1.Height;
        shpGraph1.Brush.Color := clSecondary;

        with lblShape1 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph1.Top - Height;
          Left := shpGraph1.Left + (shpGraph1.Width div 2) - (Width div 2);
        end;
      end;

  if (shpGraph2.Height = 50) or (shpGraph2.Height = 10)
    then
      begin
        shpGraph2.Height := 10;
        shpGraph2.Top := grbStats.Height - shpGraph2.Height;
        shpGraph2.Brush.Color := clSecondary;

        with lblShape2 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph2.Top - Height;
          Left := shpGraph2.Left + (shpGraph2.Width div 2) - (Width div 2);
        end;
      end;

  if (shpGraph3.Height = 50) or (shpGraph3.Height = 10)
    then
      begin
        shpGraph3.Height := 10;
        shpGraph3.Top := grbStats.Height - shpGraph3.Height;
        shpGraph3.Brush.Color := clSecondary;

        with lblShape3 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph3.Top - Height;
          Left := shpGraph3.Left + (shpGraph3.Width div 2) - (Width div 2);
        end;
      end;

  if (shpGraph4.Height = 50) or (shpGraph4.Height = 10)
    then
      begin
        shpGraph4.Height := 10;
        shpGraph4.Top := grbStats.Height - shpGraph4.Height;
        shpGraph4.Brush.Color := clSecondary;

        with lblShape4 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph4.Top - Height;
          Left := shpGraph4.Left + (shpGraph4.Width div 2) - (Width div 2);
        end;
      end;

  if (shpGraph5.Height = 50) or (shpGraph5.Height = 10)
    then
      begin
        shpGraph5.Height := 10;
        shpGraph5.Top := grbStats.Height - shpGraph5.Height;
        shpGraph5.Brush.Color := clSecondary;

        with lblShape5 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph5.Top - Height;
          Left := shpGraph5.Left + (shpGraph5.Width div 2) - (Width div 2);
        end;
      end;

  if (shpGraph6.Height = 50) or (shpGraph6.Height = 10)
    then
      begin
        shpGraph6.Height := 10;
        shpGraph6.Top := grbStats.Height - shpGraph6.Height;
        shpGraph6.Brush.Color := clSecondary;

        with lblShape6 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph6.Top - Height;
          Left := shpGraph6.Left + (shpGraph6.Width div 2) - (Width div 2);
        end;
      end;

  if (shpGraph7.Height = 50) or (shpGraph7.Height = 10)
    then
      begin
        shpGraph7.Height := 10;
        shpGraph7.Top := grbStats.Height - shpGraph7.Height;
        shpGraph7.Brush.Color := clSecondary;

        with lblShape7 do
        begin
          Caption := 'No Data';
          Font.Color := clBlack;
          Top := shpGraph7.Top - Height;
          Left := shpGraph7.Left + (shpGraph7.Width div 2) - (Width div 2);
        end;
      end;
end;

end.

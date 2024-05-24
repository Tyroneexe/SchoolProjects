unit frmSettings_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, dmData_u, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.DateUtils;

type
  TfrmSettings = class(TForm)
    MainMenu: TMainMenu;
    mmFile: TMenuItem;
    ConnectFile: TMenuItem;
    mmEdit: TMenuItem;
    mmView: TMenuItem;
    ChangeName: TMenuItem;
    ViewFile: TMenuItem;
    ViewUser: TMenuItem;
    AddUser: TMenuItem;
    ChangeUsersName: TMenuItem;
    RemoveUser: TMenuItem;
    pcPages: TPageControl;
    tsProfile: TTabSheet;
    tsAdminInfo: TTabSheet;
    tsSettings: TTabSheet;
    dbgUsers: TDBGrid;
    MakeaUserAdmin: TMenuItem;
    lblUserInfo: TLabel;
    imgUserInfoBack: TImage;
    imgGirl: TImage;
    lblName: TLabel;
    lblEmail: TLabel;
    lblDate: TLabel;
    lblGeslag: TLabel;
    btbtnClose: TBitBtn;
    imgGirl2: TImage;
    btnHomePage: TButton;
    btnOrder: TButton;
    btnAdmin: TButton;
    btnEmails: TButton;
    btnViewGrid: TButton;
    PushNotification: TMenuItem;
    lblAge: TLabel;
    lblWeight: TLabel;
    btbtnSignOut: TBitBtn;
    btbtnDeleteAcc: TBitBtn;
    Label1: TLabel;
    btnAskAdmin: TButton;
    btnChangeName: TButton;
    btnChangeEmail: TButton;
    btnNotifyAdmins: TButton;
    procedure ConnectFileClick(Sender: TObject);
    procedure ChangeNameClick(Sender: TObject);
    procedure ViewFileClick(Sender: TObject);
    procedure ViewUserClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgUserInfoBackClick(Sender: TObject);
    //My functions
    procedure PreviousPage(Sender: TObject);
    procedure GetUserDetails(Sender: TObject);
    //
    procedure pcPagesChange(Sender: TObject);
    procedure AddUserClick(Sender: TObject);
    procedure ChangeUsersNameClick(Sender: TObject);
    procedure RemoveUserClick(Sender: TObject);
    procedure MakeaUserAdminClick(Sender: TObject);
    procedure btbtnSignOutClick(Sender: TObject);
    procedure btnHomePageClick(Sender: TObject);
    procedure btnDeleteAccClick(Sender: TObject);
    procedure btnOrderClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure btnEmailsClick(Sender: TObject);
    procedure btnViewGridClick(Sender: TObject);
    procedure PushNotificationClick(Sender: TObject);
    procedure btbtnDeleteAccClick(Sender: TObject);
    procedure btnChangeNameClick(Sender: TObject);
    procedure btnChangeEmailClick(Sender: TObject);
    procedure btnAskAdminClick(Sender: TObject);
    procedure btnNotifyAdminsClick(Sender: TObject);
    //
  private
    { Private declarations }
    tfile : textfile;
    bAdmin, bOrder, bdbgrid : Boolean;
    sDBGrid, sname : string;
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.dfm}

uses frmSignUp_u, frmHealthHarmony_u;

procedure TfrmSettings.AddUserClick(Sender: TObject);
var

  sname, semail, sdate, sgeslag, spassword, sadmin : string;
  bisadmin : Boolean;

begin

  sname := inputbox('Name','What is the user`s full name?','');
  semail := inputbox('Email','What is the user`s email','');
  sdate := inputbox('Birth Date','When was the user born?' + #13 + 'Format: yyyy/mm/dd','');
  sgeslag := inputbox('Gender','What is the gender of the ','');
  sadmin := inputbox('Admin','Is this user an admin?','');
  spassword := inputbox('Password','What is the user`s password','');

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.Edit;
    tblUsers.Last;
    tblUsers.Insert;

    tblUsers['Naam'] := sname;
    tblUsers['Van'] := sname;
    tblUsers['Epos'] := semail;
    tblUsers['GeboorteDatum'] := sdate;
    tblUsers['Geslag'] := sgeslag;
    tblUsers['isAdmin'] := sadmin;
    tblUsers['Password'] := spassword;

    tblUsers.Post;
  end;

  Showmessage('Successfully added a user');
end;

procedure TfrmSettings.btbtnDeleteAccClick(Sender: TObject);
var

  bfound : Boolean;

begin
  bfound := false;

  if MessageDlg('Are your sure you want to delete your account?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes
    then
      begin
        with dmData do
        begin
          tblUsers.Open;
          tblUsers.First;
          while (not tblusers.Eof) and (bfound = false) do
            begin
              if tblUsers['GebruikerID'] = strtoint(sUserID)
                then
                  begin
                    tblUsers.Delete;
                    showmessage('Successfully deleted your account');
                    frmSettings.Hide;
                    frmSignUp.Show;
                  end;

              tblUsers.Next;
            end;
        end;
      end
      else
        exit;

  if bfound = false
    then Showmessage('No User was found');
end;

procedure TfrmSettings.btbtnSignOutClick(Sender: TObject);
begin
  dmData.sUserID := '0'; //remove
  frmSettings.Hide;
  frmSignUp.Show;
end;

procedure TfrmSettings.btnAdminClick(Sender: TObject);
begin
  with dmData do
        begin
          qryData.Active := false;
          qryData.sql.Text := 'select * from tblUsers where isAdmin = True';
          qryData.Active := true;
        end;
end;

procedure TfrmSettings.btnAskAdminClick(Sender: TObject);
var

  bfound : Boolean;

begin

  if MessageDlg('Do you want to ask for admin?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbNo, TMsgDlgBtn.mbYes], 0) = mrYes
    then
      begin
        with dmData do
        begin
          tblUsers.Open;
          tblUsers.First;
          while (not tblUsers.Eof) and (bfound = false) do
            begin
              if tblUsers['isAdmin'] = 'True'
                then
                  begin
                    tblUsers.Edit;
                    tblUsers['Notification'] := 'User ' + sname + ' wants admin privileges';
                    tblUsers.Post;

                    bfound := true;
                  end;

              tblUsers.Next;
            end;
        end;
      end;

end;

procedure TfrmSettings.btnChangeEmailClick(Sender: TObject);
var

  bfound : Boolean;
  snewemail : string;

begin
  bfound := false;
  snewemail := inputbox('Change Name','What would you like your new user name to be?','');

  with dmData do
  begin
    tblUsers.open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = sUserID
          then
            begin
              tblUsers.Edit;
              tblUsers['Epos'] := snewemail;
              tblUsers.Post;

              bfound := true;
            end;

        tblUsers.Next;
      end;
  end;

  if bfound
    then //rebuild user details after changing them
      GetUserDetails(nil);

end;

procedure TfrmSettings.btnChangeNameClick(Sender: TObject);
begin
  ChangeNameClick(nil);
end;

procedure TfrmSettings.btnDeleteAccClick(Sender: TObject);
var

  bfound : Boolean;

begin
  bfound := false;

  if MessageDlg('Are your sure you want to delete your account?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes
    then
      begin
        with dmData do
        begin
          tblUsers.Open;
          tblUsers.First;
          while (not tblusers.Eof) and (bfound = false) do
            begin
              if tblUsers['GebruikerID'] = strtoint(sUserID)
                then
                  begin
                    tblUsers.Delete;
                    showmessage('Successfully deleted your account');
                    frmSettings.Hide;
                    frmSignUp.Show;
                  end;

              tblUsers.Next;
            end;
        end;
      end
      else
        exit;

  if bfound = false
    then Showmessage('No User was found');
end;

procedure TfrmSettings.btnEmailsClick(Sender: TObject);
var

  semail : string;
  I: Integer;

begin
  semail := inputbox('View Email', 'Which emails do you want to see', '@gmail.com');


//  for I := 1 to length(semail) do
  for I := length(semail) downto 1 do
  begin
    if semail[i] = '@'
      then
        begin
          delete(semail, i, 1);
        end;
    if semail[i] = '.'
      then
        begin
          delete(semail, i, length(semail));
        end;
  end;

 with dmData do
    begin
      qryData.Active := false;
      qryData.sql.Text := 'select * from tblUsers where Epos like ' + QuotedStr('%' + semail + '%');
      qryData.Active := true;
    end;
end;

procedure TfrmSettings.btnHomePageClick(Sender: TObject);
begin
  frmSettings.Hide;
  frmHealth.Show;
end;

procedure TfrmSettings.btnNotifyAdminsClick(Sender: TObject);
var

  snotify : string;
  icounter : integer;

begin
  snotify := inputbox('Notify Admins', 'What do you want to notify all the admins', '');
  icounter := 0;

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while not tblUsers.Eof do
      begin
        if tblUsers['isAdmin'] = 'True'
          then
            begin
              if not tblUsers['GebruikerID'] = strtoint(sUserID)
                then
                  begin
                    tblUsers.Edit;
                    tblUsers['Notification'] := tblUsers['Notification'] + ',' + snotify;
                    tblUsers.Post;

                    inc(icounter);
                  end;
            end;

        tblUsers.Next;
      end;
  end;

  Showmessage('Notified ' + inttostr(icounter) + ' admins');

end;

procedure TfrmSettings.btnOrderClick(Sender: TObject);
var

  scolumName : string;

begin
  if sdbgrid = 'tblUsers'
    then scolumName := 'Naam'
    else scolumName := 'FoodName';

  if border = false
  then
    begin
      btnOrder.Caption := 'Ascending';
      border := true;

      with dmData do
      begin
        qryData.Active := false;
        qryData.sql.Text := 'select * from ' + sdbGrid + ' order by ' + scolumname + ' DESC';
        qryData.Active := true;
      end;
    end
    else
      begin
        btnOrder.Caption := 'Descending';
        border := false;

        with dmData do
        begin
          qryData.Active := false;
          qryData.sql.Text := 'select * from ' + sdbGrid + ' order by ' + scolumname + ' ASC';
          qryData.Active := true;
        end;
      end;
end;

procedure TfrmSettings.btnViewGridClick(Sender: TObject);
begin

  if bdbgrid = false then
  begin
    sdbgrid := 'tblDiet';
    btnViewGrid.Caption := 'See Users';
    bdbgrid := true;

    with dmData do
    begin
      qryData.Active := false;
      qryData.sql.Text := 'select * from ' + sdbgrid;
      qryData.Active := true;
    end;
  end
  else
    begin
      sdbgrid := 'tblUsers';
      btnViewGrid.Caption := 'See Food';
      bdbgrid := false;

    with dmData do
      begin
        qryData.Active := false;
        qryData.sql.Text := 'select * from ' + sdbgrid;
        qryData.Active := true;
      end;
    end;
end;

procedure TfrmSettings.ChangeNameClick(Sender: TObject);
var

  bfound : Boolean;
  snewname : string;

begin
  bfound := false;
  snewname := inputbox('Change Name','What would you like your new user name to be?','');

  with dmData do
  begin
    tblUsers.open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = sUserID
          then
            begin
              tblUsers.Edit;
              tblUsers['Naam'] := snewname;
              tblUsers.Post;

              bfound := true;
            end;

        tblUsers.Next;
      end;
  end;

  if bfound
    then //rebuild user details after changing them
      GetUserDetails(nil);

end;

procedure TfrmSettings.ChangeUsersNameClick(Sender: TObject);
var

  susername, snewname : string;
  bfound, bSearchName : Boolean;
  iuserID : integer;

begin
  susername := inputbox('Name','What is the user`s name or ID?','');
  bfound := false;
  bSearchName := false;
  snewname := inputbox('New Name', 'What should the user`s new name be?', '');

  try
    iuserID := strtoint(susername);
  except
    iUserID := 0;
    bSearchName := true;
  end;

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if bSearchName
          then
            begin
              if tblUsers['Naam'] = susername
                then
                  begin
                    tblUsers.Edit;
                    tblusers['Naam'] := snewname;
                    tblUsers.Post;
                    bfound := true;
                    Showmessage('Successfully Changed user`s name');
                  end;

            end
            else
            begin
              if tblUsers['GebruikerID'] = iUserID
                then
                  begin
                    tblUsers.Edit;
                    tblusers['Naam'] := snewname;
                    tblUsers.Post;
                    bfound := true;
                    Showmessage('Successfully Changed user`s name');
                  end
            end;

        tblUsers.Next;
      end;

  end;

  if bfound = false
    then Showmessage('No User was found');
end;

procedure TfrmSettings.ConnectFileClick(Sender: TObject);
var

  sfilename : string;

begin

  sfilename := inputbox('File','What file do you want to connect?','');

  if pos('.txt', sfilename) = 0
    then
      insert('.txt', sfilename, length(sfilename) + 1);

  showmessage(sfilename);

  if fileexists(sfilename)
    then
      begin
        assignfile(tfile, sfilename);
        Showmessage('File "' + sfilename + '" connected successfully');
      end
      else
        showmessage('No files found');
end;

procedure TfrmSettings.FormActivate(Sender: TObject);
var

  bfound : Boolean;

begin
  //Initialize vars
  pcPages.TabIndex := frmHealth.iPages;
  bfound := false;
  badmin := false;
  dmData.sUserID := '1'; //remove
  GetUserDetails(nil);

  with dmData do
  begin
    tblUsers.open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = sUserID
          then
            begin
              if tblUsers['isAdmin'] = 'True'
                then
                  badmin := true;
            end;

        tblUsers.Next;
      end;
  end;

  if (badmin = false)
    then
    begin
      Adduser.Enabled := false;
      ChangeUsersName.Enabled := false;
      Removeuser.Enabled := false;
      Viewuser.Enabled := false;
      MakeaUserAdmin.Enabled := false;
      PushNotification.Enabled := false;
    end
    else
      begin
        btnAskAdmin.Enabled := false;
      end;

end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  //Initialize vars
  pcPages.TabIndex := 0;
  sDBGrid := 'tblUsers';
  bdbgrid := false;
  bOrder := false;

  //Load Images
  imgUserInfoBack.Picture.LoadFromFile('images/back.png');
  imgUserInfoBack.Stretch := true;
  imgGirl.Picture.LoadFromFile('images/girlTennis.png');
  imgGirl.Stretch := true;
  imgGirl2.Picture.LoadFromFile('images/girlTennis.png');
  imgGirl2.Stretch := true;

  //Size and Position

end;

procedure TfrmSettings.imgUserInfoBackClick(Sender: TObject);
begin
  PreviousPage(nil);
end;

procedure TfrmSettings.MakeaUserAdminClick(Sender: TObject);
var

  susername, snewname : string;
  bfound, bSearchName : Boolean;
  iuserID : integer;

begin
  susername := inputbox('Name','What is the user`s name or ID?','');
  bfound := false;
  bSearchName := false;

  try
    iuserID := strtoint(susername);
  except
    iUserID := 0;
    bSearchName := true;
  end;

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if bSearchName
          then
            begin
              if tblUsers['Naam'] = susername
                then
                  begin
                    tblusers.Edit;
                    tblUsers['isAdmin'] := True;
                    tblUsers.Post;
                    bfound := true;
                    Showmessage('Successfully made user admin');
                  end;

            end
            else
            begin
              if tblUsers['GebruikerID'] = iUserID
                then
                  begin
                    tblusers.Edit;
                    tblUsers['isAdmin'] := True;
                    tblUsers.Post;
                    bfound := true;
                    Showmessage('Successfully made user admin');
                  end
            end;

        tblUsers.Next;
      end;

  end;

  if bfound = false
    then Showmessage('No User was found');
end;

procedure TfrmSettings.pcPagesChange(Sender: TObject);
begin
  if pcPages.TabIndex = pcPages.PageCount - 1
    then
      begin
        if badmin = false
          then
            begin
              pcPages.TabIndex := pcPages.PageCount - 2;
              MessageDlg('You need to be admin to view user`s info', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
            end;
      end;

end;

procedure TfrmSettings.ViewFileClick(Sender: TObject);
var

  arrFiles : array[1..2] of string;
  I: Integer;

begin
  arrFiles[1] := 'UserWorkout';
  arrFiles[2] := 'Recipes';

  //Gebruik "Low" en "High" om die nommer te kry
  for I := Low(arrFiles) to High(arrFiles) do
  begin
    //Gebruik I om die huidige nommer te wys
    showMessage(arrFiles[I]);
  end;
end;

procedure TfrmSettings.ViewUserClick(Sender: TObject);
var

  bfound, bsearchname : Boolean;
  susername : string;
  iuserid : integer;

begin
  bfound := false;
  bsearchname := false;
  pcPages.TabIndex := 2;
  susername := inputbox('User Name','Search for the name or id of the user you want to view','');

  try
    iuserid := strtoint(susername);
  except
    iuserid := 0;
    bsearchname := true;
  end;

  with dmData do
  begin
    if bsearchname
      then
      begin
        qryData.Active := false;
        qryData.sql.Text := 'select * from tblUsers where Naam like ' + QuotedStr('%' + susername + '%');
        qryData.Active := true;
      end
      else
        begin
          qryData.Active := false;
          qryData.sql.Text := 'select * from tblUsers where GebruikerID = ' + inttostr(iuserid);
          qryData.Active := true;
        end;
  end;
end;

procedure TfrmSettings.PreviousPage(Sender: TObject);
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
              if bAdmin
                then
                  pcpages.TabIndex := pcPages.PageCount - 1
                else
                  pcpages.TabIndex := pcPages.PageCount - 2;
            end
          else
            pcpages.TabIndex := pcpages.TabIndex - 1;
      end;
end;

procedure TfrmSettings.PushNotificationClick(Sender: TObject);
var

  bfound, bSearchName : Boolean;
  snotification, suser : string;
  iuser, icounter : integer;

begin
  if MessageDlg('Do you want to send a notification to all users?', TMsgDlgType.mtConfirmation, [mbNo, mbAll], 0) = mrAll
    then
    begin
      snotification := inputbox('Notification','What message do you want all the users to see','');
      icounter := 0;

      with dmData do
      begin
        tblUsers.Open;
        tblUsers.First;
        while not tblUsers.eof do
          begin
            if tblUsers['GebruikerID'] <> strtoint(sUserID)
              then
                begin
                  tblUsers.Edit;
                  if tblUsers['Notification'] <> ''
                    then tblUsers['Notification'] := tblUsers['Notification'] + ',' + snotification
                    else tblUsers['Notification'] := snotification;
                  tblUsers.Post;

                  inc(icounter);
                end;

            tblUsers.Next;
          end;
      end;

      Showmessage('Notified ' + inttostr(icounter) + ' users');
    end
    else //Send noti to one user
      begin
        bfound := false;
        bSearchName := false;
        suser := inputbox('User','Which user do you want to notify?','');

        try
          iuser := strtoint(suser);
        except
          iuser := 0;
          bSearchName := true;
        end;

        showmessage(suser + ' iuser: ' + inttostr(iuser)); //remove

        with dmData do
        begin
          tblUsers.Open;
          tblUsers.First;
          while (not tblUsers.Eof) and (bfound = false) do
            begin
              snotification := '1'; //add 1 before string so that i can mark it as important
              snotification := snotification + inputbox('Notification','What message do you want the user to see','');

              if bSearchName
                then
                begin
                  if uppercase(tblUsers['Naam']) = uppercase(suser)
                    then
                    begin

                      tblUsers.Edit;
                      if tblUsers['Notification'] <> ''
                        then tblUsers['Notification'] := tblUsers['Notification'] + ',' + snotification
                        else tblUsers['Notification'] := snotification;
                      tblUsers.Post;

                      bfound := true;
                    end;
                end
                else
                  begin
                    if tblUsers['GebruikerID'] = iuser
                      then
                      begin

                        tblUsers.Edit;
                        if tblUsers['Notification'] <> ''
                          then tblUsers['Notification'] := tblUsers['Notification'] + ',' + snotification
                          else tblUsers['Notification'] := snotification;
                        tblUsers.Post;

                        bfound := true;
                      end;

                  end;

              tblUsers.Next;
            end;
        end;

        if bfound = false
          then showmessage('No user was found');

      end;
end;

procedure TfrmSettings.RemoveUserClick(Sender: TObject);
var

  susername, snewname : string;
  bfound, bSearchName : Boolean;
  iuserID : integer;

begin
  susername := inputbox('Name','What is the user`s name or ID?','');
  bfound := false;
  bSearchName := false;

  try
    iuserID := strtoint(susername);
  except
    iUserID := 0;
    bSearchName := true;
  end;

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if bSearchName
          then
            begin
              if tblUsers['Naam'] = susername
                then
                  begin
                    tblUsers.Delete;
                    bfound := true;
                    Showmessage('Successfully deleted user');
                  end;

            end
            else
            begin
              if tblUsers['GebruikerID'] = iUserID
                then
                  begin
                    tblUsers.Delete;
                    bfound := true;
                    Showmessage('Successfully deleted user');
                  end
            end;

        tblUsers.Next;
      end;

  end;

  if bfound = false
    then Showmessage('No User was found');
end;

procedure TfrmSettings.GetUserDetails(Sender: TObject);
var

  bfound : Boolean;
  sFormattedDate : string;

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
              sname := tblUsers['Naam'];
              lblName.Caption := sname + ' ' + tblUsers['Van'];

              if tblUsers['isAdmin'] = 'True'
                then lblName.Caption := lblName.Caption + ' (Admin)';

              sFormattedDate := FormatDateTime('DD MMMM YYYY', strToDate(tblUsers['GeboorteDatum']));

              lblAge.Caption := 'Age: ' + inttostr(YearOf(Date) - yearof(tblUsers['GeboorteDatum']));
              lblDate.Caption := 'Birth Date: ' + sFormattedDate;
              lblGeslag.Caption := 'Geslag: ' + tblUsers['Geslag'];

              lblEmail.Caption := tblUsers['Epos'];

              //Position
              lblName.Left := 20;
              lblEmail.Left := (lblName.Width div 2) - (lblEmail.Width div 2);
              lblEmail.Top := lblName.Top + lblName.Height;
              lblAge.Left := 20;
              lblAge.Top := lblEmail.Top + lblEmail.Height + 20;
              lblDate.Left := 20;
              lblDate.Top := lblAge.Top + lblAge.Height + 20;
              lblGeslag.Left := 20;
              lblGeslag.Top := lblDate.Top + lblDate.Height + 20;

              bfound := true;
            end;

        tblUsers.Next;
      end;

    tblHealthData.Open;
    tblHealthData.First;
    while not tblHealthData.Eof do
      begin
        if tblHealthData['GebruikerID'] = strtoint(sUserID)
          then
            begin
              lblWeight.Caption := 'Weight: ' + floattostr(tblHealthData['Weight']) + ' kg';
            end;

        tblHealthData.Next;
      end;

    lblWeight.Left := 20;
    lblWeight.Top := lblGeslag.Top + lblGeslag.Height + 20;

  end;
end;

end.

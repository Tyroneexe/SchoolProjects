unit frmSettings_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, dmData_u, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

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
    btbtnSignOut: TBitBtn;
    imgGirl2: TImage;
    btnHomePage: TButton;
    lblChangeDetail: TButton;
    btnDeleteAcc: TButton;
    btnOrder: TButton;
    btnAdmin: TButton;
    btnEmails: TButton;
    btnViewGrid: TButton;
    PushNotification: TMenuItem;
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
    //
  private
    { Private declarations }
    tfile : textfile;
    bAdmin, bOrder, bdbgrid : Boolean;
    sDBGrid : string;
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

procedure TfrmSettings.btbtnSignOutClick(Sender: TObject);
begin
  dmData.sUserID := '0';
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
      end;

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
  pcPages.TabIndex := 0;
  bfound := false;
  badmin := false;
  dmData.sUserID := '1';
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
      end;

end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  //Initialize vars
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

  bfound : Boolean;
  susername : string;

begin
  bfound := false;
  susername := inputbox('User Name','Search for the name of the user you want to view','');

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while (not tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['Naam'] = susername
          then
            begin
              tblUsers.FieldCount;
            end;


        tblUsers.Next;
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

  snotification : string;

begin
  snotification := inputbox('Notification','What message do you want all the users to see','');

  with dmData do
  begin
    tblUsers.Open;
    tblUsers.First;
    while not tblUsers.eof do
      begin
        tblUsers.Edit;
        tblUsers['Notification'] := snotification;
        tblUsers.Post;

        tblUsers.next;
      end;
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
              lblName.Caption := tblUsers['Naam'] + ' ' + tblUsers['Van'];

              if tblUsers['isAdmin'] = 'True'
                then lblName.Caption := lblName.Caption + ' (Admin)';

              sFormattedDate := FormatDateTime('DD MMMM YY', strToDate(tblUsers['GeboorteDatum']));

              lblDate.Caption := 'Birth Date: ' + sFormattedDate;
              lblGeslag.Caption := 'Geslag: ' + tblUsers['Geslag'];
              lblEmail.Caption := tblUsers['Epos'];

              //Position
              lblName.Left := pcPages.Left + 20;
              lblEmail.Left := (lblName.Width div 2) - (lblEmail.Width div 2);
              lblEmail.Top := lblName.Top + lblName.Height;
              lblDate.Left := 20;
              lblDate.Top := lblEmail.Top + lblEmail.Height + 30;
              lblGeslag.Left := 20;
              lblGeslag.Top := lblDate.Top + lblDate.Height + 30;

              bfound := true;
            end;

        tblUsers.Next;
      end;

  end;
end;

end.

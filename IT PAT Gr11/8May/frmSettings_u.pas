unit frmSettings_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, dmData_u, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

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
    PageControl1: TPageControl;
    tsProfile: TTabSheet;
    TabSheet1: TTabSheet;
    tsSettings: TTabSheet;
    DBGrid1: TDBGrid;
    procedure ConnectFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeNameClick(Sender: TObject);
    procedure ViewFileClick(Sender: TObject);
    procedure ViewUserClick(Sender: TObject);
  private
    { Private declarations }
    tfile : textfile;
    bAdmin : Boolean;
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.dfm}

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

procedure TfrmSettings.FormCreate(Sender: TObject);
var

  bfound : Boolean;

begin
  bfound := false;
  badmin := false;
  dmData.sUserID := '1';

  with dmData do
  begin
    tblUsers.open;
    tblUsers.First;
    while (tblUsers.Eof) and (bfound = false) do
      begin
        if tblUsers['GebruikerID'] = sUserID
          then
            begin
              if tblUsers['isAdmin'] = True
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
begin
  if badmin
    then
      begin

      end;
end;

end.

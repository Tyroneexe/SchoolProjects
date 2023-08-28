unit frmRoder_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u, jpeg, pngimage,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Samples.Spin;

type
  TfrmRoder = class(TForm)
    PageControl: TPageControl;
    tbsBuy: TTabSheet;
    tbsSell: TTabSheet;
    tbsCheckout: TTabSheet;
    tbsSettings: TTabSheet;
    pnlHey: TPanel;
    imgLogo: TImage;
    pnlOder: TPanel;
    lblChangeTheme: TLabel;
    lblLogOut: TLabel;
    lblChangeName: TLabel;
    btnLogOut: TButton;
    btnChangeUserName: TButton;
    rgChangeTheme: TRadioGroup;
    imgLogoCheckout: TImage;
    pnlOderCheckout: TPanel;
    pnlCheckout: TPanel;
    lblTotalAllTime: TLabel;
    lblTotalAllTimeMoney: TLabel;
    lblAmountInCheckout: TLabel;
    lblAmountInCheckoutMoney: TLabel;
    lblRoderBTW: TLabel;
    lblRoderBTWMoney: TLabel;
    lblTotalAmountInCheckout: TLabel;
    lblTotalAmountInCheckoutMoney: TLabel;
    imgLogoSell: TImage;
    pnlOderSell: TPanel;
    lblUserName: TLabel;
    lblSellSomething: TLabel;
    pnlBrandName: TPanel;
    pnlLocationPickup: TPanel;
    pnlPrice: TPanel;
    pnlCcBike: TPanel;
    pnlPartName: TPanel;
    grbProduct: TGroupBox;
    pnlSettings: TPanel;
    rgSellWhat: TRadioGroup;
    sedtCC: TSpinEdit;
    edtPartName: TEdit;
    edtLocationPickup: TEdit;
    cbbBrandName: TComboBox;
    imgProductLogo: TImage;
    lblProductName: TLabel;
    lblProductCCBike: TLabel;
    lblProductLocationPickup: TLabel;
    lblProductPrice: TLabel;
    btnPreviewSell: TButton;
    edtPrice: TEdit;
    btnSeeAccInfo: TButton;
    lblSeeAccInfo: TLabel;
    redtAccInfo: TRichEdit;
    tbsWelcome: TTabSheet;
    pnlWelcome: TPanel;
    pnlOderWelcome: TPanel;
    imgLogoWelcome: TImage;
    pnlTo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure btnChangeUserNameClick(Sender: TObject);
    procedure rgChangeThemeClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure rgSellWhatClick(Sender: TObject);
    procedure btnPreviewSellClick(Sender: TObject);
    procedure edtLocationPickupChange(Sender: TObject);
    procedure sedtPriceChange(Sender: TObject);
    procedure cbbBrandNameChange(Sender: TObject);
    procedure edtPartNameChange(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
    procedure btnSeeAccInfoClick(Sender: TObject);
  private
    { Private declarations }
    rAmountInCheckout, rRoderTakes, rTotalAmountInCheckout, rPrice : real;
    bIsPreview : Boolean;
  public
    { Public declarations }
  end;

  const
  rBTW = 15/100;

var
  frmRoder: TfrmRoder;

implementation

{$R *.dfm}

uses frmSignUp_u;

procedure TfrmRoder.btnChangeUserNameClick(Sender: TObject);
var

  sNewUserName : string;
  iConfirmNewName : integer;

begin
  //Change User Name

  //Wat moet die nuwe username wees
  sNewUserName := InputBox('New UserName','What should your new UserName be?','');

  //Open the db
  DataModule1.ADOTable1.Open;

  //Gaan na die eerste lyn
  DataModule1.ADOTable1.First;

  //Gaan totdat dit die laaste een in die db vind
  while not DataModule1.ADOTable1.Eof do
  begin
    //as die ID = db se id
    if DataModule1.ADOTable1.FieldByName('ID').AsString = DataModule1.sUserID then
    begin
      iConfirmNewName :=  MessageDlg('Successfuly changed the UserName to ' + sNewUserName, TMsgDlgType.mtInformation, [mbOK, mbCancel], 0);
      if iConfirmNewName = mrOk
          then
            begin
            //Se die db dat ek iets wil verander
            DataModule1.ADOTable1.Edit;

            //Verander die userName
            DataModule1.ADOTable1.FieldByName('UserName').AsString := sNewUserName;

            // Post the changes to the database
            DataModule1.ADOTable1.Post;

            // Breuk die loop as daar n match is
            Break;
            end
            else
              begin
                MessageDlg('Your UserName was not changed', TMsgDlgType.mtConfirmation, [mbOK], 0);
                Break;
              end;
    end;

    // Gaan na die volgnde lyn
    DataModule1.ADOTable1.Next;
  end;

  //Maak db toe
  DataModule1.ADOTable1.Close;
end;

procedure TfrmRoder.btnLogOutClick(Sender: TObject);
begin
  //Go back to sign up page
  frmSignUp.Show;
  frmRoder.Hide;
end;

procedure TfrmRoder.btnPreviewSellClick(Sender: TObject);
var

  sPrice : string;


begin

  sPrice := uppercase(edtPrice.Text);

  if bIsPreview
    then
      begin
        //Check of die price nie enige letter in het nie
        if (sPrice >= 'A') and (sPrice <= 'Z') //selfde as IN
          then
            begin
              MessageDlg('Price should not contain letters', TMsgDlgType.mtWarning, [mbOK, mbCancel], 0);
              edtPrice.SetFocus;
              Exit;
            end
          else
            rPrice := StrToFloat(edtPrice.Text);

        //Bike Brand
        grbProduct.Caption := cbbBrandName.Text;

        lblProductName.Caption := cbbBrandName.Text;

        case cbbBrandName.ItemIndex of
          0 : imgProductLogo.Picture.LoadFromFile('BMWlogo.jpg');
          1 : imgProductLogo.Picture.LoadFromFile('ToyotaLogo.jpg');
          2 : imgProductLogo.Picture.LoadFromFile('HondaLogo.jpg');
          3 : imgProductLogo.Picture.LoadFromFile('SuzukiLogo.jpg');
          4 : imgProductLogo.Picture.LoadFromFile('YamahaLogo.jpg');
          5 : imgProductLogo.Picture.LoadFromFile('HarleyLogo.png');
          else imgProductLogo.Picture.LoadFromFile('Logo.png');
        end;

        //Location
        lblProductLocationPickup.Caption := edtLocationPickup.Text;
        lblProductLocationPickup.Left := (grbProduct.Width div 2) - (lblProductLocationPickup.Width div 2);

        //Price
        lblProductPrice.Caption := FloatToStrF(rPrice, ffCurrency, 8, 2);
        lblProductPrice.Left := (grbProduct.Width div 2) - (lblProductPrice.Width div 2);

        //CC
        lblProductCCBike.Caption := IntToStr(sedtCC.Value) + ' CC';

        btnPreviewSell.Caption := 'Sell Product';
      end
        else
          begin
            //Add the item to the database
            //Maak die Access db oop
            DataModule1.ADOTable2.Open;

            // Maak n nuwe ry oop
            DataModule1.ADOTable2.Append;

            //Add na die database toe
            DataModule1.ADOTable2.FieldByName('Type').AsInteger := rgSellWhat.ItemIndex;
            DataModule1.ADOTable2.FieldByName('Location').AsString := edtLocationPickup.Text;
            DataModule1.ADOTable2.FieldByName('Price').AsFloat := rPrice;

            //As dit n bike is add die cbb anders add edt
            if rgSellWhat.ItemIndex = 0 then // Bike
              begin
                DataModule1.ADOTable2.FieldByName('ProductName').AsString := cbbBrandName.Text;
                DataModule1.ADOTable2.FieldByName('CC').AsInteger := sedtCC.Value;
              end
              else // Part
                begin
                  DataModule1.ADOTable2.FieldByName('ProductName').AsString := edtPartName.Text;
                  DataModule1.ADOTable2.FieldByName('CC').AsInteger := 0;
                end;

            // Post die nuwe info
            DataModule1.ADOTable2.Post;

            // Maak db toe
            DataModule1.ADOTable2.Close;

            ShowMessage('added');

            btnPreviewSell.Caption := 'Preview Product';
            btnPreviewSell.Enabled := False;

          end;

      bIsPreview := not bIsPreview;
end;

procedure TfrmRoder.btnSeeAccInfoClick(Sender: TObject);
begin
  redtAccInfo.Visible := True;

  redtAccInfo.Clear;

  redtAccInfo.Paragraph.TabCount := 1;
  redtAccInfo.Paragraph.Tab[0] := 150;


  //Open the db
  DataModule1.ADOTable1.Open;

  //Gaan na die eerste lyn
  DataModule1.ADOTable1.First;

  //Gaan totdat dit die laaste een in die db vind
  while not DataModule1.ADOTable1.Eof do
  begin
    //as die ID = db se id
    if DataModule1.ADOTable1.FieldByName('ID').AsString = DataModule1.sUserID then
    begin

      redtAccInfo.Lines.Add('User Name:' + #9 + DataModule1.ADOTable1.FieldByName('UserName').AsString);
      redtAccInfo.Lines.Add('Email:' + #9 + DataModule1.ADOTable1.FieldByName('Email').AsString);
      redtAccInfo.Lines.Add('===============================================');
      //Format Str Uit DB na geld
      redtAccInfo.Lines.Add('Total Ammount Ever Spent:' + #9 + FloatToStrF(DataModule1.ADOTable1.FieldByName('OfAllTime').AsFloat, ffCurrency, 8, 2));

      //Stop die search as daar n match is
      Break;
    end;

    //Check die volgende lyn
    DataModule1.ADOTable1.Next;
  end;

  //Maak die db toe
  DataModule1.ADOTable1.Close;
end;

procedure TfrmRoder.cbbBrandNameChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check if any of the required fields is empty
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // If any field is empty, disable the button
        btnPreviewSell.Enabled := false
      else
        // Enable the button if all fields are filled
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check if any of the required fields is empty
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // If any field is empty, disable the button
            btnPreviewSell.Enabled := false
          else
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.edtLocationPickupChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check if any of the required fields is empty
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // If any field is empty, disable the button
        btnPreviewSell.Enabled := false
      else
        // Enable the button if all fields are filled
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check if any of the required fields is empty
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // If any field is empty, disable the button
            btnPreviewSell.Enabled := false
          else
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.edtPartNameChange(Sender: TObject);
begin

  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check if any of the required fields is empty
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // If any field is empty, disable the button
        btnPreviewSell.Enabled := false
      else
        // Enable the button if all fields are filled
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check if any of the required fields is empty
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // If any field is empty, disable the button
            btnPreviewSell.Enabled := false
          else
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.edtPriceChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check if any of the required fields is empty
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // If any field is empty, disable the button
        btnPreviewSell.Enabled := false
      else
        // Enable the button if all fields are filled
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check if any of the required fields is empty
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // If any field is empty, disable the button
            btnPreviewSell.Enabled := false
          else
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.FormCreate(Sender: TObject);
var

  primaryClr, lightBlueClr : Cardinal;

begin
  //Start of the program

  primaryClr := RGB(11, 49, 140);
  lightBlueClr := RGB(79, 149, 255);

  bIsPreview := True; //Preview the item before you can sell

  rgChangeTheme.ItemIndex := 0; //Begin die program op light mode

  PageControl.TabIndex := 0; //Begin altyd by welcome page

  //Load Images
  imgLogo.Picture.LoadFromFile('Logo.png');
  imgLogoCheckout.Picture.LoadFromFile('Logo.png');
  imgLogoSell.Picture.LoadFromFile('Logo.png');
  imgProductLogo.Picture.LoadFromFile('Logo.png');
  imgLogoWelcome.Picture.LoadFromFile('Logo.png');

  //Assign Positions

    //Buy Page
    pnlHey.Left := 10;
    pnlHey.Top := 10;
    lblUserName.Left := (pnlHey.Left + pnlHey.Width) + 10;
    lblUserName.Top := 12;

    //Settings Page
    pnlOder.Left := (frmRoder.Width div 2) - ((pnlOder.Width div 2) - 40);
    imgLogo.Left := (pnlOder.Left - pnlOder.Width) + 30;

    lblChangeTheme.Left := (frmRoder.Width div 2) - (lblChangeTheme.Width div 2); //Center die komponent
    lblLogOut.Left := (frmRoder.Width div 2) - (lblLogOut.Width div 2);
    lblChangeName.Left := (frmRoder.Width div 2) - (lblChangeName.Width div 2);

    btnLogOut.Left := (frmRoder.Width div 2) - (btnLogOut.Width div 2);
    btnChangeUserName.Left := (frmRoder.Width div 2) - (btnChangeUserName.Width div 2);
    rgChangeTheme.Left := (frmRoder.Width div 2) - (rgChangeTheme.Width div 2);

    redtAccInfo.Visible := False;

    //Checkout Page
    lblTotalAllTime.Left := (frmRoder.Width div 2) - (lblTotalAllTime.Width div 2) - (lblTotalAllTimeMoney.Width div 2);
    lblAmountInCheckout.Left := 20;
    lblRoderBTW.Left := 20;
    lblTotalAmountInCheckout.Left := 20;

    lblTotalAllTimeMoney.Left := (lblTotalAllTime.Left + lblTotalAllTime.Width) + 5;
    lblAmountInCheckoutMoney.Left := (lblAmountInCheckout.Left + lblAmountInCheckout.Width) + 5;
    lblRoderBTWMoney.Left := (lblRoderBTW.Left + lblRoderBTW.Width) + 5;
    lblTotalAmountInCheckoutMoney.Left := (lblTotalAmountInCheckout.Left + lblTotalAmountInCheckout.Width) + 5;

    //Sell Page
    pnlOderSell.Left := (frmRoder.Width div 2) - ((pnlOder.Width div 2) - 40);
    imgLogoSell.Left := (pnlOder.Left - pnlOder.Width) + 30;

    pnlSettings.Left := (frmRoder.Width div 2) - (pnlSettings.Width div 2);

    pnlPartName.Visible := false;
    pnlPartName.Top := pnlBrandName.Top;
    edtPartName.Visible := false;
    pnlPartName.Left := 20;
    pnlBrandName.Left := 20;
    pnlLocationPickup.Left := 20;
    pnlPrice.Left := 20;
    pnlCcBike.Left := 20;

    edtPartName.Left := (pnlPartName.Left + pnlPartName.Width) + 10;
    edtLocationPickup.Left := (pnlLocationPickup.Left + pnlLocationPickup.Width) + 10;
    edtPrice.Left := (pnlPrice.Left + pnlPrice.Width) + 10;
    sedtCC.Left := (pnlCcBike.Left + pnlCcBike.Width) + 10;
    cbbBrandName.Left := (pnlBrandName.Left + pnlBrandName.Width) + 10;

    edtPartName.Top := pnlPartName.Top + 10;
    cbbBrandName.Top := pnlBrandName.Top + 10;
    edtLocationPickup.Top := pnlLocationPickup.Top + 10;
    edtPrice.Top := pnlPrice.Top + 10;
    edtPartName.Top := pnlPartName.Top + 10;
    sedtCC.Top := pnlCcBike.Top + 10;

    rgSellWhat.Left := (frmRoder.Width div 2) - (rgSellWhat.Width div 2);

    btnPreviewSell.Left := (frmRoder.Width div 2) - (btnPreviewSell.Width div 2);


  //Assign Colors
  pnlHey.Font.Color := primaryClr;
  lblUserName.Font.Color := primaryClr;
  pnlOder.Font.Color := primaryClr;

  lblChangeTheme.Font.Color := lightBlueClr;
  lblLogOut.Font.Color := lightBlueClr;
  lblChangeName.Font.Color := lightBlueClr;

  lblTotalAllTime.Font.Color := lightBlueClr;
  lblTotalAllTimeMoney.Font.Color := lightBlueClr;

  pnlOderCheckout.Font.Color := primaryClr;
  pnlCheckout.Font.Color := primaryClr;

  pnlOderSell.Font.Color := primaryClr;
  lblSellSomething.Font.Color := lightBlueClr;

  pnlSettings.Font.Color := lightBlueClr;

  lblSeeAccInfo.Font.Color := lightBlueClr;


    if rgSellWhat.ItemIndex = 0 then
      begin
        // Check if any of the required fields is empty
        if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '') then
          // If any field is empty, disable the button
          btnPreviewSell.Enabled := false
        else
          // Enable the button if all fields are filled
          btnPreviewSell.Enabled := true;
      end
        else
          begin
            // Check if any of the required fields is empty
            if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '') then
              // If any field is empty, disable the button
              btnPreviewSell.Enabled := false
            else
              btnPreviewSell.Enabled := true;
          end;

end;

procedure TfrmRoder.PageControlChange(Sender: TObject);
begin
  //Open the db
  DataModule1.ADOTable1.Open;

  //Gaan na die eerste lyn
  DataModule1.ADOTable1.First;

  //Gaan totdat dit die laaste een in die db vind
  while not DataModule1.ADOTable1.Eof do
  begin
    //as die ID = db se id
    if DataModule1.ADOTable1.FieldByName('ID').AsString = DataModule1.sUserID then
    begin
      //Dan is die UserName die current user se db
      lblUserName.Caption := DataModule1.ADOTable1.FieldByName('UserName').AsString;
      lblSellSomething.Caption := 'Let`s Sell Something ' +  DataModule1.ADOTable1.FieldByName('UserName').AsString;
      // Exit die loop as daar n match is
      Break;
    end;

    // Gaan na die volgnde lyn
    DataModule1.ADOTable1.Next;
  end;

  //Maak db toe
  DataModule1.ADOTable1.Close;

  lblSellSomething.Left := (frmRoder.Width div 2) - (lblSellSomething.Width div 2);
end;

procedure TfrmRoder.rgChangeThemeClick(Sender: TObject);
begin
  //Change the color of the form

  if rgChangeTheme.ItemIndex = 1
    then
      begin
        frmRoder.Color := clGray
      end
    else
      begin
        frmRoder.Color := clBtnFace;
      end;

end;

procedure TfrmRoder.rgSellWhatClick(Sender: TObject);
begin
  //if user clicks on Bike or Bike Part in Sell Page
  if rgSellWhat.ItemIndex = 0 //Bike
    then
      begin
        pnlBrandName.Left := 20;
        pnlLocationPickup.Left := 20;
        pnlPrice.Left := 20;
        pnlCcBike.Left := 20;
        pnlPartName.Visible := false;
        pnlBrandName.Visible := true;
        cbbBrandName.Visible := True;
        edtPartName.Visible := False;
        pnlCcBike.Visible := True;
        sedtCC.Visible := True;
        imgProductLogo.Picture.LoadFromFile('Logo.png');
        btnPreviewSell.Enabled := false;
        btnPreviewSell.Caption := 'Preview Product';
      end
    else //Part
      begin
        pnlBrandName.Visible := false;
        pnlPartName.Visible := true;
        pnlPartName.Left := 20;
        cbbBrandName.Visible := False;
        edtPartName.Visible := True;
        grbProduct.Caption := '';
        pnlCcBike.Visible := False;
        sedtCC.Visible := False;
        imgProductLogo.Picture.LoadFromFile('BikePart.jpg');

        lblProductName.Caption := '';
        lblProductCCBike.Caption := '';
        lblProductLocationPickup.Caption := '';
        lblProductPrice.Caption := '';
        btnPreviewSell.Enabled := false;
        btnPreviewSell.Caption := 'Preview Product';
      end;
end;

procedure TfrmRoder.sedtPriceChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check if any of the required fields is empty
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '') then
        // If any field is empty, disable the button
        btnPreviewSell.Enabled := false
      else
        // Enable the button if all fields are filled
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check if any of the required fields is empty
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '') then
            // If any field is empty, disable the button
            btnPreviewSell.Enabled := false
          else
            btnPreviewSell.Enabled := true;
        end;
end;

end.

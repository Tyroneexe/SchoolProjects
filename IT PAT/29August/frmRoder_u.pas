unit frmRoder_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u, jpeg, pngimage,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Samples.Spin, Math;
  {
    Import dmData_u vir die Database
    Import jpeg en pngimgae vir pictures
    Import math vir formules
  }

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
    lblMoreRoder: TLabel;
    mmoMoreRoder: TMemo;
    btnMoreRoder: TButton;
    lblLetsBuy: TLabel;
    scbProducts: TScrollBox;
    pnlDatePickup: TPanel;
    dtpDatePickup: TDateTimePicker;
    lblProductDatePickup: TLabel;
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
    procedure btnMoreRoderClick(Sender: TObject);
    //My Eie procedure
    procedure BuyProductClick(Sender: TObject);
  private
    { Private declarations }
    rAmountInCheckout, rRoderTakes, rTotalAmountInCheckout, rPrice : real;
    bIsPreview, bUpdateOnce : Boolean;
    clPrimaryClr : Cardinal; //32 bit int (bv. vir rgb values)
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

procedure TfrmRoder.btnMoreRoderClick(Sender: TObject);
begin
  mmoMoreRoder.Visible := True;

  mmoMoreRoder.Clear;

  //Initialize die mmo
  mmoMoreRoder.Alignment := taCenter;
  mmoMoreRoder.Font.Color := clPrimaryClr;
  mmoMoreRoder.Font.Size := 13;
  mmoMoreRoder.ReadOnly := True;

  mmoMoreRoder.Lines.Add('If you are enjoying Roder, and want some more');
  mmoMoreRoder.Lines.Add('');

  mmoMoreRoder.Lines.Add('Check out Roder: Biker App on the Play Store!!');
  mmoMoreRoder.Lines.Add('');

  mmoMoreRoder.Lines.Add('With Roder: Biker App you can organize and plan bike runs with friends');
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

        redtAccInfo.SelAttributes.Color := clPrimaryClr;
        redtAccInfo.SelAttributes.Size := 13;
        redtAccInfo.Paragraph.Alignment := taCenter;
        redtAccInfo.SelAttributes.Style := [TFontStyle.fsBold];
        redtAccInfo.SelAttributes.Name := 'Ravie';
        redtAccInfo.Lines.Add(DataModule1.ADOTable1.FieldByName('UserName').AsString + '`s' + ' Account' + #13);

        redtAccInfo.Paragraph.Alignment := taLeftJustify;
        redtAccInfo.Lines.Add('User Name:' + #9 + DataModule1.ADOTable1.FieldByName('UserName').AsString);
        redtAccInfo.Lines.Add('Email:' + #9 + DataModule1.ADOTable1.FieldByName('Email').AsString + #13);
        redtAccInfo.Lines.Add('Items Sold:' + #9);
        redtAccInfo.Lines.Add('Items Bought:' + #9 + #13);

        redtAccInfo.SelAttributes.Color := clPrimaryClr;
        redtAccInfo.Lines.Add('==================================================' + #13);

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

  clLightBlueClr : Cardinal; //32 bit int

  iXPos, iYPos : integer;
  sFormatedDate : string;


begin
  //Start of the program

  clPrimaryClr := RGB(11, 49, 140);
  clLightBlueClr := RGB(79, 149, 255);

    //Hoe alles moet begin

    bUpdateOnce := True; //Ja dit mag update maar net een keer
    bIsPreview := True; //Preview the item before you can sell

    rgChangeTheme.ItemIndex := 0; //Begin die program op light mode

    PageControl.TabIndex := 0; //Begin altyd by welcome page

    mmoMoreRoder.Visible := False;
    redtAccInfo.Visible := False;

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
    lblUserName.Left := (pnlHey.Left + pnlHey.Width) + 12;
    lblUserName.Top := 12;

    lblLetsBuy.Left := 12;
    lblLetsBuy.Top := (pnlHey.Top + pnlHey.Height) + 5;

    //Settings Page
    pnlOder.Left := (frmRoder.Width div 2) - ((pnlOder.Width div 2) - 40);
    imgLogo.Left := (pnlOder.Left - pnlOder.Width) + 30;

    lblChangeTheme.Left := (frmRoder.Width div 2) - (lblChangeTheme.Width div 2); //Center die komponent
    lblLogOut.Left := (frmRoder.Width div 2) - (lblLogOut.Width div 2);
    lblChangeName.Left := (frmRoder.Width div 2) - (lblChangeName.Width div 2);

    btnLogOut.Left := (frmRoder.Width div 2) - (btnLogOut.Width div 2);
    btnChangeUserName.Left := (frmRoder.Width div 2) - (btnChangeUserName.Width div 2);
    rgChangeTheme.Left := (frmRoder.Width div 2) - (rgChangeTheme.Width div 2);

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
    pnlOderSell.Left := (frmRoder.Width div 2) - ((pnlOderSell.Width div 2) - 40);
    imgLogoSell.Left := (pnlOderSell.Left - pnlOderSell.Width) + 30;

    pnlSettings.Left := (frmRoder.Width div 2) - (pnlSettings.Width div 2);

    pnlPartName.Visible := false;
    pnlPartName.Top := pnlBrandName.Top;
    edtPartName.Visible := false;
    pnlPartName.Left := 20;
    pnlBrandName.Left := 20;
    pnlLocationPickup.Left := 20;
    pnlPrice.Left := 20;
    pnlCcBike.Left := 20;
    pnlDatePickup.Left := (sedtCC.Left + sedtCC.Width) + 20;

    edtPartName.Left := (pnlPartName.Left + pnlPartName.Width) + 10;
    edtLocationPickup.Left := (pnlLocationPickup.Left + pnlLocationPickup.Width) + 10;
    edtPrice.Left := (pnlPrice.Left + pnlPrice.Width) + 10;
    sedtCC.Left := (pnlCcBike.Left + pnlCcBike.Width) + 10;
    dtpDatePickup.Left := (pnlDatePickup.Left + pnlDatePickup.Width) + 10;
    cbbBrandName.Left := (pnlBrandName.Left + pnlBrandName.Width) + 10;

    edtPartName.Top := pnlPartName.Top + 10;
    cbbBrandName.Top := pnlBrandName.Top + 10;
    edtLocationPickup.Top := pnlLocationPickup.Top + 10;
    edtPrice.Top := pnlPrice.Top + 10;
    edtPartName.Top := pnlPartName.Top + 10;
    sedtCC.Top := pnlCcBike.Top + 10;
    dtpDatePickup.Top := pnlDatePickup.Top  + 10;

    rgSellWhat.Left := (frmRoder.Width div 2) - (rgSellWhat.Width div 2);

    btnPreviewSell.Left := (frmRoder.Width div 2) - (btnPreviewSell.Width div 2);


  //Assign Colors
  pnlHey.Font.Color := clPrimaryClr;
  lblUserName.Font.Color := clPrimaryClr;
  pnlOder.Font.Color := clPrimaryClr;
  lblChangeTheme.Font.Color := clLightBlueClr;
  lblLogOut.Font.Color := clLightBlueClr;
  lblChangeName.Font.Color := clLightBlueClr;
  lblTotalAllTime.Font.Color := clLightBlueClr;
  lblTotalAllTimeMoney.Font.Color := clLightBlueClr;
  pnlOderCheckout.Font.Color := clPrimaryClr;
  pnlCheckout.Font.Color := clPrimaryClr;
  pnlOderSell.Font.Color := clPrimaryClr;
  lblSellSomething.Font.Color := clLightBlueClr;
  pnlSettings.Font.Color := clLightBlueClr;
  lblSeeAccInfo.Font.Color := clLightBlueClr;
  pnlWelcome.Font.Color := clPrimaryClr;
  pnlTo.Font.Color := clLightBlueClr;
  pnlOderWelcome.Font.Color := clPrimaryClr;
  lblMoreRoder.Font.Color := clLightBlueClr;
  lblLetsBuy.Font.Color := clLightBlueClr;


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

//My eie procedure sodat jy die button can click en dit doen iets
procedure TfrmRoder.BuyProductClick(Sender: TObject);
var

  //Maak n TButton variable sodat ek sender kan gebruik
  btnClickedButton: TButton;

  sBtnID: string;

begin

  {Okay so sender kry die button, wat jy nou net gepress het, se inligting}
  {Hierdie lyn check die button (TButton) se inligting}
  btnClickedButton := Sender as TButton;

  //Maak die naam dieselfde as die id sodat dit mekaar kan vind en ooreenstem
  sBtnID := btnClickedButton.Name;

  //Delete die btn in die naam sodat ons net die ID het
  delete(sBtnID, 1, 3);

  //Wys die ID van die item
  ShowMessage('You bought item with ID: ' + sBtnID);

  //Gaan deur die database totdat ons nie meer kan nie
  while not DataModule1.ADOTable2.Eof do
    begin
      //Kry die ID in die database wat dieselfde is as die btn se id
      //m.a.w. Kry die item wat jy will koop in die db
      if DataModule1.ADOTable2.FieldByName('ID').AsString = sBtnID
        then
          begin
            //add die geld na die user
          end;
    end;

end;

procedure TfrmRoder.PageControlChange(Sender: TObject);
var

  iXPos, iYPos : integer;
  sFormatedDate : string;

begin
  //Open the db
  DataModule1.ADOTable1.Open;

  //Gaan na die eerste lyn
  DataModule1.ADOTable1.First;

  //Gaan totdat dit die laaste een in die db vind
  while not DataModule1.ADOTable1.Eof do
    begin
      //as die ID = db se id
      if DataModule1.ADOTable1.FieldByName('ID').AsString = DataModule1.sUserID
        then
          begin
            //Dan is die UserName die current user se db
            lblUserName.Caption := DataModule1.ADOTable1.FieldByName('UserName').AsString;
            lblSellSomething.Caption := 'Let`s Sell Something ' +  DataModule1.ADOTable1.FieldByName('UserName').AsString;
            lblTotalAllTimeMoney.Caption := FloatToStrF(DataModule1.ADOTable1.FieldByName('OfAllTime').AsFloat, ffCurrency, 8 ,2);
            // Exit die loop as daar n match is
            Break;
          end;

      // Gaan na die volgnde lyn
      DataModule1.ADOTable1.Next;
    end;

  //Maak db toe
  DataModule1.ADOTable1.Close;

  //Center die label nadat naam gevind is
  lblSellSomething.Left := (frmRoder.Width div 2) - (lblSellSomething.Width div 2);



  // Initialize die positions
  iXPos := 20;
  iYPos := 20;

  if bUpdateOnce
    then
      begin
        //Open the db
        DataModule1.ADOTable2.Open;

        //Gaan na die eerste lyn
        DataModule1.ADOTable2.First;

        { //////////////////////////////////////////////
          Hierdie is goeie code
        } //////////////////////////////////////////////

        //Vir elke item in die database
        while not DataModule1.ADOTable2.Eof do
          begin
            //Create n group box
            var grbProductInfo := TGroupBox.Create(scbProducts);
            grbProductInfo.Parent := scbProducts;

            grbProductInfo.Height := 200;
            grbProductInfo.Width := 320;

            grbProductInfo.Left := iXPos;
            grbProductInfo.Top := iYPos;

            //as die groub box nie kan inpas nie dan gaan na die volgende lyn
            if (grbProductInfo.Left + grbProductInfo.Width) >= frmRoder.Width
              then
                begin
                  iXPos := 20;
                  grbProductInfo.Left := iXPos;
                  grbProductInfo.Top := grbProductInfo.Top + grbProductInfo.Height + 20;
                  iYPos := iYPos + (grbProductInfo.Height) + 20;
                end;


            // Adjust XPosition for the next group box
            iXPos := iXPos + grbProductInfo.Width + 20; //Die '+' create padding

            //Create n img
            var imgPicOfProduct := TImage.Create(grbProductInfo);
            imgPicOfProduct.Parent := grbProductInfo;

            imgPicOfProduct.Height := 100;
            imgPicOfProduct.Width := 130;

            imgPicOfProduct.Stretch := True;

            imgPicOfProduct.Top := 20;
            imgPicOfProduct.Left := 20;

            //Check watse image om te display
            {kon ook die combo box se itemIndex gesave het en dan n case gedoen het}
            if DataModule1.ADOTable2.FieldByName('Type').AsInteger = 0 //As dit n Bike is
              then
                begin
                  if DataModule1.ADOTable2.FieldByName('ProductName').AsString = 'BMW'
                    then imgPicOfProduct.Picture.LoadFromFile('BMWlogo.jpg');

                  if DataModule1.ADOTable2.FieldByName('ProductName').AsString = 'Toyota'
                    then imgPicOfProduct.Picture.LoadFromFile('ToyotaLogo.jpg');

                  if DataModule1.ADOTable2.FieldByName('ProductName').AsString = 'Honda'
                    then imgPicOfProduct.Picture.LoadFromFile('HondaLogo.jpg');

                  if DataModule1.ADOTable2.FieldByName('ProductName').AsString = 'Suzuki'
                    then imgPicOfProduct.Picture.LoadFromFile('SuzukiLogo.jpg');

                  if DataModule1.ADOTable2.FieldByName('ProductName').AsString = 'Yamaha'
                    then imgPicOfProduct.Picture.LoadFromFile('YamahaLogo.jpg');

                  if DataModule1.ADOTable2.FieldByName('ProductName').AsString = 'Harley Davidson'
                    then imgPicOfProduct.Picture.LoadFromFile('HarleyLogo.png');

                end
                  else //As dit n Part is
                    begin
                      imgPicOfProduct.Picture.LoadFromFile('BikePart.jpg');
                    end;


            //Create n label vir die naam
            var lblNameOfProduct := TLabel.Create(grbProductInfo);
            lblNameOfProduct.Parent := grbProductInfo;

            lblNameOfProduct.Font.Name := 'Roboto';
            lblNameOfProduct.Font.Size := 14;

            lblNameOfProduct.Caption := DataModule1.ADOTable2.FieldByName('ProductName').AsString;

            lblNameOfProduct.Left := imgPicOfProduct.Left + imgPicOfProduct.Width + 20;
            lblNameOfProduct.Top := 20;

            if DataModule1.ADOTable2.FieldByName('Type').AsInteger = 0 //As dit n Bike is dan
              then
                begin
                  //Create n label vir die CC
                  var lblCCOfBike := TLabel.Create(grbProductInfo);
                  lblCCOfBike.Parent := grbProductInfo;

                  lblCCOfBike.Font.Name := 'Roboto';
                  lblCCOfBike.Font.Size := 14;

                  lblCCOfBike.Caption := DataModule1.ADOTable2.FieldByName('CC').AsString + ' CC';

                  lblCCOfBike.Left := lblNameOfProduct.Left;
                  lblCCOfBike.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;
                end;


            //Create n label vir die Date Pickup
            var lblDatePickupForProduct := TLabel.Create(grbProductInfo);
            lblDatePickupForProduct.Parent := grbProductInfo;

            lblDatePickupForProduct.Font.Name := 'Roboto';
            lblDatePickupForProduct.Font.Size := 14;

            sFormatedDate := FormatDateTime('dd mmmm yyyy', DataModule1.ADOTable2.FieldByName('DatePickup').AsDateTime);

            lblDatePickupForProduct.Caption := sFormatedDate;

            lblDatePickupForProduct.Left := lblNameOfProduct.Left;

            //Date moet op skuif as dit n part is
            if DataModule1.ADOTable2.FieldByName('Type').AsInteger = 0
              then
                lblDatePickupForProduct.Top := (lblNameOfProduct.Top + lblNameOfProduct.Height) * 2
              else lblDatePickupForProduct.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;

            //Create n label vir die Location Pickup
            var lblLocationOfPickup := TLabel.Create(grbProductInfo);
            lblLocationOfPickup.Parent := grbProductInfo;

            lblLocationOfPickup.Font.Name := 'Roboto';
            lblLocationOfPickup.Font.Size := 14;

            lblLocationOfPickup.Caption := DataModule1.ADOTable2.FieldByName('Location').AsString;

            lblLocationOfPickup.Left := imgPicOfProduct.Left;
            lblLocationOfPickup.Top := imgPicOfProduct.Top + imgPicOfProduct.Height + 20;

            //Create n label vir die Price
            var lblPriceOfProduct := TLabel.Create(grbProductInfo);
            lblPriceOfProduct.Parent := grbProductInfo;

            lblPriceOfProduct.Font.Name := 'Roboto';
            lblPriceOfProduct.Font.Size := 14;

            lblPriceOfProduct.Caption := FloatToStrF(DataModule1.ADOTable2.FieldByName('Price').AsFloat, ffCurrency, 8, 2);

            lblPriceOfProduct.Left := imgPicOfProduct.Left;
            lblPriceOfProduct.Top := lblLocationOfPickup.Top + lblLocationOfPickup.Height + 10;

            //Create die button om dit te koop
            var btnBuyProduct := TButton.Create(grbProductInfo);
            btnBuyProduct.Parent := grbProductInfo;
            //Maak die btn name die id sodat ek later kan trace watse item will hy koop
            btnBuyProduct.Name := 'btn' + DataModule1.ADOTable2.FieldByName('ID').AsString;

            btnBuyProduct.Caption := 'Buy This Product';

            btnBuyProduct.Width := 100;

            btnBuyProduct.Left := grbProductInfo.Width - 105;
            btnBuyProduct.Top := grbProductInfo.Height - 30;

            //Gee die button n procedure sodat die button iets kan doen
            btnBuyProduct.OnClick := BuyProductClick;

            //Gaan na die volgende item
            DataModule1.ADOTable2.Next;
          end;

          //Maak db toe
          DataModule1.ADOTable2.Close;
      end;

    bUpdateOnce := False;

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

        lblProductName.Caption := 'Brand Name';
        lblProductCCBike.Caption := 'CC of Bike';
        lblProductLocationPickup.Caption := 'Location Pickup';
        lblProductPrice.Caption := 'Price';

        pnlDatePickup.Left := (sedtCC.Left + sedtCC.Width) + 20;
        dtpDatePickup.Left := (pnlDatePickup.Left + pnlDatePickup.Width) + 10;
        dtpDatePickup.Top := pnlDatePickup.Top  + 10;
        dtpDatePickup.Width := 100;

        lblProductDatePickup.Top := 112;

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

        lblProductName.Caption := 'Product Name';
        lblProductCCBike.Caption := '';
        lblProductLocationPickup.Caption := 'Location Pickup';
        lblProductPrice.Caption := 'Price';

        pnlDatePickup.Left := 20;
        dtpDatePickup.Left := (pnlDatePickup.Left + pnlDatePickup.Width) + 10;
        dtpDatePickup.Width := 200;
        lblProductDatePickup.Top := lblProductCCBike.Top;

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

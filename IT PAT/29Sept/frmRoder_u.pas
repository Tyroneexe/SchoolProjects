unit frmRoder_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, dmData_u, jpeg, pngimage,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Samples.Spin, Math, Vcl.Buttons;
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
    btnCheckOut: TButton;
    cbxLikeRoder: TCheckBox;
    lblLikeRoder: TLabel;
    btnSaveAccInfo: TButton;
    btnAboutRoder: TButton;
    lblFilter: TLabel;
    rgBikeOrPart: TRadioGroup;
    lblSearch: TLabel;
    edtSearch: TEdit;
    imgSearchIcon: TImage;
    btnPrintAccount: TButton;
    tbsReceipt: TTabSheet;
    redtReceipt: TRichEdit;
    imgLogoReceipt: TImage;
    pnlOderReceipt: TPanel;
    pnlReceipt: TPanel;
    btnClose: TBitBtn;
    lblReceiptHint: TLabel;
    btnPrintReceipt: TButton;
    btnSaveReceipt: TButton;
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
    {Dit is n custom procedure vir die button om die produk te koop}
    procedure BuyProductClick(Sender: TObject);
    //
    procedure btnCheckOutClick(Sender: TObject);
    procedure cbxLikeRoderClick(Sender: TObject);
    procedure lblLikeRoderClick(Sender: TObject);
    procedure btnSaveAccInfoClick(Sender: TObject);
    procedure btnCheckOutMouseLeave(Sender: TObject);
    procedure btnCheckOutMouseEnter(Sender: TObject);
    procedure pnlWelcomeMouseEnter(Sender: TObject);
    procedure pnlWelcomeMouseLeave(Sender: TObject);
    procedure pnlToMouseEnter(Sender: TObject);
    procedure pnlToMouseLeave(Sender: TObject);
    procedure btnAboutRoderClick(Sender: TObject);
    procedure pnlWelcomeClick(Sender: TObject);
    procedure pnlToClick(Sender: TObject);
    procedure pnlOderWelcomeMouseEnter(Sender: TObject);
    procedure pnlOderWelcomeMouseLeave(Sender: TObject);
    procedure pnlOderWelcomeClick(Sender: TObject);
    procedure rgBikeOrPartClick(Sender: TObject);
    procedure imgSearchIconClick(Sender: TObject);
    procedure imgSearchIconMouseEnter(Sender: TObject);
    procedure imgSearchIconMouseLeave(Sender: TObject);
    procedure btnPrintAccountClick(Sender: TObject);
    procedure lblSearchClick(Sender: TObject);
    procedure btnPrintReceiptClick(Sender: TObject);
    procedure btnSaveReceiptClick(Sender: TObject);
  private
    { Private declarations }
    rPrice, rTotalAmountInCheckout, rAmountInCheckout, rRoderTakes : real;
    bIsPreview, bUpdateItems : Boolean;
    clPrimary, clLightBlue : TColor;

  public
    { Public declarations }
  end;

  const
  //Die hoeveelheid wat Roder (ek) vat
  rRoderBTW = 15/100;

var
  frmRoder: TfrmRoder;

implementation

{$R *.dfm}

uses frmSignUp_u, frmAbout_u;

procedure TfrmRoder.btnAboutRoderClick(Sender: TObject);
begin
  //Goes to about frm
  frmAbout.Show;
  frmRoder.Hide;

end;

procedure TfrmRoder.btnChangeUserNameClick(Sender: TObject);
var

  sNewUserName : string;
  iConfirmNewName : integer;
  I: Integer;

begin
  //Change User Name

  //Wat moet die nuwe username wees
  sNewUserName := InputBox('New UserName','What should your new UserName be?','');

  //Gaan deur die username om te sien of dit enige spasies het {kon ook .Contains() gebruik}
  for I := 1 to length(sNewUserName) do
  begin
    if sNewUserName[i] = ' '
      then
        begin
          MessageDlg('Username Can Not Contain Spaces!', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);

          //Exit want daar is `n error in die username
          Exit;
        end;

  end;

  //Maak die db oop
  dmData.ADOTableUsers.Open;

  //Gaan na die eerste lyn
  dmData.ADOTableUsers.First;

  //Gaan totdat dit die laaste een in die db vind
  {eof = end of file}
  while not dmData.ADOTableUsers.Eof do
  begin
    //as die current user se ID = db se ID dan is die daai acc die current user sn
    if dmData.ADOTableUsers.FieldByName('ID').AsString = dmData.sUserID
      then
        begin
          //vra vir die user om te confirm oor die nuwe username
          iConfirmNewName :=  MessageDlg('Change user name to ' + sNewUserName + '?', TMsgDlgType.mtInformation, [mbOK, mbCancel], 0);
          //as die user seker is
          if iConfirmNewName = mrOk
              then
                begin
                //Se die db dat ek iets wil verander
                dmData.ADOTableUsers.Edit;

                //Verander die userName
                dmData.ADOTableUsers.FieldByName('UserName').AsString := sNewUserName;

                // Post the changes to the database
                dmData.ADOTableUsers.Post;

                //Se vir die user dit was n success
                Showmessage('User name successfully changed');

                // Breuk die loop as daar n match is
                Break;
                end
                else
                  begin
                    //As hy cancel click break die loop en moet die username nie verander nie
                    MessageDlg('Your UserName was not changed', TMsgDlgType.mtConfirmation, [mbOK], 0);
                    Break;
                  end;
        end;

    // Gaan na die volgnde lyn
    dmData.ADOTableUsers.Next;
  end;

  //Maak db toe
  dmData.ADOTableUsers.Close;
end;

procedure TfrmRoder.btnCheckOutClick(Sender: TObject);
var

  iItemsBought : integer;

begin
  //Maak die receipt visible
  redtReceipt.Visible := True;
  lblReceiptHint.Visible := False;

  //Checkout the price and add it to the user database

  //As amount in checkout leeg is
  if lblAmountInCheckoutMoney.Caption = 'R0,00'
    then
      begin
        //Checkout is empty, so jy kannie iets koop nie
        ShowMessage('Your Cart is Empty, Let`s go do some Shopping!');
        PageControl.TabIndex := 1; //Buy page (tbsBuy)
      end
        else //Checkout is nie empty nie, so jy kan iets koop
          begin
            //Open the db
            dmData.ADOTableUsers.Open;

            //Gaan na die eerste lyn
            dmData.ADOTableUsers.First;

            //Gaan totdat dit die laaste een in die db vind
            while not dmData.ADOTableUsers.Eof do
            begin
              //as die ID = db se id
              if dmData.ADOTableUsers.FieldByName('ID').AsString = dmData.sUserID
                then
                  begin
                    //Se die db dat ek iets wil verander
                    dmData.ADOTableUsers.Edit;

                    //Update die Total ever spent met wat nou gekoop was
                    dmData.ADOTableUsers.FieldByName('OfAllTime').AsFloat := dmData.ADOTableUsers.FieldByName('OfAllTime').AsFloat + rTotalAmountInCheckout;

                    //Hyt een meer ding gekoop so sit dit by die database
                    iItemsBought := dmData.ADOTableUsers.FieldByName('TotalBought').AsInteger;
                    inc(iItemsBought);
                    dmData.ADOTableUsers.FieldByName('TotalBought').AsInteger := iItemsBought;

                    // Post die changes na die database
                    dmData.ADOTableUsers.Post;

                    //Wys die nuwe bedrag van Total All Time Spent
                    lblTotalAllTimeMoney.Caption := FloatToStrF(dmData.ADOTableUsers.FieldByName('OfAllTime').AsFloat, ffCurrency, 8, 2);

                    redtReceipt.Lines.Add(#9 + #9 + #9 + '==========');
                    redtReceipt.Lines.Add(#9 + 'Roder Takes :' + #9 + 'ZAR' + #9 + FloatToStrF(rRoderTakes, ffCurrency, 8, 2));
                    redtReceipt.SelAttributes.Size := 16;
                    redtReceipt.SelAttributes.Style := [TFontStyle.fsBold];
                    redtReceipt.Lines.Add(#9 + 'Total :' + #9 + 'ZAR' + #9 + FloatToStrF(rTotalAmountInCheckout, ffCurrency, 8, 2));

                    //Maak die gelde skoon sodat jy nie weer dieselfde produk checkout nie
                    rAmountInCheckout := 0;
                    rRoderTakes := 0;
                    rTotalAmountInCheckout := 0;
                    lblAmountInCheckoutMoney.Caption := 'R0,00';
                    lblRoderBTWMoney.Caption := 'R0,00';
                    lblTotalAmountInCheckoutMoney.Caption := 'R0,00';

                    //Break die loop want daar is n match gevind
                    Break;
                  end;

              // Gaan na die volgnde lyn
              dmData.ADOTableUsers.Next;
            end;

            //Maak die db toe
            dmData.ADOTableUsers.Close;

          end;

end;

procedure TfrmRoder.btnCheckOutMouseEnter(Sender: TObject);
begin
  //Animation vir die checkout button enter
  btnCheckOut.Font.Size := 20;
end;

procedure TfrmRoder.btnCheckOutMouseLeave(Sender: TObject);
begin
  //Animation vir die checkout button leave
  btnCheckout.Font.Size := 18;

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
  mmoMoreRoder.Font.Color := clPrimary;
  mmoMoreRoder.Font.Size := 13;
  mmoMoreRoder.ReadOnly := True;

  //add na die mmo toe
  mmoMoreRoder.Lines.Add('If you are enjoying Roder, and want some more');
  mmoMoreRoder.Lines.Add('');

  mmoMoreRoder.Lines.Add('Check out Roder: Biker App on the Play Store!!');
  mmoMoreRoder.Lines.Add('');

  mmoMoreRoder.Lines.Add('With Roder: Biker App you can organize and plan bike runs with friends');


  btnAboutRoder.Visible := true;
end;

procedure TfrmRoder.btnPreviewSellClick(Sender: TObject);
var

  sPrice, sFormatedDate : string;
  iTotalSold : integer;
  iCC : real;


begin
  //Vat die CC na die naaste 10
  iCC := RoundTo(sedtCC.value, 1);
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

              //Exit want daar is n error
              Exit;
            end
          else
            //Daar is geen error nie so ons kan dit format
            rPrice := StrToFloat(edtPrice.Text);

        //Bike Brand
        if rgSellWhat.ItemIndex = 0 //as dit n bike is
          then
            //display die bike tipe
            grbProduct.Caption := cbbBrandName.Text
          else
            //anders wys die part name
            grbProduct.Caption := edtPartName.Text;



        //Wys die brand as dit n bike is
        if rgSellWhat.ItemIndex = 0
          then
            lblProductName.Caption := cbbBrandName.Text
          else
            lblProductName.Caption := edtPartName.Text;


        //Verander die foto based van die brand
        case cbbBrandName.ItemIndex of
          0 : imgProductLogo.Picture.LoadFromFile('BMWlogo.jpg');
          1 : imgProductLogo.Picture.LoadFromFile('ToyotaLogo.jpg');
          2 : imgProductLogo.Picture.LoadFromFile('HondaLogo.jpg');
          3 : imgProductLogo.Picture.LoadFromFile('SuzukiLogo.jpg');
          4 : imgProductLogo.Picture.LoadFromFile('YamahaLogo.jpg');
          5 : imgProductLogo.Picture.LoadFromFile('HarleyLogo.png');
          else imgProductLogo.Picture.LoadFromFile('BikePart.jpg');
        end;

        //Location
        lblProductLocationPickup.Caption := edtLocationPickup.Text;
        lblProductLocationPickup.Left := 20;;

        //Price
        lblProductPrice.Caption := FloatToStrF(rPrice, ffCurrency, 8, 2);
        lblProductPrice.Left := 20;

        //CC
        //moet net die CC wys as dit n bike is
        if rgSellWhat.ItemIndex = 0
          then
            lblProductCCBike.Caption := FloatToStr(iCC) + ' CC';

        //Date
        sFormatedDate := FormatDateTime('dd mmm yyyy', dtpDatePickup.Date);
        lblProductDatePickup.Caption := sFormatedDate;

        //Maak die button reg om te sell
        btnPreviewSell.Caption := 'Sell Product';
        btnPreviewSell.Hint := 'Sell this item to other users';
      end
        else
          begin
            //Add the item to the database
            //Maak die Access db oop
            dmData.ADOTableProducts.Open;

            // Maak n nuwe ry oop
            dmData.ADOTableProducts.Append;

            //Add na die database toe
            dmData.ADOTableProducts.FieldByName('Type').AsInteger := rgSellWhat.ItemIndex;
            dmData.ADOTableProducts.FieldByName('Location').AsString := edtLocationPickup.Text;
            dmData.ADOTableProducts.FieldByName('Price').AsFloat := rPrice;
            dmData.ADOTableProducts.FieldByName('DatePickup').AsDateTime := dtpDatePickup.Date;

            //Die current user het hierdie produk verkoop
            dmData.ADOTableProducts.FieldByName('SellerID').AsString := dmData.sUserID;

            //As dit n bike is add die cbb anders add edt
            if rgSellWhat.ItemIndex = 0 then // Bike
              begin
                dmData.ADOTableProducts.FieldByName('ProductName').AsString := cbbBrandName.Text;
                dmData.ADOTableProducts.FieldByName('CC').AsInteger := sedtCC.Value;
              end
              else // Part
                begin
                  dmData.ADOTableProducts.FieldByName('ProductName').AsString := edtPartName.Text;
                  dmData.ADOTableProducts.FieldByName('CC').AsInteger := 0;
                end;

            // Post die nuwe info
            dmData.ADOTableProducts.Post;

            // Maak db toe
            dmData.ADOTableProducts.Close;

            //Maak weer Preview want ons wil nie die produk weer verkoop nie
            btnPreviewSell.Caption := 'Preview Product';
            btnPreviewSell.Enabled := False;

            //Add to the total items sold

            //Open the db
            dmData.ADOTableUsers.Open;

            //Gaan na die eerste lyn
            dmData.ADOTableUsers.First;

            //Gaan totdat dit die laaste een in die db vind
            while not dmData.ADOTableUsers.Eof do
              begin
                if dmData.ADOTableUsers.FieldByName('ID').AsString = dmData.sUserID
                  then
                    begin
                      //inc die items sold by een omdat jy nou net een ding verkoop het
                      iTotalSold := dmData.ADOTableUsers.FieldByName('TotalSold').AsInteger;
                      inc(iTotalSold);

                      //Se die db dat ek iets wil verander
                      dmData.ADOTableUsers.Edit;

                      //increase die total items sold
                      dmData.ADOTableUsers.FieldByName('TotalSold').AsInteger := iTotalSold;

                      // Post the changes to the database
                      dmData.ADOTableUsers.Post;

                      //Stop die search as daar na match is
                      Break;
                    end;

                  //Gaan na volg lyntjie
                  dmData.ADOTableUsers.Next;
              end;


            //Maak die db toe
            dmData.ADOTableUsers.Close;

            //Ons will die product sien in die buy page
            bUpdateItems := True;

          end;

      //Maak die preview opposite van wat dit nou is
      {True na False of False na True}
      bIsPreview := not bIsPreview;
end;

procedure TfrmRoder.btnPrintAccountClick(Sender: TObject);
begin
  //Vra vir die user of hy die account info will print
  if MessageDlg('Do you want to Print your Account Info?', TMsgDlgType.mtConfirmation, mbOKCancel, 0) = mrOK
    then
      redtAccInfo.Print('');
end;

procedure TfrmRoder.btnPrintReceiptClick(Sender: TObject);
begin
  //Vra vir die user of hy die receipt will print
  if MessageDlg('Do you want to Print your Receipt?', TMsgDlgType.mtConfirmation, mbOKCancel, 0) = mrOK
    then
      redtReceipt.Print('');
end;

procedure TfrmRoder.btnSaveAccInfoClick(Sender: TObject);
var

  iConfirmSaveAccInfo : integer;

begin
  //Get the first line
  // wat {users name} account + txt is
  {of ek kon connect na die db toe en kry die naam van daaraf}

  //Confirm dat die user die info will save
  iConfirmSaveAccInfo := MessageDlg('Save account as ' + redtAccInfo.Lines[0], TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0);

  if iConfirmSaveAccInfo = mrOk
    then
      begin
        //Save die account info as n text leer
        redtAccInfo.Lines.SaveToFile(redtAccInfo.Lines[0] + '.txt');
        ShowMessage('Account Saved as : ' + redtAccInfo.Lines[0] + '.txt');
      end
        else
          begin
            //Die user will dit nie save nie
            MessageDlg('Account Saved Cancelled', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
          end;

end;

procedure TfrmRoder.btnSaveReceiptClick(Sender: TObject);
begin
  //Maak die database oop en begin by die eerste lyn
  dmData.ADOTableUsers.Open;
  dmData.ADOTableUsers.First;

  //Gaan deur die database
  while not dmData.ADOTableUsers.Eof do
  begin
    //Kry die user se account
    if dmData.ADOTableUsers.FieldByName('ID').AsString = dmData.sUserID
      then
        begin
          //Confirm dat die user die info will save
          if MessageDlg('Save your Receipt?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOk
            then
              begin
                //Save die account info as n text leer
                redtReceipt.Lines.SaveToFile(dmData.ADOTableUsers.FieldByName('UserName').AsString + ' Receipt' + '.txt');
                ShowMessage('Receipt Saved as : ' + dmData.ADOTableUsers.FieldByName('UserName').AsString + ' Receipt' + '.txt');

                //Break want daar is n account gevind en dit is klaar gesave
                Break;
              end
                else
                  begin
                    //Die user will dit nie save nie
                    MessageDlg('Account Saved Cancelled', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

                    //Stop die code want die user het dit gecancel
                    Break;
                  end;
        end;

        //Gaan na die volgende lyntjie
        dmData.ADOTableUsers.Next;
  end;

  //Maak die database toe
  dmData.ADOTableUsers.Close;
end;

procedure TfrmRoder.btnSeeAccInfoClick(Sender: TObject);
begin
  //Die user will die acc info sien
  redtAccInfo.Visible := True;
  btnSaveAccInfo.Visible := True;
  btnPrintAccount.Visible := True;

  //Maak die redtAccInfo skoon {eintlik onnodig}
  redtAccInfo.Clear;

  //Tabs sodat dit beter geformateer is
  redtAccInfo.Paragraph.TabCount := 1;
  redtAccInfo.Paragraph.Tab[0] := 150;


  //Open the db
  dmData.ADOTableUsers.Open;

  //Gaan na die eerste lyn
  dmData.ADOTableUsers.First;

  //Gaan totdat dit die laaste een in die db vind
  while not dmData.ADOTableUsers.Eof do
  begin
    //as die current user se ID = db se ID
    if dmData.ADOTableUsers.FieldByName('ID').AsString = dmData.sUserID then
      begin
        //Format die eerste lyn van die redt
        redtAccInfo.SelAttributes.Color := clPrimary;
        redtAccInfo.SelAttributes.Size := 13;
        redtAccInfo.Paragraph.Alignment := taCenter;
        redtAccInfo.SelAttributes.Style := [TFontStyle.fsBold];
        redtAccInfo.SelAttributes.Name := 'Ravie';
        redtAccInfo.Lines.Add(dmData.ADOTableUsers.FieldByName('UserName').AsString + '`s' + ' Account' + #13);

        //add die info van die user in die redt
        redtAccInfo.Paragraph.Alignment := taLeftJustify;
        redtAccInfo.Lines.Add('User Name:' + #9 + dmData.ADOTableUsers.FieldByName('UserName').AsString);
        redtAccInfo.Lines.Add('Email:' + #9 + dmData.ADOTableUsers.FieldByName('Email').AsString + #13);
        redtAccInfo.Lines.Add('Total Items Sold:' + #9 + IntToStr(dmData.ADOTableUsers.FieldByName('TotalSold').AsInteger));
        redtAccInfo.Lines.Add('Total Items Bought:' + #9 + IntToStr(dmData.ADOTableUsers.FieldByName('TotalBought').AsInteger) + #13);

        redtAccInfo.SelAttributes.Color := clPrimary;
        redtAccInfo.Lines.Add('==================================================' + #13);

        //Format Str Uit DB na geld
        redtAccInfo.Lines.Add('Total Ammount Ever Spent:' + #9 + FloatToStrF(dmData.ADOTableUsers.FieldByName('OfAllTime').AsFloat, ffCurrency, 8, 2));
        redtAccInfo.Lines.Add('Total Amount Ever Earned:' + #9 + FloatToStrF(dmData.ADOTableUsers.FieldByName('Earned').AsFloat, ffCurrency, 8, 2));

        //Stop die search as daar n match is
        Break;
      end;

    //Check die volgende lyn
    dmData.ADOTableUsers.Next;
  end;

  //Maak die db toe
  dmData.ADOTableUsers.Close;
end;

procedure TfrmRoder.cbbBrandNameChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check of enige van die required fields empty is
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // As enige field empty is disable die button
        btnPreviewSell.Enabled := false
      else
        // Enable die button as all die fields nie empty is nie
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check of enige van die required fields empty is
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // As enige field empty is disable die button
            btnPreviewSell.Enabled := false
          else
            // Enable die button as all die fields nie empty is nie
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.cbxLikeRoderClick(Sender: TObject);
begin

  //As die user Roder like
  if cbxLikeRoder.Checked
    then
      begin
        //Wys die button en maak die checkbox toe
        btnMoreRoder.Visible := True;
        lblMoreRoder.Visible := True;
        cbxLikeRoder.Visible := False;
        lblLikeRoder.Visible := False;
      end
        else //As hy nie Roder lyk nie
          begin
            //Moet nie die More Roder wys nie
            btnMoreRoder.Visible := False;
            lblMoreRoder.Visible := False;
            cbxLikeRoder.Visible := True;
            lblLikeRoder.Visible := True;
          end;

end;

procedure TfrmRoder.edtLocationPickupChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check of enige van die required fields empty is
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // As enige field empty is disable die button
        btnPreviewSell.Enabled := false
      else
        // Enable die button as all die fields nie empty is nie
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check of enige van die required fields empty is
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // As enige field empty is disable die button
            btnPreviewSell.Enabled := false
          else
            // Enable die button as all die fields nie empty is nie
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.edtPartNameChange(Sender: TObject);
begin

  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check of enige van die required fields empty is
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // As enige field empty is disable die button
        btnPreviewSell.Enabled := false
      else
        // Enable die button as all die fields nie empty is nie
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check of enige van die required fields empty is
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // As enige field empty is disable die button
            btnPreviewSell.Enabled := false
          else
            // Enable die button as all die fields nie empty is nie
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.edtPriceChange(Sender: TObject);
begin
  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check of enige van die required fields empty is
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // As enige field empty is disable die button
        btnPreviewSell.Enabled := false
      else
        // Enable die button as all die fields nie empty is nie
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check of enige van die required fields empty is
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // As enige field empty is disable die button
            btnPreviewSell.Enabled := false
          else
            // Enable die button as all die fields nie empty is nie
            btnPreviewSell.Enabled := true;
        end;
end;

procedure TfrmRoder.FormCreate(Sender: TObject);
var

  sFormatedDate : string;


begin
  //Start of the program

  clPrimary := RGB(11, 49, 140);
  clLightBlue := RGB(79, 149, 255);

  //Hoe alles moet begin

  bUpdateItems := True; //Ja dit mag update maar net een keer
  bIsPreview := True; //Preview die item before you can sell
  btnPreviewSell.Enabled := False; //Kan nie preview as alles empty is nie en op die start van die program is alles empty

  rgChangeTheme.ItemIndex := 0; //Begin die program op light mode

  PageControl.TabIndex := 0; //Begin altyd by welcome page

  dtpDatePickup.Date := Date(); //Maak die initial date vandag

  mmoMoreRoder.Visible := False;
  redtAccInfo.Visible := False;
  btnPrintAccount.Visible := False;
  btnAboutRoder.Visible := false;
  redtReceipt.Visible := True;
  lblReceiptHint.Visible := False;
  redtReceipt.ReadOnly := True;

  rAmountInCheckout := 0;
  rTotalAmountInCheckout := 0;
  rRoderTakes := 0;

  //Load Images
  imgLogo.Picture.LoadFromFile('Logo.png');
  imgLogoCheckout.Picture.LoadFromFile('Logo.png');
  imgLogoSell.Picture.LoadFromFile('Logo.png');
  imgProductLogo.Picture.LoadFromFile('Logo.png');
  imgLogoWelcome.Picture.LoadFromFile('Logo.png');
  imgSearchIcon.Picture.LoadFromFile('SearchIcon.png');
  imgLogoReceipt.Picture.LoadFromFile('Logo.png');

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

    lblMoreRoder.Top := lblChangeTheme.Top;
    lblSeeAccInfo.Top := lblChangeTheme.Top;

    btnMoreRoder.Visible := False;
    lblMoreRoder.Visible := False;
    cbxLikeRoder.Left := lblMoreRoder.Left;
    cbxLikeRoder.Top := lblMoreRoder.Top;
    lblLikeRoder.Left := cbxLikeRoder.Left + cbxLikeRoder.Width;
    lblLikeRoder.Top := lblMoreRoder.Top;

    btnSaveAccInfo.Top := (redtAccInfo.Top + redtAccInfo.Height) + 20;
    btnSaveAccInfo.Visible := False;

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

    //Receipt Page
    redtReceipt.Left := (frmRoder.Width div 2) - (redtReceipt.Width div 2);

      //Tabs sodat dit beter geformateer is
      redtReceipt.Paragraph.TabCount := 5;
      redtReceipt.Paragraph.Tab[0] := 150;
      redtReceipt.Paragraph.Tab[1] := 250;
      redtReceipt.Paragraph.Tab[2] := 300;
      redtReceipt.Paragraph.Tab[3] := 350;
      redtReceipt.Paragraph.Tab[4] := 400;

      //Add to the receipt
      redtReceipt.Font.Name := 'Roboto';
      redtReceipt.Font.Size := 14;

      redtReceipt.Paragraph.Alignment := taCenter;
      redtReceipt.Lines.Add('');
      redtReceipt.SelAttributes.Size := 38;
      redtReceipt.SelAttributes.Color := clPrimary;
      redtReceipt.SelAttributes.Name := 'Roboto';
      redtReceipt.SelAttributes.Style := [TFontStyle.fsBold];
      redtReceipt.lines.Add('Roder');

      redtReceipt.SelAttributes.Size := 18;
      redtReceipt.SelAttributes.Name := 'Roboto';
      redtReceipt.SelAttributes.Style := [TFontStyle.fsBold];
      redtReceipt.Lines.Add('193 Bell Dr., Krugersdorp' + #13);
      redtReceipt.Paragraph.Alignment := taLeftJustify;
      redtReceipt.Lines.Add('Time:' + #9 + TimeToStr(time()) + #9 + DateToStr(date()) + #13);


  //Assign Colors
  pnlHey.Font.Color := clPrimary;
  lblUserName.Font.Color := clPrimary;
  pnlOder.Font.Color := clPrimary;
  lblChangeTheme.Font.Color := clLightBlue;
  lblLogOut.Font.Color := clLightBlue;
  lblChangeName.Font.Color := clLightBlue;
  lblTotalAllTime.Font.Color := clLightBlue;
  lblTotalAllTimeMoney.Font.Color := clLightBlue;
  pnlOderCheckout.Font.Color := clPrimary;
  pnlCheckout.Font.Color := clPrimary;
  pnlOderSell.Font.Color := clPrimary;
  lblSellSomething.Font.Color := clLightBlue;
  pnlSettings.Font.Color := clLightBlue;
  lblSeeAccInfo.Font.Color := clLightBlue;
  pnlWelcome.Font.Color := clPrimary;
  pnlTo.Font.Color := clLightBlue;
  pnlOderWelcome.Font.Color := clPrimary;
  lblMoreRoder.Font.Color := clLightBlue;
  lblLetsBuy.Font.Color := clLightBlue;
  lblLikeRoder.Font.Color := clLightBlue;
  pnlReceipt.Font.Color := clPrimary;
  pnlOderReceipt.Font.Color := clPrimary;

end;

procedure ClearScrollBox(ScrollBox: TScrollBox);
var

  //iCountItems gaan all die items tell wat dit moet delete
  iCountItems : Integer;

begin

  // Gaan deur elke komponent in die ScrollBox en clear dit
  // - 1 want dit begin by 0
  // control count kyk vir al die children in die scrollbox
  for iCountItems := ScrollBox.ControlCount - 1 downto 0 do
    begin
      //Free is amper soos delete
      {Free se vir die Ram om te vergeet van dit}
      //Controls laat jy die children edit en verander
      ScrollBox.Controls[iCountItems].Free;
    end;

end;

procedure TfrmRoder.imgSearchIconClick(Sender: TObject);
var

  sSearchProducts, sProductName, sFormatedDate : string;
  iXPos, iYPos : integer;


begin
  //Maak die filter skoon sodat dit nie confusing is nie
  rgBikeOrPart.ItemIndex := -1;

  //Clear die scroll box sodat ek net die bikes of net die parts kan bou
  ClearScrollBox(scbProducts);

  //maak dit uppercase sodat dit nie case sensitive is nie
  sSearchProducts := uppercase(edtSearch.Text);

  //Gee die integers n value
  iXPos := 20;
  iYPos := 20;

  //Maak die db oop
  dmData.ADOTableProducts.Open;

  //Begin by die eerste lyn
  dmData.ADOTableProducts.First;

  while not dmData.ADOTableProducts.Eof do
    begin
      sProductName := UpperCase(dmData.ADOTableProducts.FieldByName('ProductName').AsString);

      if sProductName.Contains(sSearchProducts)
        then
          begin
            //Create n group box vir all die components
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
            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is
              then
                begin
                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'BMW'
                    then imgPicOfProduct.Picture.LoadFromFile('BMWlogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Toyota'
                    then imgPicOfProduct.Picture.LoadFromFile('ToyotaLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Honda'
                    then imgPicOfProduct.Picture.LoadFromFile('HondaLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Suzuki'
                    then imgPicOfProduct.Picture.LoadFromFile('SuzukiLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Yamaha'
                    then imgPicOfProduct.Picture.LoadFromFile('YamahaLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Harley Davidson'
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

            lblNameOfProduct.Caption := dmData.ADOTableProducts.FieldByName('ProductName').AsString;

            lblNameOfProduct.Left := imgPicOfProduct.Left + imgPicOfProduct.Width + 10;
            lblNameOfProduct.Top := 20;

            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is dan
              then
                begin
                  //Create n label vir die CC
                  var lblCCOfBike := TLabel.Create(grbProductInfo);
                  lblCCOfBike.Parent := grbProductInfo;

                  lblCCOfBike.Font.Name := 'Roboto';
                  lblCCOfBike.Font.Size := 14;

                  lblCCOfBike.Caption := dmData.ADOTableProducts.FieldByName('CC').AsString + ' CC';

                  lblCCOfBike.Left := lblNameOfProduct.Left;
                  lblCCOfBike.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;
                end;


            //Create n label vir die Date Pickup
            var lblDatePickupForProduct := TLabel.Create(grbProductInfo);
            lblDatePickupForProduct.Parent := grbProductInfo;

            lblDatePickupForProduct.Font.Name := 'Roboto';
            lblDatePickupForProduct.Font.Size := 14;

            sFormatedDate := FormatDateTime('dd mmm yyyy', dmData.ADOTableProducts.FieldByName('DatePickup').AsDateTime);

            lblDatePickupForProduct.Caption := sFormatedDate;

            lblDatePickupForProduct.Left := lblNameOfProduct.Left;

            //Date moet op skuif as dit n part is want die part het nie CC by nie
            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0
              then
                lblDatePickupForProduct.Top := (lblNameOfProduct.Top + lblNameOfProduct.Height) * 2
              else lblDatePickupForProduct.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;

            //Create n label vir die Location Pickup
            var lblLocationOfPickup := TLabel.Create(grbProductInfo);
            lblLocationOfPickup.Parent := grbProductInfo;

            lblLocationOfPickup.Font.Name := 'Roboto';
            lblLocationOfPickup.Font.Size := 14;

            lblLocationOfPickup.Caption := dmData.ADOTableProducts.FieldByName('Location').AsString;

            lblLocationOfPickup.Left := imgPicOfProduct.Left;
            lblLocationOfPickup.Top := imgPicOfProduct.Top + imgPicOfProduct.Height + 20;

            //Create n label vir die Price
            var lblPriceOfProduct := TLabel.Create(grbProductInfo);
            lblPriceOfProduct.Parent := grbProductInfo;

            lblPriceOfProduct.Font.Name := 'Roboto';
            lblPriceOfProduct.Font.Size := 14;

            lblPriceOfProduct.Caption := FloatToStrF(dmData.ADOTableProducts.FieldByName('Price').AsFloat, ffCurrency, 8, 2);

            lblPriceOfProduct.Left := imgPicOfProduct.Left;
            lblPriceOfProduct.Top := lblLocationOfPickup.Top + lblLocationOfPickup.Height + 10;

            //Create die button om dit te koop
            var btnBuyProduct := TButton.Create(grbProductInfo);
            btnBuyProduct.Parent := grbProductInfo;

            {
            Maak die btn name die id sodat ek later kan trace watse item will hy koop
            }
            //Add 'btn' sodat dit nie n error gooi nie
            btnBuyProduct.Name := 'btn' + dmData.ADOTableProducts.FieldByName('ID').AsString;

            btnBuyProduct.Caption := 'Buy This Product';

            btnBuyProduct.Width := 100;

            btnBuyProduct.Left := grbProductInfo.Width - 105;
            btnBuyProduct.Top := grbProductInfo.Height - 30;

            //Gee die button n procedure sodat die button iets kan doen
            btnBuyProduct.OnClick := BuyProductClick;
          end;


      //Gaan an die volgende lyn
      dmData.ADOTableProducts.Next;
    end;

    dmData.ADOTableProducts.Close;

end;

procedure TfrmRoder.imgSearchIconMouseEnter(Sender: TObject);
begin
  //Maak die image groter
  imgSearchIcon.Height := 25;
  imgSearchIcon.Width := 25;
end;

procedure TfrmRoder.imgSearchIconMouseLeave(Sender: TObject);
begin
  //Reset die image size
  imgSearchIcon.Height := 20;
  imgSearchIcon.Width := 20;
end;

procedure TfrmRoder.lblLikeRoderClick(Sender: TObject);
begin
  //Check en uncheck die box ook deur die label
  cbxLikeRoder.Checked := not cbxLikeRoder.Checked;
end;

procedure TfrmRoder.lblSearchClick(Sender: TObject);
begin

end;

//My eie procedure sodat jy die button can click en dit doen iets
procedure TfrmRoder.BuyProductClick(Sender: TObject);
var

  //Maak n TButton variable sodat ek sender kan gebruik
  btnClickedButton: TButton;
  iConfirmBuy, iIncItemsBought : integer;
  sBtnID: string;

begin

  {Okay so sender kry die button, wat jy nou net gepress het, se inligting}
  {Hierdie lyn check die button (TButton) se inligting}
  btnClickedButton := Sender as TButton;

  //Maak die naam dieselfde as die id sodat dit mekaar kan vind en ooreenstem
  sBtnID := btnClickedButton.Name;

  //Delete die 'btn' in die naam sodat ons net die ID het
  delete(sBtnID, 1, 3);

  //Confirm of die user die produk will koop
  iConfirmBuy := MessageDlg('Buy this product?', TMsgDlgType.mtConfirmation, [mbOK, mbCancel], 0);
  if iConfirmBuy = mrOk
    then
      begin
        //As die user seker is doen alles

        //Open the db
        dmData.ADOTableProducts.Open;

        //Gaan na die eerste lyn
        dmData.ADOTableProducts.First;

        //Gaan deur die database totdat ons nie meer kan nie
        while not dmData.ADOTableProducts.Eof do
          begin
            //Kry die ID in die database wat dieselfde is as die btn se id
            //m.a.w. Kry die item wat jy will koop in die db
            if dmData.ADOTableProducts.FieldByName('ID').AsString = sBtnID
              then
                begin
                  //add die geld van die produk na die checkout

                  //Die geld van die produk
                  rAmountInCheckout := rAmountInCheckout + dmData.ADOTableProducts.FieldByName('Price').AsFloat;
                  lblAmountInCheckoutMoney.Caption := FloatToStrF(rAmountInCheckout, ffCurrency, 8, 2);

                  //Die hoeveelheid geld wat Roder (ek) vat
                  rRoderTakes := rAmountInCheckout * rRoderBTW;
                  lblRoderBTWMoney.Caption := FloatToStrF(rRoderTakes, ffCurrency, 8, 2);

                  //Die totale hoeveelheid geld wat die user vir moet betaal om te checkout nadat ek my cut gevat het
                  rTotalAmountInCheckout := rAmountInCheckout - rRoderTakes;
                  lblTotalAmountInCheckoutMoney.Caption := FloatToStrF(rTotalAmountInCheckout, ffCurrency, 8, 2);

                  //Add to receipt
                  redtReceipt.Paragraph.Alignment := taLeftJustify;
                  redtReceipt.Lines.Add(
                  dmData.ADOTableProducts.FieldByName('ProductName').AsString + #9 + '--' + #9 +
                  'ZAR' + #9 +
                  FloatToStrF(dmData.ADOTableProducts.FieldByName('Price').AsFloat, ffCurrency, 8, 2));

                  //Maak die db oop en begin by die eerste lyn
                  dmData.ADOTableUsers.Open;
                  dmData.ADOTableUsers.First;

                  //Terwyl database nie by end of file is nie
                  {terwyl nie Eof = end of file}
                  while not dmData.ADOTableUsers.Eof do
                    begin
                      //as seller id = user se id in die db; dan is dit die seller
                      if dmData.ADOTableProducts.FieldByName('SellerID').AsString = dmData.ADOTableUsers.FieldByName('ID').AsString
                        then
                          begin
                            dmData.ADOTableUsers.Edit;

                            //Die user het die produk gekoop so die seller moet die geld ontvang
                            dmData.ADOTableUsers.FieldByName('Earned').AsFloat := dmData.ADOTableUsers.FieldByName('Earned').AsFloat + rTotalAmountInCheckout;

                            //Post die vernadereinge
                            dmData.ADOTableUsers.Post;

                            //Break dan die loop
                            Break;

                          end;
                        //Gaan na die volgende lyn in die database
                        dmData.ADOTableUsers.Next;
                    end;


                  //as daar n match is hou op soek
                  Break;
                end;

                //Gaan na die volgende lyn in die database
                dmData.ADOTableProducts.Next;

          end;

          //Maak die database toe
          dmData.ADOTableProducts.Close;
          dmData.ADOTableUsers.Close;

          showmessage('Added Item to Checkout');
      end
        else
          //Die user wil nie die produk koop nie
          MessageDlg('Transaction cancelled', TMsgDlgType.mtWarning, [mbOK], 0);

end;

procedure TfrmRoder.PageControlChange(Sender: TObject);
var

  iXPos, iYPos : integer;
  sFormatedDate : string;

begin
  //Open the db
  dmData.ADOTableUsers.Open;

  //Gaan na die eerste lyn
  dmData.ADOTableUsers.First;

  //Gaan totdat dit die laaste een in die db vind
  while not dmData.ADOTableUsers.Eof do
    begin
      //as die ID = db se id
      if dmData.ADOTableUsers.FieldByName('ID').AsString = dmData.sUserID
        then
          begin
            //Dan is die UserName die current user se db
            lblUserName.Caption := dmData.ADOTableUsers.FieldByName('UserName').AsString;

            //Lets sell something {user se naam}
            lblSellSomething.Caption := 'Let`s Sell Something ' +  dmData.ADOTableUsers.FieldByName('UserName').AsString;

            //Wys die totale geld wat die current user al ooit spandeer het
            lblTotalAllTimeMoney.Caption := FloatToStrF(dmData.ADOTableUsers.FieldByName('OfAllTime').AsFloat, ffCurrency, 8 ,2);


            // Exit die loop as daar n match is
            Break;
          end;

      // Gaan na die volgnde lyn
      dmData.ADOTableUsers.Next;
    end;

  //Maak db toe
  dmData.ADOTableUsers.Close;

  //Center die lable as dit klaar die db se price ingevul het
  lblTotalAllTime.Left := (frmRoder.Width div 2) - (lblTotalAllTime.Width div 2) - (lblTotalAllTimeMoney.Width div 2);
  lblTotalAllTimeMoney.Left := (lblTotalAllTime.Left + lblTotalAllTime.Width) + 10;

  //Center die label nadat naam gevind is
  lblSellSomething.Left := (frmRoder.Width div 2) - (lblSellSomething.Width div 2);

  // Initialize die positions
  iXPos := 20;
  iYPos := 20;

  {
  Ons will net eenkeer al die produkte wys wat in die database is
  Anders kry ons klomp errors as dit in die OnActivate is
  Ons kry ook klomp stack errors as dit konstant all die produkte bou
  }
  //Deur n bool te gebruik werk dit soos n OnActivate van die frm
  if bUpdateItems
    then
      begin
        //Open the db
        dmData.ADOTableProducts.Open;

        //Gaan na die eerste lyn
        dmData.ADOTableProducts.First;

        { //////////////////////////////////////////////
          Hierdie is goeie code
        } //////////////////////////////////////////////

        //Vir elke item in die database
        while not dmData.ADOTableProducts.Eof do
          begin
            //Create n group box vir all die components
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
            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is
              then
                begin
                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'BMW'
                    then imgPicOfProduct.Picture.LoadFromFile('BMWlogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Toyota'
                    then imgPicOfProduct.Picture.LoadFromFile('ToyotaLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Honda'
                    then imgPicOfProduct.Picture.LoadFromFile('HondaLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Suzuki'
                    then imgPicOfProduct.Picture.LoadFromFile('SuzukiLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Yamaha'
                    then imgPicOfProduct.Picture.LoadFromFile('YamahaLogo.jpg');

                  if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Harley Davidson'
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

            lblNameOfProduct.Caption := dmData.ADOTableProducts.FieldByName('ProductName').AsString;

            lblNameOfProduct.Left := imgPicOfProduct.Left + imgPicOfProduct.Width + 10;
            lblNameOfProduct.Top := 20;

            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is dan
              then
                begin
                  //Create n label vir die CC
                  var lblCCOfBike := TLabel.Create(grbProductInfo);
                  lblCCOfBike.Parent := grbProductInfo;

                  lblCCOfBike.Font.Name := 'Roboto';
                  lblCCOfBike.Font.Size := 14;

                  lblCCOfBike.Caption := dmData.ADOTableProducts.FieldByName('CC').AsString + ' CC';

                  lblCCOfBike.Left := lblNameOfProduct.Left;
                  lblCCOfBike.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;
                end;


            //Create n label vir die Date Pickup
            var lblDatePickupForProduct := TLabel.Create(grbProductInfo);
            lblDatePickupForProduct.Parent := grbProductInfo;

            lblDatePickupForProduct.Font.Name := 'Roboto';
            lblDatePickupForProduct.Font.Size := 14;

            sFormatedDate := FormatDateTime('dd mmm yyyy', dmData.ADOTableProducts.FieldByName('DatePickup').AsDateTime);

            lblDatePickupForProduct.Caption := sFormatedDate;

            lblDatePickupForProduct.Left := lblNameOfProduct.Left;

            //Date moet op skuif as dit n part is want die part het nie CC by nie
            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0
              then
                lblDatePickupForProduct.Top := (lblNameOfProduct.Top + lblNameOfProduct.Height) * 2
              else lblDatePickupForProduct.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;

            //Create n label vir die Location Pickup
            var lblLocationOfPickup := TLabel.Create(grbProductInfo);
            lblLocationOfPickup.Parent := grbProductInfo;

            lblLocationOfPickup.Font.Name := 'Roboto';
            lblLocationOfPickup.Font.Size := 14;

            lblLocationOfPickup.Caption := dmData.ADOTableProducts.FieldByName('Location').AsString;

            lblLocationOfPickup.Left := imgPicOfProduct.Left;
            lblLocationOfPickup.Top := imgPicOfProduct.Top + imgPicOfProduct.Height + 20;

            //Create n label vir die Price
            var lblPriceOfProduct := TLabel.Create(grbProductInfo);
            lblPriceOfProduct.Parent := grbProductInfo;

            lblPriceOfProduct.Font.Name := 'Roboto';
            lblPriceOfProduct.Font.Size := 14;

            lblPriceOfProduct.Caption := FloatToStrF(dmData.ADOTableProducts.FieldByName('Price').AsFloat, ffCurrency, 8, 2);

            lblPriceOfProduct.Left := imgPicOfProduct.Left;
            lblPriceOfProduct.Top := lblLocationOfPickup.Top + lblLocationOfPickup.Height + 10;

            //Create die button om dit te koop
            var btnBuyProduct := TButton.Create(grbProductInfo);
            btnBuyProduct.Parent := grbProductInfo;

            {
            Maak die btn name die id sodat ek later kan trace watse item will hy koop
            }
            //Add 'btn' sodat dit nie n error gooi nie
            btnBuyProduct.Name := 'btn' + dmData.ADOTableProducts.FieldByName('ID').AsString;

            btnBuyProduct.Caption := 'Buy This Product';

            btnBuyProduct.Width := 100;

            btnBuyProduct.Left := grbProductInfo.Width - 105;
            btnBuyProduct.Top := grbProductInfo.Height - 30;

            //Gee die button n procedure sodat die button iets kan doen
            btnBuyProduct.OnClick := BuyProductClick;

            //Gaan na die volgende item
            dmData.ADOTableProducts.Next;
          end;

          //Maak db toe
          dmData.ADOTableProducts.Close;
      end;

    //Dit het klaar geupdate so moenie weer nie
    bUpdateItems := False;

end;

procedure TfrmRoder.pnlOderWelcomeClick(Sender: TObject);
begin
  //Change die Color van die panel elke keer as hy daarop kliek

  //Change color van die welcome panel
  if pnlWelcome.Font.Color = clLightBlue
    then
      pnlWelcome.Font.Color := clPrimary
    else
      pnlWelcome.Font.Color := clLightBlue;

  //Change Color van die To panel
  if pnlTo.Font.Color = clLightBlue
    then
      pnlTo.Font.Color := clPrimary
    else
      pnlTo.Font.Color := clLightBlue;

  //Change Color na die Oder Panel
  if pnlOderWelcome.Font.Color = clLightBlue
    then
      pnlOderWelcome.Font.Color := clPrimary
    else
      pnlOderWelcome.Font.Color := clLightBlue;
end;

procedure TfrmRoder.pnlOderWelcomeMouseEnter(Sender: TObject);
begin
  //Increase die img en font size vir die logo en enter

  imgLogoWelcome.Width := 160;
  imgLogoWelcome.Height := 160;


  pnlOderWelcome.Font.Size := 82;
end;

procedure TfrmRoder.pnlOderWelcomeMouseLeave(Sender: TObject);
begin
  //Increase die img en font size vir die logo en enter

  imgLogoWelcome.Width := 150;
  imgLogoWelcome.Height := 150;

  pnlOderWelcome.Font.Size := 72;
end;

procedure TfrmRoder.pnlToClick(Sender: TObject);
begin

  //Change die Color van die panel elke keer as hy daarop kliek

  //Change color van die welcome panel
  if pnlWelcome.Font.Color = clLightBlue
    then
      pnlWelcome.Font.Color := clPrimary
    else
      pnlWelcome.Font.Color := clLightBlue;

  //Change Color van die To panel
  if pnlTo.Font.Color = clLightBlue
    then
      pnlTo.Font.Color := clPrimary
    else
      pnlTo.Font.Color := clLightBlue;

  //Change Color na die Oder Panel
  if pnlOderWelcome.Font.Color = clLightBlue
    then
      pnlOderWelcome.Font.Color := clPrimary
    else
      pnlOderWelcome.Font.Color := clLightBlue;
end;

procedure TfrmRoder.pnlToMouseEnter(Sender: TObject);
begin
  //Increase die font size van pnlTo on enter
  pnlTo.Font.Size := 58;
end;

procedure TfrmRoder.pnlToMouseLeave(Sender: TObject);
begin
  //Reset die font van pnlTo on leave
  pnlTo.Font.Size := 48;
end;

procedure TfrmRoder.pnlWelcomeClick(Sender: TObject);
begin

  //Change die Color van die panel elke keer as hy daarop kliek

  //Change color van die welcome panel
  if pnlWelcome.Font.Color = clLightBlue
    then
      pnlWelcome.Font.Color := clPrimary
    else
      pnlWelcome.Font.Color := clLightBlue;

  //Change Color van die To panel
  if pnlTo.Font.Color = clLightBlue
    then
      pnlTo.Font.Color := clPrimary
    else
      pnlTo.Font.Color := clLightBlue;

  //Change Color na die Oder Panel
  if pnlOderWelcome.Font.Color = clLightBlue
    then
      pnlOderWelcome.Font.Color := clPrimary
    else
      pnlOderWelcome.Font.Color := clLightBlue;

end;

procedure TfrmRoder.pnlWelcomeMouseEnter(Sender: TObject);
begin
  //Increase die font van pnlWelcome on enter
  pnlWelcome.Font.Size := 82;
end;

procedure TfrmRoder.pnlWelcomeMouseLeave(Sender: TObject);
begin
  //Reset die font van pnlWelcome on leave
  pnlWelcome.Font.Size := 72;
end;

procedure TfrmRoder.rgBikeOrPartClick(Sender: TObject);
var

  iXPos, iYPos : integer;
  sFormatedDate : string;

begin

  //Clear die scroll box sodat ek net die bikes of net die parts kan bou
  ClearScrollBox(scbProducts);

  //Clear die search box sodat daar nie komplikasies gebeur nie
  edtSearch.Clear;

  // Initialize die positions
  iXPos := 20;
  iYPos := 20;


  //Maak die db oop
  dmData.ADOTableProducts.Open;

  //Begin by die eerste lyn
  dmData.ADOTableProducts.First;

  //Wys net bikes of parts
  if rgBikeOrPart.ItemIndex = 1 //Wys net Bikes
    then
      begin

        while not dmData.ADOTableProducts.Eof do
          begin
            if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //as dit 0 is, is dit n bike
              then
                begin
                  //Create groupbox vir die components
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
                  if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is
                    then
                      begin
                        if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'BMW'
                          then imgPicOfProduct.Picture.LoadFromFile('BMWlogo.jpg');

                        if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Toyota'
                          then imgPicOfProduct.Picture.LoadFromFile('ToyotaLogo.jpg');

                        if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Honda'
                          then imgPicOfProduct.Picture.LoadFromFile('HondaLogo.jpg');

                        if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Suzuki'
                          then imgPicOfProduct.Picture.LoadFromFile('SuzukiLogo.jpg');

                        if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Yamaha'
                          then imgPicOfProduct.Picture.LoadFromFile('YamahaLogo.jpg');

                        if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Harley Davidson'
                          then imgPicOfProduct.Picture.LoadFromFile('HarleyLogo.png');

                      end;


                  //Create n label vir die naam
                  var lblNameOfProduct := TLabel.Create(grbProductInfo);
                  lblNameOfProduct.Parent := grbProductInfo;

                  lblNameOfProduct.Font.Name := 'Roboto';
                  lblNameOfProduct.Font.Size := 14;

                  lblNameOfProduct.Caption := dmData.ADOTableProducts.FieldByName('ProductName').AsString;

                  lblNameOfProduct.Left := imgPicOfProduct.Left + imgPicOfProduct.Width + 10;
                  lblNameOfProduct.Top := 20;

                  //Create n label vir die CC
                  var lblCCOfBike := TLabel.Create(grbProductInfo);
                  lblCCOfBike.Parent := grbProductInfo;

                  lblCCOfBike.Font.Name := 'Roboto';
                  lblCCOfBike.Font.Size := 14;

                  lblCCOfBike.Caption := dmData.ADOTableProducts.FieldByName('CC').AsString + ' CC';

                  lblCCOfBike.Left := lblNameOfProduct.Left;
                  lblCCOfBike.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;


                  //Create n label vir die Date Pickup
                  var lblDatePickupForProduct := TLabel.Create(grbProductInfo);
                  lblDatePickupForProduct.Parent := grbProductInfo;

                  lblDatePickupForProduct.Font.Name := 'Roboto';
                  lblDatePickupForProduct.Font.Size := 14;

                  sFormatedDate := FormatDateTime('dd mmm yyyy', dmData.ADOTableProducts.FieldByName('DatePickup').AsDateTime);

                  lblDatePickupForProduct.Caption := sFormatedDate;

                  lblDatePickupForProduct.Left := lblNameOfProduct.Left;

                  //Date moet op skuif as dit n part is want die part het nie CC by nie
                  lblDatePickupForProduct.Top := (lblNameOfProduct.Top + lblNameOfProduct.Height) * 2;


                  //Create n label vir die Location Pickup
                  var lblLocationOfPickup := TLabel.Create(grbProductInfo);
                  lblLocationOfPickup.Parent := grbProductInfo;

                  lblLocationOfPickup.Font.Name := 'Roboto';
                  lblLocationOfPickup.Font.Size := 14;

                  lblLocationOfPickup.Caption := dmData.ADOTableProducts.FieldByName('Location').AsString;

                  lblLocationOfPickup.Left := imgPicOfProduct.Left;
                  lblLocationOfPickup.Top := imgPicOfProduct.Top + imgPicOfProduct.Height + 20;

                  //Create n label vir die Price
                  var lblPriceOfProduct := TLabel.Create(grbProductInfo);
                  lblPriceOfProduct.Parent := grbProductInfo;

                  lblPriceOfProduct.Font.Name := 'Roboto';
                  lblPriceOfProduct.Font.Size := 14;

                  lblPriceOfProduct.Caption := FloatToStrF(dmData.ADOTableProducts.FieldByName('Price').AsFloat, ffCurrency, 8, 2);

                  lblPriceOfProduct.Left := imgPicOfProduct.Left;
                  lblPriceOfProduct.Top := lblLocationOfPickup.Top + lblLocationOfPickup.Height + 10;

                  //Create die button om dit te koop
                  var btnBuyProduct := TButton.Create(grbProductInfo);
                  btnBuyProduct.Parent := grbProductInfo;

                  {
                  Maak die btn name die id sodat ek later kan trace watse item will hy koop
                  }
                  //Add 'btn' sodat dit nie n error gooi nie
                  btnBuyProduct.Name := 'btn' + dmData.ADOTableProducts.FieldByName('ID').AsString;

                  btnBuyProduct.Caption := 'Buy This Product';

                  btnBuyProduct.Width := 100;

                  btnBuyProduct.Left := grbProductInfo.Width - 105;
                  btnBuyProduct.Top := grbProductInfo.Height - 30;

                  //Gee die button n procedure sodat die button iets kan doen
                  btnBuyProduct.OnClick := BuyProductClick;

                end;

                //Gaan na die volgende item
                dmData.ADOTableProducts.Next;

          end;

      end
        else
          if rgBikeOrPart.ItemIndex = 2 //as dit n Part is
            then
              begin
                //Begin weer by die eerste lyn
                dmData.ADOTableProducts.First;

                //Wys net parts
                while not dmData.ADOTableProducts.Eof do
                  begin
                     if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 1 //as dit 1 is, is dit net parts
                        then
                          begin
                            //Create all die components
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


                            //Dit wys net parts so ons wys net die part image
                            imgPicOfProduct.Picture.LoadFromFile('BikePart.jpg');


                            //Create n label vir die naam
                            var lblNameOfProduct := TLabel.Create(grbProductInfo);
                            lblNameOfProduct.Parent := grbProductInfo;

                            lblNameOfProduct.Font.Name := 'Roboto';
                            lblNameOfProduct.Font.Size := 14;

                            lblNameOfProduct.Caption := dmData.ADOTableProducts.FieldByName('ProductName').AsString;

                            lblNameOfProduct.Left := imgPicOfProduct.Left + imgPicOfProduct.Width + 10;
                            lblNameOfProduct.Top := 20;


                            //Create n label vir die Date Pickup
                            var lblDatePickupForProduct := TLabel.Create(grbProductInfo);
                            lblDatePickupForProduct.Parent := grbProductInfo;

                            lblDatePickupForProduct.Font.Name := 'Roboto';
                            lblDatePickupForProduct.Font.Size := 14;

                            sFormatedDate := FormatDateTime('dd mmm yyyy', dmData.ADOTableProducts.FieldByName('DatePickup').AsDateTime);

                            lblDatePickupForProduct.Caption := sFormatedDate;

                            lblDatePickupForProduct.Left := lblNameOfProduct.Left;

                            //Date moet op skuif as dit n part is want die part het nie CC by nie
                            lblDatePickupForProduct.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;

                            //Create n label vir die Location Pickup
                            var lblLocationOfPickup := TLabel.Create(grbProductInfo);
                            lblLocationOfPickup.Parent := grbProductInfo;

                            lblLocationOfPickup.Font.Name := 'Roboto';
                            lblLocationOfPickup.Font.Size := 14;

                            lblLocationOfPickup.Caption := dmData.ADOTableProducts.FieldByName('Location').AsString;

                            lblLocationOfPickup.Left := imgPicOfProduct.Left;
                            lblLocationOfPickup.Top := imgPicOfProduct.Top + imgPicOfProduct.Height + 10;

                            //Create n label vir die Price
                            var lblPriceOfProduct := TLabel.Create(grbProductInfo);
                            lblPriceOfProduct.Parent := grbProductInfo;

                            lblPriceOfProduct.Font.Name := 'Roboto';
                            lblPriceOfProduct.Font.Size := 14;

                            lblPriceOfProduct.Caption := FloatToStrF(dmData.ADOTableProducts.FieldByName('Price').AsFloat, ffCurrency, 8, 2);

                            lblPriceOfProduct.Left := imgPicOfProduct.Left;
                            lblPriceOfProduct.Top := lblLocationOfPickup.Top + lblLocationOfPickup.Height + 10;

                            //Create die button om dit te koop
                            var btnBuyProduct := TButton.Create(grbProductInfo);
                            btnBuyProduct.Parent := grbProductInfo;

                            {
                            Maak die btn name die id sodat ek later kan trace watse item will hy koop
                            }
                            //Add 'btn' sodat dit nie n error gooi nie
                            btnBuyProduct.Name := 'btn' + dmData.ADOTableProducts.FieldByName('ID').AsString;

                            btnBuyProduct.Caption := 'Buy This Product';

                            btnBuyProduct.Width := 100;

                            btnBuyProduct.Left := grbProductInfo.Width - 105;
                            btnBuyProduct.Top := grbProductInfo.Height - 30;

                            //Gee die button n procedure sodat die button iets kan doen
                            btnBuyProduct.OnClick := BuyProductClick;
                          end;

                          //Gaan na die volgende lyn
                          dmData.ADOTableProducts.Next;

                  end;

              end
                else
                  if rgBikeOrPart.ItemIndex = 0  //As dit alles is
                    then
                    begin
                        //Wys alles

                        //Begin weer by die eerste lyn
                        dmData.ADOTableProducts.First;

                        while not dmData.ADOTableProducts.Eof do
                        begin
                          //Create n group box vir all die components
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
                          if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is
                            then
                              begin
                                if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'BMW'
                                  then imgPicOfProduct.Picture.LoadFromFile('BMWlogo.jpg');

                                if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Toyota'
                                  then imgPicOfProduct.Picture.LoadFromFile('ToyotaLogo.jpg');

                                if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Honda'
                                  then imgPicOfProduct.Picture.LoadFromFile('HondaLogo.jpg');

                                if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Suzuki'
                                  then imgPicOfProduct.Picture.LoadFromFile('SuzukiLogo.jpg');

                                if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Yamaha'
                                  then imgPicOfProduct.Picture.LoadFromFile('YamahaLogo.jpg');

                                if dmData.ADOTableProducts.FieldByName('ProductName').AsString = 'Harley Davidson'
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

                          lblNameOfProduct.Caption := dmData.ADOTableProducts.FieldByName('ProductName').AsString;

                          lblNameOfProduct.Left := imgPicOfProduct.Left + imgPicOfProduct.Width + 10;
                          lblNameOfProduct.Top := 20;

                          if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0 //As dit n Bike is dan
                            then
                              begin
                                //Create n label vir die CC
                                var lblCCOfBike := TLabel.Create(grbProductInfo);
                                lblCCOfBike.Parent := grbProductInfo;

                                lblCCOfBike.Font.Name := 'Roboto';
                                lblCCOfBike.Font.Size := 14;

                                lblCCOfBike.Caption := dmData.ADOTableProducts.FieldByName('CC').AsString + ' CC';

                                lblCCOfBike.Left := lblNameOfProduct.Left;
                                lblCCOfBike.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;
                              end;


                          //Create n label vir die Date Pickup
                          var lblDatePickupForProduct := TLabel.Create(grbProductInfo);
                          lblDatePickupForProduct.Parent := grbProductInfo;

                          lblDatePickupForProduct.Font.Name := 'Roboto';
                          lblDatePickupForProduct.Font.Size := 14;

                          sFormatedDate := FormatDateTime('dd mmm yyyy', dmData.ADOTableProducts.FieldByName('DatePickup').AsDateTime);

                          lblDatePickupForProduct.Caption := sFormatedDate;

                          lblDatePickupForProduct.Left := lblNameOfProduct.Left;

                          //Date moet op skuif as dit n part is want die part het nie CC by nie
                          if dmData.ADOTableProducts.FieldByName('Type').AsInteger = 0
                            then
                              lblDatePickupForProduct.Top := (lblNameOfProduct.Top + lblNameOfProduct.Height) * 2
                            else lblDatePickupForProduct.Top := lblNameOfProduct.Top + lblNameOfProduct.Height + 10;

                          //Create n label vir die Location Pickup
                          var lblLocationOfPickup := TLabel.Create(grbProductInfo);
                          lblLocationOfPickup.Parent := grbProductInfo;

                          lblLocationOfPickup.Font.Name := 'Roboto';
                          lblLocationOfPickup.Font.Size := 14;

                          lblLocationOfPickup.Caption := dmData.ADOTableProducts.FieldByName('Location').AsString;

                          lblLocationOfPickup.Left := imgPicOfProduct.Left;
                          lblLocationOfPickup.Top := imgPicOfProduct.Top + imgPicOfProduct.Height + 20;

                          //Create n label vir die Price
                          var lblPriceOfProduct := TLabel.Create(grbProductInfo);
                          lblPriceOfProduct.Parent := grbProductInfo;

                          lblPriceOfProduct.Font.Name := 'Roboto';
                          lblPriceOfProduct.Font.Size := 14;

                          lblPriceOfProduct.Caption := FloatToStrF(dmData.ADOTableProducts.FieldByName('Price').AsFloat, ffCurrency, 8, 2);

                          lblPriceOfProduct.Left := imgPicOfProduct.Left;
                          lblPriceOfProduct.Top := lblLocationOfPickup.Top + lblLocationOfPickup.Height + 10;

                          //Create die button om dit te koop
                          var btnBuyProduct := TButton.Create(grbProductInfo);
                          btnBuyProduct.Parent := grbProductInfo;

                          {
                          Maak die btn name die id sodat ek later kan trace watse item will hy koop
                          }
                          //Add 'btn' sodat dit nie n error gooi nie
                          btnBuyProduct.Name := 'btn' + dmData.ADOTableProducts.FieldByName('ID').AsString;

                          btnBuyProduct.Caption := 'Buy This Product';

                          btnBuyProduct.Width := 100;

                          btnBuyProduct.Left := grbProductInfo.Width - 105;
                          btnBuyProduct.Top := grbProductInfo.Height - 30;

                          //Gee die button n procedure sodat die button iets kan doen
                          btnBuyProduct.OnClick := BuyProductClick;

                          //Gaan na die volgende item
                          dmData.ADOTableProducts.Next;
                        end;
                    end;

    //Maak db toe
    dmData.ADOTableProducts.Close;

end;

procedure TfrmRoder.rgChangeThemeClick(Sender: TObject);
begin
  //Change the color of the form

  if rgChangeTheme.ItemIndex = 1
    then
      //Dark mode
      begin
        frmRoder.Color := clGray
      end
    else
      //Light mode
      begin
        frmRoder.Color := clBtnFace;
      end;

end;

procedure TfrmRoder.rgSellWhatClick(Sender: TObject);
begin
  //if user clicks on Bike or Bike Part in Sell Page

  //As die user n bike will verkoop
  if rgSellWhat.ItemIndex = 0  //bike
    then
      begin
        // Maak die preview bool weer true
        bIsPreview := True;

        //Maak alles skoon
        edtPartName.Clear;
        edtLocationPickup.Clear;
        cbbBrandName.ItemIndex := -1;
        edtPrice.Clear;
        grbProduct.Caption := '';

        //Skyf die components
        pnlBrandName.Left := 20;
        pnlLocationPickup.Left := 20;
        pnlPrice.Left := 20;
        pnlCcBike.Left := 20;

        //Maak false wat nie gebruik gaan word nie
        pnlPartName.Visible := false;
        pnlBrandName.Visible := true;
        cbbBrandName.Visible := True;
        edtPartName.Visible := False;
        pnlCcBike.Visible := True;
        sedtCC.Visible := True;
        //Default image is Logo.png
        imgProductLogo.Picture.LoadFromFile('Logo.png');

        //Reset die captions
        lblProductName.Caption := 'Brand Name';
        lblProductCCBike.Caption := 'CC of Bike';
        lblProductLocationPickup.Caption := 'Location Pickup';
        lblProductPrice.Caption := 'Price';
        lblProductDatePickup.Caption := 'Date Pickup';

        //Skyf die CC terug
        pnlDatePickup.Left := (sedtCC.Left + sedtCC.Width) + 20;
        dtpDatePickup.Left := (pnlDatePickup.Left + pnlDatePickup.Width) + 10;
        dtpDatePickup.Top := pnlDatePickup.Top  + 10;
        dtpDatePickup.Width := 100;
        lblProductDatePickup.Top := 112;

        //Button moet weer false wees
        btnPreviewSell.Enabled := false;
        btnPreviewSell.Caption := 'Preview Product';
      end
    //As die user n part will verkoop
    else //Part
      begin
        // Maak die preview bool weer true
        bIsPreview := True;

        //Maak alles skoon
        edtPartName.Clear;
        edtLocationPickup.Clear;
        cbbBrandName.ItemIndex := -1;
        edtPrice.Clear;
        grbProduct.Caption := '';

        //Maak false want ons gebruik dit nie
        //en skyf dit dan
        pnlBrandName.Visible := false;
        pnlPartName.Visible := true;
        pnlPartName.Left := 20;
        cbbBrandName.Visible := False;
        edtPartName.Visible := True;
        grbProduct.Caption := '';
        pnlCcBike.Visible := False;
        sedtCC.Visible := False;
        imgProductLogo.Picture.LoadFromFile('BikePart.jpg');

        //Reset die captions
        lblProductName.Caption := 'Product Name';
        lblProductCCBike.Caption := '';
        lblProductLocationPickup.Caption := 'Location Pickup';
        lblProductPrice.Caption := 'Price';
        lblProductDatePickup.Caption := 'Date Pickup';

        //Skyf die date want die CC is weg
        pnlDatePickup.Left := 20;
        dtpDatePickup.Left := (pnlDatePickup.Left + pnlDatePickup.Width) + 10;
        dtpDatePickup.Width := 200;
        lblProductDatePickup.Top := lblProductCCBike.Top;

        //Dit moet weer se preview want dit het verander
        btnPreviewSell.Enabled := false;
        btnPreviewSell.Caption := 'Preview Product';
      end;
end;

procedure TfrmRoder.sedtPriceChange(Sender: TObject);
begin

  if rgSellWhat.ItemIndex = 0 then
    begin
      // Check of enige van die required fields empty is
      if (cbbBrandName.ItemIndex = -1) or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
        then
        // As enige field empty is disable die button
        btnPreviewSell.Enabled := false
      else
        // Enable die button as all die fields nie empty is nie
        btnPreviewSell.Enabled := true;
    end
      else
        begin
          // Check of enige van die required fields empty is
          if (edtPartName.Text = '') or (edtLocationPickup.Text = '') or (edtPrice.Text = '')
            then
            // As enige field empty is disable die button
            btnPreviewSell.Enabled := false
          else
            // Enable die button as all die fields nie empty is nie
            btnPreviewSell.Enabled := true;
        end;

end;

end.

unit dmData_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmData = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTableUsers: TADOTable;
    DataSource1: TDataSource;
    ADOTableProducts: TADOTable;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    //User id moet hier gekry word sodat ons ooral, even tussen forms, die id kan access
    sUserID: string;
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

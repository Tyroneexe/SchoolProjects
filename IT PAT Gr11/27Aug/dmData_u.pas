unit dmData_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Data.FMTBcd,
  Data.SqlExpr;

type
  TdmData = class(TDataModule)
    conData: TADOConnection;
    tblUsers: TADOTable;
    tblDiet: TADOTable;
    qryData: TADOQuery;
    dsDataQuery: TDataSource;
    tblHealthData: TADOTable;
    dsHealthData: TDataSource;
    dsDiet: TDataSource;
    dsUsers: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    sUserID : string;
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

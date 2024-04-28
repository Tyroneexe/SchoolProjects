unit dmData_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmData = class(TDataModule)
    ADOCon: TADOConnection;
    tblUsers: TADOTable;
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

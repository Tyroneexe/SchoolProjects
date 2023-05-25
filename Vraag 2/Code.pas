unit Vraag2_u;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, Buttons;

type
TForm1 = class(TForm)
edtPunt1: TEdit;
edt Punt2: TEdit; IblPunt1: TLabel; IblPunt2: TLabel;
btnBereken: TButton;
bmbRetry: TBitBtn;
bmbClose: TBitBtn;
redAfvoer: TRichEdit;
edtNaam: TEdit;
IblNaam: TLabel;
edtVan: TEdit;
lblVan: TLabel;

procedure btnBerekenClick(Sender: TObject);
procedure bmbRetryClick(Sender: TObject);

private
 { Private declarations }
Public
 { Public declarations }
end;

var
Form1: TForm1;
implementation

{$R.dfm)

procedure TForm1.bmbRetryClick(Sender: TObject);
begin
edtPunt1.Clear;
edtPunt2.Clear;
edtNaam.Clear;
edtVan.Clear;
edtNaam.SetFocus;
end;

procedure TForm1.btnBerekenClick(Sender: TObject);
var
  iPunt1, iPunt2 : integer;
  SNaam, sVan : string:
  rGemiddeld, rPersentasie1, rPersentasie2: real;
begin
SNaam: edtNaam.Text; sVan: edtVan.Text;
iPunt1 := StrTolnt(edtPunt1.Text); iPunt2:= StrToInt(edtPunt2.Text);
rPersentasiel := iPunt1/75*100; rPersentasie2 := iPunt2/60*100;
rGemiddeld := (rPersentasiel+rPersentasie2)/2;
redAfvoer.Lines.Add('Toetsverslag vir + sNaam+ sVan);
redAfvoer.Lines.Add('Toets 1: '+FloatToStrF(rPersentasiel, ffFixed,8,1)+"%"); redAfvoer.Lines.Add('Toets 2: '+FloatToStrF(rPersentasie2, ffFixed,8,1)+"%");
redAfvoer.Lines.Add(#13+'Gemiddeld: '+FloatToStrF(rGemiddeld, ffFixed,8,1)+'%');
end;
end.

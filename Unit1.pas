unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    play1: TLabeledEdit;
    play2: TLabeledEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Radio2: TRadioButton;
    Radio1: TRadioButton;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    procedure Radio1Click(Sender: TObject);
    procedure Radio2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

 

procedure TForm1.Radio1Click(Sender: TObject);
begin
groupbox1.Enabled:=true;
play2.Enabled:=false;
play2.Text:=' COMPUTER ';
end;

procedure TForm1.Radio2Click(Sender: TObject);
begin
groupbox1.Enabled:=true;
play2.Enabled:=true;
play2.Text:='';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if (play1.Text<>'')and(play2.Text<>play1.Text)and(play2.Text<>'')and(play1.Text<>' COMPUTER ')then
begin
form1.Visible:=false;
form1.Hide;
form2.show;
 form2.playeroo.Caption:=play1.Text;
  form2.playerxx.Caption:=play2.Text;
end
else
begin
showmessage('Check YOUR Names YAHDIK ALLAH');
end;
end;

end.

unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, Buttons,shellapi;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    son: TCheckBox;
    winx: TSpeedButton;
    wino: TSpeedButton;
    sel: TSpeedButton;
    selo: TSpeedButton;
    selx: TSpeedButton;
    vide: TSpeedButton;
    Panel2: TPanel;
    GAME: TStringGrid;
    Timer1: TTimer;
    Panel3: TPanel;
    Panel4: TPanel;
    playerxx: TPanel;
    playerxxx: TPanel;
    playeroo: TPanel;
    Playerooo: TPanel;
    xxx: TSpeedButton;
    o: TSpeedButton;
  
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GAMEMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GAMEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure GAMEMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  player,playero,playerx:string;
  nbx,nby,selxx,nbselected,selyy,selx1,sely1:integer;
  t:array[0..5]of array[0..5]of integer;

implementation

{$R *.dfm}
           uses unit1;

              function gagner(aux:string):boolean;
var i,j:integer;
test:boolean;
begin
 test:=true;
  for i:=0 to 2 do
     begin
     test:=true;
       for j:=0 to 2 do
         begin

             if form2.GAME.Cells[i,j]<>aux
             then
             begin
             test:=false;
              t[i,j]:=0;
               break;
             end   ;



         end;
           if test=true then

             begin
             t[i,0]:=1;
             t[i,1]:=1;
             t[i,2]:=1;
             break;
             end;
    end;

    if test=false then
    begin
    test:=true;
   for i:=0 to 2 do
     begin
      test:=true;
       for j:=0 to 2 do
         begin

             if form2.GAME.Cells[j,i]<>aux
             then
             begin
             test:=false;
             t[j,i]:=0;
             break;
             end  ;


         end;
           if test=true then
             
             begin
             t[0,i]:=1;
             t[1,i]:=1;
             t[2,i]:=1;
             break;
             end;
    end;
   end;

    if test=false then
    begin
     if (form2.GAME.Cells[0,0]=aux) and(form2.GAME.Cells[1,1]=aux)and(form2.GAME.Cells[2,2]=aux)then
       begin
         test:=true;
         t[0,0]:=1; t[1,1]:=1; t[2,2]:=1;

       end
       else test:=false;

    end;

      if test=false then
    begin
     if (form2.GAME.Cells[0,2]=aux) and(form2.GAME.Cells[1,1]=aux)and(form2.GAME.Cells[2,0]=aux)then
       begin
         test:=true;
         t[0,2]:=1; t[1,1]:=1; t[2,0]:=1;

       end
       else test:=false;

    end;

   result:=test;

  end;

          
       procedure coloration();
var i,j:integer;
begin
for i:=1 to 3  do
begin
 for j:=1 to 3 do
 begin

  if form2.GAME.Cells[i-1,j-1]=playerx then

     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.xxx.Glyph)
    else if  form2.GAME.Cells[i-1,j-1]=playero then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.o.Glyph)
      else if  form2.GAME.Cells[i-1,j-1]='' then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.vide.Glyph)
       else if  form2.GAME.Cells[i-1,j-1]='selectedx' then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.selx.Glyph)
       else if  form2.GAME.Cells[i-1,j-1]='selectedo' then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.selo.Glyph)
       else if  form2.GAME.Cells[i-1,j-1]='selected' then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.sel.Glyph)
         else if  form2.GAME.Cells[i-1,j-1]='gagnerx' then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.winx.Glyph)
        else if  form2.GAME.Cells[i-1,j-1]='gagnero' then
     FORM2.GAME.Canvas.Draw((J*140)-140+J-1,(I*140)-140+I-1,form2.wino.Glyph);








 end;
 end;
 form2.GAME.Repaint;

 end;//end coloration//

procedure initialisation();
begin

playero:=Form1.play1.text;
 playerx:=Form1.play2.text;

 form2.playeroo.Caption:=playero;
  form2.playerxx.Caption:=playerx;
nbx:=0;
nby:=0;
coloration();coloration();

randomize;
if (random(10)mod 2=0)then
  player:=playero
else player:=playerx;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
APPLICATION.Terminate;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if button1.Caption='START' then
begin
initialisation();
game.Enabled:=true;
button1.Caption:='RESET';
end
else
begin
shellexecute(0,'open',pchar(application.ExeName),nil,nil,sw_show);
application.Terminate;
end;
end;




function verif(ligne,col:integer):boolean;
begin
try

 if (nbx<3)and(player=playerx)then
  verif:=true
  else if (nby<3)and(player=playero)then
   verif:=true

  else if(nbx=3)and(nbselected>=1)and(ligne-1>=0)and(col-1>=0)and(player=playerx)and((form2.GAME.Cells[ligne+1,col]='selectedx')or(form2.GAME.Cells[ligne,col+1]='selectedx')or(form2.GAME.Cells[ligne,col-1]='selectedx')or(form2.GAME.Cells[ligne-1,col]='selectedx')) then
   verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1>=0)and(col-1>=0)and(player=playero)and((form2.GAME.Cells[ligne+1,col]='selectedo')or(form2.GAME.Cells[ligne,col+1]='selectedo')or(form2.GAME.Cells[ligne,col-1]='selectedo')or(form2.GAME.Cells[ligne-1,col]='selectedo')) then
   verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1<0)and(col-1<0)and(player=playero)and((form2.GAME.Cells[ligne+1,col]='selectedo')or(form2.GAME.Cells[ligne,col+1]='selectedo')) then
  verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1<0)and(col-1>=0)and(player=playero)and((form2.GAME.Cells[ligne+1,col]='selectedo')or(form2.GAME.Cells[ligne,col+1]='selectedo')or(form2.GAME.Cells[ligne,col-1]='selectedo')) then
  verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1>=0)and(col-1<0)and(player=playero)and((form2.GAME.Cells[ligne+1,col]='selectedo')or(form2.GAME.Cells[ligne,col+1]='selectedo')or(form2.GAME.Cells[ligne-1,col]='selectedo')) then
   verif:=true

   else if(nbx=3)and(nbselected>=1)and(ligne-1>=0)and(col-1>=0)and(player=playero)and((form2.GAME.Cells[ligne+1,col]='selectedo')or(form2.GAME.Cells[ligne,col+1]='selectedo')or(form2.GAME.Cells[ligne,col-1]='selectedo')or(form2.GAME.Cells[ligne-1,col]='selectedo')) then
   verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1>=0)and(col-1>=0)and(player=playerx)and((form2.GAME.Cells[ligne+1,col]='selectedx')or(form2.GAME.Cells[ligne,col+1]='selectedx')or(form2.GAME.Cells[ligne,col-1]='selectedx')or(form2.GAME.Cells[ligne-1,col]='selectedx')) then
   verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1<0)and(col-1<0)and(player=player)and((form2.GAME.Cells[ligne+1,col]='selectedx')or(form2.GAME.Cells[ligne,col+1]='selectedx')) then
  verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1<0)and(col-1>=0)and(player=playerx)and((form2.GAME.Cells[ligne+1,col]='selectedx')or(form2.GAME.Cells[ligne,col+1]='selectedx')or(form2.GAME.Cells[ligne,col-1]='selectedx')) then
  verif:=true
  else if(nby=3)and(nbselected>=1)and(ligne-1>=0)and(col-1<0)and(player=playerx)and((form2.GAME.Cells[ligne+1,col]='selectedx')or(form2.GAME.Cells[ligne,col+1]='selectedx')or(form2.GAME.Cells[ligne-1,col]='selectedx')) then
   verif:=true


   else verif:=false;

  except
  end;




end;

procedure computer();
var a,b:integer;

begin

  if nbx<3 then
     begin
       if form2.GAME.Cells[1,1]='' then
          begin
         form2.GAME.Cells[1,1]:=player;
         inc(nbx);

           exit;
         end
         else  if (form2.GAME.Cells[2,2]='')and( form2.GAME.Cells[0,0]<>player)and( form2.GAME.Cells[0,2]<>player)and( form2.GAME.Cells[2,0]<>player) and( form2.GAME.Cells[1,1]<>player)then
          begin
         form2.GAME.Cells[2,2]:=player;
         inc(nbx);
           exit;
         end
         else  if (form2.GAME.Cells[0,0]='')and( form2.GAME.Cells[2,2]<>player)and( form2.GAME.Cells[0,2]<>player)and( form2.GAME.Cells[2,0]<>player)and( form2.GAME.Cells[1,1]<>player) then
          begin
         form2.GAME.Cells[0,0]:=player;
         inc(nbx);
           exit;
         end
         else  if (form2.GAME.Cells[2,0]='')and( form2.GAME.Cells[0,2]<>player)and(form2.GAME.Cells[2,2]<>player)and( form2.GAME.Cells[0,0]<>player)and( form2.GAME.Cells[1,1]<>player) then
          begin
         form2.GAME.Cells[2,0]:=player;
         inc(nbx);
           exit;
         end
         else  if (form2.GAME.Cells[0,2]='')and( form2.GAME.Cells[2,0]<>player)and(form2.GAME.Cells[2,2]<>player)and( form2.GAME.Cells[0,0]<>player)and( form2.GAME.Cells[1,1]<>player) then
          begin
         form2.GAME.Cells[0,2]:=player;
         inc(nbx);
           exit;
         end
         //simetrique/:
            else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=2) and (selx1=2)and( form2.GAME.Cells[0,0]='')then
          begin
         form2.GAME.Cells[0,0]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=0 )and (selx1=0)and( form2.GAME.Cells[2,2]='')then
          begin
         form2.GAME.Cells[2,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=2 )and (selx1=0)and( form2.GAME.Cells[0,2]='')then
          begin
         form2.GAME.Cells[0,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=0 )and (selx1=2)and( form2.GAME.Cells[2,0]='')then
          begin
         form2.GAME.Cells[2,0]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=0 )and (selx1=1)and( form2.GAME.Cells[2,1]='')then
          begin
         form2.GAME.Cells[2,1]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=1) and (selx1=0)and( form2.GAME.Cells[1,2]='')then
          begin
         form2.GAME.Cells[1,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=2 )and (selx1=1)and( form2.GAME.Cells[0,1]='')then
          begin
         form2.GAME.Cells[0,1]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(form2.GAME.Cells[1,1]=playero)and(sely1=1 )and (selx1=2)and( form2.GAME.Cells[1,0]='')then
          begin
         form2.GAME.Cells[1,0]:=player;
         inc(nbx);
           exit;
         end



              //simetrique/:

              //simetrique/:
            else  if (nby=2)and(sely1=2) and (selx1=2)and( form2.GAME.Cells[0,0]='')then
          begin
         form2.GAME.Cells[0,0]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=0 )and (selx1=0)and( form2.GAME.Cells[2,2]='')then
          begin
         form2.GAME.Cells[2,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=2 )and (selx1=0)and( form2.GAME.Cells[0,2]='')then
          begin
         form2.GAME.Cells[0,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=0 )and (selx1=2)and( form2.GAME.Cells[2,0]='')then
          begin
         form2.GAME.Cells[2,0]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=0 )and (selx1=1)and( form2.GAME.Cells[2,1]='')then
          begin
         form2.GAME.Cells[2,1]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=1) and (selx1=0)and( form2.GAME.Cells[1,2]='')then
          begin
         form2.GAME.Cells[1,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=2 )and (selx1=1)and( form2.GAME.Cells[0,1]='')then
          begin
         form2.GAME.Cells[0,1]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=2)and(sely1=1 )and (selx1=2)and( form2.GAME.Cells[1,0]='')then
          begin
         form2.GAME.Cells[1,0]:=player;
         inc(nbx);
           exit;
         end



              //simetrique/:

              //simetrique/:



           else  if (nby=3)and(sely1=0 )and (selx1=1)and( form2.GAME.Cells[2,1]='')then
          begin
         form2.GAME.Cells[2,1]:=player;
         inc(nbx);
           exit;
         end
          else  if (nby=2)and(sely1=0 )and (selx1=2)and( form2.GAME.Cells[0,0]='')then
          begin
         form2.GAME.Cells[0,0]:=player;
         inc(nbx);
           exit;
         end
          else  if (nby=2)and(sely1=2 )and (selx1=2)and( form2.GAME.Cells[2,0]='')then
          begin
         form2.GAME.Cells[2,0]:=player;
         inc(nbx);
           exit;
         end
          else  if (nby=2)and(sely1=0 )and (selx1=0)and( form2.GAME.Cells[2,2]='')then
          begin
         form2.GAME.Cells[2,2]:=player;
         inc(nbx);
           exit;
         end
          else  if (nby=2)and(sely1=2 )and (selx1=0)and( form2.GAME.Cells[2,2]='')then
          begin
         form2.GAME.Cells[2,2]:=player;
         inc(nbx);
           exit;
         end


           else  if (nby=3)and(sely1=1) and (selx1=0)and( form2.GAME.Cells[1,2]='')then
          begin
         form2.GAME.Cells[1,2]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=3)and(sely1=2 )and (selx1=1)and( form2.GAME.Cells[0,1]='')then
          begin
         form2.GAME.Cells[0,1]:=player;
         inc(nbx);
           exit;
         end

           else  if (nby=3)and(sely1=1 )and (selx1=2)and( form2.GAME.Cells[1,0]='')then
          begin
         form2.GAME.Cells[1,0]:=player;
         inc(nbx);
           exit;
         end
              //simetrique/:
         else
         begin


             if (form2.GAME.Cells[sely1,selx1+1]='')and((selx1+1<=2))then
             form2.GAME.Cells[sely1,selx1+1]:=player
             else if (form2.GAME.Cells[sely1+1,selx1]='')and((sely1+1<=2))then
             form2.GAME.Cells[sely1+1,selx1]:=player
               else if ((sely1-1>=0))and(form2.GAME.Cells[sely1-1,selx1]='')then
             form2.GAME.Cells[sely1-1,selx1]:=player
             else if ((selx1-1>=0))and(form2.GAME.Cells[sely1-1,selx1]='')then
             form2.GAME.Cells[selx1-1,selx1]:=player

             else
               begin
                  repeat
              randomize;
             a:=random(3);
               randomize;
             b:=random(3);
             until form2.GAME.Cells[a,b]='';
              form2.GAME.Cells[b,a]:=player
               end;

             inc(nbx);
            exit;
         end;

     end
     else
     begin
      for a:=0 to 2 do
        begin
          for b:=0 to 2 do
            begin
              if (b+1<=2)and(form2.GAME.Cells[a,b]=player)and(form2.GAME.Cells[a,b+1]='')then
                begin
                form2.GAME.Cells[a,b]:=''   ;
                form2.GAME.Cells[a,b+1]:=player;




                  exit;

                end
                else  if (a+1<=2)and(form2.GAME.Cells[a,b]=player)and(form2.GAME.Cells[a+1,b]='')then
                begin
                form2.GAME.Cells[a,b]:=''   ;
                form2.GAME.Cells[a+1,b]:=player;


                  exit;
                end
                else if (a-1>=0)and(form2.GAME.Cells[a,b]=player)and(form2.GAME.Cells[a-1,b]='')then
                begin
                form2.GAME.Cells[a,b]:=''   ;
                form2.GAME.Cells[a-1,b]:=player;


                 
                  exit;
                end
                else   if (b-1>=0)and(form2.GAME.Cells[a,b]=player)and(form2.GAME.Cells[a,b-1]='')then
                begin
                form2.GAME.Cells[a,b]:=''   ;
                form2.GAME.Cells[a,b-1]:=player;
               
                  
                  exit;
                end  ;





            end;
        end;
     end; 


end;

procedure TForm2.GAMEMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var col,ligne:integer;
begin
game.MouseToCell(x,y,col,ligne);

   if (game.Cells[ligne,col]=player)and(player<>' COMPUTER ') then
     begin
        if (nbx=3)and(player=playerx) then
          begin
       if nbselected=0 then
       begin
        game.Cells[ligne,col]:='selectedx'    ;
        inc(nbselected);
        selxx:=col;
        selyy:=ligne;
        end
        else if nbselected=1 then
        begin
        game.Cells[selyy,selxx]:=player;
        game.Cells[ligne,col]:='selectedx'  ;
        nbselected:=1;
        selxx:=col;
        selyy:=ligne;
        end
        else
        begin
        game.Cells[selyy,selxx]:=player;
        game.Cells[sely1,selx1]:=''  ;
        game.Cells[ligne,col]:='selectedx'  ;
        nbselected:=1;
        selxx:=col;
        selyy:=ligne;
        end;
     end
     else  if (nby=3)and(player=playero) then
          begin

       if nbselected=0 then
       begin
        game.Cells[ligne,col]:='selectedo'    ;
        inc(nbselected);
        selxx:=col;
        selyy:=ligne;
        end
        else if nbselected=1 then
        begin
        game.Cells[selyy,selxx]:=player;
        game.Cells[ligne,col]:='selectedo'  ;
        nbselected:=1;
        selxx:=col;
        selyy:=ligne;
        end
        else
        begin
        game.Cells[selyy,selxx]:=player;
        game.Cells[sely1,selx1]:=''  ;
        game.Cells[ligne,col]:='selectedo'  ;
        nbselected:=1;
        selxx:=col;
        selyy:=ligne;
        end;
     end;
    end

     else   if (game.Cells[ligne,col]='')and(player<>' COMPUTER ') then
     begin
        if verif(ligne,col)  then
         begin
         if  game.Cells[sely1,selx1]='selected' then
             game.Cells[sely1,selx1]:='' ;
             
        game.Cells[ligne,col]:='selected'  ;

        inc(nbselected);
        selx1:=col;
        sely1:=ligne;
        end;
     end
     else if (game.Cells[ligne,col]='selected')and(player<>' COMPUTER ') then
     begin
        if verif(ligne,col)  then
         begin
        game.Cells[ligne,col]:='' ;
        dec(nbselected);
        end;
     end  ;

      
   


       coloration();coloration();
      
end;

procedure TForm2.GAMEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var aux:string;i,j:integer;
begin
   aux:=player;

try


if nbselected>1 then
begin

  if (nbx=3)and(player=playerx)then
  begin
game.Cells[sely1,selx1]:=  player;
game.Cells[selyy,selxx]:='';

 if son.Checked=true then
         windows.Beep(2000,100);
end

else if (nby=3)and(player=playero)then
  begin
game.Cells[sely1,selx1]:=  player;
game.Cells[selyy,selxx]:='';
end   ;

 if son.Checked=true then
         windows.Beep(2000,100);
         
  if player=playero then
 player:=playerx
else player:=playero;

nbselected:=0;
end





else if (nbx<3)and(player=playerx)and(nbselected=1)then
  begin
game.Cells[sely1,selx1]:=player;
inc(nbx);
 if son.Checked=true then
         windows.Beep(2000,100);
if player=playero then
 player:=playerx
else player:=playero;

nbselected:=0;
end

else  if (nby<3)and(player=playero)and(nbselected=1)then
  begin
game.Cells[sely1,selx1]:=player;
inc(nby);

 if son.Checked=true then
         windows.Beep(2000,100);

if player=playero then
 player:=playerx
else player:=playero;
nbselected:=0;

end    ;



  except
  end;

  if gagner(aux) then
begin
  timer1.Enabled:=false;
for i:=0 to 2 do
begin
  for j:=0 to 2 do
  begin
    if t[i,j]=1 then
        if aux=playero then
        game.Cells[i,j]:='gagnero'
        else  game.Cells[i,j]:='gagnerx'  ;
        end;
        end;
         coloration();coloration();
game.Enabled:=false;
showmessage(aux+' is the Winner ');
end;

coloration();coloration(); coloration;
   

end;

procedure TForm2.Timer1Timer(Sender: TObject);
var i,j:integer;

begin
if game.Enabled=true then
game.SetFocus;
if (player=playero)and(playeroo.Color<>cllime)then
  begin
 playeroo.Color:=cllime;
 playerxx.Color:=clblack;
  playerooo.Color:=cllime;
 playerxxx.Color:=clblack;
 end
else if  (player=playerx)and(playerxx.Color<>cllime) then
begin
 playeroo.Color:=clblack;
 playerxx.Color:=cllime;
  playerooo.Color:=clblack;
 playerxxx.Color:=cllime;
 end;

 if(player=' COMPUTER ') then
 BEGIN

         computer();
      
      if form2.son.Checked=true then
                    windows.Beep(2000,100);

                      coloration();coloration();


                                        if gagner(player) then
begin
  timer1.Enabled:=false;
for i:=0 to 2 do
begin
  for j:=0 to 2 do
  begin
    if t[i,j]=1 then
        if player=playero then
        game.Cells[i,j]:='gagnero'
        else  game.Cells[i,j]:='gagnerx'  ;
        end;
        end;
         coloration();coloration();
game.Enabled:=false;
showmessage(player+' is the Winner ');
end;


                  player:=playero;
                 


        

 END;

end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
if player=' COMPUTER ' then
 begin
  
 end;
end;

procedure TForm2.GAMEMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
       var col,ligne:integer;
begin
 try
         game.MouseToCell(x,y,col,ligne);

        if (game.Cells[ligne,col]=player) then
        game.Cursor:=crhandpoint
        else if game.Cells[ligne,col]='' then
        game.Cursor:=crhandpoint
        else if (game.Cells[ligne,col]='selectedx')or(game.Cells[ligne,col]='selectedx')then
        game.Cursor:=crdrag
         else if (game.Cells[ligne,col]='selected')then
        game.Cursor:=crappstart
        else game.Cursor:=crno;

       

          except
          end;
end;

end.

data myopia;
     input Refract$ Light$ Count @@;
     cards;
HighHyper Darkness 4   HighHyper Night_light 2   HighHyper Room_light 1
          Hyperopia Darkness 36   Hyperopia Night_light 37   Hyperopia Room_light 11
     Emmetropia Darkness 114  Emmetropia Night_light 115   Emmetropia Room_light 22
     Myopia Darkness 16  Myopia Night_light 71   Myopia Room_light 36
 HighMyopia Darkness 2 HighMyopia Night_light 7  HighMyopia Room_light 5
;
proc freq order=data data=myopia; weight count;
tables refract*light/cmh chisq norow nopercent  ;
run;

proc genmod  order=data; class Refract Light;
model Count=Refract Light/dist=p link=log;
title 'independence model';
run;

data myop; set myopia;
if Refract='HighHype' then Refnum=1;
else if Refract='Hyperopi' then Refnum=2;
else if Refract='Emmetrop' then Refnum=3;
else if Refract='Myopia' then Refnum=4;
else Refnum=5;
myopic=0;
if Refnum=4 or Refnum=5 then myopic=1;
If Light='Darkness' then Lightnum=0;
else if Light='Night_li' then Lightnum=1;
else Lightnum=2;
assoc=Refnum*Lightnum;
   proc print;
   run;

proc genmod  order=data; class Refract Light; ods select modelfit type3;
model Count=Refract Light assoc/dist=p link=log type3;
title 'Linear by linear association model';
run;

proc genmod  order=data; class Refract Light; 
model Count=Refract Light Refract*Lightnum/dist=p link=log type3;
title 'Row effects model';
run;

proc genmod order=data; class  Refract Light;
model Count= Refract Light myopic*Lightnum/dist=p link=log type3;
title 'Row effects model with dichotomized interaction';
run;
proc genmod  order=data; class Refract Light; ods select modelfit type3;
model Count=Refract Light Refnum*Light/dist=p link=log type3;
title 'Column effects model';
run;


proc genmod  order=data; class Refract Light; ods select modelfit type3;
model Count=Refract Light Refract*Lightnum Refnum*Light/dist=p link=log type3;
title 'Row and column effects model';
run;

proc genmod  order=data; class Refract Light; ods select modelfit type3;
model Count=Refract| Light /dist=p link=log type3;
title 'Saturated model';

run;

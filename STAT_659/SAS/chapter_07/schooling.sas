
/*  Schooling and age data from Kateri, Contingency Table Analysis, p. 168 
(originally from Wermuth and Cox (1998).
A sample of people from West Germany are classified according to the type of schooling
completed and their age.
*/

data schooling; 
input type $ agegroup $ freq;
cards;

bas_inc 18-29 12
bas_comp 18-29 215
medium 18-29 277
uppermed 18-29 52
intens	18-29 233
bas_inc 30-44 13
bas_comp 30-44 507
medium 30-44 300
uppermed 30-44 91
intens	30-44 225
bas_inc 45-59 12
bas_comp 45-59 493
medium 45-59 192
uppermed 45-59 47
intens	45-59 102
bas_inc 60-74 20
bas_comp 60-74 460
medium 60-74 126
uppermed 60-74 15
intens	60-74 74
bas_inc >74 7
bas_comp >74 137
medium >74 38
uppermed >74 6
intens	>74 19

data scored; set schooling;
 if agegroup='18-29' then age=1;
    else if agegroup='30-44' then age=2;
	     else if agegroup='45-59' then age=3;
		  else if agegroup='60-74' then age=4;
		   else if agegroup='>74' then age=5;

 if type='bas_inc' then type_ord=1;
    else if type='bas_comp' then type_ord=2;
	else if type='medium' then type_ord=3;
	else if type='uppermed' then type_ord=4;
else if type='intens' then type_ord=5;
	assoc=type_ord*age;
        
* use freq to test for  association;        
proc freq data=schooling order=data; weight freq;
tables type*agegroup/cellchi2 chisq expected plots=mosaicplot;
title 'Testing for Association using Freq';
run;

* use freq to test for linear by linear association using table scores;
proc freq order=data data=scored; weight freq;
tables type_ord*age/nopercent norow nocol cmh1 chisq measures;
title 'Testing Linear by Linear Association with Table Scores';
run;
* use freq to test for linear by linear association using ridit 
scores;
proc freq order=data; weight freq;
tables type*agegroup/nopercent norow nocol cmh1 measures scores=ridit;
title 'Testing Linear by Linear Association with Ridit Scores';
run;



proc genmod data=scored; class type agegroup; 
model freq=type agegroup /dist=p link=log;
title 'Fitting the independence model with genmod';

proc genmod data=scored; class type agegroup; 
model freq=type agegroup assoc /dist=p link=log type3 obstats;
title 'Fitting the linear by linear association model with genmod';
run;

proc genmod data=scored; class type agegroup;
model freq=type agegroup age*type/dist=p link=log type3 obstats;
title 'Fitting the row effects model with genmod';

proc genmod data=scored; class type agegroup;
model freq=type agegroup agegroup*type_ord/dist=p link=log type3 obstats;
title 'Fitting the column effects model with genmod';

proc genmod data=scored; class type agegroup;
model freq=type agegroup age*type agegroup*type_ord/dist=p link=log type3 obstats;
title 'Fitting the row and column effects model with genmod';
run;

proc genmod data=scored; class type agegroup; 
model freq=type|agegroup /dist=p link=log  type3;
title 'Fitting the saturated model with genmod';

run;
/*

ods graphics on;

* Perform Simple Correspondence Analysis;
proc corresp all data=schooling outc=Coor;
weight freq;
   tables agegroup, type;
run;
*/

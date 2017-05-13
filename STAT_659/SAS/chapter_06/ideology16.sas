
proc format; value id3fmt 1='L' 3='M' 5='C';
             value id5fmt 1,-1='very liberal' 2,-2='liberal' 3,-3='moderate' 
                          4,-4='conservative' 5,-5='very conservative';
             value parfmt 0,2='Republican' 1='Democratic'; 
data ideology;
input party ideology c1 c2 @@;
 if (ideology >=4) then do;
     LMC=5; liberal=0; LorM=0; end;
 else if (ideology=3) then do;
     LMC=3; liberal=0; LorM=1; end;
 else do;
     LMC=1; liberal=1; LorM=1;
	 end;
 nideolog=ideology; * numerical (unformated) ideology;
 format LMC id3fmt. party parfmt. ideology id5fmt.;
 gender='F'; count=c1; output;
 gender='M'; count=c2; output;
 drop c1 c2;
cards;


1 1 44 36   1 2 47 34   1 3 118 53   1 4 23 18   1 5 32 23
0 1 18 12   0 2 28 18   0 3 86 62   0 4 39 45   0 5 48 51

;
proc print data=ideology; title 'Printout of the data';
run;

proc logistic data=ideology order=internal; freq count; class gender/param=ref;
	model nideolog = party gender/aggregate scale=none;
	output out=pred_i predprobs=i;    
	title 'POM with proc logistic with gender and party (MLE)';
	run;

	proc logistic data=ideology order=internal; freq count;
	model nideolog = party/aggregate scale=none;
	output out=pred_i predprobs=i;    
	title 'POM with party for 5 categories with proc logistic (MLE)';
run;
	/*
proc sort data=pred_i; by party;
proc summary data=pred_i; by party; var count;
output out=sampsize(keep=party tcount) sum=tcount;
data pred_i; merge pred_i sampsize; by party;
	array pp{5} ip_1-ip_5;
	do i=1 to 5;
		if (ideology=i) then do;
	  	p_count=tcount*pp{i}; output;
	 	end;
	end;
proc print data=pred_i round;
var party ideology tcount count p_count nideolog ip_1-ip_5;

proc freq data=ideology; weight count;
tables ideology*party/chisq cmh;
title 'Using proc freq for CMH test';

proc catmod data=ideology; weight count; direct party; response clogits;
model ideology = _response_ party/pred;
title 'POM (5 category) with proc CATMOD (WLS)';

run;
*/

proc logistic data=ideology desc; freq count;
	model liberal=party;
	title '1st Logit, odds of liberal vs (M+C)';
run;
proc logistic data=ideology desc; freq count;
	model LorM=party;
	title '2nd Logit, odds of (L+M) vs  conservative';
run;
proc logistic data=ideology order=internal; freq count;
	model LMC=party;
	output out=pred_c(drop=_from_ _into_ ideology liberal LorM) predprobs=c;
	title 'POM with J=3';
run;
proc print data=pred_c round; title2 'print all';
proc sort data=pred_c; by party;
data pred_c; set pred_c; by party;
	if first.party;
	proc print data=pred_c round; title2 'print unique';

run;
proc logistic data=ideology order=internal; freq count; class party;
	model nideolog = party/aggregate scale=none link=glogit;
	output out=pred_i predprobs=i;    
	title 'Saturated model with 5 categories with proc logistic (MLE)'; run;


proc logistic data=ideology order=internal; freq count; class party;
	model nideolog = /aggregate=(party) scale=none link=glogit;
	output out=pred_i predprobs=i;    
	title 'Independence model with 5 categories with proc logistic (MLE)'; run;





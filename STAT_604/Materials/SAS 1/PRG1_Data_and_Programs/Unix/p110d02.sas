********** Create Data **********;
data EmpsDK;
   input First $ Gender $ Country $;
   datalines;
Lars	M	Denmark
Kari	F	Denmark
Jonas	M	Denmark
;
run;

data EmpsFR;
   input First $ Gender $ Country $;
   datalines;
Pierre	M	France
Sophie	F	France
;
run;

********** Like-Structured Data Sets **********;
data EmpsAll1;
   set EmpsDK EmpsFR;
run;

proc print data=EmpsAll1;
run;

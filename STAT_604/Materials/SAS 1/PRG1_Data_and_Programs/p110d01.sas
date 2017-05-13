********** Create Data **********;
data Emps;
   input First $ Gender $ HireYear;
   datalines;
Stacey	F	2006
Gloria	F	2007
James	M	2007
;
run;

data Emps2008;
   input First $ Gender $ HireYear;
   datalines;
Brett	M	2008
Renee	F	2008
;
run;

data Emps2009;
   input First $ HireYear;
   datalines;
Sara	2009
Dennis	2009
;
run;

data Emps2010;
   input First $ HireYear Country $;
   datalines;
Rose	2010	Spain
Eric	2009	Spain
;
run;

********** Like-Structured Data Sets **********;
proc append base=Emps
            data=Emps2008;
run;

proc print data=Emps;
run;

********** Unlike-Structured Data Sets **********;
proc append base=Emps
            data=Emps2009;
run;

proc print data=Emps;
run;

proc append base=Emps
            data=Emps2010;
run;

********** FORCE Option **********;
proc append base=Emps
            data=Emps2010 force;
run;

proc print data=Emps;
run;

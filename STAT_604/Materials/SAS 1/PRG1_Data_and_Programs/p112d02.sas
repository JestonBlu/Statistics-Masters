********** One-Way Frequency Table OUT= **********;
proc freq data=orion.sales noprint;
   tables Gender Country / out=work.freq1;
run; 

proc print data=work.freq1;
run;

********** Two-Way Frequency Table OUT= **********;
proc freq data=orion.sales noprint;
   tables Gender*Country / out=work.freq2;
run; 

proc print data=work.freq2;
run;

********** One-Way Frequency Table OUT= with OUTCUM **********;
proc freq data=orion.sales noprint;
   tables Gender Country / out=work.freq3 outcum;
run; 

proc print data=work.freq3;
run;

********** Two-Way Frequency Table OUT= with OUTPCT **********;
proc freq data=orion.sales noprint;
   tables Gender*Country / out=work.freq4 outpct;
run; 

proc print data=work.freq4;
run;

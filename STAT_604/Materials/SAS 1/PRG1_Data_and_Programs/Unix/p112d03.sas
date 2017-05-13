********** One-Way Frequency Table OUTPUT OUT= **********;
proc freq data=orion.sales;
   tables Country / chisq;
   output out=work.freq5 chisq;
run; 

proc print data=work.freq5;
run;

proc options option=date;
run;
options nodate;
%let currentdate=%sysfunc(today(),weekdate.);
%let currenttime=%sysfunc(time(),timeampm8.);
proc means data=orion.order_fact;
   title "Sales Report as of &currenttime on &currentdate";
   var Total_Retail_Price;
run;

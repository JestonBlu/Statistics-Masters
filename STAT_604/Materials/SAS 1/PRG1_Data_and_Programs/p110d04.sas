********** Create Data **********;
data EmpsDUP;
   input First $ Gender $ EmpID;
   datalines;
Matt	M	121160
Julie	F	121161
Brett	M	121162
Julie	F	121161
Chris	F	121161
Julie   F   121163
;
run;

********** Eliminating Duplicates Based on By Variable **********;
proc sort data=EmpsDUP 
          out=EmpsDUP1 nodupkey equals;
  by EmpID;
run;

proc print data=EmpsDUP1;
run;

********** Eliminating Duplicates Based on Observation **********;
proc sort data=EmpsDUP 
               out=EmpsDUP2 noduprecs;
  by EmpID;
run;

proc print data=EmpsDUP2;
run;

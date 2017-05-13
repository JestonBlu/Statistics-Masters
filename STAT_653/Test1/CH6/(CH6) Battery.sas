proc import out=test
  datafile='\\sf1\Users\faculty\derya\My Documents\Stat653\Spring17\LectureDatasets\Battery.jmp'
  /* notice that the address I typed in quotes is the directory for the file in my computer */
  dbms=JMP replace;
  /* if the file ise excel or csv, use excel or csv instead of jmp above writing dbms */
  run;
/*** Calculating the means ***/
proc means data=test nway noprint;
   class Temperature Type;
   var Battery_Life;
   output out=meanbattery mean=Life;
run;
/*** Plotting the Battery data with means ***/
proc sgplot data=meanbattery;
   series y=life x=Type / group=Temperature ;
   title 'Life vs Type for Each Temperature';
run;
title;
proc sgplot data=meanbattery;
   series y=life x=Temperature / group=Type ;
   title 'Life vs Temperature for Each Type';
run;
title;
proc means data=test nway noprint;
   class Temperature;
   var Battery_Life;
   output out=meanbattery mean=Life;
run;
proc sgplot data=meanbattery;
   series y=life x=Temperature;
run;
proc means data=test nway noprint;
   class Type;
   var Battery_Life;
   output out=meanbattery mean=Life;
run;
proc sgplot data=meanbattery;
   series y=life x=Type ;
run;
/*** Analyses with PROC MIXED, Contrast and Estimate ***/
proc mixed data=test ;
   class Temperature Type;
   model Battery_Life=Temperature Type Temperature*Type/ ddfm=kr;
run;	 			 	                 

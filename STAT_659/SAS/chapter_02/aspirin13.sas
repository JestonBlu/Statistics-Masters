options ls=78 ps=55 nocenter nodate;
*  Aspirin and Myocardial Infarction Example;

data aspirin; 
title 'Aspirin and Myocardial Infarction Example';
input group $ attack $ freq;
cards;

placebo fatal 18
placebo nonfatal 171
placebo none 10845
aspirin fatal 5
aspirin nonfatal 99
aspirin none 10933

proc print;
title 'Overall Table';
proc freq order=data data=aspirin; weight freq;
tables group*attack/cellchi2 nocol nopercent chisq expected measures
relrisk riskdiff plots=mosaicplot;
run;

data aspirin2; set aspirin; if attack ne 'none';
proc print;
title "Compare 1st Two Columns";
proc freq order=data data=aspirin2; weight freq;
tables group*attack/cellchisq nocol nopercent chisq expected relrisk;

data aspirin3; set aspirin; if attack ne 'none' then attack='attack';
proc print;
title "Combine Columns 1 and 2 and Compare to Column 3";
proc freq order=data data=aspirin3; weight freq;
tables group*attack/cellchisq nocol nopercent chisq expected relrisk;
run;


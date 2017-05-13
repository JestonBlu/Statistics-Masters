proc contents data=orion.qtr1_2007;
run;

proc contents data=orion.qtr2_2007;
run;

proc append base=work.ytd 
            data=orion.qtr1_2007;
run;

proc append base=work.ytd 
            data=orion.qtr2_2007 force;
run;

data randdata;
m=10000;
do i = 1 to m;
random = i;
output;end;drop i;
proc surveyselect data=randdata method = srs n=35 reps = 1 out = sample;
run;
proc print data = sample; var random;
run;

data male; set sasuser.medcare; if male=1;

title 'poisson model';
proc genmod data=male;
model ofp=hosp healthpoor healthexcellent numchron  married school/dist=p link=log;
run;

title 'negative binomial model';
proc genmod data=male;
model ofp=hosp healthpoor healthexcellent numchron  married school/dist=negbin link=log;
run;

title 'zero-inflated poisson model';
proc genmod data=male;
model ofp=hosp healthpoor healthexcellent numchron age married school/dist=zip link=log;
zeromodel hosp healthpoor healthexcellent numchron age married school;
run;


title 'zero-inflated poisson model, intercept only zero model';
proc genmod data=male;
model ofp=hosp healthpoor healthexcellent numchron age married school/dist=zip link=log;
zeromodel ;
run;

title 'zero-inflated negative binomial model';
proc genmod data=male;
model ofp=hosp healthpoor healthexcellent numchron age married school/dist=zinb link=log;
zeromodel hosp healthpoor healthexcellent numchron age married school;
run;

title 'zero-inflated negative binomial model. intercept only zero model';
proc genmod data=male;
model ofp=hosp healthpoor healthexcellent numchron age married school/dist=zinb link=log;
zeromodel ;
run;

data female; set sasuser.medcare; if male=0;

title 'poisson model';
proc genmod data=female;
model ofp=hosp healthpoor healthexcellent numchron  age married school/dist=p link=log;
run;

title 'negative binomial model';
proc genmod data=female;
model ofp=hosp healthpoor healthexcellent numchron  age married school/dist=negbin link=log;
run;

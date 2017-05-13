********** Create Data **********;
data EmpsCN;
   input First $ Gender $ Country $;
   datalines;
Chang	M	China
Li		M	China
Ming	F	China
;
run;

data EmpsJP;
   input First $ Gender $ Region $;
   datalines;
Cho		F	Japan
Tomi	M	Japan
;
run;

********** Unlike-Structured Data Sets **********;
data EmpsAll2;
   set EmpsCN EmpsJP;
run;

proc print data=EmpsAll2;
run;

********** RENAME= Option **********;
data EmpsAll2;
   set EmpsCN EmpsJP(rename=(Region=Country));
run;

proc print data=EmpsAll2;
run;

********** Interleaving (Self-Study) **********;
data EmpsAll2;
   set EmpsCN EmpsJP(rename=(Region=Country));
   by First;
run;

proc print data=EmpsAll2;
run;

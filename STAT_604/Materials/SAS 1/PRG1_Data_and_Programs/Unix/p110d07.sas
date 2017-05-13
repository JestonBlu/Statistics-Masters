********** Create Data **********;
data EmpsAU;
   input First $ Gender $ EmpID;
   datalines;
Togar	M	121150
Kylie	F	121151
Birin	M	121152
;
run;

data PhoneC;
   input EmpID Phone $15.;
   datalines;
121150 +61(2)5555-1795
121152 +61(2)5555-1667
121153 +61(2)5555-1348
;
run;

********** Non-matches **********;
data EmpsAUC;
   merge EmpsAU PhoneC;
   by EmpID;
run;

proc print data=EmpsAUC;
run;

********** IN= Option **********;
data EmpsAUC;
   merge EmpsAU(in=Emps) 
         PhoneC(in=Cell);
   by EmpID;
run;

proc print data=EmpsAUC;
run;

********** Matches Only **********;
data EmpsAUC;
   merge EmpsAU(in=Emps) 
         PhoneC(in=Cell);
   by EmpID;
   if Emps=1 and Cell=1;
run;

proc print data=EmpsAUC;
run;

********** Non-Matches from EmpsAU Only **********;
data EmpsAUC;
   merge EmpsAU(in=Emps) 
         PhoneC(in=Cell);
   by EmpID;
   if Emps=1 and Cell=0;
run;

proc print data=EmpsAUC;
run;

********** Non-Matches from PhoneC Only **********;
data EmpsAUC;
   merge EmpsAU(in=Emps) 
         PhoneC(in=Cell);
   by EmpID;
   if Emps=0 and Cell=1;
run;

proc print data=EmpsAUC;
run;

********** All Non-Matches **********;
data EmpsAUC;
   merge EmpsAU(in=Emps) 
         PhoneC(in=Cell);
   by EmpID;
   if Emps=0 or Cell=0;
run;

proc print data=EmpsAUC;
run;

********** Outputting to Multiple Data Sets (Self-Study) **********;
data EmpsAUC EmpsOnly PhoneOnly;
   merge EmpsAU(in=Emps) PhoneC(in=Cell);
   by EmpID;
   if Emps=1 and Cell=1 then output EmpsAUC;
   else if Emps=1 and Cell=0 then output EmpsOnly;
   else if Emps=0 and Cell=1 then output PhoneOnly;
run;

proc print data=EmpsAUC;
run;

proc print data=EmpsOnly;
run;

proc print data=PhoneOnly;
run;

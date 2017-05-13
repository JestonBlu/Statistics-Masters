********** Create Data **********;
data EmpsAU;
   input First $ Gender $ EmpID;
   datalines;
Togar	M	121150
Kylie	F	121151
Birin	M	121152
;
run;

data PhoneH;
   input EmpID Phone $15.;
   datalines;
121150 +61(2)5555-1793
121151 +61(2)5555-1849
121152 +61(2)5555-1665
;
run;

********** One-to-One Merge **********;
data EmpsAUH;
   merge EmpsAU PhoneH;
   by EmpID;
run;

proc print data=EmpsAUH;
run;

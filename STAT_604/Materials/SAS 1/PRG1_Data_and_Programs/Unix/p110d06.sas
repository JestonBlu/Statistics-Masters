********** Create Data **********;
data EmpsAU;
   input First $ Gender $ EmpID;
   datalines;
Togar	M	121150
Kylie	F	121151
Birin	M	121152
;
run;

data PhoneHW;
   input EmpID Type $ Phone $15.;
   datalines;
121150 Home +61(2)5555-1793
121150 Work +61(2)5555-1794
121151 Home +61(2)5555-1849
121151 Work +61(2)5555-1850
121152 Home +61(2)5555-1665
121152 Work +61(2)5555-1666
;
run;

********** One-to-Many Merge **********;
data EmpsAUHW;
   merge EmpsAU PhoneHW;
   by EmpID;
run;

proc print data=EmpsAUHW;
run;

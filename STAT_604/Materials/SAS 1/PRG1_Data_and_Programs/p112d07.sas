proc means data=orion.sales noprint;
   var Salary;
   class Gender Country;
   output out=work.means mean=aveSalary;
run;

data gender_summary(keep=Gender aveSalary)  
     country_summary(keep=Country aveSalary);
   set work.means;
   if _type_=1 then output country_summary;
   else if _type_=2 then output gender_summary;
run;

proc sort data=orion.sales out=sort_country;
   by Country;
run;

data detail_country;
   merge sort_country 
         country_summary(rename=(aveSalary=CountrySalary));
   by Country;
run;

proc sort data=detail_country out=sort_gender;
   by Gender;
run;

data detail_country_gender;
   merge sort_gender
	     gender_summary(rename=(aveSalary=GenderSalary));
   by Gender;
   if Salary>CountrySalary then CS='Above Average'; else CS='Below Average';
   if Salary>GenderSalary then GS='Above Average'; else GS='Below Average';
   label CS='Comparison*to Country*Salary Average'
         GS='Comparison*to Gender*Salary Average';
run;

proc sort data=detail_country_gender;
   by Employee_ID;
run;

proc print data=detail_country_gender split='*';
   var First_Name Last_Name Salary CS GS;
run;

********** Character User-defined Format **********;
proc format;
   value $ctryfmt  'AU' = 'Australia'
                   'US' = 'United States' 
                  other = 'Miscoded';
run;

proc print data=orion.sales label;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary'
         Birth_Date='Date of Birth'
         Hire_Date='Date of Hire';
   format Salary dollar10.0 
          Birth_Date Hire_Date monyy7.
          Country $ctryfmt.;
run;

********** Numeric User-defined Format **********;
proc format;
   value tiers  20000-49999  = 'Tier 1'                  
                50000-99999  = 'Tier 2'
               100000-250000 = 'Tier 3';
run;

proc print data=orion.sales label;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary'
         Birth_Date='Date of Birth'
         Hire_Date='Date of Hire';
   format Birth_Date Hire_Date monyy7.
          Salary tiers.;
run;

********** Numeric User-defined Format with < **********;
proc format;
   value tiers  20000-<50000  = 'Tier 1'                  
                50000- 100000 = 'Tier 2'
               100000<-250000 = 'Tier 3';
run;

proc print data=orion.sales label;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary'
         Birth_Date='Date of Birth'
         Hire_Date='Date of Hire';
   format Birth_Date Hire_Date monyy7.
          Salary tiers.;
run;

********** Numeric User-defined Format with LOW and HIGH **********;
proc format;
   value tiers    low-<50000  = 'Tier 1'                  
                50000- 100000 = 'Tier 2'
               100000<-high   = 'Tier 3';
run;

proc print data=orion.sales label;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary'
         Birth_Date='Date of Birth'
         Hire_Date='Date of Hire';
   format Birth_Date Hire_Date monyy7.
          Salary tiers.;
run;

********** Multiple User-defined Formats **********;
proc format;
   value $ctryfmt  'AU' = 'Australia'
                   'US' = 'United States' 
                  other = 'Miscoded';
   value tiers    low-<50000  = 'Tier 1'                  
                50000- 100000 = 'Tier 2'
               100000<-high   = 'Tier 3';
run;

proc print data=orion.sales label;
   var Employee_ID Job_Title Salary 
       Country Birth_Date Hire_Date;
   label Employee_ID='Sales ID'
         Job_Title='Job Title'
         Salary='Annual Salary'
         Birth_Date='Date of Birth'
         Hire_Date='Date of Hire';
   format Birth_Date Hire_Date monyy7.
          Country $ctryfmt. 
          Salary tiers.;
run;

proc freq data=orion.sales;
   tables Country Salary;
   format Country $ctryfmt. Salary tiers.;
run;


proc format;
   value dategrp
                      .='None'
       low-'31dec2006'd=[year4.]
      '01jan2007'd-high=[monyy7.]
   ;
run;

proc freq data=orion.employee_payroll;
   tables Employee_Term_Date / missing;
   format Employee_Term_Date dategrp.;
   title 'Employee Status Report';
run;

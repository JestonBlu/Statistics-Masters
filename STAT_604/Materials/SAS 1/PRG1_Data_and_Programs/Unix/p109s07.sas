data work.increase;
   set orion.staff;
   where Emp_Hire_Date>='01JUL2006'd;
   Increase=Salary*0.10;
   if Increase>3000;
   NewSalary=sum(Salary,Increase);
   keep Employee_ID Emp_Hire_Date Salary Increase NewSalary;
   format Salary Increase NewSalary comma10.;
run;

proc print data=work.increase label;
run;





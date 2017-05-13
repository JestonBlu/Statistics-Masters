data work.increase;
   set orion.staff;
   Increase=Salary*0.10;
   NewSalary=sum(Salary,Increase);
   keep Employee_ID Salary Increase NewSalary;
   format Salary Increase NewSalary comma10.;
run;

proc print data=work.increase label;
run;

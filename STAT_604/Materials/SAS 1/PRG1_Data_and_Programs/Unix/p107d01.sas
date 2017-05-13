data work.subset3;
   infile 'sales.csv' dlm=',';
   input Employee_ID First_Name $ Last_Name $ 
         Gender $ Salary Job_Title $ Country $;
run;

proc print data=work.subset3;
run;

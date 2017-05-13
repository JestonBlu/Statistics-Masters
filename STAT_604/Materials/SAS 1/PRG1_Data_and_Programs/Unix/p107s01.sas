data work.NewEmployees;
   length First $ 12 Last $ 18 Title $ 25;
   infile 'newemps.csv' dlm=',';
   input First $ Last $ Title $ Salary;
run;

proc print data=work.NewEmployees;
run;

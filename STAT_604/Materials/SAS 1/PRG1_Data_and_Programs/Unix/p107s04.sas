data work.canada_customers;
   length First Last $ 20 Gender $ 1 AgeGroup $ 12;
   infile 'custca.csv' dlm=',';
   input First $ Last $ ID Gender $ 
         BirthDate :ddmmyy. Age AgeGroup $;
   format BirthDate monyy7.;
   drop ID Age;
run;

proc print data=work.canada_customers;
run;

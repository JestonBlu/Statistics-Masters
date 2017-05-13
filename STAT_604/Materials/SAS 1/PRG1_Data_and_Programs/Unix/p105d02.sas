data work.subset1;
   set orion.sales;
   where Country='AU' and 
         Job_Title contains 'Rep';
run;

proc print data=work.subset1;
run;

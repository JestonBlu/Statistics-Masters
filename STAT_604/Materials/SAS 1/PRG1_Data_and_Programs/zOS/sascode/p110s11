proc sort data=orion.customer
          out=work.customer;
   by Country;
run;

data work.allcustomer;
   merge work.customer(in=Cust) 
         orion.lookup_country(rename=(Start=Country 
                                      Label=Country_Name) 
                              in=Ctry);
   by Country;
   keep Customer_ID Country Customer_Name Country_Name;
   if Cust=1 and Ctry=1;
run;

proc print data=work.allcustomer;
run;

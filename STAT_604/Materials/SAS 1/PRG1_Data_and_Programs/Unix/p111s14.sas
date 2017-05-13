ods csvall file='p111s14.csv';
proc print data=orion.customer_type;
   title 'Customer Type Definitions';
run;

proc print data=orion.country;
   title 'Country Definitions';
run;
ods csvall close;

ods msoffice2k file='p111s14.html' style=Listing;
proc print data=orion.customer_type;
   title 'Customer Type Definitions';
run;

proc print data=orion.country;
   title 'Country Definitions';
run;
ods msoffice2k close;

ods tagsets.excelxp file='p111s14.xml' style=Listing;
proc print data=orion.customer_type;
   title 'Customer Type Definitions';
run;

proc print data=orion.country;
   title 'Country Definitions';
run;
ods tagsets.excelxp close;

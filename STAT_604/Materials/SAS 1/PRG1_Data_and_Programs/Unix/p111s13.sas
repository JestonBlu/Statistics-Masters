ods listing close;
ods pdf file='p111s13p.pdf';
ods rtf file='p111s13r.rtf' style=curve;
proc print data=orion.customer;
   title 'Customer Information';
run;
ods pdf close;
ods rtf close;
ods listing;

data work.supplier_info;
   infile 'supplier.dat';
   input ID 1-5 Name $ 8-37 Country $ 40-41;
run;

proc print data=work.supplier_info;
run;

  

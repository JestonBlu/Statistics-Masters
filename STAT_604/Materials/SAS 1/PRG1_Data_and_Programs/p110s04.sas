data work.thirdqtr;
   set orion.mnth7_2007 orion.mnth8_2007 orion.mnth9_2007;
run;

proc print data=work.thirdqtr;
run; 

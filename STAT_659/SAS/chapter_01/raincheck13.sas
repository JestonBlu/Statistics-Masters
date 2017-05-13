data shoppers; 
     input check $ count ; 
     cards ; 
     yes 69
     no 208 
; 
run;

proc freq data=shoppers order=data;
     tables check / binomial(all) alpha=.05;
     weight count;
run;
proc genmod data=shoppers desc;
freq count;
model check=/dist=binomial link=identity lrci;
run;

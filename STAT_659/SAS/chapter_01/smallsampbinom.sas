data smsamp; 
     input  success $ count ; 
     cards ; 
     yes 9
     no 1 
; 
run;

proc freq data=smsamp order=data;
     tables success / binomial(p=.6 cl=all) alpha=.05;
	 exact binomial;
     weight count;
run;


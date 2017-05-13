proc freq data=orion.sales;
   tables Gender / chisq out=genderfreq outcum;
   output out=genderchi chisq;
run; 

proc freq data=orion.sales;
   tables Country / chisq out=countryfreq outcum;
   output out=countrychi chisq;
run; 

data allfreq;
   length Value $ 7;
   set genderfreq(in=gf) countryfreq(in=cf)
       genderchi(in=gc) countrychi(in=cc);
   if gf then Value=Gender;    
   else if cf then Value=Country;
   else if gc then Value='Gender';
   else if cc then Value='Country';
   label _PCHI_='Chi-Square'
         P_PCHI='P-Value';
   keep Value COUNT PERCENT _PCHI_ P_PCHI; 
run;

proc print data=allfreq label;
run;

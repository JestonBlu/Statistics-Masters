*ods html;ods graphics on;
* crab,genmod.sas
 The relationship between different habitats and the population densities of
Hermit crabs. There are 6 sites. At each site 25 transects are run and the
number of crabs are counted. Analyze using an overdispersed Poisson Model ;

option ls=120 ps=50 nocenter nodate;

* Written by R;
*  write.foreign(dt2, "eggs.txt", "eggs.sas", package = "SAS") ;

PROC FORMAT;
value type 
     1 = "USDA" 
     2 = "FIELD" 
     3 = "RESIST" 
;

DATA  rdata ;
INFILE  "C:\Users\Joseph\Projects\learning\Statistics\eggs.txt" 
     DSD 
     LRECL= 9 ;
INPUT
 type
 eggs
;
FORMAT type type. ;
RUN;



title "Poisson Regression on Eggs";
proc genmod data=rdata;
class type;
model  eggs = type/Dist=P link=log;
run;
Title "Overdispersed Poisson Regression on Eggs";
proc genmod data=rdata;
class type;
model  eggs = type/dist=P link=log  scale = pearson;
run;
*ods graphics off;
*ods html close;

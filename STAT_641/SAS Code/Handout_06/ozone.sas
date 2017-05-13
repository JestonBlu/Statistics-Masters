

* SAS program to obtain summary statistics for ozone data. You may copy this
file from the following directory:

~longneck/meth1/sasfiles/ozone.sas
;

option ls=75 ps=55 nocenter nodate;
title 'Ozone Concentration';
data OZONE1; 
   infile 'u:meth1\sasfiles\ozone1.DAT';           * input data;
      input ozone1 @@;
data OZONE2; 
   infile 'u:meth1\sasfiles\ozone2.DAT';           * input data;
      input ozone2 @@;
data ozone;
      merge ozone1 ozone2;                              * combine data sets;

   label OZONE1='Ozone Level in Stamford'
         OZONE2='Ozone Level in Yonkers';
   
run;
proc print;
run;

* generates various summary statistics and plots;

proc univariate plot normal def=5; 
   var ozone1 ozone2;

* create data set with ozone values in one column
  and city name in second column;

data ozonebox1;
set ozone1;
ozone=ozone1;drop ozone1;
run;
data ozonebox2;
set ozone2;
ozone=ozone2;drop ozone2;
run;
data ozonebox;
set ozonebox1 ozonebox2;
if _n_<137 then city="Stamford";
if _n_>=137 then city="Yonkers";drop obs;
run;

* creates side-by-side box plots;

proc boxplot;
   plot ozone*city/boxstyle=schematic;
run;

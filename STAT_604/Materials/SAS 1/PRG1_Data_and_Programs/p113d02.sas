 /* Creating a Simple Scatter Plot  */
  
goptions reset=all;
proc gplot data=orion.budget;
   plot Yr2007*Month;
   format Yr2007 dollar12.;
   title 'Plot of Budget by Month';
run;
quit;

  
 /* Specifying Plot Symbols and Interpolation Lines  */
 
goptions reset=all;
proc gplot data=orion.budget;
   plot Yr2007*Month / haxis=1 to 12;
   label Yr2007='Budget';
   format Yr2007 dollar12.;
   title 'Plot of Budget by Month';
   symbol1 v=dot i=join cv=red ci=blue;
run;
quit;

   
 /* Overlaying Multiple Plot Lines on the Same Set of Axes  */
 
goptions reset=all;
proc gplot data=orion.budget;
   plot Yr2006*Month yr2007*Month/ overlay haxis=1 to 12 vref=3000000
                                   cframe="very light gray";
   label Yr2006='Budget';
   format Yr2006 dollar12.;
   title 'Plot of Budget by Month for 2006 and 2007';
   symbol1 i=join v=dot ci=blue cv=blue;
   symbol2 i=join v=triangle ci=red cv=red;
run;
quit;

    

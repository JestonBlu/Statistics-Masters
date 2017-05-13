 /* Using ODS Styles to Control Appearance of Output  */
 
ods listing style=gears;
goptions reset=all;
proc gplot data=orion.budget;
   plot Yr2007*Month;
   format Yr2007 dollar12.;
   label Yr2007='Budget';
   title 'Plot of Budget by Month';
run;
quit;

     
 /* Specifying Options in TITLE and FOOTNOTE Statements 
    to Control Text Appearance  */
 
ods listing style=gears; 
goptions reset=all;
proc gplot data=orion.budget;
   plot Yr2007*Month / vref=3000000;
   label Yr2007='Budget';
   format Yr2007 dollar12.;
   title f=centbi h=5 pct 'Budget by Month';
   footnote c=green j=left 'Data for 2007';
run;
quit;

    
 /* Using a GOPTIONS Statement to Control the Appearance of Output  */
 
ods listing style=gears;
goptions reset=all ftext=centb htext=3 pct ctext=dark_blue;
   proc gplot data=orion.budget;
   plot Yr2007*Month / vref=3000000;
   label Yr2007='Budget';
   format Yr2007 dollar12.;
   title f=centbi 'Budget by Month';
run;
quit;  

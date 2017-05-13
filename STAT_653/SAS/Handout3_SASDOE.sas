
proc plan seed=27371;
factors Replicate=3 ordered tiptype=4;
run;
proc factex;
   factors tiptype / nlev=4;
   size design=16;
   output out=Experiment randomize        
      tiptype cvals=('Green' 'Purple' 'Blue' 'Orange');
run;
proc print data=Experiment;
run;

proc contents data=orion.shoes_eclipse;
run;

proc contents data=orion.shoes_tracker;
run;

proc contents data=orion.shoes;
run;

proc datasets library=orion nolist;
   append base=shoes data=shoes_eclipse;
   append base=shoes data=shoes_tracker force;
quit;

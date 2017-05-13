proc contents data=orion.price_current;
run;

proc contents data=orion.price_new;
run;              

proc append base=orion.price_current
            data=orion.price_new;
run;

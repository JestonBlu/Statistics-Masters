data election;
 infile "U:\608\sp13\pct_obama.csv" firstobs=2 dlm=",";
 input state $ Pollclose $ Electoral Obama12 Romney12 Pred $ Obama08 Mccain08;
run;

proc reg data = election;
 model Obama12 = Obama08;
run;

proc gplot data = election;
 plot Obama12*Obama08;
run;

proc print data = election;
run;


data new;
 input Obama08;
 cards;
 61
 ;
run;

data preds;
 set election new;
run;

proc print data = preds;
run;

proc reg data = preds;
 model Obama12 = Obama08/p clm cli;
run;
*We don't need the "p" in the model statement when we ask for clm or cli.;

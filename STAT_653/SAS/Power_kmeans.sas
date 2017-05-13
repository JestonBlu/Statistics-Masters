proc power;
      onewayanova
         groupmeans = 9 | 9.1 | 9.4 | 9.6
         stddev = 0.2
         alpha = 0.05
         ntotal = .
         power = 0.85
/*         contrast = (3 -1 -1 -1) (1  1 -1 -1)
                    (1 -1  0  0) (0  0  1 -1)*/;
   run;
proc power;
onewayanova alpha=.05 test=overall
groupmeans=(9 9.1 9.4 9.6) npergroup=. stddev=0.2
power=.85;
run;
proc power;
onewayanova alpha=.05 test=overall
groupmeans=(9 9.1 9.4 9.6) ntotal=8 to 16 stddev=0.2
power=.;
plot interpol=join yopts=(ref=.80);
run;

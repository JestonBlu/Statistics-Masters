*nested_equalreps.sas;
* This is an example from Snedecor and Cochran of a
Nested Design involving an experiment
to investigate the variability of calcium concentration
in the leaves of turnip greens.
Four plants were randomly selected
and then three leaves were randomly
selected from each plant. Two 100-mg samples
from each leaf. The amount of calcium is determined
by microchemical methods;

ods html;
ods graphics on;
options pagesize=55 linesize=80;
Title 'Nested Design - Equal Sample Sizes';
data raw;
input plant leaf sample X @@;
cards;
1 1 1  3.28  1 1 2  3.09  1 2 1  3.52  1 2 2  3.48
1 3 1  2.88  1 3 2  2.80
2 1 1  2.46  2 1 2  2.44  2 2 1  1.87  2 2 2  1.92
2 3 1  2.19  2 3 2  2.19
3 1 1  2.77  3 1 2  2.66  3 2 1  3.74  3 2 2  3.44
3 3 1  2.55  3 3 2  2.55
4 1 1  3.78  4 1 2  3.87  4 2 1  4.07  4 2 2  4.12
4 3 1  3.31  4 3 2  3.31

;
proc glm;
class plant leaf sample;
model X = plant leaf(plant);
random plant leaf(plant) /test;
run;

*anaylsis using proc mixed;

proc mixed cl alpha=.05 COVTEST;
class plant leaf sample;
model X = /residual;
random plant leaf(plant) ;
run;
ods graphics off;
ods html close;

* brand_unbal.sas;
* The stopping distance at 25 mph was measured for each of six brands of
automobile tires. There were four replications for each brand.

Brands S1 and S2 were all terrain tires
Brands B1 and B2 were bias     tires
Brands R1 and R2 were radial  tires
Brand S1 is the most widely used brand of tire
;
option ls=80 ps=50 nocenter nodate;
title 'Stopping Distance of 6 brands of tires';
data old; array Y Y1-Y4;
input BRD $ Y1-Y4; do over Y; SD=Y; output; end;
      drop Y1-Y4;
      label BRD = 'Brand of Tire' SD = 'Stopping Distance';
cards;
S1 22 20 25 17
S2 26 22 .   .
B1 16 20 14 18
B2 20 25 26 .
R1 28 29 23 24
R2 22 15 .   .
run;
proc glm data=old order=data;
class BRD;
model  SD=BRD;
lsmeans BRD/STDERR;
contrast 'TERRAIN VS OTHERS'  BRD  2  2 -1 -1 -1 -1 ;
contrast 'TERRAIN VS BIAS'    BRD  1  1 -1 -1  0  0 ;
contrast 'TERRAIN VS RADIAL'  BRD  1  1  0  0 -1 -1 ;
contrast 'BIAS VS RADIAL' BRD  0  0  1  1 -1 -1 ;
contrast 'WITHIN TERRAIN'     BRD  1 -1  0  0  0  0 ;
contrast 'WITHIN BIAS'    BRD  0  0  1 -1  0  0 ;
contrast 'WITHIN RADIAL'  BRD  0  0  0  0  1 -1 ;

estimate 'TE VS OTHERS'  BRD  2  2 -1 -1 -1 -1 ;
estimate 'TERRAIN VS BIAS'    BRD  1  1 -1 -1  0  0 ;
estimate 'TERRAIN VS RADIAL'  BRD  1  1  0  0 -1 -1 ;
estimate 'BIAS VS RADIAL' BRD  0  0  1  1 -1 -1 ;
estimate 'WITHIN TERRAIN'     BRD  1 -1  0  0  0  0 ;
estimate 'WITHIN BIAS'    BRD  0  0  1 -1  0  0 ;
estimate 'WITHIN RADIAL'  BRD  0  0  0  0  1 -1 ;
run;


    











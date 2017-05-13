* bibexample.sas
*     INCOMPLETE BLOCK DESIGN ;
* Study the effects of 6 Diets (D) on weight gain in rabbits. There are
10 litters (LI) of rabbits each containing 3 rabbits. The litter will
serve as a blocking variable. We have 10 blocks, each containing
3 EU's, whereas we have 6 treatments, the diets. Thus, we have an
incomplete block design. With the proper structuring of the diets to the
litters, the final design was a BIB, with data give below;
ods html;ods graphics on;
OPTIONS PS=50 LS=90 nocenter nodate;
TITLE 'BALANCED INCOMPLETE BLOCK DESIGN (BIBD)';
DATA DIET;
INPUT D $ L  $ Y @@;
CARDS;

D1 L1 .    D1 L2 40.1 D1 L3 .    D1 L4 44.9 D1 L5 .
D2 L1 32.6 D2 L2 38.1 D2 L3 .    D2 L4 .    D2 L5 .
D3 L1 35.2 D3 L2 40.9 D3 L3 34.6 D3 L4 43.9 D3 L5 40.9
D4 L1 .    D4 L2 .    D4 L3 37.5 D4 L4 .    D4 L5 37.3
D5 L1 .    D5 L2 .    D5 L3 .    D5 L4 40.8 D5 L5 32.0
D6 L1 42.2 D6 L2 .    D6 L3 34.3 D6 L4 .    D6 L6 .
D1 L6 .    D1 L7 45.2 D1 L8 44.0 D1 L9 .    D1 L10 37.3
D2 L6 37.3 D2 L7 40.6 D2 L8 .    D2 L9 30.6 D2 L10 .
D3 L6 .    D3 L7 .    D3 L8 .    D3 L9 .    D3 L10 .
D4 L6 .    D4 L7 37.9 D4 L8 .    D4 L9 27.5 D4 L10 42.3
D5 L6 40.5 D5 L7 .    D5 L8 38.5 D5 L9 20.6 D5 L10 .
D6 L6 42.8 D6 L7 .    D6 L8 51.9 D6 L9 .    D6 L10 41.7
RUN;
PROC GLM;
CLASS  D;
MODEL Y =  D/SOLUTION;
RUN;
PROC GLM;
CLASS L D;
MODEL Y = L D/SOLUTION;
RANDOM L;
LSMEANS D/pdiff stderr adjust=tukey;           
RUN;
PROC MIXED CL ALPHA=.05;
CLASS L D;
MODEL Y = D /SOLUTION RESIDUAL;
RANDOM L;
LSMEANS  D/ADJUST=TUKEY;
RUN;
ods graphics off;ods html close;

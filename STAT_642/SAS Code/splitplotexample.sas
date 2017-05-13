* splitplotexample.sas;
option ls=80 ps=55 nocenter nodate; 
title 'Split-Plot Design';

data yields; 
INPUT VA $ DATE $ BLOCK $ Y @@; 
cards;                                                             
 L N 1 2.17 L N 2 1.88 L N 3 1.62 L N 4 2.34 L N 5 1.58 L N 6 1.66
 L S1 1 1.58 L S1 2 1.26 L S1 3 1.22 L S1 4 1.59 L S1 5 1.25 L S1 6 0.94
 L S20 1 2.29 L S20 2 1.60 L S20 3 1.67 L S20 4 1.91 L S20 5 1.39 L S20 6 1.12
 L O7 1 2.23 L O7 2 2.01 L O7 3 1.82 L O7 4 2.10 L O7 5 1.66 L O7 6 1.10
 C N 1 2.33 C N 2 2.01 C N 3 1.70 C N 4 1.78 C N 5 1.42 C N 6 1.35
 C S1 1 1.38 C S1 2 1.30 C S1 3 1.85 C S1 4 1.09 C S1 5 1.13 C S1 6 1.06
 C S20 1 1.86 C S20 2 1.70 C S20 3 1.81 C S20 4 1.54 C S20 5 1.67 C S20 6 0.88
 C O7 1 2.27 C O7 2 1.81 C O7 3 2.01 C O7 4 1.40 C O7 5 1.31 C O7 6 1.06
 R N 1 1.75 R N 2 1.95 R N 3 2.13 R N 4 1.78 R N 5 1.31 R N 6 1.30
 R S1 1 1.52 R S1 2 1.47 R S1 3 1.80 R S1 4 1.37 R S1 5 1.01 R S1 6 1.31
 R S20 1 1.55 R S20 2 1.61 R S20 3 1.82 R S20 4 1.56 R S20 5 1.23 R S20 6 1.13
 R O7 1 1.56 R O7 2 1.72 R O7 3 1.99 R O7 4 1.55 R O7 5 1.51 R O7 6 1.33
RUN;
proc mixed cl alpha=.05; 
class VA DATE BLOCK;
model  Y =  VA  DATE VA*DATE/ddfm=satterth;
RANDOM BLOCK BLOCK*VA;
LSMEANS VA DATE VA*DATE/ADJUST=TUKEY CL;
run;


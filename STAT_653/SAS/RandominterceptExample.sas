/*** Researchers investigated the performance of two medical procedures in a multicenter study. 
They randomly selected 15 centers for inclusion. 

One of the study goals was to compare the occurrence of side effects for the procedures. 
In each center  patients were randomly selected and assigned to procedure "A," and  
patients were randomly assigned to procedure "B."

The variable group identifies the two procedures, 
n is the number of patients who received a given procedure in a particular center, 
sideeffect is the number of patients who reported side effects.

To model the probability of side effects for the two drugs,  
we need to account for the fixed group effect and the random selection of centers. 
One possibility is to assume a model that relates group and center effects linearly 
to the logit of the probabilities:
***/
data multicenter;
     input center group $ n sideeffect;
     datalines;
    1  A  32  14
    1  B  33  18
    2  A  30   4
    2  B  28   8
    3  A  23  14
    3  B  24   9
    4  A  22   7
    4  B  22  10
    5  A  20   6
    5  B  21  12
    6  A  19   1
    6  B  20   3
    7  A  17   2
    7  B  17   6
    8  A  16   7
    8  B  15   9
    9  A  13   1
    9  B  14   5
   10  A  13   3
   10  B  13   1
   11  A  11   1
   11  B  12   2
   12  A  10   1
   12  B   9   0
   13  A   9   2
   13  B   9   6
   14  A   8   1
   14  B   8   1
   15  A   7   1
   15  B   8   0
   ;
   run;
/*** Fitting a Generalized Linear Mixed Model Using PROC GLIMMIX ***/
proc glimmix data=multicenter;
      class center group;
      model sideeffect/n = group / solution;
      random intercept / subject=center;
run;
/*** the estimates of the average logits in the two groups and their predictions on the scale of the data 
with the LSMEANS ***/
ods select lsmeans;
proc glimmix data=multicenter;
      class center group;
      model sideeffect/n = group / solution;
      random intercept / subject=center;
      lsmeans group / oddsratio cl ilink diff;
run;
/*** The first type uses the solutions for the random effects (the estimated best linear unbiased predictors (BLUPs) in the final linearized model),
and the second type uses predictions based on the fixed effects alone. The ILINK suboption of the PRED
keyword requests that the inverse link function be applied to the resulting predictions. This yields predictions
of probabilities. The results of these calculations are stored in the variables PredProb and PredProb–PA in the
data set glimmixout. The acronym “PA” is used here to identify a “population-averaged” prediction. ***/
proc glimmix data=multicenter;
      class center group;
      model sideeffect/n = group / solution;
      random intercept / subject=center solution;
      output out=glimmixout pred( blup ilink)=PredProb
                            pred(noblup ilink)=PredProb_PA;
run;
proc print data=glimmixout;
run;

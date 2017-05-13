/*** fev1mult example***/
data fev1mult;
   input patient basefev1 fev11h fev12h fev13h fev14h fev15h 
         fev16h fev17h fev18h drug $;
   datalines;
201 2.46 2.68 2.76 2.50 2.30 2.14 2.40 2.33 2.20 a
202 3.50 3.95 3.65 2.93 2.53 3.04 3.37 3.14 2.62 a
203 1.96 2.28 2.34 2.29 2.43 2.06 2.18 2.28 2.29 a
204 3.44 4.08 3.87 3.79 3.30 3.80 3.24 2.98 2.91 a
205 2.80 4.09 3.90 3.54 3.35 3.15 3.23 3.46 3.27 a
206 2.36 3.79 3.97 3.78 3.69 3.31 2.83 2.72 3.00 a
207 1.77 3.82 3.44 3.46 3.02 2.98 3.10 2.79 2.88 a
208 2.64 3.67 3.47 3.19 2.19 2.85 2.68 2.60 2.73 a
209 2.30 4.12 3.71 3.57 3.49 3.64 3.38 2.28 3.72 a
210 2.27 2.77 2.77 2.75 2.75 2.71 2.75 2.52 2.60 a
211 2.44 3.77 3.73 3.67 3.56 3.59 3.35 3.32 3.18 a
212 2.04 2.00 1.91 1.88 2.09 2.08 1.98 1.70 1.40 a
214 2.77 3.36 3.42 3.28 3.30 3.31 2.99 3.01 3.08 a
215 2.96 4.31 4.02 3.38 3.31 3.46 3.49 3.38 3.35 a
216 3.11 3.88 3.92 3.71 3.59 3.57 3.48 3.42 3.63 a
217 1.47 1.97 1.90 1.45 1.45 1.24 1.24 1.17 1.27 a
218 2.73 2.91 2.99 2.87 2.88 2.84 2.67 2.69 2.77 a
219 3.25 3.59 3.54 3.17 2.92 3.48 3.05 3.27 2.96 a
220 2.73 2.88 3.06 2.75 2.71 2.83 2.58 2.68 2.42 a
221 3.30 4.04 3.94 3.84 3.99 3.90 3.89 3.89 2.98 a
222 2.85 3.38 3.42 3.28 2.94 2.96 3.12 2.98 2.99 a
223 2.72 4.49 4.35 4.38 4.36 3.77 4.23 3.83 3.89 a
224 3.68 4.17 4.30 4.16 4.07 3.87 3.87 3.85 3.82 a
232 2.49 3.73 3.51 3.16 3.26 3.07 2.77 2.92 3.00 a
201 2.30 3.41 3.48 3.41 3.49 3.33 3.20 3.07 3.15 c
202 2.91 3.92 4.02 4.04 3.64 3.29 3.10 2.70 2.69 c
203 2.08 2.52 2.44 2.27 2.23 2.01 2.26 2.34 2.44 c
204 3.02 4.43 4.30 4.08 4.01 3.62 3.23 2.46 2.97 c
205 3.26 4.55 4.58 4.44 4.04 4.33 3.87 3.75 3.81 c
206 2.29 4.25 4.37 4.10 4.20 3.84 3.43 3.79 3.74 c
207 1.96 3.00 2.80 2.59 2.42 1.61 1.83 1.21 1.50 c
208 2.70 4.06 3.98 4.06 3.93 3.61 2.91 2.07 2.67 c
209 2.50 4.37 4.06 3.68 3.64 3.17 3.37 3.20 3.25 c
210 2.35 2.83 2.79 2.82 2.79 2.80 2.76 2.64 2.69 c
211 2.34 4.06 3.68 3.59 3.27 2.60 2.72 2.22 2.68 c
212 2.20 2.82 1.90 2.57 2.30 1.67 1.90 2.07 1.76 c
214 2.78 3.18 3.13 3.11 2.97 3.06 3.27 3.24 3.33 c
215 3.43 4.39 4.63 4.19 4.00 4.01 3.66 3.47 3.22 c
216 3.07 3.90 3.98 4.09 4.03 4.07 3.56 3.83 3.75 c
217 1.21 2.31 2.19 2.21 2.09 1.75 1.72 1.80 1.36 c
218 2.60 3.19 3.18 3.15 3.14 3.08 2.96 2.97 2.85 c
219 2.61 3.54 3.45 3.25 3.01 3.07 2.65 2.47 2.55 c
220 2.48 2.99 3.02 3.02 2.94 2.69 2.66 2.68 2.70 c
221 3.73 4.37 4.20 4.17 4.19 4.07 3.86 3.89 3.89 c
222 2.54 3.26 3.39 3.27 3.20 3.32 3.09 3.25 3.15 c
223 2.83 4.72 4.97 4.99 4.96 4.95 4.82 4.56 4.49 c
224 3.47 4.27 4.50 4.34 4.00 4.11 3.93 3.68 3.77 c
232 2.79 4.10 3.85 4.27 4.01 3.78 3.14 3.94 3.69 c
201 2.14 2.36 2.36 2.28 2.35 2.31 2.62 2.12 2.42 p
202 3.37 3.03 3.02 3.19 2.98 3.01 2.75 2.70 2.84 p
203 1.88 1.99 1.62 1.65 1.68 1.65 1.85 1.96 1.30 p
204 3.10 3.24 3.37 3.54 3.31 2.81 3.58 3.76 3.05 p
205 2.91 3.35 3.92 3.69 3.97 3.94 3.63 2.92 3.31 p
206 2.29 3.04 3.28 3.17 2.99 3.31 3.21 2.98 2.82 p
207 2.20 2.46 3.22 2.65 3.02 2.25 1.50 2.37 1.94 p
208 2.70 2.85 2.81 2.96 2.69 2.18 1.91 2.21 1.71 p
209 2.25 3.45 3.48 3.80 3.60 2.83 3.17 3.22 3.13 p
210 2.48 2.56 2.52 2.67 2.60 2.68 2.64 2.65 2.61 p
211 2.12 2.19 2.44 2.41 2.55 2.93 3.08 3.11 3.06 p
212 2.37 2.14 1.92 1.75 1.58 1.51 1.94 1.84 1.76 p
214 2.73 2.57 3.08 2.62 2.91 2.71 2.39 2.42 2.73 p
215 3.15 2.90 2.80 3.17 2.39 3.01 3.22 2.75 3.14 p
216 2.52 3.02 3.21 3.17 3.13 3.38 3.25 3.29 3.35 p
217 1.48 1.35 1.15 1.24 1.32 0.95 1.24 1.04 1.16 p
218 2.52 2.61 2.59 2.77 2.73 2.70 2.72 2.71 2.75 p
219 2.90 2.91 2.89 3.01 2.74 2.71 2.86 2.95 2.66 p
220 2.83 2.78 2.89 2.77 2.77 2.69 2.65 2.84 2.80 p
221 3.50 3.81 3.77 3.78 3.90 3.80 3.78 3.70 3.61 p
222 2.86 3.06 2.95 3.07 3.10 2.67 2.68 2.94 2.89 p
223 2.42 2.87 3.08 3.02 3.14 3.67 3.84 3.55 3.75 p
224 3.66 3.98 3.77 3.65 3.81 3.77 3.89 3.63 3.74 p
232 2.88 3.04 3.00 3.24 3.37 2.69 2.89 2.89 2.76 p
;
run;
/*** Creating fev1uni data from fev1mult example***/
data fev1uni(drop=fev11h fev12h fev13h fev14h fev15h fev16h
    fev17h fev18h i);
 set fev1mult;
 array fev[8] fev11h fev12h fev13h fev14h fev15h fev16h fev17h fev18h;
 do i = 1 to 8;
   hour=i; 
   fev1=fev[i];
   output;
 end;
run;
/*** Printing fev1uni and fev1mult datasets***/
proc print data=fev1mult;
proc print data=fev1uni;
run;
/*** Producing Profile Plots for the Three Drugs***/
proc means data=fev1uni nway noprint;
   var fev1;
   class drug hour;
   output out=profile mean=avgfev1;
run;

proc sgplot data=profile;
   series y=avgfev1 x=hour / group=drug;
   title 'Average FEV1 vs. Hour by Drug';
run;
title;
/*** Visualizing the Correlation Structure***/
proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour
         / ddfm=kr;
   repeated hour / type=un subject=patient(drug) r rcorr;
   ods output covparms=cov rcorr=corr;
run;                                      

data times;
   do time1=1 to 8;
      do time2=1 to time1;
	     distance=time1-time2;
		 output;
	  end;
   end;
run;

data covplot;
   merge times cov;
run;

proc print;
run;

proc sgplot data=covplot noautolegend;
   label distance='Distance in Hour';
   series y=estimate x=distance / group=time1 datalabel=time1;
   title 'Covariance vs. Distance in Hour';
run;
title;
               
proc print data=corr;
run;                                 

%macro forplot(corrdata, dim);
   proc datasets; delete corrplot;
   run;
   %do i=1 %to %eval(&dim-1);
     data corrplot&i(rename=(col&i=corr row=time1));
        set &corrdata(keep=col&i row);
        distance=row-&i;
		time2=&i;
  		if distance > 0;
	 run;
    
	 proc append base=corrplot data=corrplot&i;
	 run;
   %end;
%mend;

%forplot(corr, 8);

proc print data=corrplot;
   var time1 time2 distance corr;
run;    

proc sgplot data=corrplot noautolegend;
   label distance='Distance in Hour';
   series y=corr x=distance / group=time1 datalabel=time1;
   title 'Correlation vs. Distance in Hour';
run;
title;
/*** Information Criteria for Model Selection***/
ods listing close;
proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr(firstorder) ;
   repeated hour / type=ar(1) subject=patient(drug);
   ods output FitStatistics=FitAR1(rename=(value=AR1))
              FitStatistics=FitAR1p
			  Dimensions=ParmAR1(rename=(value=NumAR1));
run;

proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr;
   repeated hour / type=toep subject=patient(drug);
   ods output FitStatistics=FitToep(rename=(value=Toep))
              FitStatistics=FitToepp
              Dimensions=ParmToep(rename=(value=NumToep));
run;

proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr ;
   repeated hour / type=un subject=patient(drug);
   ods output FitStatistics=FitUn(rename=(value=UN))
              FitStatistics=FitUNp
              Dimensions=ParmUN(rename=(value=NumUN));
run;

data fits;
   merge FitAR1 FitToep FitUn;
   by descr;
run;

ods listing;
proc print data=fits;
run;       

*** Plot the fit statistics;
data plot(drop=descr p);
   set FitAR1p (in=ar1)
         FitToepp (in=toep) 
         FitUNp (in=un);
   if ar1 then structure='AR(1)';
   else if toep then structure='Toep';
          else if un then structure='UN';
   p=index(descr, '(');
   if p > 0 then FitStatistics=substr(descr, 1, p-2);
   else delete;
run;

proc sgplot data=plot;
   scatter y=value x=FitStatistics / group=structure;
run;
/*** Likelihood Ratio Tests***/
data result (drop=descr);
   merge FitAR1 FitToep FitUN ParmAR1 ParmToep ParmUN;
   if _n_ = 1 then do;
      ChiToepUn=Toep-UN;
	  dfToepUn=NumUN-NumToep;
      pToepUn=1-probchi(ChiToepUn, dfToepUn);

	  ChiAR1Un=AR1-UN;
	  dfAR1Un=NumUN-NumAR1;
      pAR1Un=1-probchi(ChiAR1Un, dfAR1Un);

	  ChiAR1Toep=AR1-Toep;
	  dfAR1Toep=NumToep-NumAR1;
      pAR1Toep=1-probchi(ChiAR1Toep, dfAR1Toep);
      output;
      stop;
   end;
run;

options nodate nonumber;
title1 'Likelihood Ratio Tests';
title2 'Toep vs UN, AR1 vs UN, and AR1 vs Toep';
proc print data=result noobs;
   var ChiToepUn dfToepUn pToepUn ChiAR1Un dfAR1Un pAR1Un ChiAR1Toep dfAR1Toep pAr1Toep;
run;
title;                                   *c05s2d6.sas;
/*** Fit the Mean Model Accounting for the  Covariance Structure***/
proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr;
   repeated hour / type=TOEP subject=patient(drug);
run;    

*** comparing mean models using maximum likelihood;
proc mixed data=fev1uni method=ml;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr ;
   repeated hour / type=TOEP subject=patient(drug);
   ods output FitStatistics=FitFull(rename=(value=Full));
run;     

proc mixed data=fev1uni method=ml;
   class drug patient hour;
   model fev1=drug basefev1 hour drug*hour / ddfm=kr ;
   repeated hour / type=TOEP subject=patient(drug);
   ods output FitStatistics=FitReduced(rename=(value=Reduced));
run;    

data fit;
   merge FitFull FitReduced;
run;

proc print data=fit;
run;  

*** Fit the final model using REML;
proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 hour drug*hour / ddfm=kr;
   repeated hour / type=TOEP subject=patient(drug);
run;   
/*** Making Statistical Inference***/
ods listing exclude diffs;
ods output diffs=alldiffs;
proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 hour drug*hour / ddfm=kr;
   repeated hour / type=TOEP subject=patient(drug);
   lsmeans drug*hour / slice=hour diff adjust=tukey adjdfe=row;
   estimate '(hr1-hr8) for a vs (hr1-hr8) for c'
           drug*hour 1 0 0 0 0 0 0 -1 
                    -1 0 0 0 0 0 0 1;
run;
 
proc print data=alldiffs;
   where drug=_drug or hour=_hour;
run;                             

* treating hour as a continuous variable;
proc mixed data=fev1uni;
   class drug patient;
   model fev1=basefev1 drug hour drug*hour / ddfm=kr solution;
   repeated / type=toep subject=patient(drug);
run;
/*** What Else Could Have Been Done?***/
proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr;
   repeated hour / type=TOEP subject=patient(drug) group=drug;
   title 'Using the GROUP= Option';
run;

proc mixed data=fev1uni;
   class drug patient hour;
   model fev1=drug basefev1 drug*basefev1 hour drug*hour / ddfm=kr(firstorder);
   random patient(drug);
   repeated hour / type=AR(1) subject=patient(drug);
   title 'Using RANDOM in Addition to REPEATED';
run;

proc mixed data=fev1uni;
   class drug patient;
   model fev1=basefev1 drug hour hour*drug / ddfm=kr ;
   random int hour / type=un subject=patient(drug) g v;
   title 'Random Coefficient Model';
run;                                       
title;            

*** make predictions;
data new;
   input basefev1 drug $ hour patient;
   datalines;
   2.46 a 2.5 201
   2.46 a 4.5 201
   2.46 a 9 201
;
run;

data fev1new;
   set fev1uni new;
run;

proc mixed data=fev1new;
   class drug patient;
   model fev1=basefev1 drug hour hour*drug / ddfm=kr outp=eblups;
   random int hour / type=un subject=patient(drug);
run;  

proc print data=eblups;
   var patient drug basefev1 hour fev1 pred;
run;     

proc sort data=eblups; 
   by drug;
run;

proc sgpanel data=eblups noautolegend;
   panelby drug ;
   series y=pred x=hour / group=patient;
run;
/*** Fitting a Random Coefficient Model with a REPEATED Statement (Self-Study)***/
proc mixed data=fev1uni;
   class drug patient;
   model fev1=basefev1 drug hour hour*drug / ddfm=kr(firstorder);
   random int hour / type=un subject=patient(drug) g v;
   repeated / type=ar(1) subject=patient(drug) r;
   title 'Random Coefficient Model with Correlated Errors';
run; 
title;  

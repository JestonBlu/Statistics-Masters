/* This macro can be used to calculate AICC and AIC of regression models using SAS Proc genmod.    */
/* The output is also stored in the dataset named "genmodsummary" which can be called if needed.   */
/* The initial vaersion was written by Yufeng Ding, based on earlier code by Zheng Sun, which was  */
/* based on code for AIC and least squares regression by J.T. Peterson.                            */

/* The initial version was taken from the web site for Analyzing Categorical Data, J. S. Simonoff  */
/* http://pages.stern.nyu.edu/~jsimonof/AnalCatData/                                               */

/* Modified by M. Friendly 29 Aug 2003 16:55:19
  - Removed unnecessary %if-then-else logic when offset given
  - Made class= variable optional
  - Added OUT= parameter
  - Added SORTBY= parameter
  - Added default for distribution=; default for link in genmod depends on distribution
  - Added Length stmt for model_name so longest need not be first
  - Labels for computed variables added
  - Make number_of_models optional
  - Check convergence status, skip results if model does not converge
  - Added scale = deviance / df to output data set
*/

/*
/* IMPORTANT NOTE                                                                    */
/*                                                                                   */
/* This macro runs under SAS version 9.xx   */
/*                                                                                   */

%Macro genmodsummary(
	data = _LAST_,
	class=,
	yvariable=,
	model1=,
	model2=,
	model3=,
	model4=,
	model5=,
	model6=,
	model7=,
	model8=,
	model9 = ,
	model10=,
	model11= ,
	model12= ,
	model13= ,
	model14= ,
	model15= ,
	model16= ,
	model17= ,
	model18= ,
	model19= ,
	model20= ,
	distribution=normal,
	link=,
	offset=,
	number_of_models=,
	sortby=modnum,
	out=genmodsummary
	);


/* should not require &number_of_models to be counted */
/* Here, assume that all models are named sequentially, so last non-blank terminates
   Better to use %do %while, so first non-blank terminates
*/
%if %length(&number_of_models) = 0 %then %do;
	%do i=1 %to 20;
		%if %length(&&model&i) %then %let number_of_models=&i;
		%end;
	%put NOTE: You didnt say it, but you seem to have &number_of_models models;
	%end;
%put number_of models = &number_of_models;

%do i = 1 %to &number_of_models;
   %let model_name&i = &&model&i;
%end;

%do i = 1 %to &number_of_models;
proc genmod data=&data;
    %if %length(&class) %then %do;
       class &class;
	   %end;
    model &yvariable = &&model&i /dist=&distribution
	%if %length(&link)   %then link=&link;
	%if %length(&offset) %then offset=&offset;
	;
    ods output      
		Modelfit = logtmp
		NObs = obstmp
		ConvergenceStatus = converged;
	ods exclude ParameterEstimates Modelfit ModelInfo ClassLevels ConvergenceStatus NObs;

	%*-- Did the model converge?;
	%let converge = no;
	data _null_;
		set converged;
		if status=0 then call symput('converge', 'yes');
		run;
	%if &converge = no %then %do;
       %put %str(   )PROC GENMOD did not converge.;
		proc print data=converged;
		%end;
		
	%else %do;
	data loglikhd;
	set logtmp;
		modnum = &i;
    	where Criterion = 'Log Likelihood';
    	loglikhd = Value;
		keep modnum loglikhd;

    proc append base=result1 data = loglikhd force;

    data dev;
    set logtmp;
        modnum = &i;
        where Criterion = 'Deviance';
        G2=Value;
		keep modnum df G2;

    proc append base=result2 data = dev force;


    data obstmp;
       set obstmp;
       modnum=&i;
       where Label = 'Number of Observations Used';
               ncells = N;
    keep modnum ncells;

   proc append base=result3 data = obstmp force;
	%end;  /* if converged */

%end; /* loop over models */


data nobstmp;
	set &data;
	proc univariate noprint;
	var &yvariable;
	output out=result4tmp sum=nobstmp;

%do i = 1 %to &number_of_models;
	data result4tmp1;
		set result4tmp;
		modnum = &i;
		nobs=nobstmp;
		keep modnum nobs;
	proc append base=result4 data=result4tmp1 force;

%end;

data &out;
	length model_name $100;
	merge result1 result2 result3 result4;
	by modnum;
	numpar=ncells-df;
	%do i=1 %to &number_of_models;
		if modnum =&i then model_name="&&model_name&i";
	%end;
	label loglikhd='Log Likelihood'
		g2 = 'Deviance'
		ncells = 'Table cells'
		numpar = 'Number of parameters'
		df = 'Degrees of freedon'
	;

%if (&distribution=normal) | (&distribution=n)  %then %do;
        data &out;
        set &out;
        numpar=numpar + 1;
        aic= -2*loglikhd+2*(numpar);
        aicc= -2*loglikhd+2*(numpar)*(ncells/(ncells-numpar-1));
%end;
%else %do;
%if (&distribution=p)|(&distribution=poisson) %then %do;
        data &out;
        set &out;
        aic= G2+2*(numpar);
        aicc= G2+2*(numpar)*(nobs/(nobs-numpar-1));
%end;
%else %if (&distribution=nb) | (&distribution= negative binomial) %then %do;
        data &out;
        set &out;
        numpar=numpar + 1;
        aic= -2*loglikhd+2*(numpar);
        aicc= -2*loglikhd+2*(numpar)*(nobs/(nobs-numpar-1));
	%end;
%end;

proc sort;
	by aic;
data &out;
set &out;
	retain best;
	drop best;
	if _n_=1 then best=aic;
	daic=aic-best;

proc sort;
        by aicc;

data &out;
	set &out;
    retain best1;
	drop best1;
    if _n_=1 then best1=aicc;
    daicc=aicc-best1;
	scale = g2/df;
	label aic = 'AIC statistic'
		aicc = 'AICC statistic'
		daic = 'AIC-best'
		daicc = 'AICC-best'
		modnum='Model#'
		model_name='Model formula'
		nobs = 'Number of observations'
		scale = 'Deviance/df'
		;

    proc sort;
            by &sortby;

proc print data=&out noobs;
id modnum;
var model_name /* nobs ncells */ G2 df loglikhd numpar aic aicc daic daicc;
run;

proc datasets library = work;
     delete  converged dev loglikhd logtmp nobstmp obstmp 
	 result1 result2 result3 result4 result4tmp result4tmp1;
run;
quit;
%mend;

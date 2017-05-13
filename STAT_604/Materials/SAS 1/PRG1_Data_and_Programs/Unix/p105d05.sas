data work.nlsformats;
   nldate=0; nldatemn=0;
   nldatew=0; nldatewn=0; output;
   nldate=17245; nldatemn=17245;
   nldatew=17245; nldatewn=17245; output;
run;

options locale=German_Germany;
proc print data=work.nlsformats;
   format nldate nldate. nldatemn nldatemn.
          nldatew nldatew. nldatewn nldatewn.;
run;

options locale=English_UnitedStates;
proc print data=work.nlsformats;
   format nldate nldate. nldatemn nldatemn.
          nldatew nldatew. nldatewn nldatewn.;
run;

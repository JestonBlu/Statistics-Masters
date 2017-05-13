
data satis;
input manag $ superv $ worker $ count;
cards;
bad low low  103
bad low high  87
bad high low  32
bad high high 42
good low low  59
good low high 109
good high low 78
good high high 205
;

proc genmod data=satis; ods select type3 obstats; class manag superv worker;
model count=manag|superv|worker/dist=poi link=log type3 obstats;
title '(MSW)';
run;

proc genmod data=satis; 
class manag superv worker; 
model count=manag superv worker manag*superv manag*worker superv*worker/
dist=poi link=log type3 residuals predicted;
title '(MS,MW,SW) with default parameterization';
run;

proc genmod data=satis; 
class manag superv worker/param=effect; 
model count=manag superv worker manag*superv manag*worker superv*worker/
dist=poi link=log type3 residuals predicted;
title '(MS,MW,SW) with effects parameterization';
run;

proc genmod data=satis; ods select type3 obstats modelfit;
class manag superv worker; 
model count=manag superv worker manag*superv manag*worker superv*worker/
dist=poi link=log type3 residuals predicted;
title '(MS,MW,SW) with selected output using ODS';
run;


proc genmod data=satis; ods select type3 obstats Modelfit;
class manag superv worker;
model count=manag superv worker manag*superv manag*worker/dist=poi link=log 
type3 r pred;
title '(MS,MW)';
run;

proc genmod data=satis; ods select type3 obstats Modelfit;
class manag superv worker;
model count=manag superv worker superv*worker manag*worker/dist=poi link=log type3 r pred;
title '(MW,SW)';

proc genmod data=satis; ods select type3 obstats modelfit;
class manag superv worker;
model count=manag superv worker manag*superv superv*worker/dist=poi link=log type3 r pred;
title '(MS,SW)';

proc genmod data=satis; ods select type3 obstats modelfit;
class manag superv worker;
model count=manag superv worker manag*superv/dist=poi link=log type3 r pred;
title '(MS,W)';

proc genmod data=satis; ods select type3 obstats modelfit;
class manag superv worker;
model count=manag superv worker /dist=poi link=log type3 r pred;
output out=pred_i pred=mwms_i;
title '(M,S,W)';
run;

proc logistic data=satis; freq count;
class manag superv;
model worker=manag superv/aggregate scale=none;
title 'Homogeneous Association Model Using Logistic Regression';
run;

proc logistic data=satis; freq count;
class manag superv;
model worker=manag|superv/aggregate scale=none;
title 'Saturated Model Using Logistic Regression';
run;


proc genmod order=data data=satis;
ods select type3 obstats modelfit;
 class manag superv worker;
 model count = manag superv worker manag*superv manag*worker
   /link=log dist=poi obstats;
 output out=pred_ci pred=mwms_ci;
 title 'Conditional Independence:  (MS,MW)';
run;

proc genmod order=data data=satis ;
ods select type3 obstats modelfit;
 class manag superv worker;
 model count = manag superv worker  manag*superv manag*worker
   worker*superv /link=log dist=poi obstat;
 output out=pred_ha pred=mwms_ha;
 title 'Homogeneous Association:  (MS,MW,SW)';
run;

proc genmod order=data data=satis ;
ods select type3 obstats modelfit;
 class manag superv worker;
 model count = manag superv worker  manag*superv superv*worker
    /link=log dist=poi obstat;
 output out=pred_ci2 pred=mwms_ci2;
 title 'Conditional Independence 2:  (MS,SW)';
run;

data all;
 merge pred_i pred_ha pred_ci pred_ci2;
 d_i=abs(count-mwms_i)/(2*715);
 d_ci=abs(count-mwms_ci)/(2*715);
 d_ci2=abs(count-mwms_ci2)/(2*715);
 d_ha=abs(count-mwms_ha)/(2*715);
* Note 715 is the total number of observations (counts) which I got by
   looking at the output;
run;

proc means sum;
 var count d_ha d_ci d_ci2 d_i;
 title 'Dissimilarity indices for Worker Satisfaction Example';
run;
/*

proc catmod order=data;
weight count;
model manag*superv*worker=_response_/noresponse noiter;
loglin manag|superv|worker;
title '(MSW)';

proc catmod order=data;
weight count;
model manag*superv*worker=_response_/pred=freq noresponse noiter;
loglin manag|superv manag|worker superv|worker;
title '(MW,MW,SW)';
run;
proc catmod order=data;
weight count;
model manag*superv*worker=_response_/pred=freq noresponse noiter;
loglin manag|superv manag|worker;
title '(MS,MW)';

proc catmod order=data;
weight count;
model manag*superv*worker=_response_/pred=freq noresponse noiter;
loglin manag|superv superv|worker; 
title'(MS,SW)';

proc catmod order=data;
weight count;
model manag*superv*worker=_response_/pred=freq noresponse noiter;
loglin  manag|worker superv|worker;
title '(MW,SW)';

proc catmod order=data;
weight count;
model manag*superv*worker=_response_/pred=freq noresponse noiter;
loglin manag|superv worker;
title '(MS,W)';

proc catmod order=data;
weight count;
model manag*superv*worker=_response_/pred=freq noresponse noiter;
loglin manag superv worker;
title '(M,S,W)';
run;
proc freq data=satis; weight count;
tables manag*superv*worker/cmh relrisk chisq;
run;
*/

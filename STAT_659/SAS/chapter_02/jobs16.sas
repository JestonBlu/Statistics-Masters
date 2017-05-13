options nodate nocenter ls=100 ps=55;
data job; input type $ gender $ response $ count @@;
cards;
office male response 15 office male deny 60
office female response 75 office female deny 150
sales male response 145 sales male deny 55
sales female response 85 sales female deny 15
;
proc freq order=data data=job;
   weight count;
   tables gender*response/nocol nopct chisq relrisk;
   tables type*gender*response/ nocol nopct chisq cmh relrisk;  
   title 'Simpsons paradox using FREQ';
/*
proc genmod data=job; class type gender response;
ods select type3 modelfit;
model count=type|gender|response/dist=poi link=log type3;
title '(TGR) using GENMOD';

proc genmod data=job; class type gender response;
model count=type gender response type*gender type*response gender*response/
dist=poi link=log type3;
title '(TG,TR,GR) using GENMOD';

proc genmod data=job; class type gender response;
ods select type3 modelfit;
model count=type gender response type*response gender*response/dist=poi link=log type3;
title '(TR,GR) using GENMOD';

proc genmod data=job; class type gender response;
ods select type3 modelfit;
model count=type gender response type*gender gender type*response/dist=poi link=log type3;
title '(TG,TR) using GENMOD';

proc genmod data=job; class type gender response;
ods select type3 modelfit;
model count=type gender response type*gender gender*response/dist=poi link=log type3;
title '(TG,GR) using GENMOD';


proc genmod data=job; class type gender response;
ods select type3 modelfit;
model count=type gender response /dist=poi link=log type3;
title '(T,G,R) using GENMOD';
*/
   run;

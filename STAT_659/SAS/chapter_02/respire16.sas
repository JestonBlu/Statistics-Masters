options nodate nocenter ls=90 ps=55;

data respire; input center treatment $ response $ count @@;
cards;
1 test    y 29 1 test    n 16
1 placebo y 14 1 placebo n 31
2 test    y 37 2 test    n 8
2 placebo y 24 2 placebo n 21
;
proc freq order=data data=respire;
   weight count;
   tables center*treatment*response/ nocol nopct chisq cmh relrisk;  
   tables treatment*response/noprint relrisk;
   title 'Using PROC FREC for CMH procedures';
run;

/*
proc genmod data=respire; class center treatment response;
ods select type3 modelfit;
model count=center|treatment|response/dist=poi link=log type3;
title '(CTR) using GENMOD';

proc genmod data=respire; class center treatment response;
ods select type3 modelfit;
model count=center treatment response center*treatment center*response treatment*response/
dist=poi link=log type3;
title '(CT,CR,TR) using GENMOD';

proc genmod data=respire; class center treatment response;
model count=center treatment response center*response treatment*response/dist=poi link=log type3;
title '(CR,TR) using GENMOD';

proc genmod data=respire; class center treatment response;
ods select type3 modelfit;
model count=center treatment response center*treatment treatment center*response/dist=poi link=log type3;
title '(CT,CR) using GENMOD';

proc genmod data=respire; class center treatment response;
ods select type3 modelfit;
model count=center treatment response center*treatment treatment*response/dist=poi link=log type3;
title '(CT,TR) using GENMOD';

proc genmod data=respire; class center treatment response;
ods select type3 modelfit;
model count=center treatment response center*treatment/dist=poi link=log type3;
title '(CT,R) using GENMOD';

proc genmod data=respire; class center treatment response;
ods select type3 modelfit;
model count=center treatment response /dist=poi link=log type3;
title '(C,T,R) using GENMOD';

*/
   run;

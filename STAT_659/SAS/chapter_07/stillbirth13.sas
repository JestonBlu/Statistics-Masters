options nocenter nodate ls=90 ps=60;
data stillbirth;
     input Gender$ GesAge$ Race$ Birth$ Count;
     cards;
     Male  <=24  Aborigine  StillBirth  22
     Male  25-28  Aborigine  StillBirth  21
     Male  29-32  Aborigine  StillBirth  12
     Male  33-36  Aborigine  StillBirth  4
     Male  37-41  Aborigine  StillBirth  7
     Female  <=24  Aborigine  StillBirth  17
     Female  25-28  Aborigine  StillBirth  13
     Female  29-32  Aborigine  StillBirth  10
     Female  33-36  Aborigine  StillBirth  10
     Female  37-41  Aborigine  StillBirth  13
     Male  <=24  Aborigine  LiveBirth  16
     Male  25-28  Aborigine  LiveBirth  42
     Male  29-32  Aborigine  LiveBirth  73
     Male  33-36  Aborigine  LiveBirth  387
     Male  37-41  Aborigine  LiveBirth  3934
     Female  <=24  Aborigine  LiveBirth  16
     Female  25-28  Aborigine  LiveBirth  19
     Female  29-32  Aborigine  LiveBirth  76
     Female  33-36  Aborigine  LiveBirth  451
     Female  37-41  Aborigine  LiveBirth  3729
     Male  <=24  White  StillBirth  171
     Male  25-28  White  StillBirth  109
     Male  29-32  White  StillBirth  95
     Male  33-36  White  StillBirth  112
     Male  37-41  White  StillBirth  169
     Female  <=24  White  StillBirth  167
     Female  25-28  White  StillBirth  100
     Female  29-32  White  StillBirth  78
     Female  33-36  White  StillBirth  92
     Female  37-41  White  StillBirth  209
     Male  <=24  White  LiveBirth  121
     Male  25-28  White  LiveBirth  358
     Male  29-32  White  LiveBirth  944
     Male  33-36  White  LiveBirth  5155
     Male  37-41  White  LiveBirth  101776
     Female  <=24  White  LiveBirth  107
     Female  25-28  White  LiveBirth  314
     Female  29-32  White  LiveBirth  727
     Female  33-36  White  LiveBirth  4224
     Female  37-41  White  LiveBirth  96077
;

data stillbirth;
     set stillbirth;
     rename gender=g;
     rename gesage=a;
     rename race=r;
     rename birth=b;
proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b/dist=poi link=log type3 obstats;
title "Model With All First-Order Terms (m1)";
output out=outm1 pred=p1;

proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b g*a g*r g*b a*r a*b r*b/dist=poi link=log type3 obstats;
title "Model with All Two-Way Interactions (m2)";
output out=outm2 pred=p2;


proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b g*a g*r g*b a*r a*b r*b g*a*r g*a*b g*r*b a*r*b/dist=poi link=log type3 obstats;
title "Model with All Three-Way Interactions (m3)";
output out=outm3 pred=p3;

proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b g*a g*r g*b a*r a*b r*b g*a*r g*a*b a*r*b/dist=poi link=log type3 obstats;
title "Model with All Three-Way Interactions except BRG (m4)";
output out=outm4 pred=p4;

proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b g*a g*r g*b a*r a*b r*b g*a*r a*r*b/dist=poi link=log type3 obstats;
title "Model with ABR, ARG, BG (m5)";
output out=outm5 pred=p5;

proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b g*a g*r g*b a*r a*b r*b g*a*r/dist=poi link=log type3 obstats;
title "Model with ARG, AB, BR, BG (m6)";
output out=outm6 pred=p6;

proc genmod; class g a r b;
ods select type3 modelfit;
model Count=g a r b g*a g*r g*b a*r a*b  g*a*r/dist=poi link=log type3 obstats;
title "Model with ARG, AB, BG (m7)";
output out=outm7 pred=p7;
run;

data allstill;
merge outm1-outm7;
d1=abs(count-p1)/(2*219977);
d2=abs(count-p2)/(2*219977);
d3=abs(count-p3)/(2*219977);
d4=abs(count-p4)/(2*219977);
d5=abs(count-p5)/(2*219977);
d6=abs(count-p6)/(2*219977);
d7=abs(count-p7)/(2*219977);

proc means sum;
 var count d1-d7;
 title 'Dissimilarity indices for Stillbirth Example';
run;

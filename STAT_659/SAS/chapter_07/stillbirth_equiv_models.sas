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

proc genmod data=stillbirth; class g a r b/param=ref;
model Count=g a r b g*a g*r g*b a*r a*b r*b a*g*r/dist=poi link=log type3;
title "Equivalent loglinear model";


proc genmod data=stillbirth; class g a r b/param=ref;
freq count;
model b=g a r/dist=bin link=logit type3 aggregate;
title "Logit model";
run;

proc genmod data=stillbirth; class g a r b/param=ref;
model Count=g a r b g*a g*r g*b /dist=poi link=log type3;
title "Equivalent loglinear model omitting interactions of predictors";



run;

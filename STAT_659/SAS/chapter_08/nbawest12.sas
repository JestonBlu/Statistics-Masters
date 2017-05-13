
data nbawest;
input winner $ loser $ symm count @@;
cards;
sa ok 1 2 sa ll 2 2 sa me 3 4  sa lc 4 2 sa de 5 2  sa da  6 2  sa ut 7 3 
ok sa 1 1  ok ll 8 2 ok me 9 3 ok lc 10 1 ok de 11 2 ok da 12 3 ok ut 13 2
ll sa 2 1 ll ok 8 1 ll me 14 2 ll lc 15 2 ll de 16 3 ll da 17 4 ll ut 18 2
me sa 3 0 me ok 9 1 me ll 14 1 me lc 19 1 me de 20 3 me da 21 2 me ut 22 1
lc sa 4 1 lc ok 10 3 lc ll 15 1 lc me 19 2 lc de 23 3 lc da 24 2 lc ut 25 2
de sa 5 1 de ok 11 1 de ll 16 1 de me 20 0 de lc 23 1 de da 26 1 de ut 27 1
da sa 6 2 da ok 12 1 da ll 17 0 da me 21 1 da lc 24 1 da de 26 3 da ut 28 3
ut sa 7 1 ut ok 13 1 ut ll 18 2 ut me 22 2 ut lc 25 1 ut de 27 2 ut da 28 1
;

proc freq data=nbawest; weight count;
tables winner*loser/norow nocol nopct;
run;

proc genmod data=nbawest; class symm winner loser; 
model count=symm winner loser /dist=poi link=log type3;
title 'Bradley-Terry model using quasi-symmetry model';
run; 


data nbawest2; input win n sa ok ll me lc de da ut;
cards;
2 3 1 -1 0 0 0 0 0 0
2 3 1 0 -1 0 0 0 0 0
4 4 1 0 0 -1 0 0 0 0
2 3 1 0 0 0 -1 0 0 0
2 3 1 0 0 0 0 -1 0 0
2 4 1 0 0 0 0 0 -1 0
3 4 1 0 0 0 0 0 0 -1
2 3 0 1 -1 0 0 0 0 0 
3 4 0 1 0 -1 0 0 0 0
1 4 0 1 0 0 -1 0 0 0
2 3 0 1 0 0 0 -1 0 0 
3 4 0 1 0 0 0 0 -1 0
2 3 0 1 0 0 0 0 0 -1
2 3 0 0 1 -1 0 0 0 0
2 3 0 0 1 0 -1 0 0 0
3 4 0 0 1 0 0 -1 0 0
4 4 0 0 1 0 0 0 -1 0
2 4 0 0 1 0 0 0 0 -1
1 3 0 0 0 1 -1 0 0 0
3 3 0 0 0 1 0 -1 0 0
2 3 0 0 0 1 0 0 -1 0
1 3 0 0 0 1 0 0 0 -1
3 4 0 0 0 0 1 -1 0 0
2 3 0 0 0 0 1 0 -1 0
2 3 0 0 0 0 1 0 0 -1
1 4 0 0 0 0 0 1 -1 0
1 3 0 0 0 0 0 1 0 -1
3 4 0 0 0 0 0 0 1 -1
;
proc genmod data=nbawest2;
model win/n= sa ok ll me lc de da ut/dist=bin link=logit noint covb;
title 'Bradley-Terry Model using logistic regression';

run;

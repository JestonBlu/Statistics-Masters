data soccer;
input value countpass countgoal;
cards;
0 10187  225
1  6923  293
2  3611  224
3  1592  114
4   608  41
5   280  15
6   107  9
7    33  1
8     9  2
9    11  0 
;
proc means; freq countpass; var value;
title 'soccer data';
run;

proc means; freq countgoal; var value;
run;

proc genmod data=soccer; freq countpass;
model value=/dist=p link=identity;

proc genmod data=soccer; freq countpass;
model value=/dist=p link=identity lrci;

proc genmod data=soccer; freq countgoal;
model value=/dist=p link=identity;

proc genmod data=soccer; freq countgoal;
model value=/link=identity dist=p lrci;

proc genmod data=soccer; freq countgoal;
     model value = / dist = nb link=identity lrci;    


run;

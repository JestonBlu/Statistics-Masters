*From Categorical Data Using SAS, 3rd edition.  A marketing research firm organized a focus group to
consider issues of new car marketing.  Members of the group had purchased a car from a local dealer
in the last month.  Researchers were interested in whether there was an association between the type
of car bought and the manner in which the group members found out about the car in the media;

data market;
input car $ adsource $ count @@;
cards;
sporty paper 3 sporty radio 4 sporty tv 0 sporty magazine 3
sedan paper 0 sedan radio 2 sedan tv 4 sedan magazine 0
utility paper 2 utility radio 2 utility tv 5 utility magazine 5
;
proc freq data=market;
weight count;
tables car*adsource/norow nocol nopct;
exact fisher pchi lrchi;
run;

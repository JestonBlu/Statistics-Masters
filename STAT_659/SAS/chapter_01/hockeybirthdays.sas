data hockey; 
input quarter $ count; 
datalines;
Jan-Mar 14
Apr-Jun 6
Jul-Sep	3
Oct-Dec 2
proc freq data=hockey order=data;
	weight count;
	*nocum -> no cumulative freq;      
	*chisq(lrchisq) --> print out liklihood Ratio Statistic;
	tables quarter/nocum testp=(25 25 25 25)chisq(lrchisq);
	*Exact test using multinomial distribution under Ho;
	exact chisq lrchisq;
	title 'Birthdates on Junior Hockey League Roster';
run;

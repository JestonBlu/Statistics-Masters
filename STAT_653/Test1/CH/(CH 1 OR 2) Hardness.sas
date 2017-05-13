Data Hardness;
input hardness;
cards;
10.1
9.6
8.3
9.2
8.9
9.1
9.3
8.5
9.3
9.1
9.4
8.5
;
PROC UNIVARIATE DATA=Hardness mu0=9.5 normal;
    VAR hardness;
	QQplot hardness /Normal(mu=est sigma=est color=red l=1);
RUN; 

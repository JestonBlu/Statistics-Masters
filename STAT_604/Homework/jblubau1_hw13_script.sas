/**********************************************************************************
 Program Name: jblubau1_hw13_script
 Date Created: 11/17/2016
 Author: Joseph Blubaugh
 Purpose: Homework Assignment 13
*********************************************************************************** */

libname datadb 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials' access=readonly;
libname output 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Data';

filename outpdf 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Homework\jblubau1_hw13_output.pdf';


* Split name from school;
data runners;
	set datadb.runners;
	length Team $ 19;
	Team = strip(scan(Player, 2, ','));
	Player = scan(Player, 1, ',');
run;

* Alter name for common variables;
data offenses;
	set datadb.offences;
	rename yds = TeamYds
	avg = TeamAvg
	TDs = TeamTDs
	rank = TeamRank
	Ydspgm = TeamYdspgm
	Name = Team;
	drop ties;
run;

* Sort the data before merging;
proc sort data=runners;
	by team;
run;

proc sort data=offenses;
	by team;
run;


* 2) Create the 3 datasets using merge;
data output.alldata 
	 teamdata(drop=runner)
	 norunners(drop=runner runpct rank player pos cl gm carries net tds avg ydspgm);
	merge offenses(in=tm) runners(in=rn);
	by team;
	format teamydspgm comma3.;
	runpct = ydspgm / teamydspgm;
	if tm = 1 and rn = 1 then output teamdata;
	if tm = 1 and rn = 0 then output norunners;
	if tm = 1 or  rn = 1 then 
	if rank ne . then runner = 'Yes';
	if rank =  . then runner = 'No';
	output output.alldata;
run;

* 3) Setup PDF in landscape mode;
options orientation=landscape nonumber dtreset;

* 4) Reorder norunners by team rank;
proc sort data=norunners;
	by teamrank;
run;

ods pdf file=outpdf;

* 5) Print the top 10 teams;
proc print data=norunners(obs=10) noobs label;
	var teamrank team plays teamyds teamavg teamydspgm wins losses;
	label teamrank = "Rank"
		  team = "Team"
		  plays = "Total Plays"
		  teamyds = "Total Yards"
		  teamavg = "Yards per Play"
		  teamydspgm = "Yards per Game";
	title1 'NCAA Football Rushing Analysis';
	title2;
	title3 'Top 10 Offences with No Top Runners';
	footnote 'Data Downloaded from NCAA.org';
run;

* 6) Fix the options to suppress dates;
options nodate;
ODS NOPROCTITLE;

* 7) Create a count table for position and class;
proc freq data=output.alldata;
	tables cl*pos / nocum nocol nopercent missing;
	label pos = "Position"
		  cl = "Class";
	footnote;
	title2 'Number of Players in each Position by Class';
run;

* 8) Use proc means to create a table on calculated field;
proc means data = output.ALLDATA maxdec=2 mean median q1 q3;
	var runpct;
	class Cl Pos;
	format RushPct comma2.;
	title2;
	title3 'Percent of Team Average by Class and Position';
run;

* 9) Use tabulate to create the same report;
proc tabulate data = output.alldata;
	var Runpct;
	class Cl Pos;
	tables cl*pos all, runpct*(n mean median q1 q3);
	format runpct comma2.;
	title3 'Percent of Team Average by Class and Position';
run;

ods pdf close;

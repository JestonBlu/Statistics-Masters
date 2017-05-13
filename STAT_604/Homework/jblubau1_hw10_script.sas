/**********************************************************************************
 Program Name: jblubau1_hw10_script
 Date Created: 10/24/2016
 Author: Joseph Blubaugh
 Purpose: Homework Assignment 10
*********************************************************************************** */

libname datadb 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials' access=readonly;
libname output 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Data';

filename outpdf 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Homework\jblubau1_hw10_output.pdf';

* 2) Read in tabled1x2016 ;
data monthly_jobs;
	set datadb.tabled1x2016;
	* b) Fix spelling;
	if industry = 'TRADE, TRANSPORTATION, AND UITLITIES' then do 
		industry = 'TRADE, TRANSPORTATION, AND UTILITIES';
	end;
	* c) Change industry to propper case;
	industry = propcase(industry); 
	where state ne '';
	if Aug__2015 ne . then;
		year = '2015';
		month = 'August    ';
		Jobs = Aug__2015;
		output;
	if Sept__2015 ne . then;
		year = '2015';
		month = 'September ';
		Jobs = Sept__2015;
		output;
	if Oct__2015 ne . then;
		year = '2015';
		month = 'October   ';
		Jobs = Oct__2015;
		output;
	if Nov__2015 ne . then;
		year = '2015';
		month = 'November  ';
		Jobs = Nov__2015;
		output;
	if Dec__2015 ne . then;
		year = '2015';
		month = 'December  ';
		Jobs = Dec__2015;
		output;
	if Jan__2016 ne . then;
		year = '2016';
		month = 'January   ';
		Jobs = Jan__2016;
		output;
	if Feb__2016 ne . then;
		year = '2016';
		month = 'February  ';
		Jobs = Feb__2016;
		output;
	if Mar__2016 ne . then;
		year = '2016';
		month = 'March     ';
		Jobs = Mar__2016;
		output;
	if Apr__2016 ne . then;
		year = '2016';
		month = 'April     ';
		Jobs = Apr__2016;
		output;
	if May_2016 ne . then;
		year = '2016';
		month = 'May       ';
		Jobs = May_2016;
		output;
	if June_2016 ne . then;
		year = '2016';
		month = 'June      ';
		Jobs = June_2016;
		output;
	if July_2016 ne . then;
		year = '2016';
		month = 'July      ';
		Jobs = July_2016;
		output;
	if Aug__2016 ne . then;
		year = '2016';
		month = 'August    ';
		Jobs = Aug__2016;
		output;
	keep industry state month year jobs;
run;

* 3) Create 6 data sets from the bls data;
data 
	large (keep=industry state average_jobs) 
	medium (keep=industry state average_jobs) 
	small (keep=industry state average_jobs) 
	government (keep=state average_jobs market_size)
	goods (keep=industry state average_jobs market_size)
	services (keep=industry state average_jobs market_size);
	set datadb.bls_jobs1516;
	* b) fix name;
	if industry = 'TRADE, TRANSPORTATION, AND UITLITIES' then do ;
		industry = 'TRADE, TRANSPORTATION, AND UTILITIES';
	end;
	* c) compute average;
    average_jobs = sum(of Aug__2015--Aug__2016)/13;
	format average_jobs 8.1;
	label average_jobs = 'Average Jobs' market_size = 'Market Size';
	* d) do not process missing values;
	if missing(average_jobs) then delete;
	* e) Separate the 3 datasets based on market size;
	if average_jobs > 1000 then do;
		market_size = 'Large';
		output large;
	end;
	else if 100 <= average_jobs <= 1000 then do;
		market_size = 'Med.';
		output medium;
	end;
	else do; 
		market_size = 'Small';
		output small;
	end;
	* f) Use select statement to create 3 more data sets;
	select (industry);
		when ('GOVERNMENT') do;
			output government ; 
		end;
		when ('CONSTRUCTION', 'MANUFACTURING') do;
			output goods; 
		end;
		otherwise do;
			output services; 
		end;
	end;
run;

* 4) Setup pdf;
ods pdf file=outpdf bookmarkgen=yes bookmarklist=hide;

* 5) Print first 50 and last 50 from step 2;

title '5a - First 50 Observations from Monthly Jobs Data Set';

proc print data=monthly_jobs (obs=50) noobs;
	var industry state month year jobs;
run;

title '5b - Last 50 Observations from Monthly Jobs Data Set';

proc print data=monthly_jobs (firstobs=5463 obs=5512) noobs;	
	var industry state month year jobs;
run;

* 6) Print observations from 3) data sets;

* 6a) Print 30 obs from small;
title '6a - First 30 Observations of Small Markets';
proc print data=small (obs=30) label;
run;

* 6b) Print 30 obs from medium;
title '6b - First 30 Observations of Medium Markets';
proc print data=medium (obs=30) label;
run;

* 6c) Print all obs from large;
title '6c - Large Markets';
proc print data=large label;
run;

* 6d) Print 30 obs beginning at ob 75 from goods data set, no obs numbers;
title '6d - Selected Observations from Goods Industry';
proc print data=goods (firstobs=75 obs=105) label noobs;
run;

* 6e) Print 30 obs from small market in services data set;
title '6e - Small Markets in the Services Industry';
proc print data=services (obs=30) label;
	where market_size = 'Small';
run;

* 6f) Print all obsservations from the government data set;
title '6f - Government Industry';
proc print data=government label;
run;

* 7) Datasets in work library;
title '7 - Data Sets in WORK Library';
proc print data=sashelp.vtable label noobs;
	where libname = 'WORK';
	var libname memname crdate nobs nvar;
run;

ods pdf close;

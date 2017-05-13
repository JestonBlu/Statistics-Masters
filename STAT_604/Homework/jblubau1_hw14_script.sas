/**********************************************************************************
 Program Name: jblubau1_hw14_script
 Date Created: 11/27/2016
 Author: Joseph Blubaugh
 Purpose: Homework Assignment 14
*********************************************************************************** */

libname datadb 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials' access=readonly;
libname output 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Data';

filename outpdf 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Homework\jblubau1_hw14_output.pdf';

* 1) Reference the file with a fileref;
filename school 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials\OKSchools.csv';

* 2) Set up page in landscape layout. Date is to only be displayed on the final section of the output;
options nodate number dtreset orientation=landscape pageno=2;
ods pdf file=outpdf contents=no startpage=yes;

*3) create the format function for the division of each school;
proc format;
	value division
		1251 - high = '6A'
		721 - 1250 = '5A'
		375 - 720 = '4A'
		181 - 374 = '3A'
		107 - 180 = '2A'
		70 - 106 = 'A'
		0 - 69 = 'B'
		. = 'Non-HS';
* 4) create the format function for the size of class for each school;
	value clsize
		. = 'Unknown'
		0 -< 10 = 'Very Small'
		10 -< 14 = 'Small'
		14 -< 18 = 'Medium'
		18 -< 22 = 'Large'
		22 - high = 'Very Large';
run;

* 5) Import School;
data schools;
	infile school dlm=',' firstobs=2 DSD;
	input School: $50. LocCity: $50. MailCity: $50. County: $50.
	Teachers Grade7 Grade8 Grade9 Grade10 Grade11 Grade12
	Ungraded PreTotal ElemTotal HSTotal STRatio;
run;

* 6) Print the first 30 obs;
proc print data=schools (obs=30) noobs;
	title Oklahoma School Analysis;
	title2 Partial Listing;
	footnote Based on NCES Data;
run;

* 7) Create frequency table using temporary labels created in step 4;
proc freq data=schools;
	tables STRatio / nocum missing;
	format STRatio clsize.;
	label STRatio="Class Size";
	title2 Distribution of Class Sizes Based on Student/Teacher Ratio;
run;


* 8) Use summary procedure to create an average STRatio by division;
proc summary data=schools missing;
	var STRatio;
	class HSTotal;
	format HSTotal division.;
	output out=sum1 n=Schools mean=Ratio;
run;

* 9) Print the summary table;
options date number;
proc print data=sum1 noobs;
	where _TYPE_ = 1;
	var HSTotal Schools Ratio;
	label HSTotal = 'Division';
	format Ratio 3.1;
	title2;
	title3 Average Student-Teacher Ratio by School Division;
run;

* 10) Housekeeping;
title;
title2;
title3;
footnote;

ods pdf close;

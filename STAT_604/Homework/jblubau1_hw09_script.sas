/**********************************************************************************
 Program Name: jblubau1_hw09_script
 Date Created: 10/16/2016
 Author: Joseph Blubaugh
 Purpose: Homework Assignment 9
*********************************************************************************** */

libname datadb 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials' access=readonly;
libname output 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Data';

* 3) Step output file name;
filename outpdf 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Homework\jblubau1_hw09_output.pdf';

* 4) Read in data into permanent library;
data output.bls;
	set datadb.tabled1x2016;
	* a) Get rid of blank rows;
	where state is not null;
	* b) Relabel months;
	label Aug__2015 = 'August 2015'
		  Sept__2015 = 'September 2015'
		  Oct__2015 = 'Octoboer 2015'
		  Nov__2015 = 'November 2015'
		  Dec__2015 = 'December 2015'
		  Jan__2016 = 'January 2016'
		  Feb__2016 = 'February 2016'
		  Mar__2016 = 'March 2016'
		  Apr__2016 = 'April 2016'
		  May_2016 = 'May 2016'
		  June_2016 = 'June 2016'
		  July_2016 = 'July 2016'
		  Aug__2016 = 'August 2016'
		  report_date = 'Report Date'
		  annual_change = 'Annual Change';
	* c) Create Report Date Column;
	report_date = '08oct2016'd;
	format report_date MMDDYY10.
		   annual_change percent8.1;
	* d) Create percent change Aug15 to Aug16;
	annual_change = (Aug__2016 - Aug__2015)/Aug__2015;
run;

* 5) Create a subset where year over year chnages are > 10%;
data bigchange;
	set output.bls;
	where (annual_change >= .1 or annual_change < -.1) and annual_change is not missing;
	keep industry state aug__2015 aug__2016 report_date annual_change;
run;

* 6) Create subset where jobs in Aug16 are greater than Aug15;
data growth;
	set output.bls;
	drop Aug__2015 Sept__2015 Oct__2015 Nov__2015 Dec__2015 report_date annual_change;
	where (Aug__2016 - July_2016) >= 1;
run;

* 7) Create subset of August15/16 for services;
data services;
	set output.bls;
	keep Industry State Aug__2015 Aug__2016 annual_change report_date;
	where annual_change is not null and industry like '%SERVICES%';
	format Aug__2015 Aug__2016 comma8.;
run;

* 8) Create subset of southern states;
data southern;
	set output.bls;
	where (state in ('Texas' 'Oklahoma' 'Arkansas' 'Louisiana' 'Mississippi' 'Kentucky' 
					'Florida' 'Georgia' 'South Carolina' 'North Carolina' 'Virginia') 
		  or state like 'Alabama%' 
		  or state like 'Tennessee%' 
          or state like 'District of Columbia%')
		  and Industry ne 'GOVERNMENT';
	drop Aug__2015 Sept__2015 Oct__2015 Nov__2015 Dec__2015 report_date;
run;

* 9) Create pdf output with no bookmarks;
ods pdf file=outpdf bookmarkgen=no startpage=never;

* 10) Print descriptor portion of bls;
proc contents data=output.bls nods;
run;

* 11) Print the contents of the work directory;
proc contents data=work._all_ nods;
run;

* 12) Print data portion of big change dataset;
proc print data=bigchange noobs label;
	var /*report_date */ annual_change state industry aug__2016 aug__2015;
run;

* 13) Print Growth datset;
proc print data=growth noobs label;
run;

proc print data=services label;
	var state aug__2015 aug__2016 annual_change industry report_date;
run;

proc print data=southern noobs label;
run;

ods pdf close;

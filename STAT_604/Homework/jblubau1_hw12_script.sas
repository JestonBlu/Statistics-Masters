/**********************************************************************************
 Program Name: jblubau1_hw11_script
 Date Created: 11/6/2016
 Author: Joseph Blubaugh
 Purpose: Homework Assignment 12
*********************************************************************************** */

libname datadb 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials' access=readonly;
libname output 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Data';

filename outpdf 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Homework\jblubau1_hw12_output.pdf';

* 2) Create a narrow dataset of the scholarship and fund code;
data scholar(keep=student_id fund_code i);
	set datadb.scholarships (keep=student_id fund1-fund10);
	array fund{10} fund1-fund10;
	do i=1 to 10;
		if fund{i} ne . then do;
		fund_code = fund{i};
		output;
		end;
	end;
	where student_id is not missing;
run;

* 3) Sort the dataset;
proc sort data=scholar;
	by fund_code;
run;

* 4) Create a sorted dataset of the fund data;
proc sort data=datadb.fund_data out=funds;
	by fund_code;
run;

* 5) Match merge scholar with funds;
data together(where=(student_id is not missing));
	merge funds scholar;
	by fund_code;
	drop fund_name;
run;

* 6) Transform data into a wide data set, first need to sort;
proc sort data=together;
	by student_id i;
run;

proc transpose data=together out=together_wide(drop=_name_ _label_) prefix=fund_type;
	by student_id;
	var category;
	id i;
run;

* 7) Merge fund categories back with the original scholarship data;
data student_funds(drop=i);
	merge datadb.scholarships together_wide;
	by student_id;
	array fund{10} fund_type1-fund_type10;
	array amount{10} amount1-amount10;
	do i=1 to 10;
		if fund{i} = 'Internal' then do;
			internal = sum(internal, amount{i});
		end;
		if fund{i} = 'Athletic' then do;
			athletic = sum(athletic, amount{i});
		end;
		total = sum(of amount{*});
	end;
	if internal = . then internal = 0;
	if athletic = . then athletic = 0;
	label internal = 'Internal Scholarships'
	      athletic = 'Athletic Scholarships'
		  total = 'Total Aid';
run;

* 8) Print the output summaries;
ods pdf file=outpdf;

* special select to match out instructors output;
ods select Attributes EngineHost Position;

proc contents data=student_funds position;
run;

* close special select ;
ods select default;

proc print data=student_funds label noobs;
	var student_id name major internal athletic total;
run;

ods pdf close;

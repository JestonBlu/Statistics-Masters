/**********************************************************************************
 Program Name: jblubau1_hw08_script
 Date Created: 10/9/2016
 Author: Joseph Blubaugh
 Purpose: Homework Assignment 8
*********************************************************************************** */

libname orion 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials\SAS 1\PRG1_Data_and_Programs' access=readonly;
libname output 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Data';

*1) Open p103e02;
/* data work.donations;
   infile 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials\SAS 1\PRG1_Data_and_Programs\donation.dat';
   input Employee_ID Qtr1 Qtr2 Qtr3 Qtr4;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
run;

*proc print data=work.donations;

*2) Save file under different name;
*3) Created header block at the beginning of the script;
*4) Creted two librefs between the header and the first step;
*5) Add the full path to the file location in step 1;
*6) Add single character to comment out the proc print line;
*7) Import the data set into the output directory;
data output.donations;
   infile 'C:\Users\Joseph\Projects\learning\Statistics\STAT_604\Materials\SAS 1\PRG1_Data_and_Programs\donation.dat';
   input Employee_ID Qtr1 Qtr2 Qtr3 Qtr4;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
run;
*/

*8) Add ods pdf output;
ods pdf file='jblubau1_hw08_output_b.pdf' style=Ocean bookmarkgen=no;

*9) Add proc contents step;
proc contents data=output.donations;
run;

*10) Display contents of work library;
proc contents data=work._all_;
run;

*11) Show contents of orion library with no data;
proc contents data=orion._all_ nods;
run;

*12) Close pdf;
ods pdf close;

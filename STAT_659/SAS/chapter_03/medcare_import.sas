/* Medical Care Example: P. 193 Tutz
*/

proc import out=sasuser.medcare1
     datafile="medcare.txt"
     dbms=dlm;
     getnames=yes;
     datarow=2;
run;

proc print; run;

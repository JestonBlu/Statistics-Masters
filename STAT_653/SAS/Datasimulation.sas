data simulationpopn;
input mean std n;
pop_id=_n_;
datalines;
4.999 3.916 21
7.224 3.564 24
7.760 5.460 21
5.682 4.147 23
;
run;
proc print;
run; 
data simulationpopn;
set simulationpopn;
do i=1 to n;
y=mean+rannor(0)*std;
output;
end;
run;
proc print;
run;

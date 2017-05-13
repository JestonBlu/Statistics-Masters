data twowayfactorial;
input drug disease$ mean std n;
cards;
1 A 120 0.84 10
1 B 160 1.47 8
1 C 125 1.12 11
2 A 135 0.84 11
2 B 150 0.85 10
2 C 125 1.02 9
3 A 140 0.63 10
3 B 140 0.54 10
3 C 125 0.77 10
4 A 150 1.07 8
4 B 130 0.77 10
4 C 125 0.88 10
;
run;
data simulatetwoway;
set twowayfactorial;
do k=1 to n;
y=mean+std*rannor(0);
output;
end;
run;
proc print;
run;

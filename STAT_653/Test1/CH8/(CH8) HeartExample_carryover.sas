data heart;
 input patient sequence $ visit basehr basefev1 hr1h fev11h 
        drug $ cop cob coa;
 changehr = hr1h - basehr;
 datalines;
201        B         2        92      2.14       84    2.36     p      0     0     0
201        B         3        92      2.30      104    3.41     c      1     0     0
201        B         4        68      2.46       72    2.68     a      0     1     0
202        E         2        54      2.91       64    3.92     c      0     0     0
202        E         3        64      3.37       54    3.03     p      0     1     0
202        E         4        80      3.50       72    3.95     a      1     0     0
203        F         2        84      1.88       82    1.99     p      0     0     0
203        F         3        84      2.08       74    2.52     a      1     0     0
203        F         4        88      1.96       84    2.28     c      0     0     0
204        D         2        72      3.44       72    4.08     a      0     0     1
204        D         3        78      3.02       98    4.43     c      0     0     1
204        D         4        96      3.10       80    3.24     p      0     1     0
205        C         2        80      3.26       72    4.55     c      0     0     0
205        C         3        96      2.80       64    4.09     a      0     1     0
205        C         4        72      2.91       60    3.35     p      0     0     1
206        B         2        68      2.29       62    3.04     p      0     0     0
206        B         3        80      2.29       88    4.25     c      1     0     0
206        B         4        64      2.36       78    3.79     a      0     1     0
207        A         2       100      1.77       68    3.82     a      0     0     0
207        A         3        78      2.20       80    2.46     p      0     0     1
207        A         4       106      1.96      100    3.00     c      1     0     0
208        A         2        60      2.64       56    3.67     a      0     0     0
208        A         3        60      2.70       56    2.85     p      0     0     1
208        A         4        72      2.70       60    4.06     c      1     0     0
209        D         2        88      2.30       84    4.12     a      0     0     0
209        D         3       102      2.50       84    4.37     c      0     0     1
209        D         4        84      2.25       86    3.45     p      0     1     0
210        C         2        92      2.35       80    2.83     c      0     0     0
210        C         3        76      2.27       64    2.77     a      0     1     0
210        C         4        64      2.48       60    2.56     p      0     0     1
211        E         2        88      2.34       78    4.06     c      0     0     0
211        E         3        86      2.12       76    2.19     p      0     1     0
211        E         4        78      2.44       68    3.77     a      1     0     0
212        F         2       102      2.37       88    2.14     p      0     0     0
212        F         3        98      2.04       86    2.00     a      1     0     0
212        F         4        88      2.20       86    2.82     c      0     0     1
214        D         2        84      2.77       80    3.36     a      0     0     0
214        D         3        78      2.78       78    3.18     c      0     0     1
214        D         4        82      2.73       76    2.57     p      0     1     0
215        E         2       104      3.43       84    4.39     c      0     0     0
215        E         3        92      3.15       84    2.90     p      0     1     0
215        E         4        76      2.96       72    4.31     a      1     0     0
216        A         2        92      3.11       64    3.88     a      0     0     0
216        A         3        72      2.52       68    3.02     p      0     0     1
216        A         4        80      3.07       88    3.90     c      1     0     0
217        B         2        92      1.48       84    1.35     p      0     0     0
217        B         3        96      1.21       96    2.31     c      1     0     0
217        B         4        88      1.47       84    1.97     a      0     1     0
218        A         2        72      2.73       76    2.91     a      0     0     0
218        A         3        88      2.52       84    2.61     p      0     0     1
218        A         4        92      2.60      100    3.19     c      1     0     0
219        E         2        72      2.61       80    3.54     c      0     0     0
219        E         3        84      2.90       78    2.91     p      0     1     0
219        E         4        80      3.25       88    3.59     a      1     0     0
220        F         2        80      2.83       78    2.78     p      0     0     0
220        F         3        84      2.73       72    2.88     a      1     0     0
220        F         4        76      2.48       72    2.99     c      0     0     1
221        B         2        72      3.50       68    3.81     p      0     0     0
221        B         3        80      3.73       60    4.37     c      1     0     0
221        B         4        68      3.30       60    4.04     a      0     1     0
222        C         2        88      2.54       88    3.26     c      0     0     0
222        C         3        96      2.85       96    3.38     a      0     1     0
222        C         4        82      2.86       80    3.06     p      0     0     1
223        C         2        88      2.83       80    4.72     c      0     0     0
223        C         3        72      2.72       76    4.49     a      0     1     0
223        C         4        96      2.42       80    2.87     p      0     0     1
224        F         2        88      3.66       64    3.98     p      0     0     0
224        F         3        80      3.68       80    4.17     a      1     0     0
224        F         4        88      3.47       80    4.27     c      0     0     1
232        D         2        78      2.49       68    3.73     a      0     0     0
232        D         3        88      2.79       84    4.10     c      0     0     1
232        D         4        80      2.88       80    3.04     p      0     1     0
;
run;
proc print data=heart; 
   var patient sequence visit drug changehr;
run;
/*** without carryover***/
proc mixed data=heart; 
   class patient sequence visit drug;
   model changehr = sequence visit drug / ddfm=kr;
   random patient;
   lsmeans drug / diff=control('p') adjust=dunnett adjdfe=row;
run; 
 /*** create the carryover factor***/
data new;
	set heart;
	if sequence="B" and visit=2 then priortrt="o";
	if sequence="B" and visit=3 then priortrt="p";
	if sequence="B" and visit=4 then priortrt="c";
	if sequence="E" and visit=2 then priortrt="o";
	if sequence="E" and visit=3 then priortrt="c";
	if sequence="E" and visit=4 then priortrt="p";
	if sequence="F" and visit=2 then priortrt="o";
	if sequence="F" and visit=3 then priortrt="p";
	if sequence="F" and visit=4 then priortrt="a";
	if sequence="D" and visit=2 then priortrt="o";
	if sequence="D" and visit=3 then priortrt="a";
	if sequence="D" and visit=4 then priortrt="c";
	if sequence="C" and visit=2 then priortrt="o";
	if sequence="C" and visit=3 then priortrt="c";
	if sequence="C" and visit=4 then priortrt="a";
	if sequence="A" and visit=2 then priortrt="o";
	if sequence="A" and visit=3 then priortrt="a";
	if sequence="A" and visit=4 then priortrt="p";
run;
/*** with carryover***/
proc mixed data=new; 
   class patient sequence visit drug priortrt;
   model changehr = sequence visit drug priortrt/ ddfm=kr;
   random patient;
   lsmeans drug priortrt/ pdiff;
   estimate "carry a-p" priortrt 1 0 0 -1;
   estimate "carry a-c" priortrt 1 -1 0 0;
   estimate "carry c-p" priortrt 0 1 0 -1;
   estimate "a-p" drug 1 0 -1;
   estimate "a-c" drug 1 -1 0;
   estimate "c-p" drug 0 1 -1;
run;  


*The following program will calculate the ;
*General Cochran-Mantel-Haenszel Statistic for the situation;
*where there is a third variable over which the original;
*counts were aggregated.;
*Age refers to the age of the respondent;
*Smoker refers to whether or not respondent was a smoker when survived;
*Surv refers to the Survival Status of the respondent 20 years later;

OPTIONS PS=55 LS=75 NOCENTER NODATE;
DATA ByAge;
INPUT Age $ Smoker $ Surv $ CNT @@;
CARDS;
18-34 Y D 5    18-34 Y A 174
18-34 N D 6    18-34 N A 213
35-54 Y D 41   35-54 Y A 198
35-54 N D 19   35-54 N A 180
55-64 Y D 51   55-64 Y A  64
55-64 N D 40   55-64 N A  81
65+ Y D 42   65+ Y A   7
65+ N D 165  65+ N A  28
RUN;
PROC FREQ ORDER=DATA;
TABLES SMOKER*SURV/EXPECTED CELLCHI2 CHISQ;
WEIGHT CNT;
EXACT CHISQ;
RUN;
PROC FREQ ORDER=DATA;
TABLES AGE*SMOKER*SURV/CMH;
WEIGHT CNT;
RUN;


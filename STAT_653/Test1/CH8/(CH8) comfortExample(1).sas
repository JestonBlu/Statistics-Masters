data comfort;
   input person temperature chamber gender $ score;
   datalines;
1 65 1 male 5
2 65 1 male 4
1 65 1 female 1
2 65 1 female 2
1 65 2 male 5
2 65 2 male 4
1 65 2 female 5
2 65 2 female 5
1 65 3 male 4
2 65 3 male 2
1 65 3 female 1
2 65 3 female 3
1 70 4 male 8
2 70 4 male 8
1 70 4 female 10
2 70 4 female 7
1 70 5 male 6
2 70 5 male 3
1 70 5 female 8
2 70 5 female 8
1 70 6 male 5
2 70 6 male 7
1 70 6 female 8
2 70 6 female 8
1 75 7 male 12
2 75 7 male 8
1 75 7 female 11
2 75 7 female 13
1 75 8 male 8
2 75 8 male 7
1 75 8 female 8
2 75 8 female 8
1 75 9 male 6
2 75 9 male 6
1 75 9 female 6
2 75 9 female 7
;
run;
proc mixed data=comfort cl  method=type3;
   class temperature gender chamber;
   model score = temperature gender temperature*gender / ddfm=kr;
   random chamber(temperature);
   lsmeans temperature*gender / diff;
   lsmeans temperature*gender / slice=gender slice=temperature;
   run;                                  

data thickness;
   input source lot wafer position thickness;
   datalines;
1      1       1        1     2006
1      1       1        2     1999
1      1       1        3     2007
1      1       2        1     1980
1      1       2        2     1988
1      1       2        3     1982
1      1       3        1     2000
1      1       3        2     1998
1      1       3        3     2007
1      2       1        1     1991
1      2       1        2     1990
1      2       1        3     1988
1      2       2        1     1987
1      2       2        2     1989
1      2       2        3     1988
1      2       3        1     1985
1      2       3        2     1983
1      2       3        3     1989
1      3       1        1     2000
1      3       1        2     2004
1      3       1        3     2004
1      3       2        1     2001
1      3       2        2     1996
1      3       2        3     2004
1      3       3        1     1999
1      3       3        2     2000
1      3       3        3     2002
1      4       1        1     1997
1      4       1        2     1994
1      4       1        3     1996
1      4       2        1     1996
1      4       2        2     2000
1      4       2        3     2002
1      4       3        1     1987
1      4       3        2     1990
1      4       3        3     1995
2      1       1        1     2013
2      1       1        2     2004
2      1       1        3     2009
2      1       2        1     2023
2      1       2        2     2018
2      1       2        3     2010
2      1       3        1     2020
2      1       3        2     2023
2      1       3        3     2015
2      2       1        1     2032
2      2       1        2     2036
2      2       1        3     2030
2      2       2        1     2018
2      2       2        2     2022
2      2       2        3     2026
2      2       3        1     2009
2      2       3        2     2010
2      2       3        3     2011
2      3       1        1     1984
2      3       1        2     1993
2      3       1        3     1993
2      3       2        1     1992
2      3       2        2     1992
2      3       2        3     1990
2      3       3        1     1996
2      3       3        2     1993
2      3       3        3     1987
2      4       1        1     1996
2      4       1        2     1989
2      4       1        3     1996
2      4       2        1     1997
2      4       2        2     1993
2      4       2        3     1996
2      4       3        1     1990
2      4       3        2     1989
2      4       3        3     1992
;
run;
proc mixed data=thickness cl;
   class source lot wafer;
   model thickness = source / ddfm=kr;
   random lot(source) wafer(lot source);
   *random int wafer / subject=lot(source);
run;                                  

proc mixed data=thickness method=type3;
   class source lot wafer;
   model thickness = source / ddfm=kr;
   random lot(source) wafer(lot source);
run;  

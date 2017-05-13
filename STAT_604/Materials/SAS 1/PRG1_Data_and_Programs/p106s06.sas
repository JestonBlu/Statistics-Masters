proc export data=orion.mnth7_2007 
            outfile='mnth7.xls' 
            dbms=excel replace;
run;

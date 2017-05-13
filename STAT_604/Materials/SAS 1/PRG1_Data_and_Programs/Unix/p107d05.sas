data contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile 'phone2.csv' dsd;
   input Name $ Phone $ Mobile $;
run;

proc print data=contacts noobs;
run;

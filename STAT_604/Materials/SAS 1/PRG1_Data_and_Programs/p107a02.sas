data contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile 'phone.csv' dsd;
   input Name $ Phone $ Mobile $;
run;

proc print data=contacts noobs;
run;

data contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile 'phone2.csv' dlm=',';
   input Name $ Phone $ Mobile $;
run;

proc print data=contacts noobs;
run;

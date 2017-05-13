data work.QtrDonation;
   length IDNum $ 6;
   infile 'donation.dat';
   input IDNum $ Qtr1 Qtr2 Qtr3 Qtr4;
run;

proc print data=work.QtrDonation;
run;

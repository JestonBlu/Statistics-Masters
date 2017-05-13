proc power; 
  onesamplemeans test=t 
  nullmean = 9.5 
  mean  = 8.9
  stddev = 0.5
  power = .95
  ntotal = . ; 
run;
proc power; 
  onesamplemeans test=t 
  nullmean = 9.5 
  mean  = 10.1
  stddev = 0.5
  power = .95
  ntotal = . ; 
run;
proc power; 
  onesamplemeans test=t 
  nullmean = 9.5 
  mean  = 10.1
  stddev = 0.5
  power = .
  ntotal = 12 ; 
run;
proc power; 
  onesamplemeans test=t 
  nullmean = 9.5 
  mean  = 8.9
  stddev = 0.5
  power = .
  ntotal = 12 ; 
run;

********** Create Data **********;
data EmpsAUUS;
   input First $ Gender $ Country $;
   datalines;
Togar	M	AU
Kylie	F	AU
Stacey	F	US
Gloria	F	US
James	M	US
;
run;

data PhoneO;
   input Country $ Phone $15.;
   datalines;
AU +61(2)5555-1500
AU +61(2)5555-1600
AU +61(2)5555-1700
US +1(305)555-1500
US +1(305)555-1600
;
run;

********** Many-to-Many (Self-Study) **********;
data EmpsOfc;
   merge EmpsAUUS PhoneO;
   by Country;
run;

proc print data=EmpsOfc;
run;

proc sql;
   create table EmpsOfc as
   select First, Gender, PhoneO.Country, Phone
   from EmpsAUUS, PhoneO
   where EmpsAUUS.Country=PhoneO.Country;
quit;

proc print data=EmpsOfc;
run;

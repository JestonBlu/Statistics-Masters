options nodate nocenter ls=90 ps=55;
data tornado;                                                                                                                           
input Year Month_number Month $ season Killer_tornadoes Tornadoes Deaths;                                                                             
cards;                                                                                                                                  
1996 1 January 1 1 35 1                                                                                                                 
1996 2 February 2 1 14 1                                                                                                                
1996 3 March 3 2 71 6                                                                                                                   
1996 4 April 4 4 177 12                                                                                                                 
1996 5 May 5 1 235 1                                                                                                                    
1996 6 June 6 0 128 0                                                                                                                   
1996 7 July 6 1 202 1                                                                                                                   
1996 8 August 6 0 72 0                                                                                                                  
1996 9 September 6 0 101 0                                                                                                              
1996 10 October 6 0 68 0                                                                                                                
1996 11 November 6 2 55 2                                                                                                               
1996 12 December 6 1 15 1                                                                                                               
1997 1 January 1 2 50 2                                                                                                                 
1997 2 February 2 1 23 1                                                                                                                
1997 3 March 3 9 102 28                                                                                                                 
1997 4 April 4 1 114 1                                                                                                                  
1997 5 May 5 3 225 29                                                                                                                   
1997 6 June 6 0 193 0                                                                                                                   
1997 7 July 6 4 188 4                                                                                                                   
1997 8 August 6 1 84 1                                                                                                                  
1997 9 September 6 1 32 1                                                                                                               
1997 10 October 6 0 100 0                                                                                                               
1997 11 November 6 0 25 0                                                                                                               
1997 12 December 6 0 12 0                                                                                                               
1998 1 January 1 0 47 0                                                                                                                 
1998 2 February 2 4 72 42                                                                                                               
1998 3 March 3 4 72 16                                                                                                                  
1998 4 April 4 13 182 55                                                                                                                
1998 5 May 5 5 312 10                                                                                                                   
1998 6 June 6 2 376 3                                                                                                                   
1998 7 July 6 0 80 0                                                                                                                    
1998 8 August 6 0 61 0                                                                                                                  
1998 9 September 6 2 104 2                                                                                                              
1998 10 October 6 2 86 2                                                                                                                
1998 11 November 6 0 26 0                                                                                                               
1998 12 December 6 0 6 0                                                                                                                
1999 1 January 1 9 212 18                                                                                                               
1999 2 February 2 0 22 0                                                                                                                
1999 3 March 3 1 56 1                                                                                                                   
1999 4 April 4 6 176 15                                                                                                                 
1999 5 May 5 10 311 53                                                                                                                  
1999 6 June 6 3 289 4                                                                                                                   
1999 7 July 6 0 100 0                                                                                                                   
1999 8 August 6 1 79 1                                                                                                                  
1999 9 September 6 0 56 0                                                                                                               
1999 10 October 6 0 18 0                                                                                                                
1999 11 November 6 0 9 0                                                                                                                
1999 12 December 6 1 15 2                                                                                                               

run;
                                                                                                                          
title 'Model with Killer tornadoes and Month';
proc genmod data=tornado;
     class month_number;
     model deaths = killer_tornadoes month_number / dist=p link=log;
	 run;

title   'Model with Killer tornadoes and Month including Interaction';     
proc genmod data=tornado;
     class month_number;
     model deaths = killer_tornadoes|month_number / dist=p link=log;
	 run;
title 'Model with Killer tornadoes, Tornadoes, and Month';
 proc genmod data=tornado; class month_number;
         model deaths = killer_tornadoes month_number tornadoes / dist=p link=log; 
		 run;
 title 'Model with Killer tornadoes, Tornadoes, Month, and Year';
proc genmod data=tornado; class month_number year;
         model deaths = killer_tornadoes tornadoes month_number year/ dist=p link=log; 
		 run;
title 'Null Model--Intercept Only'; 
proc genmod data=tornado;
         model deaths = / dist=p link=log;
		 run;
title "saturated model";
		 data new; set tornado; obsno=_n_;
		 proc genmod data=new; class obsno;
		 model deaths=obsno/dist=p link=log;
output p=pred;
proc print;
run;




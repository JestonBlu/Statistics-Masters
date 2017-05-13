ods html; ods graphics on;
proc factex; 
      factors A B C D E F G H; 
      model resolution=maximum; 
      size design=16;                     
      examine design confounding aliasing(4);       
   run;
ods graphics off; ods html close;

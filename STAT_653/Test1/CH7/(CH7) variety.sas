proc import out=test
  datafile='\\sf1\Users\faculty\derya\My Documents\Stat653\Spring17\LectureDatasets\variety.jmp'
  /* notice that the address I typed in quotes is the directory for the file in my computer */
  dbms=JMP replace;
  /* if the file ise excel or csv, use excel or csv instead of jmp above writing dbms */
  run;
proc mixed data=test covtest;
   class Block Variety Phosphorus;                                                 
   model Yield=Block Variety Phosphorus Variety*Phosphorus/ ddfm=kr;    
   random Block*Variety;
   /*notice that Block*Variety is random (wholeplot error) and Block is fixed for this example.  When Block is also random (selected from population),
   it should appear here instead of the model.*/
run;     

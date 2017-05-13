proc import out=test
  datafile='\\sf1\Users\faculty\derya\My Documents\Stat653\Spring17\LectureDatasets\Pulserate_CRD.jmp'
  /* notice that the address I typed in quotes is the directory for the file in my computer */
  dbms=JMP replace;
  /* if the file ise excel or csv, use excel or csv instead of jmp above writing dbms */
  run;
proc glm data=test; 
class Task;
model Pulserate=Task;
estimate "task3 mean" intercept 1 Task 0 0 1 0 0 0;
contrast "task4 versus task5" Task 0 0 0 1 -1 0;
estimate "task1 versus task2to6" Task 5 -1 -1 -1 -1 -1;
estimate "task1 versus task2to6" Task 5 -1 -1 -1 -1 -1 /divisor=5;
contrast "task1 versus task2to4" Task 3 -1 -1 -1 0 0;
contrast "task1 versus task3to6" Task 4 0 -1 -1 -1 -1;
means Task / hovtest=bf lsd tukey dunnett('2');
run;

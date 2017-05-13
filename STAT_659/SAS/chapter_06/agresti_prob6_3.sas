options nocenter nodate ls=100 ps=60;
data gator;
input lake $ length $ choice $ count@@;
cards;
H S F 23 
H S I 4 
H S R 2 
H S B 2 
H S O 8
H L F 7 
H L I 0 
H L R 1 
H L B 3 
H L O 5
O S F 5 
O S I 11 
O S R 1 
O S B 0 
O S O 3
O L F 13 
O L I 8 
O L R 6 
O L B 1 
O L O 0
T S F 5 
T S I 11 
T S R 2 
T S B 1 
T S O 5
T L F 8 
T L I 7 
T L R 6 
T L B 3 
T L O 5
G S F 16 
G S I 19 
G S R 1 
G S B 2 
G S O 3
G L F 17 
G L I 1 
G L R 0 
G L B 1 
G L O 3
;


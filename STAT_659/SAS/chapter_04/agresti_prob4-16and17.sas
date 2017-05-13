data personality;
input EI $ SN $ TF $ JP $ yes no;
total=yes+no;
cards;
E S T J 10 67
E S T P 8 34
E S F J 5 101
E S F P 7 72
E N T J 3 20
E N T P 2 16
E N F J 4 27
E N F P 15 65
I S T J 17 123
I S T P 3 49
I S F J 6 132
I S F P 4 102
I N T J 1 12
I N T P 5 30
I N F J 1 30
I N F P 6 73
;
proc logistic; classes ei sn tf jp/param=ref;
model yes/total=ei sn tf jp;

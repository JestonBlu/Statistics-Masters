* augmentedFac.sas
ods html; ods graphics on;
OPTION LS=75 PS=55 NOCENTER NODATE;
TITLE 'QUALITATIVE FACTOR WITH A QUANITATIVE FACTOR WITH A 0 LEVEL';
DATA AUGFAC;
INPUT  DOSE $ FUM $ TRT $ Y @@;
LABEL Y='EELWORM COUNT';
CARDS;
0 C  C0    466 0 C C0    219 0 C C0   421 0 C C0   708
1 CK CKD1  256 2 CK CKD2  283 1 CN CND1 398 2 CN CND2 304
1 CM CMD1  386 2 CM CMD2 379 1 CS CSD1 194 2 CS CSD2 372
0 C C0   590 0 C C0    137 0 C C0   356 0 C C0   212
1 CK CKD1  236 2 CK CKD2  142 1 CN CND1 176 2 CN CND2 199
1 CM CMD1  332 2 CM CMD2 308 1 CS CSD1 221 2 CS CSD2 166
0 C C0   505 0 C C0    363 0 C C0   563 0 C C0   338
1 CK CKD1  268 2 CK CKD2  408 1 CN CND1 415 2 CN CND2 365
1 CM CMD1  222 2 CM CMD2 561 1 CS CSD1 433 2 CS CSD2 311
0 C C0   352 0 C C0    254 0 C C0   106 0 C C0   268
1 CK CKD1  132 2 CK CKD2  292 1 CN CND1 454 2 CN CND2 298
1 CM CMD1  114 2 CM CMD2  92 1 CS CSD1  80 2 CS CSD2 281
RUN;

*STEP 1;
TITLE STEP 1: ANALYSIS WITH 2 DOSES PLUS CONTROL;
PROC GLM;
CLASS DOSE;
MODEL Y = DOSE;
RUN;

*STEP 2;
TITLE STEP 2: ANALYSIS AS A 2X4 FACTORIAL WITHOUT CONTROL;
DATA SUBSET; SET AUGFAC; IF DOSE > 0;
IF FUM='CK' THEN FUMPLOT = 1;IF FUM='CM' THEN FUMPLOT = 2;
IF FUM='CN' THEN FUMPLOT =3;IF FUM='CS' THEN FUMPLOT =4;
RUN;
PROC PRINT;
RUN;
PROC GLM DATA=SUBSET;
 CLASS DOSE FUM;
 MODEL   Y = DOSE FUM DOSE*FUM;
RUN;

TITLE  FUM BY DOSE INTERACTION PLOT;
proc glimmix data=SUBSET;
CLASS DOSE FUM;
 MODEL   Y = DOSE FUM DOSE*FUM;
lsmeans DOSE*FUM /  plot = meanplot cl;
RUN;

*STEP 3;
TITLE STEP 3: ANALYSIS AS A CR WITH 9 TREATMENTS;
PROC SORT; BY TRT;

PROC GLM DATA=AUGFAC;
  CLASS TRT;
  MODEL   Y  = TRT;
  LSMEANS TRT/STDERR;
  MEANS TRT/DUNNETT( 'C0');

*                               TRT C CK1 CK2 CM1 CM2 CN1 CN2 CS1 CS2;
CONTRAST 'FUMIGANT MAIN EFFECT' TRT 0  -1  -1  -1  -1   1   1   1   1,
                                TRT 0  -1  -1   1   1   0   0   0   0,
                                TRT 0   0   0   0   0  -1  -1   1   1;

CONTRAST 'BETWEEN DOSE 1 & 2'   TRT 0  -1   1  -1   1  -1   1  -1   1;

CONTRAST 'FUMIGANT*DOSE'        TRT 0   1  -1   1  -1  -1   1  -1   1,
                                TRT 0   1  -1  -1   1   0   0   0   0,
                                TRT 0   0   0   0   0   1  -1  -1   1;

CONTRAST 'FUMIGANT @ DOSE 1'    TRT 0   1   0   1   0  -1   0  -1   0,
                                TRT 0   1   0  -1   0   0   0   0   0,
                                TRT 0   0   0   0   0   1   0  -1   0;

CONTRAST 'FUMIGANT @ DOSE 2'    TRT 0   0   1   0   1   0  -1   0  -1,
                                TRT 0   0   1   0  -1   0   0   0   0,
                                TRT 0   0   0   0   0   0   1   0  -1;

CONTRAST 'BETWEEN DOSES'        TRT -8  1   1   1   1   1   1   1   1,
                                TRT  0  1  -1   1  -1   1  -1   1  -1;
RUN;
ods graphics off; ods html close;

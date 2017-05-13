data washer;
   input brand $ store $ sales @@;
   datalines;
A depart 150 A depart 137 A depart 129 A depart 135
A region 180 A region 150 A region 136 A region 144
A nation 198 A nation 171 A nation 159 A nation 151
B depart 175 B depart 183 B depart 178 B depart 189
B region 182 B region 174 B region 168 B region 181
B nation 179 B nation 157 B nation 144 B nation 165
C depart 180 C depart 163 C depart 150 C depart 159
C region 186 C region 204 C region 201 C region 180
C nation 219 C nation 231 C nation 235 C nation 195
;
run;

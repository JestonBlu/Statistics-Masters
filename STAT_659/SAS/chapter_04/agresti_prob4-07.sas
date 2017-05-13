
title 'Presence of kyphosis';
data kyphosis;
input condition $ age; dummy=0; if condition='kyphosis' then dummy=1;
age2=age*age;
cards;
kyphosis 12
kyphosis 15
kyphosis 42
kyphosis 52
kyphosis 59
kyphosis 73
kyphosis 82
kyphosis 91
kyphosis 96
kyphosis 105
kyphosis 114
kyphosis 120
kyphosis 121
kyphosis 128
kyphosis 130
kyphosis 139
kyphosis 139
kyphosis 157
nokyphosis 1
nokyphosis 1
nokyphosis 2
nokyphosis 8
nokyphosis 11
nokyphosis 18
nokyphosis 22
nokyphosis 31
nokyphosis 37
nokyphosis 61
nokyphosis 72
nokyphosis 81
nokyphosis 97
nokyphosis 112
nokyphosis 118
nokyphosis 127
nokyphosis 131
nokyphosis 140
nokyphosis 151
nokyphosis 159
nokyphosis 177
nokyphosis 206
;


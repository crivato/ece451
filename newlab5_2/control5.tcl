l SR
l SL
h vdd
l gnd
stepsize 1000
vector clock Phi1 Phi2
vector control {ctrl[6:0]}
vector N {N[3:0]}
vector FBEn {FBEn[3:0]}
vector ARdEn {ARdEn[3:0]}
vector WriteEn {WriteEn[3:0]}
vector BRdEn {BRdEn[3:0]}
vector M {M[3:0]}
vector L {L[3:1]} vdd
vector Fi {Fi[3:0]}
vector D {D[3:0]}
w CLOCK control ARdEn BRdEn WriteEn FBEn N L M shl notshl shr notshr D Fi
setvector clock 00
setvector D 0111
s 400
setvector control 0000000
s 400
setvector clock 10
s 1000
setvector clock 00
s 400
setvector control 0110000
s 400
setvector clock 01
s 1000
setvector clock 00
s 400
setvector control 0000000
s 400
setvector clock 10
s 1000
setvector clock 00
s 400
setvector control 0110000
s 400
setvector clock 01
s 1000
setvector clock 00
s 400
setvector control 0000000
s 400
setvector clock 10
s 1000
setvector clock 00
s 400
setvector control 0110000
s 400
setvector clock 01
s 1000
setvector clock 00
s 400
setvector control 0000000
s 400
setvector clock 10
s 1000
setvector clock 00
s 400
setvector control 0110000
s 400

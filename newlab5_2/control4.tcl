l SR
l SL
h vdd
l gnd
stepsize 2000
vector CLOCK Phi1 Phi2
clock CLOCK 00 00 10 10 00 00 01 01
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
setvector D 0111
p
setvector control 0000000
p
p
p
p
setvector control 0110000
p
p
p
p
setvector control 0000000
p
p
p
p
setvector control 0110000
p
p
p
p
setvector control 0000000
p
p
p
p
setvector control 0110000
p
p
p
p
setvector control 0000000
p
p
p
p
setvector control 0110000
p
p
p

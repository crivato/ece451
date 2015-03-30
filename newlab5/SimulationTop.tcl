h vdd
l gnd
stepsize 500
vector CLOCK Phi1 Phi2
clock CLOCK 00 10 00 01
vector control {ctrl[6:0]}
vector L {L[3:1]} vdd
vector M {M[3:0]}
vector N {N[3:0]}
vector ARdEn {ARdEn[3:0]}
vector BRdEn {BRdEn[3:0]}
vector WriteEn {WriteEn[3:0]}
vector FBEn {FBEn[3:0]}
w CLOCK control notshr DSelect zeroSelect shr notshl shl L M N ARdEn BRdEn WriteEn FBEn
setvector control 0000000
p
p
setvector control 0110000
p
p
setvector control 0000100
p
p
setvector control 0010000
p
p
setvector control 0000000
p
p

h vdd
l SL
l SR
h notCin
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
vector R {R[3:0]}
vector S {S[3:0]}
vector RAMIN {RAMIN[3:0]}
vector CTRL_SHIFTER notshl shl notshr shr
vector CTRL_Ri {ARdEn[3:0]} {BRdEn[3:0]} {FBEn[3:0]} {WriteEn[3:0]} {WriteEn[3:0]}
vector CTRL_MUX ASelect zeroSelect BSelect DSelect
w CLOCK control ARdEn BRdEn WriteEn FBEn N L M shl notshl shr notshr D Fi
setvector clock 00
setvector D 0001
s 300
setvector control 0000000
s 300
setvector clock 10
s 1000
setvector clock 00
s 300
setvector control 0110000
s 300
setvector clock 01
s 1000
setvector clock 00
s 300
setvector control 0000000
s 300
setvector clock 10
s 1000
setvector clock 00
s 300
setvector control 0010000
s 300
setvector clock 01
s 1000
setvector clock 00
s 300
setvector control 0000000
s 300
setvector clock 10
s 1000
setvector clock 00
s 300
setvector control 0010000
s 300
setvector clock 01
s 1000
setvector clock 00
s 300
setvector control 0000000
s 300
setvector clock 10
s 1000
setvector clock 00
s 300
setvector control 0010000
s 300
ana Phi1 Phi2 Fiint control CTRL_SHIFTER CTRL_Ri CTRL_MUX L M N notCin D RAMIN R S Fi notCout


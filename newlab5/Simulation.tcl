h vdd
l gnd
stepsize 2000
vector CLOCK Phi1 Phi2
clock CLOCK 00 10 00 01
vector control {ctrl[6:0]}
vector D {D[3:0]}
vector F {F[3:0]}
vector L {L[3:1]} vdd
vector M {M[3:0]}
vector N {N[3:0]}
w CLOCK control F D L M N shl notshl shr notshr
setvector D 0110
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

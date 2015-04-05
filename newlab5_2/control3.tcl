h vdd
l gnd
stepsize 1000
vector CLOCK Phi1 Phi2
clock CLOCK 00 00 10 10 00 00 01 01
vector control {ctrl[6:0]}
vector N {N[3:0]}
vector M {M[3:0]}
vector L {L[3:1]} vdd
vector Fi {Fi[3:0]}
vector D {D[3:0]}
w CLOCK control N L M shl notshl shr notshr D Fi
setvector D 0000
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
setvector D 0101
p
p
p
p
setvector control 0110000
p
p
p
p
setvector control 0000100
p
p
p
p
setvector control 0011000
p
p
p
p
setvector control 0000000
setvector D 0001
p
p
p
p
setvector control 0011100
p
p
p

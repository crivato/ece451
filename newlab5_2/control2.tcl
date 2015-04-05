h vdd
l gnd
stepsize 2000
vector CLOCK Phi1 Phi2
clock CLOCK 00 00 10 10 00 00 01 01
vector control {ctrl[6:0]}
w CLOCK control shl notshl shr notshr
p
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

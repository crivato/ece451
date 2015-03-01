h vdd
l gnd
h notCin
l shl shr
h notshl notshr
l SR SL
stepsize 25
vector CLOCK Phi1 notPhi1 Phi2
vector D {D[3:0]}
vector S {S[3:0]}
vector F {F[3:0]}
vector A {A[3:0]}
vector B {B[3:0]}
vector R {R[3:0]}
vector RAMIN {RAMIN[3:0]}
vector ARdEn {ARdEn[3:0]}
vector BRdEn {BRdEn[3:0]}
vector WriteEn {WriteEn[3:0]}
vector FBEn {FBEn[3:0]}
vector notFBEn {notFBEn[3:0]}
vector L {L[3:0]}
vector M {M[3:0]}
vector N {N[3:0]}
w Phi1 notPhi1 Phi2 D A B
clock CLOCK 010 100 010 011
setvector D 0000
setvector FBEn 1111
setvector notFBEn 0000
setvector WriteEn 0000
setvector ARdEn 0000
setvector BRdEn 0000



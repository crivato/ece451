l gnd; stepsize 50; w notG notP Phi notCi_1 NotCI P Ci_1; stepsize 50; 
vector in notCi_1 notP notG Phi; set vlist {0010 0011 0111 0110 0100 0101 1011 1010 1110 1111 1101 1100}; foreach vec $vlist {setvector in $vec; s}; analyzer notG notP notCi_1 Phi P Ci_1 NotCi


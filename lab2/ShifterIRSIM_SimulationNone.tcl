l gnd; stepsize 100; w shr notshr shl notshl FiPlus1 Fi_1 RAMINi Fi; vector in shl shr Fi; set vlist {000 001 010 011 100 101 110 111}; foreach vec $vlist {setvector in $vec; s}; analyzer shl notshl shr notshr fi ramini fi_1 fiplus1

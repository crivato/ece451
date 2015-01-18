h vdd;l gnd;stepsize 100;w sum !carry bin ain;vector in ain bin;set vlist {00 01 10 11} ;foreach vec $vlist {setvector in $vec ; s}; analyzer ain bin sum !carry

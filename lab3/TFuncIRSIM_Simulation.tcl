l gnd; stepsize 100; vector in X3 X2 X1 X0 S R; w R S X3 X2 X1 X0 Y; for { set i 0} { $i < 0x40 } { incr i } { setvector in 0d$i; s }; ana X3 X2 X1 X0 S R Y

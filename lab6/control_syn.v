
module control ( phi1, phi2, ctrl, L, M, N, ARdEn, BRdEn, WriteEn, FBEn, 
        notFBEn, ASelect, BSelect, DSelect, zeroSelect, shl, notshl, shr, 
        notshr, phi1_1, phi1_2, phi1_3, notphi1_1, notphi1_2, phi2_1 );
  input [6:0] ctrl;
  output [3:0] L;
  output [3:0] M;
  output [3:0] N;
  output [3:0] ARdEn;
  output [3:0] BRdEn;
  output [3:0] WriteEn;
  output [3:0] FBEn;
  output [3:0] notFBEn;
  input phi1, phi2;
  output ASelect, BSelect, DSelect, zeroSelect, shl, notshl, shr, notshr,
         phi1_1, phi1_2, phi1_3, notphi1_1, notphi1_2, phi2_1;
  wire   phi2, notphi1_2, \baddr[0] , \aaddr[0] , N9, N13, n23, n25, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84;
  wire   [2:0] opcode;
  wire   [1:0] waddr;
  assign L[0] = 1'b1;
  assign phi2_1 = phi2;
  assign WriteEn[3] = notFBEn[3];
  assign WriteEn[2] = notFBEn[2];
  assign WriteEn[1] = notFBEn[1];
  assign WriteEn[0] = notFBEn[0];
  assign notphi1_1 = notphi1_2;
  assign phi1_3 = N9;
  assign phi1_2 = N9;
  assign phi1_1 = N9;
  assign N9 = phi1;

  latsp2 \aaddr_reg[0]  ( .NQ(n31), .Q(\aaddr[0] ), .D(ctrl[0]), .G(N13), .NS(
        1'b1) );
  latsp2 \aaddr_reg[1]  ( .NQ(n32), .Q(n55), .D(ctrl[1]), .G(N13), .NS(1'b1)
         );
  latsp2 \opsel_reg[0]  ( .NQ(BSelect), .Q(DSelect), .D(ctrl[4]), .G(N13), 
        .NS(1'b1) );
  latsp2 \opsel_reg[1]  ( .NQ(ASelect), .Q(zeroSelect), .D(ctrl[5]), .G(N13), 
        .NS(1'b1) );
  latsp2 \baddr_reg[0]  ( .NQ(n29), .Q(\baddr[0] ), .D(ctrl[2]), .G(N13), .NS(
        1'b1) );
  latsp2 \baddr_reg[1]  ( .NQ(n30), .Q(n53), .D(ctrl[3]), .G(N13), .NS(1'b1)
         );
  invp3 U16 ( .NQ(notFBEn[3]), .A(FBEn[3]) );
  invp3 U17 ( .NQ(notFBEn[2]), .A(FBEn[2]) );
  invp3 U18 ( .NQ(notFBEn[1]), .A(FBEn[1]) );
  invp3 U19 ( .NQ(notFBEn[0]), .A(FBEn[0]) );
  an2p3 U21 ( .Q(N13), .A(notphi1_2), .B(phi2) );
  invp3 U22 ( .NQ(notphi1_2), .A(N9) );
  an2p3 U53 ( .Q(n33), .A(n81), .B(n80) );
  an2p3 U54 ( .Q(n34), .A(n25), .B(opcode[1]) );
  or2p1 U55 ( .Q(n35), .A(\baddr[0] ), .B(n53) );
  or2p1 U56 ( .Q(n36), .A(\baddr[0] ), .B(n30) );
  or2p1 U57 ( .Q(n37), .A(\aaddr[0] ), .B(n55) );
  or2p1 U58 ( .Q(n38), .A(\aaddr[0] ), .B(n32) );
  or2p1 U59 ( .Q(n39), .A(n53), .B(n29) );
  or2p1 U60 ( .Q(n40), .A(n55), .B(n31) );
  or2p1 U61 ( .Q(n41), .A(n30), .B(n29) );
  or2p1 U62 ( .Q(n42), .A(n32), .B(n31) );
  latrp1 \opcode_reg[0]  ( .NQ(n25), .Q(opcode[0]), .D(ctrl[4]), .G(N9), .NR(
        1'b1) );
  latrp1 \opcode_reg[1]  ( .NQ(n23), .Q(opcode[1]), .D(ctrl[5]), .G(N9), .NR(
        1'b1) );
  latrp1 \shctl_reg[0]  ( .NQ(notshl), .Q(shl), .D(ctrl[0]), .G(N9), .NR(1'b1)
         );
  latrp1 \shctl_reg[1]  ( .NQ(notshr), .Q(shr), .D(ctrl[1]), .G(N9), .NR(1'b1)
         );
  latrp1 \waddr_reg[0]  ( .NQ(n27), .Q(waddr[0]), .D(ctrl[2]), .G(N9), .NR(
        1'b1) );
  latrp1 \waddr_reg[1]  ( .NQ(n28), .Q(waddr[1]), .D(ctrl[3]), .G(N9), .NR(
        1'b1) );
  latrp1 \opcode_reg[2]  ( .NQ(n72), .Q(opcode[2]), .D(ctrl[6]), .G(N9), .NR(
        1'b1) );
  no2p2 U70 ( .NQ(BRdEn[0]), .A(n35), .B(n50) );
  invp6 U71 ( .NQ(n50), .A(N9) );
  no2p2 U72 ( .NQ(BRdEn[1]), .A(n39), .B(n52) );
  invp6 U73 ( .NQ(n52), .A(N9) );
  no2p2 U74 ( .NQ(BRdEn[2]), .A(n36), .B(n56) );
  invp6 U75 ( .NQ(n56), .A(N9) );
  no2p2 U76 ( .NQ(BRdEn[3]), .A(n41), .B(n58) );
  invp6 U77 ( .NQ(n58), .A(N9) );
  no2p2 U78 ( .NQ(ARdEn[0]), .A(n37), .B(n51) );
  invp6 U79 ( .NQ(n51), .A(N9) );
  no2p2 U80 ( .NQ(ARdEn[1]), .A(n40), .B(n54) );
  invp6 U81 ( .NQ(n54), .A(N9) );
  no2p2 U82 ( .NQ(ARdEn[2]), .A(n38), .B(n57) );
  invp6 U83 ( .NQ(n57), .A(N9) );
  no2p2 U84 ( .NQ(ARdEn[3]), .A(n42), .B(n59) );
  invp6 U85 ( .NQ(n59), .A(N9) );
  na3p3 U86 ( .NQ(FBEn[0]), .A(n27), .B(n28), .C(phi2) );
  na3p3 U87 ( .NQ(FBEn[1]), .A(phi2), .B(n28), .C(waddr[0]) );
  na3p3 U88 ( .NQ(FBEn[2]), .A(phi2), .B(n27), .C(waddr[1]) );
  na2p3 U89 ( .NQ(M[1]), .A(phi2), .B(n76) );
  na2p3 U90 ( .NQ(M[2]), .A(phi2), .B(n77) );
  na2p3 U91 ( .NQ(L[3]), .A(phi2), .B(n84) );
  na3p2 U92 ( .NQ(M[0]), .A(n75), .B(n74), .C(phi2) );
  na3p2 U93 ( .NQ(M[3]), .A(n78), .B(n81), .C(phi2) );
  na3p2 U94 ( .NQ(L[1]), .A(n82), .B(n33), .C(phi2) );
  na3p2 U95 ( .NQ(L[2]), .A(n83), .B(n33), .C(phi2) );
  no3p1 U96 ( .NQ(n77), .A(n68), .B(n34), .C(n79) );
  na2p1 U97 ( .NQ(n81), .A(n77), .B(n73) );
  invp1 U98 ( .NQ(n79), .A(n78) );
  na2p1 U99 ( .NQ(n68), .A(n83), .B(n82) );
  invp1 U100 ( .NQ(n84), .A(n75) );
  invp1 U101 ( .NQ(n76), .A(n81) );
  na3p1 U102 ( .NQ(n75), .A(n72), .B(n77), .C(n73) );
  na3p1 U103 ( .NQ(n82), .A(n23), .B(opcode[0]), .C(n72) );
  na3p1 U104 ( .NQ(n78), .A(opcode[0]), .B(opcode[1]), .C(n72) );
  na2p1 U105 ( .NQ(n83), .A(n72), .B(n34) );
  invp1 U106 ( .NQ(n70), .A(phi2) );
  or2p1 U107 ( .Q(n73), .A(n25), .B(opcode[1]) );
  invp1 U108 ( .NQ(n69), .A(n68) );
  na3p3 U109 ( .NQ(FBEn[3]), .A(waddr[0]), .B(phi2), .C(waddr[1]) );
  na2p1 U110 ( .NQ(N[0]), .A(phi2), .B(n75) );
  na2p1 U111 ( .NQ(N[1]), .A(phi2), .B(n84) );
  na2p1 U112 ( .NQ(N[2]), .A(phi2), .B(n69) );
  no2p1 U113 ( .NQ(n71), .A(n79), .B(n70) );
  na3p1 U114 ( .NQ(N[3]), .A(n72), .B(n81), .C(n71) );
  na3p1 U115 ( .NQ(n74), .A(opcode[1]), .B(n77), .C(n73) );
  no2p1 U116 ( .NQ(n80), .A(n79), .B(opcode[2]) );
endmodule



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
  wire   phi2, notphi1_2, N9, N13, n28, n29, n31, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, \I3/n8 , \I3/n9 , \I2/n8 , \I2/n9 ,
         \I1/n8 , \I1/n9 ;
  wire   [1:0] waddr;
  wire   [1:0] baddr;
  wire   [1:0] aaddr;
  assign L[0] = 1'b1;
  assign phi2_1 = phi2;
  assign L[3] = N[1];
  assign WriteEn[3] = notFBEn[3];
  assign WriteEn[2] = notFBEn[2];
  assign WriteEn[1] = notFBEn[1];
  assign WriteEn[0] = notFBEn[0];
  assign notphi1_1 = notphi1_2;
  assign phi1_3 = N9;
  assign phi1_2 = N9;
  assign phi1_1 = N9;
  assign N9 = phi1;

  latsp2 \waddr_reg[0]  ( .Q(waddr[0]), .D(ctrl[2]), .G(N9), .NS(1'b1) );
  latsp2 \waddr_reg[1]  ( .Q(waddr[1]), .D(ctrl[3]), .G(N9), .NS(1'b1) );
  latsp2 \opcode_reg[0]  ( .NQ(n28), .D(ctrl[4]), .G(N9), .NS(1'b1) );
  latsp2 \opcode_reg[1]  ( .NQ(n31), .Q(n35), .D(ctrl[5]), .G(N9), .NS(1'b1)
         );
  latsp2 \opcode_reg[2]  ( .NQ(n29), .Q(n34), .D(ctrl[6]), .G(N9), .NS(1'b1)
         );
  latsp2 \aaddr_reg[0]  ( .Q(aaddr[0]), .D(ctrl[0]), .G(N13), .NS(1'b1) );
  latsp2 \aaddr_reg[1]  ( .Q(aaddr[1]), .D(ctrl[1]), .G(N13), .NS(1'b1) );
  latsp2 \shctl_reg[0]  ( .NQ(notshl), .Q(shl), .D(ctrl[0]), .G(N9), .NS(1'b1)
         );
  latsp2 \shctl_reg[1]  ( .NQ(notshr), .Q(shr), .D(ctrl[1]), .G(N9), .NS(1'b1)
         );
  latsp2 \opsel_reg[0]  ( .NQ(BSelect), .Q(DSelect), .D(ctrl[4]), .G(N13), 
        .NS(1'b1) );
  latsp2 \opsel_reg[1]  ( .NQ(ASelect), .Q(zeroSelect), .D(ctrl[5]), .G(N13), 
        .NS(1'b1) );
  latsp2 \baddr_reg[0]  ( .Q(baddr[0]), .D(ctrl[2]), .G(N13), .NS(1'b1) );
  latsp2 \baddr_reg[1]  ( .Q(baddr[1]), .D(ctrl[3]), .G(N13), .NS(1'b1) );
  invp1 U48 ( .NQ(N[3]), .A(n36) );
  na4p1 U49 ( .NQ(N[1]), .A(phi2), .B(n31), .C(n28), .D(n29) );
  an2p2 U50 ( .Q(N13), .A(notphi1_2), .B(phi2) );
  invp1 U51 ( .NQ(notphi1_2), .A(N9) );
  na2p1 U52 ( .NQ(M[1]), .A(n37), .B(n38) );
  invp1 U53 ( .NQ(n38), .A(M[2]) );
  ao211p1 U54 ( .Q(M[2]), .A1(n39), .A2(n29), .B(N[2]), .C(n40) );
  invp1 U55 ( .NQ(n40), .A(n41) );
  na2p1 U56 ( .NQ(N[2]), .A(phi2), .B(n42) );
  na2p1 U57 ( .NQ(n42), .A(n29), .B(n43) );
  na2p1 U58 ( .NQ(n43), .A(n37), .B(n41) );
  na2p1 U59 ( .NQ(M[0]), .A(n44), .B(n45) );
  invp1 U60 ( .NQ(n45), .A(N[0]) );
  na2p1 U61 ( .NQ(n44), .A(n39), .B(n34) );
  na2p1 U62 ( .NQ(L[2]), .A(n41), .B(n36) );
  na2p1 U63 ( .NQ(n41), .A(n28), .B(n35) );
  na2p1 U64 ( .NQ(L[1]), .A(n37), .B(n36) );
  no2p1 U65 ( .NQ(n36), .A(n34), .B(M[3]) );
  ao211p1 U66 ( .Q(M[3]), .A1(n31), .A2(n28), .B(N[0]), .C(n39) );
  no2p1 U67 ( .NQ(n39), .A(n28), .B(n31) );
  na2p1 U68 ( .NQ(N[0]), .A(phi2), .B(n46) );
  na3p1 U69 ( .NQ(n46), .A(n28), .B(n29), .C(n31) );
  or2p1 U70 ( .Q(n37), .A(n35), .B(n28) );
  invp1 U71 ( .NQ(FBEn[3]), .A(notFBEn[3]) );
  invp1 U72 ( .NQ(FBEn[2]), .A(notFBEn[2]) );
  invp1 U73 ( .NQ(FBEn[1]), .A(notFBEn[1]) );
  invp1 U74 ( .NQ(FBEn[0]), .A(notFBEn[0]) );
  an3p1 \I3/U20  ( .Q(notFBEn[3]), .A(waddr[1]), .B(waddr[0]), .C(phi2) );
  an3p1 \I3/U21  ( .Q(notFBEn[2]), .A(waddr[1]), .B(\I3/n8 ), .C(phi2) );
  an3p1 \I3/U22  ( .Q(notFBEn[1]), .A(waddr[0]), .B(\I3/n9 ), .C(phi2) );
  an3p1 \I3/U23  ( .Q(notFBEn[0]), .A(\I3/n8 ), .B(\I3/n9 ), .C(phi2) );
  invp1 \I3/U24  ( .NQ(\I3/n9 ), .A(waddr[1]) );
  invp1 \I3/U25  ( .NQ(\I3/n8 ), .A(waddr[0]) );
  an3p1 \I2/U20  ( .Q(BRdEn[3]), .A(baddr[1]), .B(baddr[0]), .C(N9) );
  an3p1 \I2/U21  ( .Q(BRdEn[2]), .A(baddr[1]), .B(\I2/n8 ), .C(N9) );
  an3p1 \I2/U22  ( .Q(BRdEn[1]), .A(baddr[0]), .B(\I2/n9 ), .C(N9) );
  an3p1 \I2/U23  ( .Q(BRdEn[0]), .A(\I2/n8 ), .B(\I2/n9 ), .C(N9) );
  invp1 \I2/U24  ( .NQ(\I2/n9 ), .A(baddr[1]) );
  invp1 \I2/U25  ( .NQ(\I2/n8 ), .A(baddr[0]) );
  an3p1 \I1/U20  ( .Q(ARdEn[3]), .A(aaddr[1]), .B(aaddr[0]), .C(N9) );
  an3p1 \I1/U21  ( .Q(ARdEn[2]), .A(aaddr[1]), .B(\I1/n8 ), .C(N9) );
  an3p1 \I1/U22  ( .Q(ARdEn[1]), .A(aaddr[0]), .B(\I1/n9 ), .C(N9) );
  an3p1 \I1/U23  ( .Q(ARdEn[0]), .A(\I1/n8 ), .B(\I1/n9 ), .C(N9) );
  invp1 \I1/U24  ( .NQ(\I1/n9 ), .A(aaddr[1]) );
  invp1 \I1/U25  ( .NQ(\I1/n8 ), .A(aaddr[0]) );
endmodule


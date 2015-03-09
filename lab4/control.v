/////////////////////////////////////////////////////
//
// Verilog-HDL description of 2901 control logic
//
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
//
// Define a latched 2-to-4 active high decoder
//
/////////////////////////////////////////////////////
module decoder (a, x, clk);

    input clk;
    input[1:0] a;
    output[3:0] x;
  
    reg[3:0] x;
    wire[3:0] d;
  
    assign d = { a[1] & a[0], a[1] & ~a[0], ~a[1] & a[0], ~(a[1] | a[0]) };
  
    always@(clk or d)
    begin
        if (clk == 1'b0) x = 4'b0000;
        else x = d;
    end

endmodule 

/////////////////////////////////////////////////////
//
// Define the top level control logic
//
/////////////////////////////////////////////////////
module control (
        phi1, phi2,     // Clock signals
        ctrl,           // Control bus

        L, M, N,        // ALU control busses
        ARdEn,          // Port A read address
        BRdEn,          // Port B read address
        WriteEn,        // Write address
        FBEn, notFBEn,  // RAM feedback enables and their inverses
        ASelect,        // Select port A
        BSelect,        // Select port B
        DSelect,        // Select intermediate data
        zeroSelect,     // Select zero
        shl, notshl,    // Shift result left and inv.
        shr, notshr,    // Shift result right and inv.

        phi1_1, phi1_2, phi1_3, // needed by datapath
        notphi1_1, notphi1_2,   // needed by datapath
        phi2_1                  // needed by datapath
        );

    input phi1, phi2;
    input[6:0] ctrl;

    // raw control signals
    reg[2:0] opcode;
    reg[1:0] aaddr, baddr, waddr, opsel, shctl;

    output[3:0] L, M, N, ARdEn, BRdEn, WriteEn, FBEn, notFBEn;
    output ASelect, BSelect, DSelect, zeroSelect, shl, notshl, shr, notshr;
    reg[3:0] L, M, N;

    output phi1_1, phi1_2, phi1_3;
    output notphi1_1, notphi1_2;
    output phi2_1;

    // Latch the raw control signals (for the next phase) off the control bus.
    always@(phi1 or phi2 or ctrl)
    begin
        if (phi1 == 1'b1)
        begin
            opcode = ctrl[6:4];
            waddr = ctrl[3:2];
            shctl = ctrl[1:0];
        end
        else if (phi2 == 1'b1)
        begin
            opsel = ctrl[5:4];
            baddr = ctrl[3:2];
            aaddr = ctrl[1:0];
        end
        // Note: No default case => latches inferred
    end

    // Decode RAM read port addresses.
    decoder I1(aaddr, ARdEn, phi1);
    decoder I2(baddr, BRdEn, phi1);
  
    // Decode RAM write port address.
    decoder I3(waddr, WriteEn, phi2);
  
    // Decode RAM feedback control.
    assign FBEn = ~WriteEn;
    assign notFBEn = ~FBEn;
  
    // Decode Operand Selects.
    assign ASelect = ~(opsel[1]);
    assign BSelect = ~(opsel[0]);
    assign DSelect = opsel[0];
    assign zeroSelect = opsel[1];

    // Decode the shift controls.
    assign shr = shctl[1];
    assign notshr = ~shctl[1];
    assign shl = shctl[0];
    assign notshl = ~shctl[0];

    // Decode the ALU controls.
    always@(phi2 or opcode)
    begin
        if (phi2 == 1'b0)
        begin
            L = 4'b1111;
            M = 4'b1111;
            N = 4'b1111;
        end
        else
        begin
            case (opcode)
            3'b000: begin L = 4'b0111; M = 4'b1001; N = 4'b1001; end
            3'b001: begin L = 4'b1011; M = 4'b0110; N = 4'b0110; end
            3'b010: begin L = 4'b1101; M = 4'b0110; N = 4'b0110; end
            3'b011: begin L = 4'b1111; M = 4'b1110; N = 4'b1010; end
            3'b100: begin L = 4'b1111; M = 4'b1000; N = 4'b1010; end
            3'b101: begin L = 4'b1111; M = 4'b0010; N = 4'b1010; end
            3'b110: begin L = 4'b1111; M = 4'b0110; N = 4'b1010; end
            3'b111: begin L = 4'b1111; M = 4'b1001; N = 4'b1010; end
            default: begin L = 4'bx; M = 4'bx; N = 4'bx; end
            endcase
        end
    end

    assign phi1_1 = phi1;
    assign phi1_2 = phi1;
    assign phi1_3 = phi1;
    assign phi2_1 = phi2;
    assign notphi1_1 = ~phi1;
    assign notphi1_2 = ~phi1;

endmodule

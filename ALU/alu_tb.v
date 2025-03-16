// File: alu_testbench.v

`timescale 1ns/1ps

module ALU_testbench;

    // Parameters
    parameter N = 32;

    // Testbench signals
    reg [2:0] opcode;
    reg [N-1:0] op_a, op_b;
    wire [N-1:0] result;

    // Instantiate the ALU module
    ALU #(N) uut (
        .opcode(opcode),
        .op_a(op_a),
        .op_b(op_b),
        .result(result)
    );

    // Test procedure
    initial begin
        $display("Starting ALU testbench...");

        // Test ADD
        opcode = `ADD;
        op_a = 32'd15;
        op_b = 32'd10;
        #10; // Wait for 10 ns
        $display("ADD: %d + %d = %d", op_a, op_b, result);

        // Test LESS
        opcode = `LESS; 
        op_a = 32'd5; 
        op_b = 32'd10;
        #10;
        $display("LESS: %d < %d = %d", op_a, op_b, result);

        // Test EQ
        opcode = `EQ; 
        op_a = 32'd20; 
        op_b = 32'd20;
        #10;
        $display("EQ: %d == %d = %d", op_a, op_b, result);

        // Test OR
        opcode = `OR; 
        op_a = 32'hA5A5A5A5; 
        op_b = 32'h5A5A5A5A;
        #10;
        $display("OR: %h | %h = %h", op_a, op_b, result);

        // Test AND
        opcode = `AND; 
        op_a = 32'hFFFF0000; 
        op_b = 32'h0000FFFF;
        #10;
        $display("AND: %h & %h = %h", op_a, op_b, result);

        // Test NOT
        opcode = `NOT; 
        op_a = 32'hF0F0F0F0; 
        op_b = 32'b0; // op_b is unused
        #10;
        $display("NOT: ~%h = %h", op_a, result);

        // Test MUL
        opcode = `MUL;
        op_a = 32'd5;  
        op_b = 32'd10;
        #10;
        $display("MUL: %dx%d =%d", op_a, op_b, result);
        
        // Test SHR Shift Right op_a >> 1
        opcode = `SHR;
        op_a = 32'd10;
        op_b = 32'd0;
        #10;
        $display("SHR:%d sayisi shift right ile kaydirilmis hali=%d",op_a,result);
        
        // Test SHL Shift Left  op_a << 1
        opcode = `SHL;
        op_a = 32'd10;
        op_b = 32'd0;
        #10
        $display("SHL:%d sayisi shift left ile kaydirilmis hali=%d",op_a,result);
        
        // Test default case
        opcode = 3'd7; op_a = 32'd0; op_b = 32'd0;
        #10;
        $display("Default case: opcode = %d, result = %d", opcode, result);

        $display("ALU testbench completed.");
        $finish;
    end

endmodule


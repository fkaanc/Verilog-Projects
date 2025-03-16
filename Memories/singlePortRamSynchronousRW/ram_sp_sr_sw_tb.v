`timescale 1ns/1ps

module ram_sp_sr_sw_tb;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 8;
    parameter RAM_DEPTH = 1 << ADDR_WIDTH;

    // Signals
    reg clk;
    reg [ADDR_WIDTH-1:0] address;
    reg cs;
    reg we;
    reg oe;
    wire [DATA_WIDTH-1:0] data;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;

    // Bidirectional data bus simulation
    assign data = (cs && we) ? data_in : {DATA_WIDTH{1'bz}};
    assign data_out = data;

    // DUT Instance
    ram_sp_sr_sw #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .address(address),
        .data(data),
        .cs(cs),
        .we(we),
        .oe(oe)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    // Testbench process
    initial begin
        // Initialize signals
        cs = 0;
        we = 0;
        oe = 0;
        address = 0;
        data_in = 0;

        // Wait for reset
        #20;

        // Test write operation
        cs = 1;
        we = 1;
        address = 8'h10;
        data_in = 8'hAA; // Writing value 0xAA
        #10; // Wait for a clock cycle

        // Test read operation
        we = 0;
        oe = 1;
        #10; // Wait for a clock cycle

        // Check if data read is correct
        if (data_out !== 8'hAA) begin
            $display("Test FAILED: Read data = %h, Expected = %h", data_out, 8'hAA);
        end else begin
            $display("Test PASSED: Read data = %h", data_out);
        end

        // Additional tests
        address = 8'h20;
        we = 1;
        data_in = 8'h55; // Writing value 0x55
        #10;

        we = 0;
        #10;

        if (data_out !== 8'h55) begin
            $display("Test FAILED: Read data = %h, Expected = %h", data_out, 8'h55);
        end else begin
            $display("Test PASSED: Read data = %h", data_out);
        end

        // End simulation
        $stop;
    end
endmodule


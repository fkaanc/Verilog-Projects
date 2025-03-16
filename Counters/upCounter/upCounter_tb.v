`timescale 1ns/1ps

module up_counter_tb;

// Testbench içindeki sinyaller
reg clk;
reg reset;
reg enable;
wire [7:0] out;

// Test edilen modülü bağla
up_counter uut (
    .out(out),
    .enable(enable),
    .clk(clk),
    .reset(reset)
);

// Saat sinyalini üret (Her 10 ns'de bir değiştir)
always #5 clk = ~clk;

initial begin
    // Başlangıç değerleri
    clk = 0;
    reset = 1;
    enable = 0;

    // Reset işlemi
    #10 reset = 0; // Reset kaldırıldı
    #10 enable = 1; // Enable aktif edildi
    
    // Sayacın çalışmasını gözlemle
    #100 enable = 0; // Sayaç durmalı
    #20 enable = 1;  // Sayaç tekrar çalışmalı

    // Simülasyonu bitir
    #50 $finish;
end

// Çıktıları gözlemlemek için
initial begin
    $monitor("Time: %0t | Reset: %b | Enable: %b | Out: %d", $time, reset, enable, out);
end

endmodule


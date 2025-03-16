`timescale 1ns/1ps

module tb_dff_async_reset;

// Testbench'deki sinyaller
reg data;    // Data input
reg clk;     // Clock input
reg reset;   // Reset input
wire q;      // Q output

// Modül örneği (instance)
dff_async_reset uut (
  .data(data),
  .clk(clk),
  .reset(reset),
  .q(q)
);

// Clock üretimi
initial begin
  clk = 0;
  forever #5 clk = ~clk; // 10ns period
end

// Test işlemleri
initial begin
  // Sinyalleri izlemek için monitor
  $monitor("Time: %0t | reset: %b | clk: %b | data: %b | q: %b", $time, reset, clk, data, q);

  // Başlangıç durumları
  reset = 1;  // Reset başlangıçta aktif değil
  data = 0;

  // Test 1: Reset durumunu test et (asenkron reset)
  #10 reset = 0; // Reset'i aktif et (Q sıfırlanmalı)
  #10 reset = 1; // Reset'i kaldır

  // Test 2: Veri girişini test et
  #10 data = 1;  // Data girişini 1 yap
  #20 data = 0;  // Data girişini 0 yap

  // Test 3: Reset sırasında data değişikliğini test et
  #10 reset = 0; // Reset'i aktif et (Q sıfırlanmalı)
  #10 data = 1;  // Data değişse bile reset aktif olduğu için etkilenmemeli
  #10 reset = 1; // Reset'i kaldır (Q data'yı takip etmeli)

  // Test 4: Farklı data değişikliklerini test et
  #10 data = 1;
  #10 data = 0;

  // Simülasyonu bitir
  #50 $finish;
end

endmodule


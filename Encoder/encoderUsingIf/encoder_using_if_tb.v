// encoder_using_if_tb.v - encoder_using_if için Testbench

`timescale 1ns/1ps  // Zaman birimi ve hassasiyetini belirler (1ns zaman dilimi, 1ps hassasiyet)
module encoder_using_if_tb;  // Testbench modülünün başlangıcı

  // Testbench için gerekli giriş ve çıkışları tanımlayın
  reg [15:0] encoder_in;  // 16-bit giriş sinyali (encoder_in)
  reg enable;             // Enable sinyali (encoder'ı etkinleştiren)
  wire [3:0] binary_out;  // 4-bit çıkış sinyali (binary_out)

  // Test edilen modülü bağlayın (encoder_using_if modülüne bağlanır)
  encoder_using_if uut (
    .binary_out(binary_out),  // binary_out çıkışı bağlanır
    .encoder_in(encoder_in),  // encoder_in girişi bağlanır
    .enable(enable)           // enable girişi bağlanır
  );

  // Testler için bir başlangıç bloğu (initial block)
  initial begin
    // Zaman, enable, encoder_in ve binary_out değerlerini izlemek için monitor kullanılır
    $monitor("Time = %0t | enable = %b | encoder_in = %h | binary_out = %d", 
             $time, enable, encoder_in, binary_out);

    // İlk durum: enable kapalı, encoder_in herhangi bir değer olabilir
    enable = 0;              // enable sinyalini 0 yap (kapalı)
    encoder_in = 16'h0001;   // encoder_in girişine 0x0001 değerini ver
    #10;                     // 10 ns bekle

    // Durum 2: enable açık, encoder_in 0x0002
    enable = 1;              // enable sinyalini 1 yap (açık)
    encoder_in = 16'h0002;   // encoder_in girişine 0x0002 değerini ver
    #10;                     // 10 ns bekle

    // Durum 3: enable açık, encoder_in 0x0004
    encoder_in = 16'h0004;   // encoder_in girişine 0x0004 değerini ver
    #10;                     // 10 ns bekle

    // Durum 4: enable açık, encoder_in 0x0008
    encoder_in = 16'h0008;   // encoder_in girişine 0x0008 değerini ver
    #10;                     // 10 ns bekle

    // Durum 5: enable açık, encoder_in 0x0100
    encoder_in = 16'h0100;   // encoder_in girişine 0x0100 değerini ver
    #10;                     // 10 ns bekle

    // Durum 6: enable açık, encoder_in 0x8000
    encoder_in = 16'h8000;   // encoder_in girişine 0x8000 değerini ver
    #10;                     // 10 ns bekle

    // Test sonu, simülasyonu sonlandır
    $finish;
  end

endmodule


// encoder_using_case_tb.v - encoder_using_case için Testbench

module encoder_using_case_tb;

  // Test sinyalleri tanımlanır
  reg enable;               // Test için enable sinyali
  reg [15:0] encoder_in;    // Test için 16 bitlik encoder giriş sinyali
  wire [3:0] binary_out;    // 4 bitlik çıkış sinyali

  // Test edilecek modül örneği
  encoder_using_case uut (  // encoder_using_case modülünü instantiate eder
    .binary_out(binary_out), // binary_out çıkışı bağlanır
    .encoder_in(encoder_in), // encoder_in girişi bağlanır
    .enable(enable)          // enable girişi bağlanır
  );

  initial begin
    // Test çıktısını izlemek için monitör kullanılır
    $monitor("Time = %0d, Enable = %b, Encoder In = %h, Binary Out = %d", 
             $time, enable, encoder_in, binary_out);

    // Teste başlangıç
    enable = 0; encoder_in = 16'h0000;    // İlk durumda enable kapalı ve encoder_in 0
    #10 enable = 1; encoder_in = 16'h0002; // Enable açık, encoder_in = 0x0002, çıkış 1 beklenir
    #10 encoder_in = 16'h0004;            // encoder_in = 0x0004, çıkış 2 beklenir
    #10 encoder_in = 16'h0010;            // encoder_in = 0x0010, çıkış 4 beklenir
    #10 encoder_in = 16'h0080;            // encoder_in = 0x0080, çıkış 7 beklenir
    #10 encoder_in = 16'h2000;            // encoder_in = 0x2000, çıkış 13 beklenir
    #10 encoder_in = 16'h8000;            // encoder_in = 0x8000, çıkış 15 beklenir
    #10 enable = 0; encoder_in = 16'h0400; // Enable kapalı, encoder_in = 0x0400, çıkış 0 beklenir
    #10 $finish;                          // Simülasyonu bitirir
  end

endmodule


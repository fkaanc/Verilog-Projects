// mux_using_case_tb.v
module mux_using_case_tb;

  // Test sinyalleri tanımlanır
  reg din_0;      // Mux'un ilk girişi
  reg din_1;      // Mux'un ikinci girişi
  reg sel;        // Seçim sinyali (sel)
  wire mux_out;   // Mux çıkışı

  // Test edilecek modül örneği
  mux_using_case uut (
    .din_0(din_0),  // din_0 girişi bağlı
    .din_1(din_1),  // din_1 girişi bağlı
    .sel(sel),      // sel girişi bağlı
    .mux_out(mux_out) // mux_out çıkışı bağlı
  );

  // Test başlatma bloğu
  initial begin
    // Test çıktısını izlemek için monitör
    $monitor("Time = %0d, din_0 = %b, din_1 = %b, sel = %b, mux_out = %b",
             $time, din_0, din_1, sel, mux_out); // Test boyunca her değişimi izler

    // Teste başlangıç
    din_0 = 0; din_1 = 1; sel = 0;   // İlk test: sel = 0, mux_out = din_0 (0) beklenir
    #10 sel = 1;                     // sel = 1, mux_out = din_1 (1) beklenir
    #10 din_0 = 1; sel = 0;          // din_0 = 1, sel = 0, mux_out = din_0 (1) beklenir
    #10 din_1 = 0; sel = 1;          // din_1 = 0, sel = 1, mux_out = din_1 (0) beklenir
    #10 din_0 = 1; din_1 = 1; sel = 0; // din_0 = 1, din_1 = 1, sel = 0, mux_out = din_0 (1) beklenir
    #10 sel = 1;                     // sel = 1, mux_out = din_1 (1) beklenir
    #10 $finish;                     // Simülasyonu bitir
  end

endmodule


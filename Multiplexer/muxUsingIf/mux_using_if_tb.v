// mux_using_if_tb.v - Testbench for mux_using_if

module mux_using_if_tb;

  // Test sinyalleri tanımlanır
  reg din_0;      // Mux'un ilk girişine bağlanacak sinyal (din_0)
  reg din_1;      // Mux'un ikinci girişine bağlanacak sinyal (din_1)
  reg sel;        // Seçim sinyali, hangi girişin çıkış olacağını belirler
  wire mux_out;   // Mux çıkışı, seçilen girişin değerini taşır

  // Test edilecek modül örneği (uut: unit under test)
  mux_using_if uut (
    .din_0(din_0),    // din_0 girişini bağla
    .din_1(din_1),    // din_1 girişini bağla
    .sel(sel),        // sel girişini bağla
    .mux_out(mux_out) // mux_out çıkışını bağla
  );

  // Test işlemi
  initial begin
    // Test çıktısını izlemek için monitör. Simülasyon sırasında sinyallerin değerlerini yazdırır.
    $monitor("Time = %0d, din_0 = %b, din_1 = %b, sel = %b, mux_out = %b",
             $time, din_0, din_1, sel, mux_out);

    // Teste başlangıç: din_0 = 0, din_1 = 1, sel = 0
    din_0 = 0; din_1 = 1; sel = 0; // sel = 0 olduğunda mux_out = din_0 (0) beklenir
    #10; // 10 ns süre bekle
    sel = 1; // sel = 1 olduğunda mux_out = din_1 (1) beklenir
    #10; // 10 ns süre bekle
    din_0 = 1; sel = 0; // sel = 0 olduğunda mux_out = din_0 (1) beklenir
    #10; // 10 ns süre bekle
    din_1 = 0; sel = 1; // sel = 1 olduğunda mux_out = din_1 (0) beklenir
    #10; // 10 ns süre bekle
    din_0 = 1; din_1 = 1; sel = 0; // sel = 0 olduğunda mux_out = din_0 (1) beklenir
    #10; // 10 ns süre bekle
    sel = 1; // sel = 1 olduğunda mux_out = din_1 (1) beklenir
    #10; // 10 ns süre bekle
    $finish; // Simülasyonu bitir
  end

endmodule


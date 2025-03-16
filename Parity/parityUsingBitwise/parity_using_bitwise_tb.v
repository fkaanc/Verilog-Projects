// Testbench for parity_using_bitwise
module tb_parity_using_bitwise;

// Testbench değişkenlerini tanımlıyoruz
reg [7:0] data_in;      // 8 bitlik giriş
wire parity_out;        // 1 bitlik parite çıkışı

// Test edilen modülü çağırıyoruz
parity_using_bitwise uut (
    .data_in(data_in),
    .parity_out(parity_out)
);

initial begin
    // Test mesajı
    $display("Test başladı...");

    // İlk durum: tüm bitler sıfır
    data_in = 8'b00000000;
    #10;
    $display("Giriş: %b, Parite Çıkışı: %b", data_in, parity_out);

    // İkinci durum: tek sayıda 1'ler
    data_in = 8'b00000001;
    #10;
    $display("Giriş: %b, Parite Çıkışı: %b", data_in, parity_out);

    // Üçüncü durum: çift sayıda 1'ler
    data_in = 8'b00000011;
    #10;
    $display("Giriş: %b, Parite Çıkışı: %b", data_in, parity_out);

    // Dördüncü durum: rastgele bir giriş
    data_in = 8'b10101010;
    #10;
    $display("Giriş: %b, Parite Çıkışı: %b", data_in, parity_out);

    // Beşinci durum: tüm bitler bir
    data_in = 8'b11111111;
    #10;
    $display("Giriş: %b, Parite Çıkışı: %b", data_in, parity_out);

    // Test tamamlandı mesajı
    $display("Test tamamlandı.");
    $finish;
end

endmodule


//-----------------------------------------------------
// Design Name : encoder_using_case
// File Name   : encoder_using_case.v
// Function    : Case yapısı kullanarak encoder
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------

module encoder_using_case(
    binary_out , //  4 bitlik çıkış
    encoder_in , //  16 bitlik giriş
    enable       //  Encoder'ı etkinleştiren sinyal
);

output [3:0] binary_out ;  // Encoder'ın çıkışı olan 4 bitlik binary sinyal
input  enable ;            // Encoder'ı aktif hale getiren enable sinyali
input [15:0] encoder_in ; // 16 bitlik giriş sinyali, encoded değeri temsil eder

reg [3:0] binary_out ;     // 4 bitlik çıkışı tutacak register

always @ (enable or encoder_in)  // enable veya encoder_in değiştiğinde her zaman çalışacak blok
begin
  binary_out = 0;  // Varsayılan olarak çıkışı 0 olarak ayarla

  if (enable) begin  // Eğer enable sinyali aktif (1) ise
    case (encoder_in)  // encoder_in'in değerine göre çıkışı belirle
      16'h0002 : binary_out = 1;  // Eğer encoder_in 0x0002 ise çıkışı 1 yap
      16'h0004 : binary_out = 2;  // Eğer encoder_in 0x0004 ise çıkışı 2 yap
      16'h0008 : binary_out = 3;  // Eğer encoder_in 0x0008 ise çıkışı 3 yap
      16'h0010 : binary_out = 4;  // Eğer encoder_in 0x0010 ise çıkışı 4 yap
      16'h0020 : binary_out = 5;  // Eğer encoder_in 0x0020 ise çıkışı 5 yap
      16'h0040 : binary_out = 6;  // Eğer encoder_in 0x0040 ise çıkışı 6 yap
      16'h0080 : binary_out = 7;  // Eğer encoder_in 0x0080 ise çıkışı 7 yap
      16'h0100 : binary_out = 8;  // Eğer encoder_in 0x0100 ise çıkışı 8 yap
      16'h0200 : binary_out = 9;  // Eğer encoder_in 0x0200 ise çıkışı 9 yap
      16'h0400 : binary_out = 10; // Eğer encoder_in 0x0400 ise çıkışı 10 yap
      16'h0800 : binary_out = 11; // Eğer encoder_in 0x0800 ise çıkışı 11 yap
      16'h1000 : binary_out = 12; // Eğer encoder_in 0x1000 ise çıkışı 12 yap
      16'h2000 : binary_out = 13; // Eğer encoder_in 0x2000 ise çıkışı 13 yap
      16'h4000 : binary_out = 14; // Eğer encoder_in 0x4000 ise çıkışı 14 yap
      16'h8000 : binary_out = 15; // Eğer encoder_in 0x8000 ise çıkışı 15 yap
    endcase  // case yapısının sonu
  end
end

endmodule


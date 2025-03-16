//-----------------------------------------------------
// Design Name : encoder_using_if
// File Name   : encoder_using_if.v
// Function    : If kullanarak encoder
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------

module encoder_using_if(
    binary_out , //  4 bitlik çıkış
    encoder_in , //  16 bitlik giriş
    enable       //  Encoder'ı etkinleştiren sinyal
); 

//-----------Çıkış Bağlantıları---------------
output [3:0] binary_out ;  // Encoder'ın çıkışı olan 4 bitlik binary sinyal

//-----------Giriş Bağlantıları---------------
input  enable ;            // Encoder'ı aktif hale getiren enable sinyali
input [15:0] encoder_in ; // 16 bitlik giriş sinyali, encoded değeri temsil eder

//------------İçsel Değişkenler--------
reg [3:0] binary_out ;     // 4 bitlik çıkışı tutacak register

//-------------Kod Başlangıcı-----------------
always @ (enable or encoder_in)  // enable veya encoder_in değiştiğinde her zaman çalışacak blok
begin 
   binary_out = 0;  // Varsayılan olarak çıkışı 0 olarak ayarla

   if (enable) begin  // Eğer enable sinyali aktif (1) ise
     // encoder_in'in her bitini kontrol ederek karşılık gelen binary çıkışı belirler
     if (encoder_in == 16'h0002) begin
      binary_out = 1;  // Eğer giriş 0x0002 (binary 0000 0010) ise çıkışı 1 yap
     end 
     if (encoder_in == 16'h0004) begin 
      binary_out = 2;  // Eğer giriş 0x0004 (binary 0000 0100) ise çıkışı 2 yap
     end  
     if (encoder_in == 16'h0008) begin 
      binary_out = 3;  // Eğer giriş 0x0008 (binary 0000 1000) ise çıkışı 3 yap
     end  
     if (encoder_in == 16'h0010) begin 
      binary_out = 4;  // Eğer giriş 0x0010 (binary 0001 0000) ise çıkışı 4 yap
     end  
     if (encoder_in == 16'h0020) begin 
      binary_out = 5;  // Eğer giriş 0x0020 (binary 0010 0000) ise çıkışı 5 yap
     end  
     if (encoder_in == 16'h0040) begin 
      binary_out = 6;  // Eğer giriş 0x0040 (binary 0100 0000) ise çıkışı 6 yap
     end  
     if (encoder_in == 16'h0080) begin 
      binary_out = 7;  // Eğer giriş 0x0080 (binary 1000 0000) ise çıkışı 7 yap
     end  
     if (encoder_in == 16'h0100) begin 
      binary_out = 8;  // Eğer giriş 0x0100 (binary 0001 0000 0000) ise çıkışı 8 yap
     end  
     if (encoder_in == 16'h0200) begin 
      binary_out = 9;  // Eğer giriş 0x0200 (binary 0010 0000 0000) ise çıkışı 9 yap
     end 
     if (encoder_in == 16'h0400) begin 
      binary_out = 10; // Eğer giriş 0x0400 (binary 0100 0000 0000) ise çıkışı 10 yap
     end  
     if (encoder_in == 16'h0800) begin 
      binary_out = 11; // Eğer giriş 0x0800 (binary 1000 0000 0000) ise çıkışı 11 yap
     end  
     if (encoder_in == 16'h1000) begin
      binary_out = 12; // Eğer giriş 0x1000 (binary 0001 0000 0000 0000) ise çıkışı 12 yap
     end  
     if (encoder_in == 16'h2000) begin 
      binary_out = 13; // Eğer giriş 0x2000 (binary 0010 0000 0000 0000) ise çıkışı 13 yap
     end  
     if (encoder_in == 16'h4000) begin 
      binary_out = 14; // Eğer giriş 0x4000 (binary 0100 0000 0000 0000) ise çıkışı 14 yap
     end 
     if (encoder_in == 16'h8000) begin 
      binary_out = 15; // Eğer giriş 0x8000 (binary 1000 0000 0000 0000) ise çıkışı 15 yap
     end
  end
end

endmodule


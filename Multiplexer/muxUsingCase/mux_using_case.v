//-----------------------------------------------------
// Design Name : mux_using_case
// File Name   : mux_using_case.v
// Function    : 2:1 Mux using Case
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------

module mux_using_case(
  din_0      , // Mux first input
  din_1      , // Mux second input
  sel        , // Select input
  mux_out    // Mux output
);
//-----------Input Ports---------------
input din_0, din_1, sel ;
//-----------Output Ports---------------
output mux_out;
//------------Internal Variables--------
reg mux_out ; // mux_out çıkışı bir register olarak tanımlanıyor

//-------------Code Starts Here---------
always @ (sel or din_0 or din_1) // sel, din_0 veya din_1 sinyallerinde bir değişiklik olduğunda çalışacak blok
begin : MUX // MUX bloğu, case yapısı ile seçim yapılacak

  // Case yapısı ile sel sinyaline göre din_0 veya din_1 seçilecek
  case(sel) 
    1'b0 : mux_out = din_0; // Eğer sel = 0 ise, mux_out = din_0 olarak atanır
    1'b1 : mux_out = din_1; // Eğer sel = 1 ise, mux_out = din_1 olarak atanır
  endcase 
end // End of MUX block

endmodule // End of module


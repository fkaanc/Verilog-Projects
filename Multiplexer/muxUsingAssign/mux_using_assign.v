//-----------------------------------------------------
// Design Name : mux_using_assign
// File Name   : mux_using_assign.v
// Function    : 2:1 Mux using Assign
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module mux_using_assign(
    din_0,      // Mux first input
    din_1,      // Mux Second input
    sel,        // Select input
    mux_out     // Mux output
);

//-----------Input Ports---------------
input din_0, din_1, sel; // Mux giriş sinyalleri. din_0 ve din_1, Mux'un iki girişini, 
                           // sel ise hangi giriş seçileceğini belirler.

//-----------Output Ports---------------
output mux_out; // Mux çıkış sinyali.

//------------Internal Variables--------
wire mux_out; // Çıkış sinyali için bir wire tanımlanır.

//-------------Code Start-----------------
assign mux_out = (sel) ? din_1 : din_0; // Eğer sel = 1 ise din_1'i çıkış olarak ver, 
                                         // eğer sel = 0 ise din_0'ı çıkış olarak ver.

endmodule //End Of Module mux

